<?php

class DrushMakingTest extends PHPUnit_Framework_TestCase
{
    /**
     * @dataProvider provideMakeResults
     */
    public function testMakeResults($file, $msg)
    {
        $this->assertFileExists($file, $msg);
    }
    
    public function provideMakeResults() {
        $dir = dirname(__DIR__) . '/www';
        return array(
            array($dir . '/install.php', "Found install.php file"),
            array($dir . '/sites/all/modules/navbar/navbar.info', 'Found navbar module'),
            array($dir . '/sites/all/modules/gd_react.module', 'Found gd_react module'),
        );
    }
}
