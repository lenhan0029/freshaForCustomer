<?php
class Database {
    private $host = 'localhost';
    private $username = 'root';
    private $password = '';
    private $databaseName = 'fresha';
    public $conn;
    public function __construct() {
        $this->connect();
    }
    public function connect() {
        try {
            if(($this->conn = mysqli_connect($this->host, $this->username, $this->password, $this->databaseName))) {
                return $this->conn;
            } 
            else {
                throw new Exception('Không thể kết nối đến Database <br />');
            }
        } 
        catch (Exception $e) {
            echo $e->getMessage();
        }
    }
}
?>