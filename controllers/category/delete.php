

<?php
   header('Access-Control-Allow-Origin: *');
    header('Content-Type: application/json');
    header('Access-Control-Allow-Methods: DELETE');
    header('Access-Control-Allow-Headers: Content-Type, Authorization');

    include_once "../../models/CategoryModel.php";

    $category = new CategoryModel();
    $category->id = isset($_GET['id']) ? $_GET['id'] : die();

    $stmt = $category -> getById($category->id);

    if ($category->delete($category->id)) {
        $category_info = [
            "status" => "success",
            "message" => "Xóa category thành công",
            "avatar" => $avatar_path
        ];
    } else {
        $category_info = [
            "status" => "fail",
            "message" => "Xóa category thất bại"
        ];
    }

echo json_encode($category_info);