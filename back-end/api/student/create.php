<?php
// header required for RESTfull APIs
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
 
require '../config/db_connection.php';
include '../model/student.php';

// DBConnection object instantiation
$db_obj = new DBConnection();
$db_conn = $db_obj->getConnection();

// Student object instantiation
$student = new Student($db_conn);

// get posted data
$data = json_decode(file_get_contents("php://input"));

// set student property values
$student->name = htmlspecialchars(strip_tags($data->name));
$student->father_name = htmlspecialchars(strip_tags($data->father_name));
$student->dob = htmlspecialchars(strip_tags($data->dob));
$student->email = htmlspecialchars(strip_tags($data->email));
$student->contact_number = htmlspecialchars(strip_tags($data->contact_number));

// INSERT query result
$result = $student->create();

// check if record created
if ($result) {
	$json_Response = json_encode(
		array('message' => 'Student record was created')
	);

} else {
	$json_Response = json_encode(
		array('message' => 'Unable to create student record')
	);

}

// Print json_Response
echo $json_Response;
?>