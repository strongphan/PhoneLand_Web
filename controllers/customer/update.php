<?php
    header("Access-Control-Allow-Origin: *");
    header("Content-Type: application/json; charset=UTF-8");
    header("Access-Control-Allow-Methods: PUT");
    header("Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, X-Request-With");


    include_once("../../models/CustomerModel.php");
    $customer = new CustomerModel();
    $data = json_decode(file_get_contents("php://input"));
    $customer->id = $data->id;

    $old_stmt = $customer -> getById($data->id);
    $old_data = $old_stmt -> fetch();
    foreach($old_data as $field => $value) {
        $customer->$field = $value;
    }

    foreach($data as $field => $value) {
        $customer-> $field = $value;
    }
    if(!empty($data->email) && !filter_var($data->email, FILTER_VALIDATE_EMAIL)){
        $customer_info = [
            "status" => "fail",
            "message" => "Email không đúng định dạng"
        ];
    }else{
        if($customer->update($customer->id)){
            $customer_info = [
                "status" => "success",
                "message" => "sửa thông tin customer thành công"
            ];
        } else {
            $customer_info = [
                "status" => "fail",
                "message" => "Sửa thông tin customer thất bại"
            ];
        }
    }

echo json_encode($customer_info);