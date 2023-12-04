<?php
    header('Access-Control-Allow-Origin: *');
    header('Content-Type: application/json');
    header('Access-Control-Allow-Methods: DELETE');
    header('Access-Control-Allow-Headers: Content-Type, Authorization');
    include_once("../../models/NewsModel.php");
    $news = new NewsModel();
    $news->id = isset($_GET['id']) ? $_GET['id'] : die();

    if($news->delete($news->id)){
        $news_info = [
            "status" => "success",
            "message" => "Xóa news thành công"
        ];
    } else {
        $news_info = [
            "status" => "fail",
            "message" => "Xóa news thất bại"
        ];
    }
    echo json_encode($news_info);