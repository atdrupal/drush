<?php

class DrushMakingTest extends PHPUnit_Framework_TestCase
{
    public function testMakeResults()
    {
        $dir = dirname(__DIR__) . '/www';
        $this->assertFileExists($dir . '/install.php', "Found install.php file");
        $this->assertFileExists($dir . '/sites/all/modules/navbar/navbar.info', 'Found navbar module');
    }
}
