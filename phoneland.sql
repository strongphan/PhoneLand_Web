-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 09, 2023 lúc 05:28 PM
-- Phiên bản máy phục vụ: 10.4.25-MariaDB
-- Phiên bản PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `phoneland`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `adminname` varchar(255) DEFAULT NULL COMMENT 'Tên đăng nhập',
  `role` tinyint(1) NOT NULL DEFAULT 0,
  `password` varchar(255) DEFAULT NULL COMMENT 'Mật khẩu đăng nhập',
  `first_name` varchar(255) DEFAULT NULL COMMENT 'Fist name',
  `last_name` varchar(255) DEFAULT NULL COMMENT 'Last name',
  `phone` int(11) DEFAULT NULL COMMENT 'SĐT user',
  `address` varchar(255) DEFAULT NULL COMMENT 'Địa chỉ user',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email của user',
  `avatar` varchar(255) DEFAULT NULL COMMENT 'File ảnh đại diện',
  `last_login` datetime DEFAULT NULL COMMENT 'Lần đăng nhập gần đây nhất',
  `status` tinyint(3) DEFAULT 0 COMMENT 'Trạng thái danh mục: 0 - Inactive, 1 - Active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` datetime DEFAULT NULL COMMENT 'Ngày cập nhật cuối'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `admins`
--

INSERT INTO `admins` (`id`, `adminname`, `role`, `password`, `first_name`, `last_name`, `phone`, `address`, `email`, `avatar`, `last_login`, `status`, `created_at`, `updated_at`) VALUES
(160, 'hoduc1307', 0, '$2y$10$nCMR1pgBgN0AjTu0Gmy1wev7S3xmkhTA2VTsL.1kDEHzwKLkoLuZO', 'Van', 'Duc', 359873313, NULL, NULL, NULL, NULL, 0, '2023-05-15 11:53:35', NULL),
(161, 'vanduc1307', 0, '$2y$10$CCM1OpXJjayKBu8dOjpnG.HsNFOqwkVYioUWO4s3gSV2VtSyHllpy', 'Van Duc', 'Ho', 359873313, NULL, NULL, NULL, NULL, 0, '2023-05-15 11:55:14', NULL),
(164, 'vanduc123', 0, '$2y$10$Nb5EBWOixVgQUUgfvVPFZuvG5kzmTghXBpaSdEv28I7sR2VmL732S', 'Van', 'Duc', 3883838, NULL, NULL, NULL, NULL, 1, '2023-05-17 06:50:46', NULL),
(172, 'vanduc1232', 0, '$2y$10$4DSEEVheiB/V0DKWfs.0M.6L0qc5TLUmAA2APnP3VZ6FB08KHtNPC', 'sadsa', 'sadasd', 23498, NULL, NULL, NULL, NULL, 0, '2023-05-24 12:04:38', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT 'Tên danh mục',
  `type` tinyint(3) DEFAULT 0 COMMENT 'Loại danh mục: 0 - Product, 1 - News',
  `avatar` varchar(255) DEFAULT NULL COMMENT 'Tên file ảnh danh mục',
  `description` text DEFAULT NULL COMMENT 'Mô tả chi tiết cho danh mục',
  `status` tinyint(3) DEFAULT 0 COMMENT 'Trạng thái danh mục: 0 - Inactive, 1 - Active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo danh mục',
  `updated_at` datetime DEFAULT NULL COMMENT 'Ngày cập nhật cuối'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `admin_id`, `name`, `type`, `avatar`, `description`, `status`, `created_at`, `updated_at`) VALUES
