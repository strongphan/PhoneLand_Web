<?php
    header("Access-Control-Allow-Origin: *");
    header("Content-Type: application/json; charset=UTF-8");
    header("Access-Control-Allow-Methods: PUT");
    header("Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, X-Request-With");


    include_once("../../models/EventModel.php");
    $event = new EventModel();
    $data = json_decode(file_get_contents("php://input"));
    $event->id = $data->id;
    $event->category_id = $data->category_id;
    $event->image_event = $data->image_event;
    $event->description = $data->description;

    if(strpos($data->image_event, "data:image") === 0) {
            $avatar_base64 = $data->image_event;
            list($type, $avatar_data) = explode(';', $avatar_base64);
            list(, $avatar_data) = explode(',', $avatar_data);
            $avatar_data = base64_decode($avatar_data);

            $finfo = new finfo(FILEINFO_MIME_TYPE);
            $mime_type = $finfo->buffer($avatar_data);
            
            $extension = '.png';
            switch ($mime_type) {
              case 'image/jpeg':
                $extension = '.jpg';
                break;
              case 'image/png':
                $extension = '.png';
                break;
              case 'image/gif':
                $extension = '.gif';
                break;
              case 'image/webp':
                $extension = '.webp';
                break;
              default:
                // Nếu định dạng không được hỗ trợ, quăng lỗi
                throw new Exception("Unsupported image format: $mime_type");
            }

            $avatar_path = 'phoneland/assets/images/' . uniqid() . $extension;
            $event->image_event = "http://localhost:8012/".$avatar_path;

    }else {
        $event->image_event = $data->image_event;
    }

    if( empty($data->category_id)){
        $event_info = [
            "status" => "fail",
            "message" => "Không được để trống category ID"
        ];
    }else{
        if($event->update($event->id)){
            if(strpos($data->image_event, "data:image") === 0) {
                file_put_contents($_SERVER['DOCUMENT_ROOT'] .'/'. $avatar_path, $avatar_data);
            }
            $event_info = [
                "status" => "success",
                "message" => "sửa thông tin event thành công"
            ];
        } else {
            $event_info = [
                "status" => "fail",
                "message" => "Sửa thông tin event thất bại"
            ];
        }
    }

echo json_encode($event_info);