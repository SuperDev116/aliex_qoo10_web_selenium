<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use DataTables;

use App\Models\AliProduct;

class AliController extends Controller
{
    public function index()
    {
        return view('ali');
    }

    public function list(Request $request)
    {
        if ($request->ajax()) {
			$data = AliProduct::where('user_id', Auth::id())->get();

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
        $products = AliProduct::where('user_id', $request->user_id)->get();
        return $products;
    }

    public function save_products(Request $request)
    {
        $product_data = $request->all();
        $old_product = AliProduct::where([
            'user_id' => $product_data['user_id'],
            'title' => $product_data['title']
        ])->first();
        
        // Convert 'img_url_thumb' array to JSON if it exists
        if (isset($product_data['img_url_thumb']) && is_array($product_data['img_url_thumb'])) {
            $product_data['img_url_thumb'] = json_encode($product_data['img_url_thumb']);
        }
        
        if (!$old_product) {
            $product = new AliProduct;
        } else {
            $product = $old_product;
        }

        $product->fill($product_data);
        $product->save();
    }

    public function destroy(Request $request)
    {
        AliProduct::whereIn('id', $request->ids)->delete();
        return;
    }
}