(60, 164, 'Apple', 0, 'http://localhost/phoneland/assets/images/6471ab1e450e1.png', '', 1, '2023-05-22 14:25:13', '2023-05-29 16:59:46'),
(63, 164, 'Khám Phá', 1, '', '', 1, '2023-05-23 01:47:30', '2023-05-27 09:18:51'),
(65, 164, 'Review', 1, '', '', 1, '2023-05-24 02:57:35', NULL),
(67, 164, 'Sam Sung', 0, '', '', 1, '2023-05-29 14:59:31', NULL),
(68, 164, 'Xiaomi', 0, '', '', 1, '2023-05-29 14:59:55', NULL),
(69, 164, 'Realme', 0, '', '', 1, '2023-05-29 15:00:01', NULL),
(70, 164, 'Oppo', 0, '', '', 1, '2023-05-29 15:00:08', NULL),
(71, 164, 'LG', 0, '', '', 1, '2023-05-29 15:00:29', NULL),
(72, 164, 'Nokia', 0, '', '', 1, '2023-05-29 15:00:59', NULL),
(73, 164, 'Google', 0, '', '', 1, '2023-05-29 15:01:22', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `event`
--

CREATE TABLE `event` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `image_event` text DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `event`
--

INSERT INTO `event` (`id`, `admin_id`, `category_id`, `image_event`, `description`) VALUES
(45, 164, 60, 'http://localhost/phoneland/assets/images/6474cf0f9291b.jpg', 'Năm 2023, Nhóm 6 của chúng đã trở thành nhóm có số điểm cao nhất. Chúng tôi phát triển chuỗi cửa hàng tiêu chuẩn và Apple Mono Store nhằm mang đến trải nghiệm tốt nhất về sản phẩm và dịch vụ của Apple cho người dùng Việt Nam.'),
(46, 164, 67, 'http://localhost/phoneland/assets/images/6474cf63466bf.jpg', ''),
(47, 164, 60, 'http://localhost/phoneland/assets/images/6474cf6bac542.png', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL COMMENT 'Id của danh mục mà tin tức thuộc về, là khóa ngoại liên kết với bảng categories',
  `name` varchar(255) NOT NULL COMMENT 'Tiêu đề tin tức',
  `summary` text DEFAULT NULL COMMENT 'Mô tả ngắn cho tin tức',
  `avatar` varchar(255) DEFAULT NULL COMMENT 'Tên file ảnh tin tức',
  `content` text DEFAULT NULL COMMENT 'Mô tả chi tiết cho sản phẩm',
  `status` tinyint(3) DEFAULT 0 COMMENT 'Trạng thái danh mục: 0 - Inactive, 1 - Active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` datetime DEFAULT NULL COMMENT 'Ngày cập nhật cuối'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `news`
--

INSERT INTO `news` (`id`, `admin_id`, `category_id`, `name`, `summary`, `avatar`, `content`, `status`, `created_at`, `updated_at`) VALUES
(13, 164, 65, 'Cách ẩn ứng dụng trên iPhone tránh xâm phạm riêng tư', 'Ẩn ứng dụng trên iPhone là phương thức hạn chế người lạ sử dụng các thiết bị iPhone, iPad của mình thậm trí đọc các nội dung tin nhắn nhạy cảm không mong muốn.\n\nBài viết dưới đây là biên pháp tối ưu cho bạn đọc lúc này để có thể giấu app trên nhanh và an toàn', 'http://localhost/phoneland/assets/images/64719d651d5d9.png', 'Mỗi ứng dụng đều có quy định giới hạn độ tuổi đi kèm, ví dụ như Snapchat là 12+.Như vậy mình đã hướng dẫn bạn cách ẩn ứng dụng trên iPhone cơ bản và cài đặt trên iPhone. Hy vọng chúng sẽ giúp ích bạn nhiều trong quá trình và sử dụng sản phẩm đến từ Apple. Và đừng quên chia sẻ với bạn bè nếu thấy hữu ích nhé!Như vậy, chỉ với vài bước thiết lập đơn giản mà ShopDunk chia sẻ trên đây, bạn đã có thể kích hoạt tính năng ẩn ứng dụng trên hầu hết các thiết bị iPhone X, iPhone 8, 8 plus, 7, 7 plus, 6s, 6s plus, 6, 6 plus, 5s, 5, 4s và iPad trong tích tắc mà không cần phải sử dụng tới ứng dụng thứ ba. Nói đến vấn đề bảo mật, có lẽ Apple luôn đi đầu với các tính năng mà họ đem lại. Trong số đó phải kể đến tính năng bảo mật 2 lớp khá hữu ích giúp người dùng có thể giữ an toàn cho dữ liệu của họ hoặc áp dụng chúng vào việc mở khóa tài khoản iCloud.Chỉ với vài bước đơn giản bạn có thể&amp;nbsp;ẩn ứng dụng trên iPhone&amp;nbsp;mà không cần dùng App rồi.&amp;nbsp;Hãy thường xuyên ghé thăm trang tin tức Apple&amp;nbsp;Tin tức ShopDunk&amp;nbsp;để cập nhập những tin tức mới nhất.', 1, '2023-05-27 06:04:06', '2023-05-27 08:08:50'),
(14, 160, 63, '3 ways to differentiate between fake and authentic iPad that not everyone knows', 'iPad is an intelligent device with a relatively high price point, but it is still widely used by many people. Therefore, to meet the high demand, the appearance of fake iPads is not uncommon. In this article, ShopDunk News will help you distinguish between fake and authentic iPads in ways that not everyone knows.', 'https://shopdunk.com/images/thumbs/0017835_0016369_226374_iPad_Pro_12.9_M2_2022_DSeifert_0001_1600_1600.jpeg', 'What is a fake iPad? \r\n\r\nThe concept of a fake iPad is widely used, but not everyone knows its true essence. According to technology professionals, a fake iPad is a product that is imported from manufacturing plants in China. Here, workers replace or recycle all used or damaged iPad models to create a usable device.A large number of fake iPads are imported from network operators or distributors. The price of this device is also divided into many different levels depending on the product model.\r\n\r\nFor beautiful, original, and unmodified devices, they will be sold at high prices. In contrast, other devices will be repaired and replaced to create a relatively presentable product to sell.\r\n\r\nLEARN NOW: Quickly resolve issues of iPad being disabled\r\n\r\nHow to differentiate between fake and genuine iPads? \r\n\r\nAlthough, at first glance, both fake and genuine iPads look alike due to the sophistication of the fake technology, there are specific characteristics that can help you differentiate between them:\r\n\r\n1. Check the box and accessories\r\n\r\nTo check the device\'s box, it is easy to distinguish between fake and genuine iPads. Specific information about the device will be displayed on the outside of the product packaging.', 1, '2023-06-05 05:06:15', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT 'Id của user trong trường hợp đã login và đặt hàng, là khóa ngoại liên kết với bảng users',
  `fullname` varchar(255) DEFAULT NULL COMMENT 'Tên khách hàng',
  `address` varchar(255) DEFAULT NULL COMMENT 'Địa chỉ khách hàng',
  `mobile` int(11) DEFAULT NULL COMMENT 'SĐT khách hàng',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email khách hàng',
  `note` text DEFAULT NULL COMMENT 'Ghi chú từ khách hàng',
  `price_total` int(255) DEFAULT NULL COMMENT 'Tổng giá trị đơn hàng',
  `payment_status` tinyint(2) DEFAULT 0 COMMENT 'Trạng thái đơn hàng: 0 - Chưa thành toán, 1 - Đã thành toán',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo đơn',
  `updated_at` datetime DEFAULT NULL COMMENT 'Ngày cập nhật cuối'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `fullname`, `address`, `mobile`, `email`, `note`, `price_total`, `payment_status`, `created_at`, `updated_at`) VALUES
(48, 15, 'ádas', 'adssad', 0, 'asdasd@asdasd.sd', 'ádasdasdadsasd', 8779, 0, '2023-06-09 11:25:26', NULL),
(49, 15, 'ádsa', 'đá', 0, 'dsasd@hjg.sadas', 'sdsad', 6909, 0, '2023-06-09 12:36:13', NULL),
(50, 15, 'Van Duc', 'VN', 987737376, 'vanduc200@gmail.com', 'Nhanh', 8900000, 0, '2023-06-09 13:08:02', NULL),
(51, 15, 'Van Duc', 'VN', 359873313, 'hoduc589@gmail.com', 'Giao nhanh', 187900000, 0, '2023-06-09 13:10:09', NULL),
(52, 15, 'Van Duc', 'VN', 99828277, 'vanduc@gmail.com', 'ádhgasdhjgdbkhamsdb', 187233222, 0, '2023-06-09 13:12:39', NULL),
(53, 15, 'Van Duc', 'VN', 992929, 'vanduc@gmail.com', 'Nhanh', 69031888, 0, '2023-06-09 13:17:48', NULL),
(54, 15, 'dsadsa', 'ádasd', 0, 'asdD@dsd.dfsdf', 'fsdsdf', 2333222, 0, '2023-06-09 13:21:42', NULL),
(55, 15, 'dsadsa', 'ádasd', 0, 'asdD@dsd.dfsdf', 'fsdsdf', 2333222, 0, '2023-06-09 13:22:09', NULL),
(56, 15, 'dsadsa', 'ádasd', 0, 'asdD@dsd.dfsdf', 'fsdsdf', 2333222, 0, '2023-06-09 13:22:11', NULL),
(57, 15, 'sadasd', 'sadsad', 645654, 'sdsds@sdfffg.dfs', 'ádasd', 2333222, 0, '2023-06-09 13:25:35', NULL),
(58, 15, 'sadasd', 'sadsad', 645654, 'sdsds@sdfffg.dfs', 'ádasd', 2333222, 0, '2023-06-09 13:26:05', NULL),
(59, 15, 'sadasd', 'sadsad', 645654, 'sdsds@sdfffg.dfs', 'ádasd', 6999666, 0, '2023-06-09 13:26:34', NULL),
(60, 15, 'sadasd', 'sadasd', 0, 'dasd@sadas.sadas', 'ádsdsds', 16832888, 0, '2023-06-09 13:27:59', NULL),
(61, 15, 'sadasd', 'sadasd', 0, 'dasd@sadas.sadas', 'ádsdsds', 16832888, 0, '2023-06-09 13:28:37', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `order_id` int(11) DEFAULT NULL COMMENT 'Id của order tương ứng, là khóa ngoại liên kết với bảng orders',
  `product_id` int(11) NOT NULL COMMENT 'ID sp tại thời điểm đặt hàng',
  `product_price` int(11) DEFAULT NULL COMMENT 'Giá sản phẩm tương ứng tại thời điểm đặt hàng',
  `quantity` int(11) DEFAULT NULL COMMENT 'Số lượng sản phẩm tương ứng tại thời điểm đặt hàng'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `order_details`
--

INSERT INTO `order_details` (`order_id`, `product_id`, `product_price`, `quantity`) VALUES
(48, 9, 8779999, 1),
(49, 9, 8779999, 786),
(49, 23, 8900000, 1),
(50, 23, 8900000, 1),
(51, 23, 8900000, 1),
(51, 22, 179000000, 1),
(52, 10, 2333222, 1),
(52, 21, 5900000, 1),
(52, 22, 179000000, 1),
(53, 10, 2333222, 4),
(53, 23, 8900000, 4),
(53, 21, 5900000, 4),
(53, 16, 499000, 1),
(54, 10, 2333222, 1),
(55, 10, 2333222, 1),
(56, 10, 2333222, 1),
(57, 10, 2333222, 1),
(58, 10, 2333222, 1),
(59, 10, 2333222, 3),
(60, 10, 2333222, 4),
(60, 18, 1600000, 1),
(60, 21, 5900000, 1),
(61, 10, 2333222, 4),
(61, 18, 1600000, 1),
(61, 21, 5900000, 1);

--
-- Bẫy `order_details`
--
DELIMITER $$
CREATE TRIGGER `create_orders` AFTER INSERT ON `order_details` FOR EACH ROW BEGIN
    DECLARE quantity INT;
    DECLARE product_id INT;
    SELECT NEW.quantity, NEW.product_id INTO quantity, product_id;
    
    IF (SELECT amount FROM products WHERE id = product_id) >= quantity THEN
        UPDATE products SET amount = amount - quantity WHERE id = product_id;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Not enough products in stock.';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL COMMENT 'Id của danh mục mà sản phẩm thuộc về, là khóa ngoại liên kết với bảng categories',
  `title` varchar(255) DEFAULT NULL COMMENT 'Tên sản phẩm',
  `avatar` text DEFAULT NULL COMMENT 'Tên file ảnh sản phẩm',
  `color` varchar(55) DEFAULT NULL COMMENT 'Màu sắc',
  `price` int(11) DEFAULT NULL COMMENT 'Giá sản phẩm',
  `amount` int(11) DEFAULT NULL COMMENT 'Số lượng sản phẩm trong kho',
  `summary` varchar(255) DEFAULT NULL COMMENT 'Mô tả ngắn cho sản phẩm',
  `content` text DEFAULT NULL COMMENT 'Mô tả chi tiết cho sản phẩm',
  `status` tinyint(3) DEFAULT 1 COMMENT 'Trạng thái danh mục: 0 - Inactive, 1 - Active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` datetime DEFAULT NULL COMMENT 'Ngày cập nhật cuối'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `admin_id`, `category_id`, `title`, `avatar`, `color`, `price`, `amount`, `summary`, `content`, `status`, `created_at`, `updated_at`) VALUES
(9, 164, 60, 'iPhone 13 128GB | Chính hãng VN/A', 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/1/4/14_1_9_2_9.jpg', 'pink', 15600999, 0, 'pausdikshadknsahdlahsldkhasdljahsdkjasdnmasndasdkahsd', '16GB*||*1TB*||*OLED*||*HD+*||*120HZ*||*PVC', 1, '2023-05-23 16:44:24', '2023-05-29 19:20:04'),
(10, 164, 60, 'Điện thoại iPhone 14 128GB – Like New', 'https://www.techone.vn/wp-content/uploads/2022/09/iphone-14-128gb-mau-trang-1.jpg', '#000', 2333222, 78, 'ksjdk', 'hkjh*||*jhkjh*||*OLED*||*1080p*||*120HZ*||*Nhựa', 1, '2023-05-23 16:46:12', '2023-05-29 18:57:44'),
(11, 160, 73, 'Google Pixel 6 mới 100% Fullbox', 'https://product.hstatic.net/1000370129/product/google-pixel-6-_1__2723239cf91949d4a0fa1238fc49a520_master.jpg', '#fff', 8900000, 100, NULL, NULL, 1, '2023-06-09 11:58:12', NULL),
(12, 160, 73, 'Google Pixel 5 5G Quốc tế Likenew 99%', 'https://product.hstatic.net/1000370129/product/pixel_5_black_digiphone_4732c9dd4f664d8b892b1a2e1463d632_master_0b913738e624442e94c5aac5fabf296c_master.png', '#000', 4900000, 100, NULL, NULL, 1, '2023-06-09 11:59:40', NULL),
(13, 160, 73, 'Google Pixel 4 XL Likenew 99%', 'https://product.hstatic.net/1000370129/product/google_pixel_4_xl_bk_2_da1d594950414c5c86457240fb06d57c_master.jpg', '#fff', 4400000, 100, NULL, NULL, 1, '2023-06-09 12:01:14', NULL),
(14, 160, 73, '\r\nGOOGLE PIXEL 7 5G 8GB-128GB', 'https://bachlongstore.vn/vnt_upload/product/05_2023/pixel_7_black_thumb.png', NULL, NULL, NULL, NULL, NULL, 1, '2023-06-09 12:03:01', NULL),
(15, 160, 72, 'Nokia G22 4GB 128GB', 'https://cdn2.cellphones.com.vn/x358,webp,q100/media/catalog/product/d/g/dgtyi8899_.jpg', '#ccc', 4900000, 12, NULL, NULL, 1, '2023-06-09 12:05:11', NULL),
(16, 160, 72, 'Điện thoại nokia nắp gập 2720 4G ', 'https://lzd-img-global.slatic.net/g/p/3b7d8d10fc5ebfb2c5f794c3eb9ef028.jpg_720x720q80.jpg_.webp', 'red', 499000, 99, NULL, NULL, 1, '2023-06-09 12:06:10', NULL),
(17, 160, 72, 'Nokia 5710 XpressAudio', 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/n/o/nokia-5701.jpg', 'red', 1765000, 122, NULL, NULL, 1, '2023-06-09 12:11:37', NULL),
(18, 160, 72, 'Nokia C20', 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/n/o/nokia-c20-2.jpg', '#000', 1600000, 10, NULL, NULL, 1, '2023-06-09 12:12:52', NULL),
(19, 160, 72, 'Nokia 110 4G', 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/1/1/110-1.jpg', 'yellow', 720000, 122, NULL, NULL, 1, '2023-06-09 12:14:13', NULL),
(20, 160, 67, 'SAMSUNG Galaxy S22 Ultra 5G Mỹ Mới Fullbox', 'https://product.hstatic.net/1000370129/product/s22_ultra_den_87452d1a31e241019518f8f97535f104_master_e873eca7c12845f39ec8c99440a3c984_master.png', 'black', 13900000, 23, NULL, NULL, 1, '2023-06-09 12:16:59', NULL),
(21, 160, 67, 'Samsung Galaxy S21 5G', 'https://shopdidong.vn/profiles/shopdidongvn/uploads/attach/1645828698_s21.jpg', '#8E8EAE', 5900000, 1214, NULL, NULL, 1, '2023-06-09 12:16:59', NULL),
(22, 160, 60, 'iPhone 14 Pro max bản giới hạn 150 chiếc kỷ niệm 15 năm G’Ace', 'https://hpcluxury.com.vn/wp-content/uploads/2022/09/iPhone-14-Pro-Max-m%E1%BA%A1-v%C3%A0ng-%C4%91%C3%ADnh-kim-c%C6%B0%C6%A1ng-15th-k%E1%BB%B7-ni%E1%BB%87m-Gace-m%E1%BA%B7t-sau.jpg', 'yellow', 179000000, 0, NULL, NULL, 1, '2023-06-09 12:24:09', NULL),
(23, 160, 60, 'iPhone SE (2022) 64GB', 'https://cdn1.viettelstore.vn/Images/Product/ProductImage/664640501.jpeg', 'red', 8900000, 115, NULL, NULL, 1, '2023-06-09 12:26:20', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL COMMENT 'Tên đăng nhập',
  `password` varchar(255) DEFAULT NULL COMMENT 'Mật khẩu đăng nhập',
  `first_name` varchar(255) DEFAULT NULL COMMENT 'Fist name',
  `last_name` varchar(255) DEFAULT NULL COMMENT 'Last name',
  `phone` int(11) DEFAULT NULL COMMENT 'SĐT user',
  `address` varchar(255) DEFAULT NULL COMMENT 'Địa chỉ user',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email của user',
  `avatar` varchar(255) DEFAULT NULL COMMENT 'File ảnh đại diện',
  `last_login` datetime DEFAULT NULL COMMENT 'Lần đăng nhập gần đây nhất',
  `facebook` varchar(255) DEFAULT NULL COMMENT 'Link facebook',
  `status` tinyint(3) DEFAULT 0 COMMENT 'Trạng thái danh mục: 0 - Inactive, 1 - Active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` datetime DEFAULT NULL COMMENT 'Ngày cập nhật cuối'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `first_name`, `last_name`, `phone`, `address`, `email`, `avatar`, `last_login`, `facebook`, `status`, `created_at`, `updated_at`) VALUES
(3, 'user3', 'password3', 'First3', 'Last3', 987654321, 'Address3', 'user3@example.com', 'avatar3.jpg', '0000-00-00 00:00:00', '', 1, '2023-05-17 15:40:27', '0000-00-00 00:00:00'),
(4, 'user4', 'password4', 'Van', 'Last4', 456789123, 'Address4', 'user4@example.com', 'avatar4.jpg', '0000-00-00 00:00:00', '', 1, '2023-05-17 15:40:27', '0000-00-00 00:00:00'),
(5, 'user5', 'password5', 'First5', 'Last5', 789123456, 'Address5', 'user5@example.com', 'avatar5.jpg', '0000-00-00 00:00:00', '', 1, '2023-05-17 15:40:27', '0000-00-00 00:00:00'),
(7, 'user7', 'password7', 'First7', 'Last7', 654789321, 'Address7', 'user7@example.com', 'avatar7.jpg', '0000-00-00 00:00:00', '', 1, '2023-05-24 15:40:27', '0000-00-00 00:00:00'),
(8, 'user8', 'password8', 'First8', 'Last8', 789456123, 'Address8', 'user8@example.com', 'avatar8.jpg', '0000-00-00 00:00:00', '', 1, '2023-05-17 15:40:27', '0000-00-00 00:00:00'),
(9, 'user9', 'password9', 'First9', 'Last9', 456123789, 'Address9', 'user9@example.com', 'avatar9.jpg', '0000-00-00 00:00:00', '', 1, '2023-05-17 15:40:27', '0000-00-00 00:00:00'),
(10, 'user10', 'password10', 'First10', 'Last10', 123789456, 'Address10', 'user10@example.com', 'avatar10.jpg', '0000-00-00 00:00:00', '', 0, '2023-05-17 15:40:27', '0000-00-00 00:00:00'),
(11, 'user11', 'password11', 'First11', 'Last11', 987321654, 'Address11', 'user11@example.com', 'avatar11.jpg', '0000-00-00 00:00:00', '', 0, '2023-05-23 15:40:27', '0000-00-00 00:00:00'),
(15, 'vanduc13', '$2y$10$pHkAMcudYyLxGAld5mXNnOOH7kCZbj6.Pj26xg72Q9ykPwEl/wuIW', 'Duc', 'Ho Van', 359873313, 'Việt Nam', 'vanduc13@gmail.com', 'http://localhost/phoneland/assets/images/64834453f2596.png', '0000-00-00 00:00:00', '', 1, '2023-06-04 12:05:50', '0000-00-00 00:00:00');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_adminname` (`adminname`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Chỉ mục cho bảng `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=173;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT cho bảng `event`
--
ALTER TABLE `event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT cho bảng `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `event_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `event_ibfk_2` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`);

--
-- Các ràng buộc cho bảng `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `news_ibfk_2` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
