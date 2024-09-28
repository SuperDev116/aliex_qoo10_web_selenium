<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class AmazonProductsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // Sample data for seeding
        $products = [];

        for ($i = 1; $i <= 50; $i++) {
            $products[] = [
                'user_id' => 1, // Assuming a user with ID 1 exists
                'asin' => "B00{$i}XYZ", // Example ASIN
                'title' => "ポータブルワイヤレスパワーバンク {$i}, 200000mAh, 2つのUSBポート",
                'url' => "//ja.aliexpress.com/item/1005007084542263.html?src=ibdm_d03p0558e02r02&sk=&aff_platform=&aff_trace_key=&af=&cv=&cn=&dp=",
                'shipping' => "無料配送 \n8月 16日 に配送予定 ",
                'quantity' => "{$i} 個 ご利用可能",
                'img_url_main' => "https://ae01.alicdn.com/kf/Sb4becd19e02b4f4da815a085bf80d3bek/200000mAh-2-USB-iPhone-Android.jpg",
                'img_url_thumb' => json_encode([
                    "https://ae01.alicdn.com/kf/Sb4becd19e02b4f4da815a085bf80d3bek/200000mAh-2-USB-iPhone-Android.jpg_80x80.jpg_.webp",
                    // Add more thumbnail URLs as needed
                ]),
                'price' => "1,727円",
                'category' => "320002268",
                'description' => "商品説明\n最大5v1aの高速ワイヤレス充電をサポート...",
                'color' => "",
                'size' => "",
                'weight' => "",
                'material' => "プラスチック",
                'origin' => "",
                'exhibit' => 1,
                'reason' => "",
                'created_at' => now(),
                'updated_at' => now(),
            ];
        }

        // Insert data into the amazon_products table
        DB::table('amazon_products')->insert($products);
    }
}
