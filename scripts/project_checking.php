<?php

namespace atdrupal;

use atdrupal\Project\IssueChecker;
use Symfony\Component\Console\Application;
use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;

require_once __DIR__ . '/vendor/autoload.php';

class ProjectCheckingCmd extends Command
{
    protected function configure()
    {
        $this
            ->setName('project:validate')
            ->setDescription('Validate project to make sure there is no know security issues.')
            ->addArgument('name', InputArgument::REQUIRED, 'Name of project')
            ->addArgument('version', InputArgument::REQUIRED);
    }

    protected function execute(InputInterface $input, OutputInterface $output)
    {
        $name = $input->getArgument('name');
        list($core, $projectVersion) = explode('-', $input->getArgument('version'));
        list($major, $minor) = explode('.', $projectVersion);

        if ($result = (new IssueChecker($name, $major, $minor))->check()) {
            $rows = array();
            foreach ($result as $major => $minors) {
                foreach ($minors as $minor => $status) {
                    $security = in_array(IssueChecker::STATUS_SECURITY, $status) ? '<error>YES</error>' : 'No';
                    $bugFixes = in_array(IssueChecker::STATUS_BUG_FIX, $status) ? '<info>YES</info>' : 'No';
                    $newFeatures = in_array(IssueChecker::STATUS_NEW_FEATURE, $status) ? 'Yes' : 'No';
                    $rows["{$major}.{$minor}"] = ["{$major}.{$minor}", $security, $bugFixes, $newFeatures];
                }
            }
            $table = $this->getHelper('table');
            $table
                ->setHeaders(['Version', 'Security', 'Bug fixes', 'New features'])
                ->setRows($rows);
            $table->render($output);
        }
    }
}

$app = new Application();
$app->add(new ProjectCheckingCmd());
$app->run();
