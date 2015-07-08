<?php

use atdrupal\Project\IssueChecker;

class SecurityIssuesTest extends PHPUnit_Framework_TestCase
{
    /**
     * @dataProvider provideSecurityIssueForProject
     */
    public function testSecurityIssueForProject($name, $major, $minor)
    {
        foreach ((new IssueChecker($name, $major, $minor))->check() as $majorVersion => $minorVersions) {
            foreach ($minorVersions as $minorVersion => $issues) {
                $hasSecurityIssue = in_array(IssueChecker::STATUS_SECURITY, $issues);
                $this->assertTrue(!$hasSecurityIssue, "{$name} {$major}.{$minor} doesn't have any security issue.");
                
                if (in_array(IssueChecker::STATUS_BUG_FIX, $issues)) {
                    $this->markTestSkipped("{$name} {$major}.{$minor} has bug fix release.");
                }
            }
        }
    }

    public function provideSecurityIssueForProject()
    {
        return $this->doProvideSecurityIssueForProject(__DIR__ . '/../' . getenv('MAKE'));
    }

    private function doProvideSecurityIssueForProject($makeFile)
    {
        $items = [];

        $make = make_parse_info_file($makeFile);
        foreach ($make['projects'] as $name => $project) {
            $isNotLibrary = !isset($project['type']) || 'library' !== $project;
            $isSelfHosted = isset($project['download']);
            if ($isNotLibrary && !$isSelfHosted) {
                $this->assertArrayHasKey('version', $project, "Version is specified for project {$name}.");

                // null mean latest release
                if (null === $project['version']) {
                    continue;
                }

                $version = str_replace('7.x-', '', $project['version']);
                if (!strpos('.x-dev', $version)) {
                    list($major, $minor) = explode('.', $version);
                    $items[] = [$name, $major, $minor];
                }
            }
        }

        return $items;
    }
}
