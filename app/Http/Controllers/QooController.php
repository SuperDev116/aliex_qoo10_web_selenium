<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use DataTables;

use App\Models\QooProduct;

class QooController extends Controller
{
    public function index()
    {
        return view('qoo10');
    }

    public function list(Request $request)
    {
        if ($request->ajax()) {
			$data = QooProduct::where('user_id', Auth::id())->get();
            
			return DataTables::of($data)
				->addColumn('jsonstr', function ($row) {
					return json_decode($row['product']);
				})
				->rawColumns(['jsonstr'])
				->make(true);
		}
    }
}
