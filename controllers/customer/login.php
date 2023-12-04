<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, X-Request-With");

include_once("../../config/config.php");
include_once("../../models/CustomerModel.php");

$user = new CustomerModel();

$data = json_decode(file_get_contents("php://input"));

$user -> username = $data -> username;
$user -> password = $data -> password;

$stmt = $user -> getPassword($user -> username);

$data = $stmt -> fetch(PDO::FETCH_ASSOC);

$password = $user -> password;

$hashed_password = $data['password'];

if (password_verify($password, $hashed_password)) {
    $user_info = [
        "status" => "success",
        "message" => "Đăng nhập thành công"
    ];
} else {
    $user_info = [
        "status" => "fail",
        "message" => "Tài khoản hoặc mật khẩu không chính xác"
    ];
}

echo json_encode($user_info);