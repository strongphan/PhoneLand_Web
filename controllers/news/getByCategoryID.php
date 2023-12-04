<?php

    include_once("../../config/config.php");
    include_once("../../models/NewsModel.php");

    $news = new NewsModel();
    $news->id = isset($_GET['category_id']) ? $_GET['category_id'] : "null";
    $stmt = $news->getByCategoryID($news->id);

    $num = $stmt -> rowCount();

    if ($num > 0) {
        $data = $stmt -> fetchAll(PDO::FETCH_ASSOC);
        $news_info = [
            "status" => "success",
            "data" => $data
        ];
    } else {
        $news_info = [
            "status" => "fail",
            "message" => "No news found."
        ];
    }

    echo json_encode($news_info);
?>

