<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

use App\Models\Setting;

class SettingController extends Controller
{
    public function index(Request $request)
    {
        if ($request->isMethod('get')) {
            $setting = Setting::where('user_id', Auth::id())->first();
        } 
        else if ($request->isMethod('post')) 
        {
            $input_data = $request->all();
            $setting = Setting::where('user_id', Auth::id())->first();
            
            if (!$setting) {
                $setting = new Setting;
                $setting->user_id = Auth::id();
            }

            $setting->fill($input_data);
            $setting->save();

            session()->flash('status', 'OK');
            // session()->flash('status', '出品情報が正常に保存されました。【ツールダウンロード】タブからツールをダウンロードして商品情報取得してください。');
        }
    
        return view('setting', ['setting' => $setting]);
    }
    
    // get setting value of the user from python selenium
    public function get_setting_value(Request $request)
    {
        $setting = Setting::where('user_id', $request->user_id)->get();
        return $setting;
    }
}
