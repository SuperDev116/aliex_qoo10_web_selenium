<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use DataTables;

use App\Models\AmazonProduct;

class AmazonController extends Controller
{
    public function index()
    {
        return view('amazon');
    }

    public function list(Request $request)
    {
        if ($request->ajax()) {
			$data = AmazonProduct::where('user_id', Auth::id())->get();

			return DataTables::of($data)
				->addColumn('jsonstr', function ($row) {
					return json_decode($row['product']);
				})
				->rawColumns(['jsonstr'])
				->make(true);
		}
    }

    public function get_products(Request $request)
    {
        $products = AmazonProduct::where('user_id', $request->user_id)->get();
        return $products;
    }

    public function save_products(Request $request)
    {
        $input_data = $request->all();
        $product_data = json_decode($input_data['product'], true);

        $old_product = AmazonProduct::where([
            'user_id' => $input_data['user_id'],
            'asin' => $product_data['asin']
        ])->first();

        // Convert 'img_url_thumb' array to JSON if it exists
        if (isset($product_data['img_url_thumb']) && is_array($product_data['img_url_thumb'])) {
            $product_data['img_url_thumb'] = json_encode($product_data['img_url_thumb']);
        }
        
        if (!$old_product) {
            $product = new AmazonProduct;
        } else {
            $product = $old_product;
        }

        $product->fill($product_data);
        $product->save();
    }

    public function destroy(Request $request)
    {
        AmazonProduct::whereIn('id', $request->ids)->delete();
        return;
    }
}
