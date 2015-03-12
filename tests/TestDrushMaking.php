<?php

class TestDrushMaking extends PHPUnit_Framework_TestCase
{
    public function testDrupalMake()
    {
        $dir = dirname(__DIR__) . '/www';
        $this->assertFileExists($dir . '/www/install.php', "Found install.php file");
        $this->assertFileExists($dir . '/www/sites/all/modules/navbar/navbar.info', 'Found navbar module');
    }

    public function testProjectAPIMake()
    {
        $dir = dirname(__DIR__) . '/project-api';
        $this->assertFileExists($dir . '/www/install.php', "Found install.php file");
        $this->assertFileExists($dir . '/www/sites/all/modules/api/api.info', 'Found api module');
    }

    public function testProjectHeadLess()
    {
        $dir = dirname(__DIR__) . '/project-headless';
        $this->assertFileExists($dir . '/www/install.php', "Found install.php file");
        $this->assertFileExists($dir . '/www/sites/all/modules/restws/restws.info', 'Found restws module');
    }
}
