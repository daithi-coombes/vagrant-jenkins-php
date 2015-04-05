<?php
namespace JenkinsPHP;
use JenkinsPHP;

require_once('bootstrap.php');

$params = array(
    'foo' => 'bar',
);
$default = DefaultController::factory($params);
