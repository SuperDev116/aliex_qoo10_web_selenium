-- phpMyAdmin SQL Dump
-- version 5.2.1-1.el7.remi
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 26, 2024 at 10:46 AM
-- Server version: 10.5.13-MariaDB-log
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `xs998400_webqoo10`
--

-- --------------------------------------------------------

--
-- Table structure for table `amazon_products`
--

CREATE TABLE `amazon_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `asin` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_prime` tinyint(1) DEFAULT 0,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `img_url_main` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img_url_thumb` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `r_price` int(11) NOT NULL DEFAULT 0,
  `price` int(11) NOT NULL DEFAULT 0,
  `category` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `material` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `origin` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exhibit` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reason` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `amazon_products`
--

INSERT INTO `amazon_products` (`id`, `user_id`, `asin`, `is_prime`, `title`, `url`, `shipping`, `quantity`, `img_url_main`, `img_url_thumb`, `r_price`, `price`, `category`, `description`, `color`, `size`, `weight`, `material`, `origin`, `exhibit`, `reason`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'B075D7BDPX', 1, 'サンワサプライ 海外電源変換アダプタ ブラック TR-AD4BK', 'https://www.amazon.co.jp/dp/B075D7BDPX', '無料配送 \n8月 16日 に配送予定 ', 10, 'https://c.media-amazon.com/images/I/61qtYBO7MBL._AC_SY450_.jpg', '[\"https:\\/\\/ae01.alicdn.com\\/kf\\/Sb4becd19e02b4f4da815a085bf80d3bek\\/200000mAh-2-USB-iPhone-Android.jpg_80x80.jpg_.webp\"]', 3265, 3265, '320002268', '商品説明\n最大5v1aの高速ワイヤレス充電をサポート...', '', '', '', 'プラスチック', '', '1', '', '2024-09-10 21:30:28', '2024-09-10 21:30:28', NULL),
(2, 1, 'B09X1DY9VV', 1, '旭電機化成 テレビの音も聞こえる手もとスピーカー 2 ブラック ANS-302BK 〈本体〉14×13×高さ12cm、〈本体プラグコード〉全長5m', 'https://www.amazon.co.jp/dp/B09X1DY9VV', '無料配送 \n8月 16日 に配送予定 ', 30, 'https://c.media-amazon.com/images/I/61GH6-ukFpL._AC_SX425_.jpg', '[\"https:\\/\\/ae01.alicdn.com\\/kf\\/Sb4becd19e02b4f4da815a085bf80d3bek\\/200000mAh-2-USB-iPhone-Android.jpg_80x80.jpg_.webp\"]', 12312, 12312, '320002268', '商品説明\n最大5v1aの高速ワイヤレス充電をサポート...', '', '', '', 'プラスチック', '', '1', '', '2024-09-10 21:30:28', '2024-09-10 21:30:28', NULL),
(3, 1, 'B0BXH49KBS', 1, '[Pogsun] アップルウォッチバンド Apple Watch バンドコンパチブル 38mm 40mm 41mm レディース iwatchかわいいバンド バースデー ギフト あっぷるうおっちバンド 防水 ステンレススチールバックル 調整ツール付き Apple Watch Series8 7 6 SE 5 4 3 2 1対応', 'https://www.amazon.co.jp/dp/B0BXH49KBS', '無料配送 \n8月 16日 に配送予定 ', 5, 'https://c.media-amazon.com/images/I/71bfsc7OkKL._AC_SY450_.jpg', '[\"https:\\/\\/ae01.alicdn.com\\/kf\\/Sb4becd19e02b4f4da815a085bf80d3bek\\/200000mAh-2-USB-iPhone-Android.jpg_80x80.jpg_.webp\"]', 7868, 7868, '320002268', '商品説明\n最大5v1aの高速ワイヤレス充電をサポート...', '', '', '', 'プラスチック', '', '1', '', '2024-09-10 21:30:28', '2024-09-10 21:30:28', NULL),
(4, 1, 'B09VC8393C', 1, 'PULUZ 40cm撮影ボックス ポータブル 簡易スタジオ 高 CRI (95+) 3 色温度 調光可能 ライトボックス Type-C 撮影キット 射撃テントボックス 製品写真用 6 x 両面カラー背景付き', 'https://www.amazon.co.jp/dp/B09VC8393C', '無料配送 \n8月 16日 に配送予定 ', 30, 'https://c.media-amazon.com/images/I/71XXzSwJVpL._AC_SY355_.jpg', '[\"https:\\/\\/ae01.alicdn.com\\/kf\\/Sb4becd19e02b4f4da815a085bf80d3bek\\/200000mAh-2-USB-iPhone-Android.jpg_80x80.jpg_.webp\"]', 2000, 1178, '320002268', '商品説明\n最大5v1aの高速ワイヤレス充電をサポート...', '', '', '', 'プラスチック', '', '1', '', '2024-09-10 21:30:28', '2024-09-10 21:30:28', NULL),
(5, 1, 'B07K3ZLRPL', 0, 'cheero Power Plus Danboard Version 13400mAh PD18W 大容量 モバイルバッテリー (パワーデリバリー対応) 2ポート出力 Type-A Type-C 対応機種へ超高速充電 iPhone, Android AUTO-IC搭載 PSEマーク付 Power Delivery 3.0 対応 AtoCケーブル・CtoCケーブル付 CHE-097 (Light Brown)', 'https://www.amazon.co.jp/dp/B07K3ZLRPL', '無料配送 \n8月 16日 に配送予定 ', 0, 'https://c.media-amazon.com/images/I/51GLwB9FFtL._AC_SX522_.jpg', '[\"https:\\/\\/ae01.alicdn.com\\/kf\\/Sb4becd19e02b4f4da815a085bf80d3bek\\/200000mAh-2-USB-iPhone-Android.jpg_80x80.jpg_.webp\"]', 1086, 1086, '320002268', '商品説明\n最大5v1aの高速ワイヤレス充電をサポート...', '', '', '', 'プラスチック', '', '1', '', '2024-09-10 21:30:28', '2024-09-10 21:30:28', NULL),
(6, 1, 'B0C2W1188T', 1, 'ワイヤレス イヤホン Bluetooth イヤホン Siri対応 HiFi ブルートゥースイヤホン 片耳/両耳 左右分離型 TypeC充電 小型 軽量 (DN1-D7004)', 'https://www.amazon.co.jp/dp/B0C2W1188T', '無料配送 \n8月 16日 に配送予定 ', 7, 'https://c.media-amazon.com/images/I/31-lxrO1JyL._AC_SY679_.jpg', '[\"https:\\/\\/ae01.alicdn.com\\/kf\\/Sb4becd19e02b4f4da815a085bf80d3bek\\/200000mAh-2-USB-iPhone-Android.jpg_80x80.jpg_.webp\"]', 7350, 7864, '320002268', '商品説明\n最大5v1aの高速ワイヤレス充電をサポート...', '', '', '', 'プラスチック', '', '1', '', '2024-09-10 21:30:28', '2024-09-10 21:30:28', NULL),
(7, 1, 'B0BQZMFQNH', 0, 'ソニー(SONY) ウォークマン純正アクセサリー NW-A300シリーズ専用 ソフトケース グレー CKS-NWA300HC', 'https://www.amazon.co.jp/dp/B0BQZMFQNH', '無料配送 \n8月 16日 に配送予定 ', 15, 'https://c.media-amazon.com/images/I/31DWyqJGg5L._AC_SY450_.jpg', '[\"https:\\/\\/ae01.alicdn.com\\/kf\\/Sb4becd19e02b4f4da815a085bf80d3bek\\/200000mAh-2-USB-iPhone-Android.jpg_80x80.jpg_.webp\"]', 4821, 4821, '320002268', '商品説明\n最大5v1aの高速ワイヤレス充電をサポート...', '', '', '', 'プラスチック', '', '1', '', '2024-09-10 21:30:28', '2024-09-10 21:30:28', NULL),
(8, 1, 'B016XKR0BC', 1, 'Anker Soundcore ポータブル Bluetooth5.0 スピーカー 24時間連続再生可能【デュアルドライバー / IPX5防水規格 / ワイヤレススピーカー/内蔵マイク搭載】(ブルー)', 'https://www.amazon.co.jp/dp/B016XKR0BC', '無料配送 \n8月 16日 に配送予定 ', 36, 'https://c.media-amazon.com/images/I/71dLst6DxjL._AC_SX425_.jpg', '[\"https:\\/\\/ae01.alicdn.com\\/kf\\/Sb4becd19e02b4f4da815a085bf80d3bek\\/200000mAh-2-USB-iPhone-Android.jpg_80x80.jpg_.webp\"]', 2050, 1886, '320002268', '商品説明\n最大5v1aの高速ワイヤレス充電をサポート...', '', '', '', 'プラスチック', '', '1', '', '2024-09-10 21:30:28', '2024-09-10 21:30:28', NULL),
(9, 1, 'B0BXRLLTTF', 1, '【MagSafeスタンド一体型・画面フィルム付き】Holidi Galaxy S23 Ultra ケース SC-52D SCG20 マット感 マグネット搭載 隠しスタンド 米軍MIL規格 全面保護 ワイヤレス充電 マグセーフ対応 半透明 ブラック', 'https://www.amazon.co.jp/dp/B0BXRLLTTF', '無料配送 \n8月 16日 に配送予定 ', 20, 'https://c.media-amazon.com/images/I/61FcSGIwpXL._AC_SX425_.jpg', '[\"https:\\/\\/ae01.alicdn.com\\/kf\\/Sb4becd19e02b4f4da815a085bf80d3bek\\/200000mAh-2-USB-iPhone-Android.jpg_80x80.jpg_.webp\"]', 64451, 64451, '320002268', '商品説明\n最大5v1aの高速ワイヤレス充電をサポート...', '', '', '', 'プラスチック', '', '1', '', '2024-09-10 21:30:28', '2024-09-10 21:30:28', NULL),
(10, 1, 'B096W4LMXZ', 1, '【Ringke】MINI POUCH TWO POCKET イヤホンケース ICカード 現金 コイン入れ イヤホンポーチ ミニポーチ ミニバッグ (カラビナ付き) - Black', 'https://www.amazon.co.jp/dp/B096W4LMXZ', '無料配送 \n8月 16日 に配送予定 ', 0, 'https://c.media-amazon.com/images/I/71KlXyfM-zS._AC_SX466_.jpg', '[\"https:\\/\\/ae01.alicdn.com\\/kf\\/Sb4becd19e02b4f4da815a085bf80d3bek\\/200000mAh-2-USB-iPhone-Android.jpg_80x80.jpg_.webp\"]', 7645, 7642, '320002268', '商品説明\n最大5v1aの高速ワイヤレス充電をサポート...', '', '', '', 'プラスチック', '', '1', '', '2024-09-10 21:30:28', '2024-09-10 21:30:28', NULL),
(11, 1, 'B097227KCJ', 1, 'TORRAS iPhone 13 mini 用 ケース 軽量 ガラスフィルム付属 マット質感 さらさら手触り 指紋防止 擦り傷防止 画面レンズ保護 ハード アイフォン13ミニ用 カバー 2021 ブラック Wisdom Series', 'https://www.amazon.co.jp/dp/B097227KCJ', '無料配送 \n8月 16日 に配送予定 ', 7, 'https://c.media-amazon.com/images/I/61ibJYyKyRL._AC_SY450_.jpg', '[\"https:\\/\\/ae01.alicdn.com\\/kf\\/Sb4becd19e02b4f4da815a085bf80d3bek\\/200000mAh-2-USB-iPhone-Android.jpg_80x80.jpg_.webp\"]', 91003, 91531, '320002268', '商品説明\n最大5v1aの高速ワイヤレス充電をサポート...', '', '', '', 'プラスチック', '', '1', '', '2024-09-10 21:30:28', '2024-09-10 21:30:28', NULL),
(12, 1, 'B0BCWBBC4L', 0, 'iFace First Class Standard iPhone 14 ケース (イエロー)【アイフェイス アイフォン14 用 iphone14 用 カバー 韓国 耐衝撃 ストラップホール】', 'https://www.amazon.co.jp/dp/B0BCWBBC4L', '無料配送 \n8月 16日 に配送予定 ', 13, 'https://c.media-amazon.com/images/I/51CTndRkosL._AC_SY679_.jpg', '[\"https:\\/\\/ae01.alicdn.com\\/kf\\/Sb4becd19e02b4f4da815a085bf80d3bek\\/200000mAh-2-USB-iPhone-Android.jpg_80x80.jpg_.webp\"]', 6864, 6864, '320002268', '商品説明\n最大5v1aの高速ワイヤレス充電をサポート...', '', '', '', 'プラスチック', '', '1', '', '2024-09-10 21:30:28', '2024-09-10 21:30:28', NULL),
(13, 1, 'B087X1538X', 1, '子供用 トランシーバー 4台セット TRH866 特定小電力トランシーバー、小型省電力、おもちゃ、免許・資格不要、親子アクティビティ、バッテリーなし（別売）', 'https://www.amazon.co.jp/dp/B087X1538X', '無料配送 \n8月 16日 に配送予定 ', 24, 'https://c.media-amazon.com/images/I/71bzUBTGALL._AC_SY450_.jpg', '[\"https:\\/\\/ae01.alicdn.com\\/kf\\/Sb4becd19e02b4f4da815a085bf80d3bek\\/200000mAh-2-USB-iPhone-Android.jpg_80x80.jpg_.webp\"]', 4534, 4534, '320002268', '商品説明\n最大5v1aの高速ワイヤレス充電をサポート...', '', '', '', 'プラスチック', '', '1', '', '2024-09-10 21:30:28', '2024-09-10 21:30:28', NULL),
(14, 1, 'B0BWXJFZH7', 1, 'MOUNTUP テレビ壁掛け金具 回転式 モニターアーム 軽量 10～43インチ対応 耐荷重13kg 中小型 左右移動式 多角度調整 VESA200×200mm 適格請求書発行可', 'https://www.amazon.co.jp/dp/B0BWXJFZH7', '無料配送 \n8月 16日 に配送予定 ', 25, 'https://c.media-amazon.com/images/I/71V7dl8nhXL._AC_SY450_.jpg', '[\"https:\\/\\/ae01.alicdn.com\\/kf\\/Sb4becd19e02b4f4da815a085bf80d3bek\\/200000mAh-2-USB-iPhone-Android.jpg_80x80.jpg_.webp\"]', 4684, 4684, '320002268', '商品説明\n最大5v1aの高速ワイヤレス充電をサポート...', '', '', '', 'プラスチック', '', '1', '', '2024-09-10 21:30:28', '2024-09-10 21:30:28', NULL),
(15, 1, 'B0C1HKYDJS', 1, '【NYタイムズスクエアを席巻！】TORRAS iPhone 14 Pro Max 用 ケース 半透明 米軍規格 Halbachマグネット ワイアレス充電対応 縦横両対応 アイフォン 14 ProMax 用 ケース 「UPRO Ostand」パープル', 'https://www.amazon.co.jp/dp/B0C1HKYDJS', '無料配送 \n8月 16日 に配送予定 ', 5, 'https://c.media-amazon.com/images/I/61PwSy7I6qL._AC_SY450_.jpg', '[\"https:\\/\\/ae01.alicdn.com\\/kf\\/Sb4becd19e02b4f4da815a085bf80d3bek\\/200000mAh-2-USB-iPhone-Android.jpg_80x80.jpg_.webp\"]', 15353, 15353, '320002268', '商品説明\n最大5v1aの高速ワイヤレス充電をサポート...', '', '', '', 'プラスチック', '', '1', '', '2024-09-10 21:30:28', '2024-09-10 21:30:28', NULL),
(16, 1, 'B0BKZFC9LB', 0, 'エレコム シガーソケット USB PD対応 45W 2ポート USB-C USB-A 12V 24V 対応 [ Macbook iPad iPhone Android 45Wで充電可能なノートPC ] ブラック EC-DC10BK', 'https://www.amazon.co.jp/dp/B0BKZFC9LB', '無料配送 \n8月 16日 に配送予定 ', 0, 'https://c.media-amazon.com/images/I/51d9cbBTH+L._AC_SY450_.jpg', '[\"https:\\/\\/ae01.alicdn.com\\/kf\\/Sb4becd19e02b4f4da815a085bf80d3bek\\/200000mAh-2-USB-iPhone-Android.jpg_80x80.jpg_.webp\"]', 15433, 15438, '320002268', '商品説明\n最大5v1aの高速ワイヤレス充電をサポート...', '', '', '', 'プラスチック', '', '1', '', '2024-09-10 21:30:28', '2024-09-10 21:30:28', NULL),
(17, 1, 'B07455SBQZ', 1, 'Godox S-型 ブラケット/ブラケットマウント 角度調整可/ホルダー Bowensマウント付 ストロボ/フラッシュ/ソフトボックス/ビューティーディッシュ/傘対応【並行輸入品】', 'https://www.amazon.co.jp/dp/B07455SBQZ', '無料配送 \n8月 16日 に配送予定 ', 4, 'https://c.media-amazon.com/images/I/61Kcvm2mNbL._AC_SY355_.jpg', '[\"https:\\/\\/ae01.alicdn.com\\/kf\\/Sb4becd19e02b4f4da815a085bf80d3bek\\/200000mAh-2-USB-iPhone-Android.jpg_80x80.jpg_.webp\"]', 8676, 8676, '320002268', '商品説明\n最大5v1aの高速ワイヤレス充電をサポート...', '', '', '', 'プラスチック', '', '1', '', '2024-09-10 21:30:28', '2024-09-10 21:30:28', NULL),
(18, 1, 'B0BXKXB5HW', 1, 'オーディオテクニカ ATH-SQ1TW2 NRD ワイヤレスイヤホン bluetooth / 小型 軽量 / 最大20時間再生 / 低遅延 / 外音取込み / マルチポイント / マルチペアリング / 防水 IPX5 / ワイヤレス充電 /【国内正規品】ネイビーレッド ATH-SQ1TW2 NRD', 'https://www.amazon.co.jp/dp/B0BXKXB5HW', '無料配送 \n8月 16日 に配送予定 ', 19, 'https://c.media-amazon.com/images/I/61uncWMhVoL._AC_SY450_.jpg', '[\"https:\\/\\/ae01.alicdn.com\\/kf\\/Sb4becd19e02b4f4da815a085bf80d3bek\\/200000mAh-2-USB-iPhone-Android.jpg_80x80.jpg_.webp\"]', 46582, 46582, '320002268', '商品説明\n最大5v1aの高速ワイヤレス充電をサポート...', '', '', '', 'プラスチック', '', '1', '', '2024-09-10 21:30:28', '2024-09-10 21:30:28', NULL),
(19, 1, 'B07SHCLR7T', 1, 'Stageek スピーカースタンド 卓上 小型スピーカーアルミ台座 5°上向き傾け 本棚スピーカー用 デスクトップスピーカースタンド ブラック[2台1組]', 'https://www.amazon.co.jp/dp/B07SHCLR7T', '無料配送 \n8月 16日 に配送予定 ', 2, 'https://c.media-amazon.com/images/I/615-QdBktVL._AC_SX425_.jpg', '[\"https:\\/\\/ae01.alicdn.com\\/kf\\/Sb4becd19e02b4f4da815a085bf80d3bek\\/200000mAh-2-USB-iPhone-Android.jpg_80x80.jpg_.webp\"]', 86123, 86123, '320002268', '商品説明\n最大5v1aの高速ワイヤレス充電をサポート...', '', '', '', 'プラスチック', '', '1', '', '2024-09-10 21:30:28', '2024-09-10 21:30:28', NULL),
(20, 1, 'B00X9TY8ZW', 1, 'Signstek Audio USB-DAC ヘッドフォンアンプ/コンパクトでUSBケーブル付き 小型', 'https://www.amazon.co.jp/dp/B00X9TY8ZW', '無料配送 \n8月 16日 に配送予定 ', 3, 'https://c.media-amazon.com/images/I/61BDpYIcDRL._AC_SX425_.jpg', '[\"https:\\/\\/ae01.alicdn.com\\/kf\\/Sb4becd19e02b4f4da815a085bf80d3bek\\/200000mAh-2-USB-iPhone-Android.jpg_80x80.jpg_.webp\"]', 4653, 8652, '320002268', '商品説明\n最大5v1aの高速ワイヤレス充電をサポート...', '', '', '', 'プラスチック', '', '1', '', '2024-09-10 21:30:28', '2024-09-10 21:30:28', NULL),
(21, 1, 'B01E74L2L0', 1, 'Marantz マランツプロ モニターヘッドホン 密閉型 オーバーイヤーヘッドホン 有線 直径40mmドライバー 楽器演奏 配信 DJ ゲーム テレワーク MPH-1', 'https://www.amazon.co.jp/dp/B01E74L2L0', '無料配送 \n8月 16日 に配送予定 ', 4, 'https://c.media-amazon.com/images/I/81iTuJQLq7L._AC_SY606_.jpg', '[\"https:\\/\\/ae01.alicdn.com\\/kf\\/Sb4becd19e02b4f4da815a085bf80d3bek\\/200000mAh-2-USB-iPhone-Android.jpg_80x80.jpg_.webp\"]', 8953, 9456, '320002268', '商品説明\n最大5v1aの高速ワイヤレス充電をサポート...', '', '', '', 'プラスチック', '', '1', '', '2024-09-10 21:30:28', '2024-09-10 21:30:28', NULL),
(22, 1, 'B09HCG2W9W', 1, 'NTHJOYS タッチペン スタイラスペン 極細 超高感度 iPad/スマホ/タブレット対応 たっちぺん 銅製ペン先 イラスト ゲーム USB充電式', 'https://www.amazon.co.jp/dp/B09HCG2W9W', '無料配送 \n8月 16日 に配送予定 ', 5, 'https://c.media-amazon.com/images/I/51bxtMQlkSL._AC_SY450_.jpg', '[\"https:\\/\\/ae01.alicdn.com\\/kf\\/Sb4becd19e02b4f4da815a085bf80d3bek\\/200000mAh-2-USB-iPhone-Android.jpg_80x80.jpg_.webp\"]', 4231, 7531, '320002268', '商品説明\n最大5v1aの高速ワイヤレス充電をサポート...', '', '', '', 'プラスチック', '', '1', '', '2024-09-10 21:30:28', '2024-09-10 21:30:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2022_05_04_180056_create_users_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT 'free',
  `price` int(10) NOT NULL DEFAULT 0,
  `limit` int(10) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qoo_products`
