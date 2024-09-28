@extends("layouts.main")
@section('content')
<div class="page-heading">
  <section class="section">
    <div class="row">
      <div class="col-md-10">
        <div class="card">
          <div class="card-body">
            <div class="tab-content" id="myTabContent">
              <div id="profile" role="tabpanel" aria-labelledby="change_password">
                <div class="row my-4">
                  <div class="form-group">
                    <label for="basicInput">現在パスワード</label>
                    <input type="password" name="current-password" class=" form-control" placeholder="現在パスワード">
                  </div>
                  <div class="form-group">
                    <label for="helpInputTop">新しいパスワード</label>
                    <input type="password" name="new-password" class="form-control" placeholder="新しいパスワード">
                  </div>
                  <div class="form-group">
                    <label for="helperText">パスワード確認</label>
                    <input type="password" name="con-password" class="form-control" placeholder="パスワード確認">
                  </div>
                  <div class="col-sm-12">
                    <button type="button" class="btn btn-raised btn-primary btn-round waves-effect" onclick="savePass()">保存</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</div>

<script>
  const savePass = () => {
    let curPass = $('input[name="current-password"]').val();
    let newPass = $('input[name="new-password"]').val();
    let conPass = $('input[name="con-password"]').val();

    if (curPass == '') {
      alert("現在パスワードは必須です。")
      return;
    };
    if (newPass === '' || conPass === '' || newPass !== conPass) {
      alert('もう一度入力してください。')
      return;
    } else {
      let postData = {
        currentpass: curPass,
        newpass: newPass
      };

      $.ajax({
        url: '{{ route("change_pwd") }}',
        type: 'post',
        headers: {
          'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        data: {
          postData: JSON.stringify(postData)
        },
        success: function(data) {
          if (data == 'err') {
            Toastify({
              text: "パスワードが間違っています。",
              duration: 2500,
              close: true,
              gravity: "top",
              position: "right",
              backgroundColor: "#f3616d",
            }).showToast();
            location.href = "{{ route('user.profile') }}";
          } else {
            Toastify({
              text: "パスワードが正常に変更されました。",
              duration: 2500,
              close: true,
              gravity: "top",
              position: "right",
              backgroundColor: "#435ebe",
            }).showToast();
            // alert('パスワードが正常に変更されました。');
            location.href = "{{ route('login') }}";
          }
        }
      });
    }
  };
</script>
@endsection
@push('scripts')
<script src="assets/extensions/parsleyjs/parsley.min.js"></script>
<script src="assets/js/pages/parsley.js"></script>
@endpush