<?php
// header required for RESTfull APIs
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json, charset=UTF-8");

require '../config/db_connection.php';
include '../model/student.php';

// DBConnection object instantiation
$db_obj = new DBConnection();
$db_conn = $db_obj->getConnection();

// Student object instantiation
$student = new Student($db_conn);

// SELECT query result
$result = $student->read();
// get number of records from result
$num_records = $result->num_rows;

// check if record exist
if ($num_records > 0) {
	// Students arrays
	$students_arr = array();
	$students_arr["records"] = array();

	// Fetching each record
	while ($row = $result->fetch_assoc()) {
		
		// extract row (eg. row['name'] to $name)
		extract($row);

		$student = array(
			'student_id' => $student_id,
			'name' => $name,
    		'father_name' => $father_name,
    		'dob' => $dob,
    		'email' => $email,
    		'contact_number' => $contact_number,
    		'created_on' => $created_on,
			'modified_on' => $modified_on
		);

		array_push($students_arr["records"], $student);
	}

	$json_Response = json_encode($students_arr);

} else {
	$json_Response = json_encode(
		array('message' => 'No student record exist')
	);

}

// Print json_Response
echo $json_Response;
?>