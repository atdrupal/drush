<?php

namespace atdrupal\Project;

use GuzzleHttp\Client;

class IssueChecker
{
    const STATUS_OK = 0;
    const STATUS_SECURITY = 1;
    const STATUS_BUG_FIX = 2;
    const STATUS_NEW_FEATURE = 3;

    private $projectName;
    private $projectMajorVersion;
    private $projectMinorVersion;

    /**
     * IssueChecker constructor.
     *
     * @param string $projectName
     * @param int    $projectMajorVersion
     * @param string $projectMinorVersion
     */
    public function __construct($projectName, $projectMajorVersion, $projectMinorVersion)
    {
        $this->projectName = $projectName;
        $this->projectMajorVersion = $projectMajorVersion;
        $this->projectMinorVersion = $projectMinorVersion;
    }

    private function fetchReleases()
    {
        $response = (new Client())
            ->get("https://updates.drupal.org/release-history/{$this->projectName}/7.x")
            ->getBody();
        $projectInfo = simplexml_load_string((string) $response);
        return $projectInfo->releases->release;
    }

    public function check()
    {
        $results = [];

        foreach ($this->fetchReleases() as $release) {
            $releaseMajorVersion = (int) $release->version_major;
            $releaseMinorVersion = (string) $release->version_patch;
            $validMajor = $this->projectMajorVersion == $releaseMajorVersion;
            $validMinor = version_compare($this->projectMinorVersion, $releaseMinorVersion) < 0;
            if ($validMajor && $validMinor && ($_results = $this->checkRelease($release))) {
                $results[$releaseMajorVersion][$releaseMinorVersion] = $_results;
            }
        }

        return $results;
    }

    private function checkRelease($release)
    {
        $results = [];

        if (!isset($release->terms)) {
            return $results;
        }

        foreach ($release->terms->term as $term) {
            switch ((string) $term->value) {
                case 'Security update':
                    $results[] = static::STATUS_SECURITY;
                    break;
                case 'Bug fixes':
                    $results[] = static::STATUS_BUG_FIX;
                    break;
                case 'New features':
                    $results[] = static::STATUS_NEW_FEATURE;
                    break;
            }
        }
        return $results;
    }
}