--

CREATE TABLE `qoo_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `gd_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img_url_main` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img_url_thumb` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int(11) DEFAULT 0,
  `quantity` int(10) UNSIGNED DEFAULT 0,
  `shipping` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `material` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `origin` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exhibit` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reason` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seller_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `qoo_products`
--

INSERT INTO `qoo_products` (`id`, `user_id`, `gd_no`, `title`, `url`, `img_url_main`, `img_url_thumb`, `category`, `price`, `quantity`, `shipping`, `description`, `color`, `size`, `weight`, `material`, `origin`, `exhibit`, `reason`, `seller_code`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, '1099564085', '枕カバー付きのピンクの花柄のコットン掛け布団カバー,柔らかく快適な寝具,クイーンまたはシングルベッドに適しています,205tc,3個', 'https://ja.aliexpress.com/item/1005006991392394.html?src=ibdm_d03p0558e02r02&sk=&aff_platform=&aff_trace_key=&af=&cv=&cn=&dp=', 'https://ae01.alicdn.com/kf/S27e9734b8b68404d92426cb219a8bc4b2/205tc.jpg', '[\"https:\\/\\/ae01.alicdn.com\\/kf\\/Sb4becd19e02b4f4da815a085bf80d3bek\\/200000mAh-2-USB-iPhone-Android.jpg_80x80.jpg_.webp\"]', '320002268', 6532, 1, '無料配送 \n8月 16日 に配送予定 ', '商品説明\n最大5v1aの高速ワイヤレス充電をサポート...', '', '', '', 'プラスチック', '', '1', '', 'SKU-32702589', '2024-09-11 01:25:48', '2024-09-11 01:25:48', NULL),
(2, 1, '1099564283	', 'ランドスケープ用のエコロジカルガラスボトル、ムスジャー、装飾用の閉鎖、オフィス、フラワールームコンテナ、マイクロ、ランドスケープ、デスクトップ', '//ja.aliexpress.com/item/1005007084542263.html?src=ibdm_d03p0558e02r02&sk=&aff_platform=&aff_trace_key=&af=&cv=&cn=&dp=', 'https://ae01.alicdn.com/kf/S9a383f7557c04b0bb57aac8b698fa48cJ/-.jpg', '[\"https:\\/\\/ae01.alicdn.com\\/kf\\/Sb4becd19e02b4f4da815a085bf80d3bek\\/200000mAh-2-USB-iPhone-Android.jpg_80x80.jpg_.webp\"]', '320002268', 10744, 2, '無料配送 \n8月 16日 に配送予定 ', '商品説明\n最大5v1aの高速ワイヤレス充電をサポート...', '', '', '', 'プラスチック', '', '1', '', 'SKU-68294622', '2024-09-11 01:25:48', '2024-09-11 01:25:48', NULL),
(3, 1, '1099564417', 'Ladi\' ロングトライアングルヘアタオル、ドライヘアキャップ、刺absorbent吸収', '//ja.aliexpress.com/item/1005007084542263.html?src=ibdm_d03p0558e02r02&sk=&aff_platform=&aff_trace_key=&af=&cv=&cn=&dp=', 'https://ae01.alicdn.com/kf/S28d51151c56340f0abd723cdf99dee769/Ladi-absorbent.jpg', '[\"https:\\/\\/ae01.alicdn.com\\/kf\\/Sb4becd19e02b4f4da815a085bf80d3bek\\/200000mAh-2-USB-iPhone-Android.jpg_80x80.jpg_.webp\"]', '320002268', 316, 3, '無料配送 \n8月 16日 に配送予定 ', '商品説明\n最大5v1aの高速ワイヤレス充電をサポート...', '', '', '', 'プラスチック', '', '1', '', 'SKU-45069377', '2024-09-11 01:25:48', '2024-09-11 01:25:48', NULL),
(4, 1, '1099564477', '透明密閉収納ボックス,透明,正方形,食品保存用,果物と肉の保存容器,ポータブルボックス,キッチン用品,700ml', '//ja.aliexpress.com/item/1005007084542263.html?src=ibdm_d03p0558e02r02&sk=&aff_platform=&aff_trace_key=&af=&cv=&cn=&dp=', 'https://ae01.alicdn.com/kf/Sb4becd19e02b4f4da815a085bf80d3bek/200000mAh-2-USB-iPhone-Android.jpg', '[\"https:\\/\\/ae01.alicdn.com\\/kf\\/Sb4becd19e02b4f4da815a085bf80d3bek\\/200000mAh-2-USB-iPhone-Android.jpg_80x80.jpg_.webp\"]', '320002268', 692, 4, '無料配送 \n8月 16日 に配送予定 ', '商品説明\n最大5v1aの高速ワイヤレス充電をサポート...', '', '', '', 'プラスチック', '', '1', '', 'SKU-74311902', '2024-09-11 01:25:48', '2024-09-11 01:25:48', NULL),
(5, 1, '1099564480', '急速冷凍アイスボックス,環境にやさしい,革新的で便利,黄色の氷の保管,アイスホッケー型,製氷機,お手入れが簡単', '//ja.aliexpress.com/item/1005007084542263.html?src=ibdm_d03p0558e02r02&sk=&aff_platform=&aff_trace_key=&af=&cv=&cn=&dp=', 'https://ae01.alicdn.com/kf/S9da4ab026c914da0b540085eb42b77f3E/-.jpg', '[\"https:\\/\\/ae01.alicdn.com\\/kf\\/Sb4becd19e02b4f4da815a085bf80d3bek\\/200000mAh-2-USB-iPhone-Android.jpg_80x80.jpg_.webp\"]', '320002268', 886, 5, '無料配送 \n8月 16日 に配送予定 ', '商品説明\n最大5v1aの高速ワイヤレス充電をサポート...', '', '', '', 'プラスチック', '', '1', '', 'SKU-88192457', '2024-09-11 01:25:48', '2024-09-11 01:25:48', NULL),
(6, 1, '1099564653', 'ミュースライスまたはシミュレーション草の巣モデル、ミニチュアグラス、フォーク、サンドシーン素材、リアルな草、ツフィートの植物、クラスターの風景、新しい', '//ja.aliexpress.com/item/1005007084542263.html?src=ibdm_d03p0558e02r02&sk=&aff_platform=&aff_trace_key=&af=&cv=&cn=&dp=', 'https://ae01.alicdn.com/kf/Sb4becd19e02b4f4da815a085bf80d3bek/200000mAh-2-USB-iPhone-Android.jpghttps://ae01.alicdn.com/kf/S9da4ab026c914da0b540085eb42b77f3E/-.jpg', '[\"https:\\/\\/ae01.alicdn.com\\/kf\\/Sb4becd19e02b4f4da815a085bf80d3bek\\/200000mAh-2-USB-iPhone-Android.jpg_80x80.jpg_.webp\"]', '320002268', 316, 6, '無料配送 \n8月 16日 に配送予定 ', '商品説明\n最大5v1aの高速ワイヤレス充電をサポート...', '', '', '', 'プラスチック', '', '1', '', 'SKU-73536708', '2024-09-11 01:25:48', '2024-09-11 01:25:48', NULL),
(7, 1, '1099564660', 'ステンレス鋼ティーポット,大容量,お茶の分離を備えたサーモクーラー,商用利用,家庭用ポット,316', '//ja.aliexpress.com/item/1005007084542263.html?src=ibdm_d03p0558e02r02&sk=&aff_platform=&aff_trace_key=&af=&cv=&cn=&dp=', 'https://ae01.alicdn.com/kf/Sc2176677570d44409a25ee32c2e235bfT/-.jpg', '[\"https:\\/\\/ae01.alicdn.com\\/kf\\/Sb4becd19e02b4f4da815a085bf80d3bek\\/200000mAh-2-USB-iPhone-Android.jpg_80x80.jpg_.webp\"]', '320002268', 1876, 7, '無料配送 \n8月 16日 に配送予定 ', '商品説明\n最大5v1aの高速ワイヤレス充電をサポート...', '', '', '', 'プラスチック', '', '1', '', 'SKU-31434156', '2024-09-11 01:25:48', '2024-09-11 01:25:48', NULL),
(8, 1, '1099564670', 'Crossfu thai スイッチタイプC,ステンレス鋼,usb,黒いパネル,壁電源ソケット,コンピューター', '//ja.aliexpress.com/item/1005007084542263.html?src=ibdm_d03p0558e02r02&sk=&aff_platform=&aff_trace_key=&af=&cv=&cn=&dp=', 'https://ae01.alicdn.com/kf/S35c4853292ce46658193810e9dac26e4x/316.jpg', '[\"https:\\/\\/ae01.alicdn.com\\/kf\\/Sb4becd19e02b4f4da815a085bf80d3bek\\/200000mAh-2-USB-iPhone-Android.jpg_80x80.jpg_.webp\"]', '320002268', 1438, 8, '無料配送 \n8月 16日 に配送予定 ', '商品説明\n最大5v1aの高速ワイヤレス充電をサポート...', '', '', '', 'プラスチック', '', '1', '', 'SKU-23162166', '2024-09-11 01:25:48', '2024-09-11 01:25:48', NULL),
(9, 1, '1099564738', '防水ディープフィットポケットシート、マットレスプロテクター、家族の寝室、ゲストルーム、アパート、学校、枕コア、枕カバー、単色、クイーン', '//ja.aliexpress.com/item/1005007084542263.html?src=ibdm_d03p0558e02r02&sk=&aff_platform=&aff_trace_key=&af=&cv=&cn=&dp=', 'https://ae01.alicdn.com/kf/Sf8951d35b8c4456c855528d7980b0fb8w/Crossfu-thai-C-usb.jpg', '[\"https:\\/\\/ae01.alicdn.com\\/kf\\/Sb4becd19e02b4f4da815a085bf80d3bek\\/200000mAh-2-USB-iPhone-Android.jpg_80x80.jpg_.webp\"]', '320002268', 5246, 9, '無料配送 \n8月 16日 に配送予定 ', '商品説明\n最大5v1aの高速ワイヤレス充電をサポート...', '', '', '', 'プラスチック', '', '1', '', 'SKU-42077865', '2024-09-11 01:25:48', '2024-09-11 01:25:48', NULL),
(10, 1, '1099564740', 'ポータブルケーキコンテナ、ケーキキャリア、実用的なカップケーキホルダー、新鮮な養蜂、50個', '//ja.aliexpress.com/item/1005007084542263.html?src=ibdm_d03p0558e02r02&sk=&aff_platform=&aff_trace_key=&af=&cv=&cn=&dp=', 'https://ae01.alicdn.com/kf/Sf0ed6b2ab2ed4eadab330db1a7f05ac0g/-.jpg', '[\"https:\\/\\/ae01.alicdn.com\\/kf\\/Sb4becd19e02b4f4da815a085bf80d3bek\\/200000mAh-2-USB-iPhone-Android.jpg_80x80.jpg_.webp\"]', '320002268', 746, 10, '無料配送 \n8月 16日 に配送予定 ', '商品説明\n最大5v1aの高速ワイヤレス充電をサポート...', '', '', '', 'プラスチック', '', '1', '', 'SKU-39768247', '2024-09-11 01:25:48', '2024-09-11 01:25:48', NULL),
(11, 1, '1099564742', '再利用可能なロングバキュームシーラー,食品保存,包装袋,家庭用,キッチンアクセサリー,10個', '//ja.aliexpress.com/item/1005007084542263.html?src=ibdm_d03p0558e02r02&sk=&aff_platform=&aff_trace_key=&af=&cv=&cn=&dp=', 'https://ae01.alicdn.com/kf/S1b5576b673a94399b0ffc7c0143e5533G/50.jpg', '[\"https:\\/\\/ae01.alicdn.com\\/kf\\/Sb4becd19e02b4f4da815a085bf80d3bek\\/200000mAh-2-USB-iPhone-Android.jpg_80x80.jpg_.webp\"]', '320002268', 316, 11, '無料配送 \n8月 16日 に配送予定 ', '商品説明\n最大5v1aの高速ワイヤレス充電をサポート...', '', '', '', 'プラスチック', '', '1', '', 'SKU-51497228', '2024-09-11 01:25:48', '2024-09-11 01:25:48', NULL),
(12, 1, '1099565189', '食品保存と梱包用のラベルステッカー1ロール、読みやすい、冷蔵庫と冷凍庫に最適、125個', '//ja.aliexpress.com/item/1005007084542263.html?src=ibdm_d03p0558e02r02&sk=&aff_platform=&aff_trace_key=&af=&cv=&cn=&dp=', 'https://ae01.alicdn.com/kf/S8c21ccf601db43bdb0344f905adeb47eu/10.jpg', '[\"https:\\/\\/ae01.alicdn.com\\/kf\\/Sb4becd19e02b4f4da815a085bf80d3bek\\/200000mAh-2-USB-iPhone-Android.jpg_80x80.jpg_.webp\"]', '320002268', 316, 12, '無料配送 \n8月 16日 に配送予定 ', '商品説明\n最大5v1aの高速ワイヤレス充電をサポート...', '', '', '', 'プラスチック', '', '1', '', 'SKU-46769815', '2024-09-11 01:25:48', '2024-09-11 01:25:48', NULL),
(13, 1, '1099565393', 'ブレビルvcf125ミニバリスタ、サンビーム、コーヒーマシン、em4300 em5300 emm5400bk、3 ears、58mm', '//ja.aliexpress.com/item/1005007084542263.html?src=ibdm_d03p0558e02r02&sk=&aff_platform=&aff_trace_key=&af=&cv=&cn=&dp=', 'https://ae01.alicdn.com/kf/S56dcaf5b57e64eb198e0a5786eea8806w/1-125.jpg', '[\"https:\\/\\/ae01.alicdn.com\\/kf\\/Sb4becd19e02b4f4da815a085bf80d3bek\\/200000mAh-2-USB-iPhone-Android.jpg_80x80.jpg_.webp\"]', '320002268', 7852, 13, '無料配送 \n8月 16日 に配送予定 ', '商品説明\n最大5v1aの高速ワイヤレス充電をサポート...', '', '', '', 'プラスチック', '', '1', '', 'SKU-23419727', '2024-09-11 01:25:48', '2024-09-11 01:25:48', NULL),
(14, 1, '1099565397', 'クリエイティブアルミフォイルローズゴールド耐久性のあるウェディング、バレンタインデー', '//ja.aliexpress.com/item/1005007084542263.html?src=ibdm_d03p0558e02r02&sk=&aff_platform=&aff_trace_key=&af=&cv=&cn=&dp=', 'https://ae01.alicdn.com/kf/S385f0784d43c4b41a40dacc51f068fb0e/vcf125-em4300-em5300-emm5400bk-3-ears-58mm.jpg', '[\"https:\\/\\/ae01.alicdn.com\\/kf\\/Sb4becd19e02b4f4da815a085bf80d3bek\\/200000mAh-2-USB-iPhone-Android.jpg_80x80.jpg_.webp\"]', '320002268', 2198, 14, '無料配送 \n8月 16日 に配送予定 ', '商品説明\n最大5v1aの高速ワイヤレス充電をサポート...', '', '', '', 'プラスチック', '', '1', '', 'SKU-61538079', '2024-09-11 01:25:48', '2024-09-11 01:25:48', NULL),
(15, 1, '1099565403', '冷凍食品,マルチレイヤーコンテトンボックス,家庭用充填装置,凍結防止冷蔵庫', '//ja.aliexpress.com/item/1005007084542263.html?src=ibdm_d03p0558e02r02&sk=&aff_platform=&aff_trace_key=&af=&cv=&cn=&dp=', 'https://ae01.alicdn.com/kf/S385f0784d43c4b41a40dacc51f068fb0e/vcf125-em4300-em5300-emm5400bk-3-ears-58mm.jpg', '[\"https:\\/\\/ae01.alicdn.com\\/kf\\/Sb4becd19e02b4f4da815a085bf80d3bek\\/200000mAh-2-USB-iPhone-Android.jpg_80x80.jpg_.webp\"]', '320002268', 536, 15, '無料配送 \n8月 16日 に配送予定 ', '商品説明\n最大5v1aの高速ワイヤレス充電をサポート...', '', '', '', 'プラスチック', '', '1', '', 'SKU-53176556', '2024-09-11 01:25:48', '2024-09-11 01:25:48', NULL),
(16, 1, '1099565450', '気密蓋付きの食品グレードのコンテナー、安全で無毒の食品容器、290ml', '//ja.aliexpress.com/item/1005007084542263.html?src=ibdm_d03p0558e02r02&sk=&aff_platform=&aff_trace_key=&af=&cv=&cn=&dp=', 'https://ae01.alicdn.com/kf/S5fa0d6822cf84c8ea14bc5d4cf9643d73/27-36.jpg', '[\"https:\\/\\/ae01.alicdn.com\\/kf\\/Sb4becd19e02b4f4da815a085bf80d3bek\\/200000mAh-2-USB-iPhone-Android.jpg_80x80.jpg_.webp\"]', '320002268', 508, 16, '無料配送 \n8月 16日 に配送予定 ', '商品説明\n最大5v1aの高速ワイヤレス充電をサポート...', '', '', '', 'プラスチック', '', '1', '', 'SKU-80254050', '2024-09-11 01:25:48', '2024-09-11 01:25:48', NULL),
(17, 1, '1099565455', 'ディブックマーク用の本物のドライフラワーパック、キャンドル作り、天然圧縮花ペタル、アートクラフト装飾、27 36個', '//ja.aliexpress.com/item/1005007084542263.html?src=ibdm_d03p0558e02r02&sk=&aff_platform=&aff_trace_key=&af=&cv=&cn=&dp=', 'https://ae01.alicdn.com/kf/Sc8ed3fe1311a41ef870b94d6eec35613F/-.jpg', '[\"https:\\/\\/ae01.alicdn.com\\/kf\\/Sb4becd19e02b4f4da815a085bf80d3bek\\/200000mAh-2-USB-iPhone-Android.jpg_80x80.jpg_.webp\"]', '320002268', 474, 17, '無料配送 \n8月 16日 に配送予定 ', '商品説明\n最大5v1aの高速ワイヤレス充電をサポート...', '', '', '', 'プラスチック', '', '1', '', 'SKU-63215658', '2024-09-11 01:25:48', '2024-09-11 01:25:48', NULL),
(18, 1, '1099565587', 'Seiko ステンレス鋼の多機能キッチンはさみ、シャープなプラスチックハンドル、鶏の骨、高品質', '//ja.aliexpress.com/item/1005007084542263.html?src=ibdm_d03p0558e02r02&sk=&aff_platform=&aff_trace_key=&af=&cv=&cn=&dp=', 'https://ae01.alicdn.com/kf/Sb4becd19e02b4f4da815a085bf80d3bek/200000mAh-2-USB-iPhone-Android.jpg', '[\"https:\\/\\/ae01.alicdn.com\\/kf\\/Sb4becd19e02b4f4da815a085bf80d3bek\\/200000mAh-2-USB-iPhone-Android.jpg_80x80.jpg_.webp\"]', '320002268', 127848, 18, '無料配送 \n8月 16日 に配送予定 ', '商品説明\n最大5v1aの高速ワイヤレス充電をサポート...', '', '', '', 'プラスチック', '', '1', '', 'SKU-44699082', '2024-09-11 01:25:48', '2024-09-11 01:25:48', NULL),
(19, 1, '1099565933', 'プラスチック製の折りたたみ式扇風機,金と銀のパウダークラフトファン,結婚式のパーティー,中国風ダンスクロス', '//ja.aliexpress.com/item/1005007084542263.html?src=ibdm_d03p0558e02r02&sk=&aff_platform=&aff_trace_key=&af=&cv=&cn=&dp=', 'https://ae01.alicdn.com/kf/Sb4895e4154124b42aaa7828dab31cb5ee/-.jpg', '[\"https:\\/\\/ae01.alicdn.com\\/kf\\/Sb4becd19e02b4f4da815a085bf80d3bek\\/200000mAh-2-USB-iPhone-Android.jpg_80x80.jpg_.webp\"]', '320002268', 3398, 19, '無料配送 \n8月 16日 に配送予定 ', '商品説明\n最大5v1aの高速ワイヤレス充電をサポート...', '', '', '', 'プラスチック', '', '1', '', 'SKU-18089343', '2024-09-11 01:25:48', '2024-09-11 01:25:48', NULL),
(20, 1, '1099566017', 'まつげとまつげ用のミニポータブルファン,冷却システム,USB充電式,サイレント', '//ja.aliexpress.com/item/1005007084542263.html?src=ibdm_d03p0558e02r02&sk=&aff_platform=&aff_trace_key=&af=&cv=&cn=&dp=', 'https://ae01.alicdn.com/kf/S40520a5773a741cda9f1379efd8ebcc2F/USB.jpg', '[\"https:\\/\\/ae01.alicdn.com\\/kf\\/Sb4becd19e02b4f4da815a085bf80d3bek\\/200000mAh-2-USB-iPhone-Android.jpg_80x80.jpg_.webp\"]', '320002268', 1727, 20, '無料配送 \n8月 16日 に配送予定 ', '商品説明\n最大5v1aの高速ワイヤレス充電をサポート...', '', '', '', 'プラスチック', '', '1', '', 'SKU-4691560', '2024-09-11 01:25:48', '2024-09-11 01:25:48', NULL),
(21, 1, '1099566061', 'バチェロレッテパーティーアクセサリー,ウェディングベール,ピンクゴールド,一時的なステッカー', '//ja.aliexpress.com/item/1005007084542263.html?src=ibdm_d03p0558e02r02&sk=&aff_platform=&aff_trace_key=&af=&cv=&cn=&dp=', 'https://ae01.alicdn.com/kf/S9a43fd763bbe4413b1ebcb852b98c394g/USB-USB-2024.jpg', '[\"https:\\/\\/ae01.alicdn.com\\/kf\\/Sb4becd19e02b4f4da815a085bf80d3bek\\/200000mAh-2-USB-iPhone-Android.jpg_80x80.jpg_.webp\"]', '320002268', 1842, 21, '無料配送 \n8月 16日 に配送予定 ', '商品説明\n最大5v1aの高速ワイヤレス充電をサポート...', '', '', '', 'プラスチック', '', '1', '', 'SKU-59433738', '2024-09-11 01:25:48', '2024-09-11 01:25:48', NULL),
(22, 1, '1099566064', 'ポータブルネックレスミニファン,USB充電式,サイレント,スポーツ用', '//ja.aliexpress.com/item/1005007084542263.html?src=ibdm_d03p0558e02r02&sk=&aff_platform=&aff_trace_key=&af=&cv=&cn=&dp=', 'https://ae01.alicdn.com/kf/Sb4becd19e02b4f4da815a085bf80d3bek/200000mAh-2-USB-iPhone-Android.jpg', '[\"https:\\/\\/ae01.alicdn.com\\/kf\\/Sb4becd19e02b4f4da815a085bf80d3bek\\/200000mAh-2-USB-iPhone-Android.jpg_80x80.jpg_.webp\"]', '320002268', 2254, 22, '無料配送 \n8月 16日 に配送予定 ', '商品説明\n最大5v1aの高速ワイヤレス充電をサポート...', '', '', '', 'プラスチック', '', '1', '', 'SKU-15497296', '2024-09-11 01:25:48', '2024-09-11 01:25:48', NULL),
(23, 1, '1099566065', 'USB充電器付きポータブル扇風機,リラックス,学生,寮,USB充電,2024', '//ja.aliexpress.com/item/1005007084542263.html?src=ibdm_d03p0558e02r02&sk=&aff_platform=&aff_trace_key=&af=&cv=&cn=&dp=', 'https://ae01.alicdn.com/kf/S1b67649751df44bc848e747156cc701fb/6-12cm-24.jpg', '[\"https:\\/\\/ae01.alicdn.com\\/kf\\/Sb4becd19e02b4f4da815a085bf80d3bek\\/200000mAh-2-USB-iPhone-Android.jpg_80x80.jpg_.webp\"]', '320002268', 1958, 23, '無料配送 \n8月 16日 に配送予定 ', '商品説明\n最大5v1aの高速ワイヤレス充電をサポート...', '', '', '', 'プラスチック', '', '1', '', 'SKU-59857133', '2024-09-11 01:25:48', '2024-09-11 01:25:48', NULL),
(24, 1, '1099566070', '特大ビールグラス、ガラス瓶、誕生日パーティー、ウェディングギフト、ゴブレットジュースグラス、3000ml、108オンス', '//ja.aliexpress.com/item/1005007084542263.html?src=ibdm_d03p0558e02r02&sk=&aff_platform=&aff_trace_key=&af=&cv=&cn=&dp=', 'https://ae01.alicdn.com/kf/S1b67649751df44bc848e747156cc701fb/6-12cm-24.jpg', '[\"https:\\/\\/ae01.alicdn.com\\/kf\\/Sb4becd19e02b4f4da815a085bf80d3bek\\/200000mAh-2-USB-iPhone-Android.jpg_80x80.jpg_.webp\"]', '320002268', 1486, 24, '無料配送 \n8月 16日 に配送予定 ', '商品説明\n最大5v1aの高速ワイヤレス充電をサポート...', '', '', '', 'プラスチック', '', '1', '', 'SKU-78066639', '2024-09-11 01:25:48', '2024-09-11 01:25:48', NULL),
(25, 1, '1099566301', 'ミニ天然乾式花のブーケ、outonnieres groomsmen、ボタンホールの花嫁介添人の花、コサージュブローチ、クリスマスの結婚式の装飾、1個', '//ja.aliexpress.com/item/1005007084542263.html?src=ibdm_d03p0558e02r02&sk=&aff_platform=&aff_trace_key=&af=&cv=&cn=&dp=', 'https://ae01.alicdn.com/kf/A93549736b2ef4c39abbf3078bb2e1caer/USB.jpg', '[\"https:\\/\\/ae01.alicdn.com\\/kf\\/Sb4becd19e02b4f4da815a085bf80d3bek\\/200000mAh-2-USB-iPhone-Android.jpg_80x80.jpg_.webp\"]', '320002268', 2646, 25, '無料配送 \n8月 16日 に配送予定 ', '商品説明\n最大5v1aの高速ワイヤレス充電をサポート...', '', '', '', 'プラスチック', '', '1', '', 'SKU-41959126', '2024-09-11 01:25:48', '2024-09-11 01:25:48', NULL),
(26, 1, '1099566415', '天然の黒髪のスパイク,6〜12cm/24ピース,波状,圧縮,本物の葉,デカール,植物,電話ケース,グリーティングカード', '//ja.aliexpress.com/item/1005007084542263.html?src=ibdm_d03p0558e02r02&sk=&aff_platform=&aff_trace_key=&af=&cv=&cn=&dp=', 'https://ae01.alicdn.com/kf/Sff5bb8b7157d463cb2b0e20d7f95f28f3/-.jpg', '[\"https:\\/\\/ae01.alicdn.com\\/kf\\/Sb4becd19e02b4f4da815a085bf80d3bek\\/200000mAh-2-USB-iPhone-Android.jpg_80x80.jpg_.webp\"]', '320002268', 1276, 26, '無料配送 \n8月 16日 に配送予定 ', '商品説明\n最大5v1aの高速ワイヤレス充電をサポート...', '', '', '', 'プラスチック', '', '1', '', NULL, '2024-09-11 01:25:48', '2024-09-11 01:25:48', NULL),
(27, 1, '1099566490', '緑の野菜のヘルバーキーパー、収納セーバー、最大リフレッシュネス、冷蔵庫オーガナイザー、換気スロット', '//ja.aliexpress.com/item/1005007084542263.html?src=ibdm_d03p0558e02r02&sk=&aff_platform=&aff_trace_key=&af=&cv=&cn=&dp=', 'https://ae01.alicdn.com/kf/Sd8b7f6218c1d4622b7d61aea3392e68ev/Genmin-Impact-kamisato-ayka.jpg', '[\"https:\\/\\/ae01.alicdn.com\\/kf\\/Sb4becd19e02b4f4da815a085bf80d3bek\\/200000mAh-2-USB-iPhone-Android.jpg_80x80.jpg_.webp\"]', '320002268', 2048, 27, '無料配送 \n8月 16日 に配送予定 ', '商品説明\n最大5v1aの高速ワイヤレス充電をサポート...', '', '', '', 'プラスチック', '', '1', '', NULL, '2024-09-11 01:25:48', '2024-09-11 01:25:48', NULL),
(28, 1, '1099566886', 'ポータブルミニハンドヘルドUSBファン,ポータブルバックル付き充電器,オフィス,屋外,旅行,学生,夏用', '//ja.aliexpress.com/item/1005007084542263.html?src=ibdm_d03p0558e02r02&sk=&aff_platform=&aff_trace_key=&af=&cv=&cn=&dp=', 'https://ae01.alicdn.com/kf/Sb4becd19e02b4f4da815a085bf80d3bek/200000mAh-2-USB-iPhone-Android.jpg', '[\"https:\\/\\/ae01.alicdn.com\\/kf\\/Sb4becd19e02b4f4da815a085bf80d3bek\\/200000mAh-2-USB-iPhone-Android.jpg_80x80.jpg_.webp\"]', '320002268', 133240, 28, '無料配送 \n8月 16日 に配送予定 ', '商品説明\n最大5v1aの高速ワイヤレス充電をサポート...', '', '', '', 'プラスチック', '', '1', '', NULL, '2024-09-11 01:25:48', '2024-09-11 01:25:48', NULL),
(29, 1, '1099566920', '自動車用シガレットライター、EUプラグ、us電源アダプター、acアダプター、dc 220 v〜12v、2a、5a、8a、10a|AC/DC アダプター', '//ja.aliexpress.com/item/1005007084542263.html?src=ibdm_d03p0558e02r02&sk=&aff_platform=&aff_trace_key=&af=&cv=&cn=&dp=', 'https://ae01.alicdn.com/kf/Sb4becd19e02b4f4da815a085bf80d3bek/200000mAh-2-USB-iPhone-Android.jpg', '[\"https:\\/\\/ae01.alicdn.com\\/kf\\/Sb4becd19e02b4f4da815a085bf80d3bek\\/200000mAh-2-USB-iPhone-Android.jpg_80x80.jpg_.webp\"]', '320002268', 5366, 29, '無料配送 \n8月 16日 に配送予定 ', '商品説明\n最大5v1aの高速ワイヤレス充電をサポート...', '', '', '', 'プラスチック', '', '1', '', NULL, '2024-09-11 01:25:48', '2024-09-11 01:25:48', NULL),
(30, 1, '1099566922', 'シリコン滑り止めベース付きウォーターボトルハンドルストラップ,耐久性のあるカラフルなストローカップ,ドリンクウェア,コーヒーカップ用キャリングコード', '//ja.aliexpress.com/item/1005007084542263.html?src=ibdm_d03p0558e02r02&sk=&aff_platform=&aff_trace_key=&af=&cv=&cn=&dp=', 'https://ae01.alicdn.com/kf/Sb4becd19e02b4f4da815a085bf80d3bek/200000mAh-2-USB-iPhone-Android.jpg', '[\"https:\\/\\/ae01.alicdn.com\\/kf\\/Sb4becd19e02b4f4da815a085bf80d3bek\\/200000mAh-2-USB-iPhone-Android.jpg_80x80.jpg_.webp\"]', '320002268', 1246, 30, '無料配送 \n8月 16日 に配送予定 ', '商品説明\n最大5v1aの高速ワイヤレス充電をサポート...', '', '', '', 'プラスチック', '', '1', '', NULL, '2024-09-11 01:25:48', '2024-09-11 01:25:48', NULL),
(31, 1, '1099566926', 'Genmin Impact kamisato aykaコスプレファン、折りたたみ布、ポータブルハンド、耐久性、アクセサリーギフト、夏', '//ja.aliexpress.com/item/1005007084542263.html?src=ibdm_d03p0558e02r02&sk=&aff_platform=&aff_trace_key=&af=&cv=&cn=&dp=', 'https://ae01.alicdn.com/kf/Sb4becd19e02b4f4da815a085bf80d3bek/200000mAh-2-USB-iPhone-Android.jpg', '[\"https:\\/\\/ae01.alicdn.com\\/kf\\/Sb4becd19e02b4f4da815a085bf80d3bek\\/200000mAh-2-USB-iPhone-Android.jpg_80x80.jpg_.webp\"]', '320002268', 7090, 31, '無料配送 \n8月 16日 に配送予定 ', '商品説明\n最大5v1aの高速ワイヤレス充電をサポート...', '', '', '', 'プラスチック', '', '1', '', NULL, '2024-09-11 01:25:48', '2024-09-11 01:25:48', NULL),
(32, 1, '1099566928', 'コンパクトなポータブルミニ扇子,USB充電器,漫画,果物,花,家庭用,屋外,コンパクト', '//ja.aliexpress.com/item/1005007084542263.html?src=ibdm_d03p0558e02r02&sk=&aff_platform=&aff_trace_key=&af=&cv=&cn=&dp=', 'https://ae01.alicdn.com/kf/Sb4becd19e02b4f4da815a085bf80d3bek/200000mAh-2-USB-iPhone-Android.jpg', '[\"https:\\/\\/ae01.alicdn.com\\/kf\\/Sb4becd19e02b4f4da815a085bf80d3bek\\/200000mAh-2-USB-iPhone-Android.jpg_80x80.jpg_.webp\"]', '320002268', 1012, 32, '無料配送 \n8月 16日 に配送予定 ', '商品説明\n最大5v1aの高速ワイヤレス充電をサポート...', '', '', '', 'プラスチック', '', '1', '', NULL, '2024-09-11 01:25:48', '2024-09-11 01:25:48', NULL),
(33, 1, '1099566930', '金属製のロブスタークラスプ,日曜大工のキーホルダー,バッグストラップバックル,カラビナ,スナップバッグパーツ,ジュエリー作りアクセサリー', '//ja.aliexpress.com/item/1005007084542263.html?src=ibdm_d03p0558e02r02&sk=&aff_platform=&aff_trace_key=&af=&cv=&cn=&dp=', 'https://ae01.alicdn.com/kf/Sb4becd19e02b4f4da815a085bf80d3bek/200000mAh-2-USB-iPhone-Android.jpg', '[\"https:\\/\\/ae01.alicdn.com\\/kf\\/Sb4becd19e02b4f4da815a085bf80d3bek\\/200000mAh-2-USB-iPhone-Android.jpg_80x80.jpg_.webp\"]', '320002268', 2094, 33, '無料配送 \n8月 16日 に配送予定 ', '商品説明\n最大5v1aの高速ワイヤレス充電をサポート...', '', '', '', 'プラスチック', '', '1', '', NULL, '2024-09-11 01:25:48', '2024-09-11 01:25:48', NULL),
(34, 1, '1099566933', '新鮮で緑の家庭用冷蔵庫、ハーブのクリスパー、野菜のクーラー、ハーブ、コリアン、ミント、パータ、サプレセションus', '//ja.aliexpress.com/item/1005007084542263.html?src=ibdm_d03p0558e02r02&sk=&aff_platform=&aff_trace_key=&af=&cv=&cn=&dp=', 'https://ae01.alicdn.com/kf/Sb4becd19e02b4f4da815a085bf80d3bek/200000mAh-2-USB-iPhone-Android.jpg', '[\"https:\\/\\/ae01.alicdn.com\\/kf\\/Sb4becd19e02b4f4da815a085bf80d3bek\\/200000mAh-2-USB-iPhone-Android.jpg_80x80.jpg_.webp\"]', '320002268', 2412, 34, '無料配送 \n8月 16日 に配送予定 ', '商品説明\n最大5v1aの高速ワイヤレス充電をサポート...', '', '', '', 'プラスチック', '', '1', '', NULL, '2024-09-11 01:25:48', '2024-09-11 01:25:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('05rqnIfticoWw9RCnRDd6j0wnv9we0M7NvfTqbZn', NULL, '43.130.7.211', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaXpaY3FIRERIS1pzYzJXWDc2MjBMRGdHbnYyUGZzU202WFZJUVUxZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly93d3cuYW1hem9ucW9vMTBtYWluLmNvbS9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1727313073),
('cPH77KtJLiRxDADFNXjIfNL9d6zCGvDJkCKsQOWp', NULL, '54.162.229.137', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.6533.99 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieUt6WGNORXpOYU9XRERONTY0UXFUeFdyWmVmOGdTdXkzZWdrT2o1TSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9hbWF6b25xb28xMG1haW4uY29tL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1727303771),
('evnKpmRHUCGIkXabopcFckexLIBLauOP4SOKe6nN', NULL, '62.141.44.236', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36 Edg/91.0.864.54', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNjZCb01XODdFNkg5Z3Nvd0NXQmU1dHFyMVhreE1ER1RZbEYwS0lUVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9hbWF6b25xb28xMG1haW4uY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1727307958),
('GSGRINVIY4yhsnyDdwwWE6oLZDS0xatU8rCHot33', NULL, '95.177.180.85', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibmFkYmdsdXJkU3BUOXJ3MmpQdmpwRjFIR1oyZVduY1B4NVBjVHV2UCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vYW1hem9ucW9vMTBtYWluLmNvbS9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1727292143),
('HZzeeIG5JDggriAFzBnHCF0fuanDd2WCoObEM2We', NULL, '43.130.7.211', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaUZ3T2VQeVJNRlZNVE9YSUpYam11dmVPcE1Oa0Y0c3pUdzkzcVNUQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly93d3cuYW1hem9ucW9vMTBtYWluLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1727313071),
('iz6Qre99myxJWFv951nifnZxDcYOOKZe2Ajdg0Mb', NULL, '140.179.16.60', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 8_0) AppleWebKit/545.38 (KHTML, like Gecko) Chrome/86.0.1085 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNndzc2wyaGEzN2JxWWhJSFZFUUwxWTczUFlmQThoOE84WWNRNFRVOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHBzOi8vd3d3LmFtYXpvbnFvbzEwbWFpbi5jb20vbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1727310662),
('kz6NjLOlslEb0XquIdQYvBkDlDTZ1W7IWvUwpvqo', NULL, '52.81.189.133', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 9_2_2) AppleWebKit/562.38 (KHTML, like Gecko) Chrome/51.0.1567 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNUpjWHhuTGk5OFhHZDF0Z2xwMExKWlBKS3VrZDRTWmVNWW82aE5oTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly93d3cuYW1hem9ucW9vMTBtYWluLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1727310454),
('nkJc8kweKnfsE8yqPvxqR3tvfuRC7xO22i4nhzS4', NULL, '62.141.44.236', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36 Edg/91.0.864.54', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQTJndHFYcXNHU2JHbWp3QmtJeEw2NEFSTWhKMDRWUkd6bUlEaVptYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9hbWF6b25xb28xMG1haW4uY29tL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1727307959),
('nUuFt8205KNG4awZ9wgwXWFAsEMvI2pUzf26A6AC', NULL, '43.163.8.36', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYU9jbVJpMWdNSVVHZXhSMk1KM2FUb1ppTWttU0lsQlBoS0k2OTVVbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9hbWF6b25xb28xMG1haW4uY29tL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1727309361),
('Os5fl7Mt746z4zZ4DKsVPs6bxe69225YP7YXKV60', NULL, '65.21.36.4', 'Mozilla/5.0 (Windows NT 10.0; rv:128.0) Gecko/20100101 Firefox/128.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT2JwZ0Q5MThVOThTQkl5ZFhHemtKcXpQVXBZV2hzNkYwQ0szSlJMTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9hbWF6b25xb28xMG1haW4uY29tL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1727297295),
('Qn5Py7QkhyvaFoHKbArQBfvMA4WZai8Mbx8yELEC', NULL, '5.133.192.146', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibWFsMldreXo1SlZTbjJxWEthSTMxeFpsempkR2ZkVllPNmRMT3FxYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vYW1hem9ucW9vMTBtYWluLmNvbS9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1727313030),
('rRlZ7QRMcZ4t0Akxayg513lx4Xal0rr6kC64tKxb', NULL, '43.163.8.36', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicWJKZHl6QXpEQ2RSajl0eW9vNldNVmFaam8xaUVBcTNrRmRZSkhDVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9hbWF6b25xb28xMG1haW4uY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1727309361),
('suPWtY4ZcBpEnBlXFBqUmkWObj4OU1UHpZOypMZF', NULL, '52.81.189.133', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/588.50 (KHTML, like Gecko) Chrome/99.0.2178 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVDJFeGVEaW1Ha2pZT3RTQjBDN0R0RVhkNGc4UTZ3SWg3ckVsT3ExWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly93d3cuYW1hem9ucW9vMTBtYWluLmNvbS9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1727310495),
('UMJcgv5IFBU006teLKTbgSNGXoh4k07mTfnwVAHR', NULL, '140.179.16.60', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 8_2_1) AppleWebKit/567.48 (KHTML, like Gecko) Chrome/82.0.2763 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieW9QcmlnVHE1WlVxUDlvTkdTR2NhWHpUdFcySlhoeVpXYjVtTEI1SiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vd3d3LmFtYXpvbnFvbzEwbWFpbi5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1727310655),
('yxSseknvkaHc1H5TC1wEBh5tNYoGIVbqgAz6g5GU', NULL, '5.133.192.146', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUFg0dWpIeG1yZEhrMFBHWTFtUWZUZ3Bwa2RFOXJyeHN5elpIUDFicCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vYW1hem9ucW9vMTBtYWluLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1727313029);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amazon_accesskey` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amazon_secretkey` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amazon_partnertag` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qsm_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qsm_password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qsm_apikey` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `multiplier` decimal(10,2) DEFAULT NULL,
  `qoo_maincategory` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qoo_subcategory` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qoo_smallcategory` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exhi_asins` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ng_asins` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ng_words` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alert_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `user_id`, `amazon_accesskey`, `amazon_secretkey`, `amazon_partnertag`, `qsm_email`, `qsm_password`, `qsm_apikey`, `multiplier`, `qoo_maincategory`, `qoo_subcategory`, `qoo_smallcategory`, `exhi_asins`, `ng_asins`, `ng_words`, `alert_email`, `created_at`, `updated_at`) VALUES
(2, 1, 'AKIAJMJK5KCN3X6BR7WA', 'RdXI0Gi6AcRapTwoaYZlXQmSV0PKgtg5dhWNfZPz', 'yuuiti8367-22', 'aliq10.hideki@gmail.com', 'Ukumatiiira1', 'BhiQeRsAhG1CSRXs3hEzdq7i_g_2_c_g_1_eMMcILhpP6q_g_2_VNJs_g_3_', 1.56, 'バッグ・雑貨', 'ストール・マフラー', '300003086', 'B0BLRT8XKY\r\nB00LUGN104\r\nB09JSM6X6Q\r\nB09B3M9DCY\r\nB0928N4M35\r\nB0928NCJVC\r\nB0928MRCNY\r\nB0928M3BG9\r\nB0928LMMHG\r\nB0928LVY8F\r\nB0928HML89\r\nB0928LDT53\r\nB0B6HD438S\r\nB09GK3WPYP\r\nB001DO2XWA\r\nB08B9LJ6YQ\r\nB08B9N4VPS\r\nB07T8ZRDDF\r\nB0BCDXHMGP\r\nB0BPB653ZK\r\nB0876CBNCM\r\nB07MBXPPC9\r\nB018LUF7PS\r\nB075D7BDPX\r\nB09X1DY9VV\r\nB0BRGNBZ5C\r\nB0BXH49KBS\r\nB09VC8393C\r\nB07K3ZLRPL\r\nB0C2W1188T\r\nB0BQZMFQNH\r\nB08TT481SM\r\nB09QLRRB98', 'B001DO2XWA\r\nB0876CBNCM\r\nB0BXH49KBS', 'Amazon\r\nQoo10\r\nAsin', 'super0116.dev@gmail.com', '2024-09-10 20:43:34', '2024-09-21 14:45:16'),
(3, 3, 'akaunt8367', 'RdXI0Gi6AcRapTwoaYZlXQmSV0PKgtg5dhWNfZPz', 'yuuiti8367-22', 'tagtag3324@gmail.com', 'Yuuiti8367', 'BhiQeRsAhG0u1XA1g3DjNjQM8yLyjC6hpDixQXkUGcA_g_3_', 1.20, '文具', '文房具', '300000525', 'B099ZTNWC1\r\nB0927YL5ND\r\nB07WYPKCM4\r\nB074TB914M\r\nB003PRIVUG', NULL, NULL, 'tagtag3324@gmail.com', '2024-09-21 08:51:26', '2024-09-21 18:05:13');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tool_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tool_pass` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('user','admin') COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `_token`, `email_verified_at`, `password`, `tool_id`, `tool_pass`, `role`, `full_name`, `created_at`, `updated_at`) VALUES
(1, 'super0116.dev@gmail.com', NULL, NULL, '$2y$10$/nGO8vc7KhOXi71GDikgMOSPCXFoyxjCOtQhExTCBbezmAtYxU0dG', 'id', 'pass', 'user', 'super0116.dev', '2024-09-22 05:39:07', '2024-09-22 05:39:07'),
(3, 'akaunt8367@gmail.com', '', NULL, '$2y$10$i3bnScfj0iQo1c39ar/L8eyeWrOmRqS4o4w5ZSX4Eb10Ay/oiV6ri', 'tagu', 'akaunt8367', 'user', 'akaunt8367', '2024-09-21 08:46:03', '2024-09-21 08:46:03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `amazon_products`
--
ALTER TABLE `amazon_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `amazon_products_asin_unique` (`asin`),
  ADD KEY `amazon_products_user_id_foreign` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qoo_products`
--
ALTER TABLE `qoo_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `qoo_products_gd_no_unique` (`gd_no`),
  ADD KEY `qoo_products_user_id_foreign` (`user_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `settings_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `amazon_products`
--
ALTER TABLE `amazon_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `qoo_products`
--
ALTER TABLE `qoo_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `amazon_products`
--
ALTER TABLE `amazon_products`
  ADD CONSTRAINT `amazon_products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `qoo_products`
--
ALTER TABLE `qoo_products`
  ADD CONSTRAINT `qoo_products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `settings`
--
ALTER TABLE `settings`
  ADD CONSTRAINT `settings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
