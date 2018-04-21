<?php

class Student
{
	private $table_name;
	private $connection;

	public $student_id;
    public $name;
    public $father_name;
    public $dob;
    public $email;
    public $contact_number;
    public $created_on;
	public $modified_on;

	function __construct($db_conn)
	{
		$this->table_name = "students";
		$this->connection = $db_conn;
	}

	public function read()
	{
		$sql = "SELECT * 
				FROM $this->table_name";

		$result = $this->connection->query($sql);

		return $result;
	}

	public function create()
	{
		$sql = "INSERT INTO $this->table_name
				(name, father_name, dob, email, contact_number)
				VALUES
				('$this->name', '$this->father_name', '$this->dob', '$this->email', '$this->contact_number')";

		if ($result = $this->connection->query($sql)) {
			return true;
		} else {
			return false;
		}
	}

	public function delete()
	{
		$sql = "DELETE FROM $this->table_name
				WHERE student_id = '$student_id'";

		$result = $this->connection->query($sql);

		if ($result = $this->connection->query($sql)) {
			return true;
		} else {
			return false;
		}
	}
}