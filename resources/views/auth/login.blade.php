<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=Edge">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <meta name="description" content="Amazon Track">
  <title>{{ env('APP_NAME') }}</title>
  <link rel="stylesheet" href="{{asset('assets/css/main/app.css')}}">
  <link rel="stylesheet" href="{{asset('assets/css/pages/auth.css')}}">
  <link href="{{asset('assets/images/11.png')}}" rel="icon">
  <link rel="shortcut icon" href="{{asset('assets/images/amazon_affiliate.png')}}" type="image/x-icon">
  <link rel="shortcut icon" href="{{asset('assets/images/amazon_affiliate.png')}}" type="image/png">
</head>

<body style="background-color: #f2f5fba8;">
  <div id="auth">
    <!-- style="overflow-x:hiddden;overflow-y:hidden;" -->
    <div class="row h-100">
      <div class="col-lg-6 col-12 ">
        <div id="auth-left">
          <div class="auth-logo mb-3">
          </div>
          <h1 class="auth-title">ログイン</h1>
          @if ($errors->first('message'))
          <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <span class="alert-text text-white"> {{$errors->first('message')}} </span>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          @elseif ($errors->first('error'))
          <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <span class="alert-text text-white"> {{$errors->first('error')}} </span>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close">
            </button>
          </div>
          @endif
          <form method="POST" action="{{ route('login') }}">
            @csrf
            <div class="form-group position-relative has-icon-left mb-4">
              <input type="text" class="form-control form-control-xl" id="email" name="email" placeholder="メールアドレス">
              <div class="form-control-icon">
                <i class="bi bi-person"></i>
              </div>
            </div>
            @error('email')
            <small class="text-danger text-xs">{{ $message }}</small>
            @enderror

            <div class="form-group position-relative has-icon-left mb-4">
              <input type="text" class="form-control form-control-xl" name="tool_id" placeholder="ツールID">
              <div class="form-control-icon">
                <i class="bi bi-shield-lock"></i>
              </div>
            </div>
            @error('tool_id')
            <small class="text-danger text-xs">{{ $message }}</small>
            @enderror

            <div class="form-group position-relative has-icon-left mb-4">
              <input type="password" class="form-control form-control-xl" name="tool_pass" placeholder="ツールパスワード">
              <div class="form-control-icon">
                <i class="bi bi-shield-lock"></i>
              </div>
            </div>
            @error('tool_pass')
            <small class="text-danger text-xs">{{ $message }}</small>
            @enderror

            <button type="submit" class="btn btn-primary btn-block btn-lg shadow-lg mt-2">ログイン</button>
          </form>
          <div class="text-center mt-5 text-lg fs-4">
          </div>
        </div>
      </div>
      <div class="col-lg-6 col-12">
        <div id="auth-right">
        </div>
      </div>
    </div>
  </div>
  <script src="{{asset('assets/js/bootstrap.js')}}"></script>
  <script src="{{asset('assets/js/app.js')}}"></script>
  <script src="{{ asset('assets/plugins/jquery/jquery.min.js') }}"></script>
</body>

</html>