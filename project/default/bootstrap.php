<?php
namespace nitevibe;
use nitevibe;

//constants
define( 'JENKINSPHP_DIR', \dirname(__FILE__) );
define( 'JENKINSPHP_NAMESPACE' , __NAMESPACE__ );


//sessions
if( !isset( $_SESSION ) )
    ; //session_start();


/**
 * Autoload nitevibe library
 * @param  string $class Full class name
 */
function autoload( $class ){

    var_dump($class);
    $class = str_replace("nitevibe\\", "lib\\", $class );
    $filename = JENKINSPHP_DIR . DIRECTORY_SEPARATOR . 'src' . DIRECTORY_SEPARATOR . str_replace('\\', DIRECTORY_SEPARATOR, $class) . '.php';

    var_dump($filename);
    if (file_exists($filename)) {
        include_once($filename);
    }
}
\spl_autoload_register( __NAMESPACE__ . '\autoload' );
