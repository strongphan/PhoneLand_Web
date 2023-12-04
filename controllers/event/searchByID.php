<?php
    header('Access-Control-Allow-Origin: *');
    header('Content-Type: application/json');

    include_once("../../models/EventModel.php");

    $q = isset($_GET['q']) ? $_GET['q'] : "null";
    $l = isset($_GET['l']) ? $_GET['l'] : "null";
    if($q == null) {
    	$events = [
            "status" => "fail",
            "message" => "No event found."
        ];
    }
    else {
	    $model = new EventModel();
	    $stmt = $model->search($q, $l);
	    $num = $stmt -> rowCount();
	    if ($num > 0) {
	        $data = $stmt -> fetchAll(PDO::FETCH_ASSOC);
	        $events = [
	            "status" => "success",
	            "data" => $data
	        ];
	    } else {
	        $events = [
	            "status" => "fail",
	            "message" => "No event found."
	        ];
	    }
    }
    echo json_encode($events);

?>