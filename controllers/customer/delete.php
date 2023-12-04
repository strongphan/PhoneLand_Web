<?php
    header('Access-Control-Allow-Origin: *');
    header('Content-Type: application/json');
    header('Access-Control-Allow-Methods: DELETE');
    header('Access-Control-Allow-Headers: Content-Type, Authorization');
    include_once("../../models/CustomerModel.php");
    $customer = new CustomerModel();
    $customer->id = isset($_GET['id']) ? $_GET['id'] : die();

    if($customer->delete($customer->id)){
        $customer_info = [
            "status" => "success",
            "message" => "Xóa user thành công"
        ];
    } else {
        $customer_info = [
            "status" => "fail",
            "message" => "Xóa user thất bại"
        ];
    }
    echo json_encode($customer_info);