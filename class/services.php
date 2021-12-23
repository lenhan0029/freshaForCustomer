<?php
include '../../connection.php';


class ServiceModel extends Database {

    public function __construct() {
        parent::connect();
    }
  
}