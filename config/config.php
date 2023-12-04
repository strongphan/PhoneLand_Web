<?php
    class db {
        private $hostname = 'localhost';
        private $port = 3307;
        private $username = 'root';
        private $password = '';
        private $dbname = 'phoneland';

        private $conn;

        public function connect() {
            $this -> conn = null;
            try {
                $this->conn = new PDO('mysql:host='.$this->hostname.';port=3307;dbname='.$this->dbname, 'root', $this->password);
                return $this->conn;
            }
            catch (PDOException $e) {
                http_response_code(500);
                echo "Error: ".$e->getMessage();
            }
            return $this-> conn;   
        }

    }
?>