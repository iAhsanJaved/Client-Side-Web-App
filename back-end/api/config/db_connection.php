<?php

class DBConnection
{
	private $host;
	private $username;
	private $password;
	private $db_name;
	public $connection;

	function __construct()
	{
		$this->host = "localhost";
		$this->username = "root";
		$this->password = "";
		$this->db_name = "db_sms";
		$this->connection = null;
	}

	public function getConnection()
	{
		try {
			$this->connection = new mysqli(
				$this->host, 
				$this->username, 
				$this->password, 
				$this->db_name
			);
		} catch(mysqli_sql_exception $ex){
			echo 'DBConnection ERROR:'.$e->errorMessage();
		}

		return $this->connection;
	}
}


?>