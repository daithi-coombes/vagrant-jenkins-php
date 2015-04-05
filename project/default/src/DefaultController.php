<?php

class DefaultController{

    public function __construct()
    {
        ;
    }

    public static function factory(array $params)
    {

        $obj = new DefaultController($params);
        $obj->set_params($params);

        return $obj;
    }

    public function setParams(array $params)
    {

        foreach ($params as $property=>$value) {

            if ( property_exists($this, $property) ) {
                $this->$property = $value;
            }
        }

        return $this;
    }

    public function doLogic()
    {

    }
}
