<?php

class TestDrushMaking extends PHPUnit_Framework_TestCase
{
    public function testMakeResults()
    {
        $dir = dirname(__DIR__) . '/www';
        $this->assertFileExists($dir . '/www/install.php', "Found install.php file");
        $this->assertFileExists($dir . '/www/sites/all/modules/navbar/navbar.info', 'Found navbar module');
    }
}
