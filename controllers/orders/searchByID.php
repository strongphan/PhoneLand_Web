<?php
    header('Access-Control-Allow-Origin: *');
    header('Content-Type: application/json');

    include_once("../../models/OrderModel.php");

    $q = isset($_GET['q']) ? $_GET['q'] : "null";
    $l = isset($_GET['l']) ? $_GET['l'] : "null";
    if($q == null) {
    	$orders = [
            "status" => "fail",
            "message" => "No product found."
        ];
    }
    else {
	    $model = new OrderModel();
	    $stmt = $model->search($q, $l);
	    $num = $stmt -> rowCount();
	    if ($num > 0) {
	        $data = $stmt -> fetchAll(PDO::FETCH_ASSOC);
	        $orders = [
	            "status" => "success",
	            "data" => $data
	        ];
	    } else {
	        $orders = [
	            "status" => "fail",
	            "message" => "No product found."
	        ];
	    }
    }
    echo json_encode($orders);

?>