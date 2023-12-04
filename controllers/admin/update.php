<?php
    header("Access-Control-Allow-Origin: *");
    header("Content-Type: application/json; charset=UTF-8");
    header("Access-Control-Allow-Methods: PUT");
    header("Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, X-Request-With");


include_once("../../models/AdminModel.php");
$admin = new AdminModel();
$data = json_decode(file_get_contents("php://input"));
$admin->id = $data->id;  

$admin->role = $data->role;
$admin->password = $data->password;
$admin->first_name = $data->first_name;
$admin->last_name = $data->last_name;
$admin->phone = $data->phone;
$admin->address = $data->address;
$admin->email = $data->email;
$admin->avatar = $data->avatar;
$admin->last_login =$data->last_login;
$admin->status = $data->status;
$admin->updated_at = $data->updated_at; 
if(!empty($data->email) && !filter_var($data->email, FILTER_VALIDATE_EMAIL)){
    $admin_info = [
        "status" => "fail",
        "message" => "Email không đúng định dạng"
    ];
}else{
    if($admin->update($admin->id)){
        $admin_info = [
            "status" => "success",
            "message" => "sửa thông tin admin thành công"
        ];
    } else {
        $admin_info = [
            "status" => "fail",
            "message" => "Sửa thông tin admin thất bại"
        ];
    }
}

echo json_encode($admin_info);