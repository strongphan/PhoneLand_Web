<?php
    header('Access-Control-Allow-Origin: *');
    header('Content-Type: application/json');

    include_once("../../models/CustomerModel.php");

    $q = isset($_GET['q']) ? $_GET['q'] : "null";
    $l = isset($_GET['l']) ? $_GET['l'] : "null";
    if($q == null) {
    	$customers = [
            "status" => "fail",
            "message" => "No user found."
        ];
    }
    else {
	    $model = new CustomerModel();
	    $stmt = $model->search($q, $l);
	    $num = $stmt -> rowCount();
	    if ($num > 0) {
	        $data = $stmt -> fetchAll(PDO::FETCH_ASSOC);
	        $customers = [
	            "status" => "success",
	            "data" => $data
	        ];
	    } else {
	        $customers = [
	            "status" => "fail",
	            "message" => "No user found."
	        ];
	    }
    }
    echo json_encode($customers);

?>