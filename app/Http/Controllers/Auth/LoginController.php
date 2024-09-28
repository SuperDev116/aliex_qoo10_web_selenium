<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Support\Facades\Http;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
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
                'tool_id' => ['required'],
                'tool_pass' => ['required'],
            ],
            [
                'email.required' => 'メールは必須です。',
                'email.email' => '無効なメールです。',
                'tool_id.required' => 'ツールIDは必須です。',
                'tool_pass.required' => 'ツールパスワードは必須です。',
            ]
        );
        $credentials['password'] = $credentials['tool_pass'];
        
        $login_api_url = 'https://qoo10manageable.info/api/v1/web_login_check'; // Replace with your API URL
        $response = Http::post($login_api_url, [
            'email' => $request->email,
            'tool_id' => $request->tool_id,
            'tool_pass' => $request->tool_pass,
            'platform' => 'amazon',
        ]);
        $status = $response->status();

        if ($status == 200)
        {
            $user = User::where('email', $request["email"])->first();
            
            if (!isset($user))
            {
                $data = array();
                $data['full_name'] = explode('@', $credentials['email'])[0];
                $data['email'] = $credentials['email'];
                $data['tool_id'] = $credentials['tool_id'];
                $data['tool_pass'] = $credentials['tool_pass'];
                $data['password'] = Hash::make($credentials['password']);
                $data['role'] = 'user';
                $user = User::create($data);
                $user->save();

                Auth::login($user);

                return redirect()->route('setting');
            }
            else if (Auth::attempt($credentials))
            {
                $request->session()->regenerate();
                return redirect()->route('setting');
            }
            else
            {
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
                'error' => '申し訳ありません。登録されていないユーザーです。',
            ]);
        }
        else
        {
            return back()->withErrors([
                'error' => '提供されたクレデンシャルは、当社の記録と一致しません。',
            ]);
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
