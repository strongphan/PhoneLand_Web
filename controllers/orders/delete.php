<?php
    header('Access-Control-Allow-Origin: *');
    header('Content-Type: application/json');
    header('Access-Control-Allow-Methods: DELETE');
    header('Access-Control-Allow-Headers: Content-Type, Authorization');
    include_once("../../models/OrderModel.php");
    $order = new OrderModel();
    $order->id = isset($_GET['id']) ? $_GET['id'] : die();

    if($order->delete($order->id)){
        $order_info = [
            "status" => "success",
            "message" => "Xóa order thành công"
        ];
    } else {
        $order_info = [
            "status" => "fail",
            "message" => "Xóa order thất bại"
        ];
    }
    echo json_encode($order_info);