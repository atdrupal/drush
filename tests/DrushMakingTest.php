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
        
        $data = array(
            array($dir . '/install.php', "Found install.php file"),
            array($dir . '/sites/all/modules/navbar/navbar.info', 'Found navbar module'),
        );
        
        if ('project-headless.make' === getenv('MAKE')) {
            $data[] = array($dir . '/sites/all/modules/gd_react.module', 'Found gd_react module');
        }
        
        return $data;
    }
}
