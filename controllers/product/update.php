<?php
    header("Access-Control-Allow-Origin: *");
    header("Content-Type: application/json; charset=UTF-8");
    header("Access-Control-Allow-Methods: POST");
    header("Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, X-Request-With");


    include_once("../../models/ProductModel.php");
    $product = new ProductModel();
    $data = json_decode(file_get_contents("php://input"));
    
    $product->id = $data->id;
    $product->category_id = $data->category_id;
    $product->title = $data->title;
    $product->avatar = $data->avatar;
    $product->color = $data->color;
    $product->price = $data->price;
    $product->amount = $data->amount;
    $product->summary = $data->summary;
    $product->content = $data->content;
    $product->status = $data->status;
    $product->updated_at = (new \DateTime())->format('Y-m-d H:i:s'); 

    if(strpos($data->avatar, "data:image") === 0) {
            $avatar_base64 = $data->avatar;
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
            $product->avatar = "http://localhost:8012/".$avatar_path;

    }else {
        $product->avatar = $data->avatar;
    }

    if(empty($data->title) || empty($data->category_id)){

        $admin_info = [
            "status" => "success",
            "message" => "Không được để trống category ID, tên sản phẩm"
        ];
    }else{
        if($product->update($product->id)){
            if(strpos($data->avatar, "data:image") === 0) {
                file_put_contents($_SERVER['DOCUMENT_ROOT'] .'/'. $avatar_path, $avatar_data);
            }
            $admin_info = [
                'status'=>'success',
                'message'=>'Sửa product thành công'
            ];

                
        }else{
            $admin_info = [
                'status'=>'success',
                'message'=>'Sửa product thất bại'
            ];
        }
    }
    echo json_encode($admin_info);
