<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Support\Facades\Http;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Session;
use function PHPUnit\Framework\exactly;
use App\Models\User;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectAfterLogout = '/';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        // $this->middleware('guest', ['except' => 'logout']);
    }

    public function login(Request $request)
    {
        $credentials = $request->validate(
            [
                'email' => ['required', 'email'],
                'password' => ['required'],
            ],
            [
                'email.required' => 'メールフィールドは必須です。',
                'email.email' => 'メールは有効なメールアドレスである必要があります。',
                'password.required' => 'パスワードフィールドは必須です。',
            ]
        );
        
        $user = User::where('email', $request["email"])->first();
        
        if (!isset($user))
        {
            return back()->withErrors([
                'message' => 'メールアドレスまたはパスワードが間違っています。',
            ]);
        }
        else
        {
            $apiUrl = 'https://qoo10manageable.info/api/v1/web_login_check'; // Replace with your API URL
            $response = Http::post($apiUrl, [
                'email' => $request->email,
                'platform' => 'amazon',
            ]);
            $status = $response->status();
            
            if ($status == 200)
            {
                if (Auth::attempt($credentials))
                {
                    $request->session()->regenerate();
                    return redirect()->route('setting');
                }
                else {
                    return back()->withErrors([
                        'error' => '提供されたクレデンシャルは、当社の記録と一致しません。',
                    ]);
                }
            }
            else if ($status == 419)
            {
                return back()->withErrors([
                    'error' => '申し訳ありません。有効切れです。',
                ]);
            }
            else if ($status == 403)
            {
                return back()->withErrors([
                    'error' => '申し訳ありません。管理者から許可がありません。',
                ]);
            }
            else {
                return back()->withErrors([
                    'error' => '提供されたクレデンシャルは、当社の記録と一致しません。',
                ]);
            }
        }
    }

    /**
     * Logout, Clear Session, and Return.
     *
     * @return void
     */

    public function logout()
    {
        $user = Auth::user();
        Log::info('User Logged Out. ', [$user]);
        Auth::logout();
        Session::flush();

        return redirect()->route('login');
    }
}
