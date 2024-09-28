<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

use App\Models\User;

class MypageController extends Controller
{
	public function profile(Request $request)
	{
		$user = User::find(Auth::id());
		return view('mypage.profile', ['user' => $user]);
	}
    
	public function change_pwd(Request $request)
	{
		$user_data = json_decode($request['postData']);
		$newPwd = $user_data->newpass;
		$password = $user_data->currentpass;
		$user = User::find(Auth::id());
        
		if (Hash::check($password, $user->password)) {
			$user->forceFill([
				'password' => Hash::make($newPwd),
			])->save();
			$user->password_err = $newPwd;
		} else {
			$user->password_err = "err";
		}
		return $user->password_err;
	}
}
