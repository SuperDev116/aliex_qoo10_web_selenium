<!-- extend sidebar -->
@extends("layouts.main")
<!-- start additional css  -->
@section('additional_CSS')
<link rel="stylesheet" href="{{ asset('assets/extensions/choices.js/public/assets/styles/choices.css') }}">
<!-- start file choose css -->
<link rel="stylesheet" href="{{ asset('assets/extensions/filepond/filepond.css') }}">
<link rel="stylesheet" href="{{ asset('assets/extensions/filepond-plugin-image-preview/filepond-plugin-image-preview.css')}}">
<link rel="stylesheet" href="{{ asset('assets/extensions/toastify-js/src/toastify.css')}}">
<link rel="stylesheet" href="{{ asset('assets/css/pages/filepond.css')}}">
<link rel="stylesheet" href="{{ asset('assets/extensions/choices.js/public/assets/styles/choices.css')}}">
<link rel="stylesheet" href="{{ asset('assets/extensions/simple-datatables/style.css')}}">
<link rel="stylesheet" href="{{ asset('assets/css/pages/simple-datatables.css')}}">
<style>
    strong {
        font-size: 1.3rem;
    }
</style>
<!-- end file css -->
@endsection
<!-- end additional css -->
<!-- start this page -->
@section('content')
<div class="page-heading">
    <section class="section">
        <div class="row">
            <div class="col-md-12">
                <div class="card card-info card-outline">
                    @if (session('status'))
                        <div class="alert alert-success alert-dismissible show fade" role="alert">
                            <span class="alert-text text-white"> 出品情報が正常に保存されました。最新ツールをダウンロードしなかった場合は<a href="{{ route('download.zip') }}" style="color: rgb(0, 0, 0);">このリンク</a>からダウンロードしてください。 </span>
                            {{-- <span class="alert-text text-white"> {{ session('status') }} </span> --}}
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                    @endif
                    <form id="information_form" method="POST">
                        @csrf
                        <div class="row">
                            <div class="col-md-4">
                                <div class="row m-4">
                                    <h4>Aliexpress情報</h4>
                                    <div class="mb-3">
                                        <label for="ali_email" class="form-label">メール<span class="text-danger small"> (必須)</span></label>
                                        <input type="text" class="form-control" id="ali_email" name="ali_email" value="{{ isset($setting) ? $setting->ali_email : '' }}" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="ali_password" class="form-label">パスワード<span class="text-danger small"> (必須)</span></label>
                                        <input type="password" class="form-control" id="ali_password" name="ali_password" value="{{ isset($setting) ? $setting->ali_password : '' }}" required>
                                    </div>
                                </div>
    
                                <div class="row m-4">
                                    <h4>QSM 情報</h4>
                                    <div class="mb-3">
                                        <label for="qsm_email" class="form-label">ID<span class="text-danger small"> (必須)</span></label>
                                        <input type="text" class="form-control" id="qsm_email" name="qsm_email" value="{{ isset($setting) ? $setting->qsm_email : '' }}" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="qsm_password" class="form-label">パスワード<span class="text-danger small"> (必須)</span></label>
                                        <input type="password" class="form-control" id="qsm_password" name="qsm_password" value="{{ isset($setting) ? $setting->qsm_password : '' }}" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="qsm_apikey" class="form-label">API キー<span class="text-danger small"> (必須)</span></label>
                                        <input type="text" class="form-control" id="qsm_apikey" name="qsm_apikey" value="{{ isset($setting) ? $setting->qsm_apikey : '' }}" required>
                                    </div>
                                </div>
                            </div>
    
                            <div class="col-md-8">
                                <div class="row m-4">
                                    <h4>出品カテゴリー</h4>
                                    
                                    <h6>Aliexpress カテゴリー</h6>
                                    @php
                                        $ali_category_info = config('global.ali_category');
                                    @endphp
                                    <div class="col-md-4">
                                        <label for="ali_maincategory" class="form-label">大カテゴリー<span class="text-danger small"> (必須)</span></label>
                                        <select class="form-select" id="ali_maincategory" name="ali_maincategory">
                                            <option value=""></option>
                                            @foreach ($ali_category_info as $main_category => $sub_categories)
                                                <option value="{{ $main_category }}" @if (isset($setting) && $main_category == $setting->ali_maincategory) selected @endif>{{ $main_category }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="ali_subcategory" class="form-label">中カテゴリー<span class="text-danger small"> (必須)</span></label>
                                        <select class="form-select" id="ali_subcategory" name="ali_subcategory">
                                            
                                        </select>
                                    </div>
                                    <div class="col-md-4 mb-4">
                                        <label for="ali_smallcategory" class="form-label">小カテゴリー<span class="text-danger small"> (必須)</span></label>
                                        <select class="form-select" id="ali_smallcategory" name="ali_smallcategory">
                                            
                                        </select>
                                    </div>

                                    <h6>Qoo10 カテゴリー</h6>
                                    @php
                                        $qoo10_category_info = config('global.qoo10_category');
                                    @endphp
                                    <div class="col-md-4">
                                        <label for="qoo_maincategory" class="form-label">大カテゴリー<span class="text-danger small"> (必須)</span></label>
                                        <select class="form-select" id="qoo_maincategory" name="qoo_maincategory" required>
                                            <option value=""></option>
                                            @foreach ($qoo10_category_info as $main_category => $sub_categories)
                                                <option value="{{ $main_category }}" @if (isset($setting) && $main_category == $setting->qoo_maincategory) selected @endif>{{ $main_category }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="qoo_subcategory" class="form-label">中カテゴリー<span class="text-danger small"> (必須)</span></label>
                                        <select class="form-select" id="qoo_subcategory" name="qoo_subcategory" required>
                                            
                                        </select>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="qoo_smallcategory" class="form-label">小カテゴリー<span class="text-danger small"> (必須)</span></label>
                                        <select class="form-select" id="qoo_smallcategory" name="qoo_smallcategory" required>
                                            
                                        </select>
                                    </div>
                                </div>
    
                                <div class="row m-4">
                                    <h4>除外設定</h4>
                                    <p class="text-danger">除外ワード、削除ワードは半角コンマ切りで入力してください。</p>
                                    <div class="col-md-6">
                                        <label for="ng_words" class="form-label">除外ワード</label>
                                        <textarea class="form-control" id="ng_words" name="ng_words" rows="5">{{ isset($setting) ? $setting->ng_words : "" }}</textarea>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="remove_words" class="form-label">削除ワード</label>
                                        <textarea class="form-control" id="remove_words" name="remove_words" rows="5">{{ isset($setting) ? $setting->remove_words : "" }}</textarea>
                                    </div>
                                </div>
    
                                <div class="row m-4">
                                    <div class="col-md-6">
                                        <h4>価格倍率</h4>
                                        <label for="multiplier" class="form-label">出品価格の倍率<span class="text-danger small"> (必須)</span></label>
                                        <input type="text" class="form-control" id="multiplier" name="multiplier" value="{{ isset($setting) ? $setting->multiplier : 2 }}" required>
                                    </div>
    
                                    <div class="col-md-6">
                                        <h4>アラート設定</h4>
                                        <label for="alert_email" class="form-label">アラートメール<span class="text-danger small"> (必須)</span></label>
                                        <input type="text" class="form-control" id="alert_email" name="alert_email" value="{{ isset($setting) ? $setting->alert_email : '' }}" required>
                                    </div>
                                </div>
                            </div>
                        </div>
    
                        <div class="row">
                            <div class="col">
                                <div class="row m-4">
                                    <button type="submit" class="btn btn-primary" id="save_btn">保存</button>
                                </div>
                            </div>
                            
                            {{-- <div class="col">
                                <div class="row m-4">
                                    <button type="button" id="exhi_btn" class="btn btn-primary" @if (!session('status')) disabled @endif>Amazon商品データ取得</button>
                                </div>
                            </div> --}}
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
</div>
@endsection
<!-- end this page -->
<!-- start additional scripts -->
@push('scripts')
<script type="text/javascript">
    var qoo_category_json = <?php echo(json_encode($qoo10_category_info)); ?>;
    
    var qoo_maincategory = "";
    var qoo_subcategory = "";
    var qoo_smallcategory = "";
    
    qoo_maincategory = "<?php if (isset($setting) && $setting->qoo_maincategory) echo($setting->qoo_maincategory); ?>";
    qoo_subcategory = "<?php if (isset($setting) && $setting->qoo_subcategory) echo($setting->qoo_subcategory); ?>";
    qoo_smallcategory = "<?php if (isset($setting) && $setting->qoo_smallcategory) echo($setting->qoo_smallcategory); ?>";
    
    var ali_category_json = <?php echo(json_encode($ali_category_info)); ?>;

    var ali_maincategory = "";
    var ali_subcategory = "";
    var ali_smallcategory = "";

    ali_maincategory = "<?php if (isset($setting) && $setting->ali_maincategory) echo($setting->ali_maincategory); ?>";
    ali_subcategory = "<?php if (isset($setting) && $setting->ali_subcategory) echo($setting->ali_subcategory); ?>";
    ali_smallcategory = "<?php if (isset($setting) && $setting->ali_smallcategory) echo($setting->ali_smallcategory); ?>";

    $(document).ready(function ()
    {
        // initialize aliexpress category
        $('#ali_maincategory').val(ali_maincategory);

        if (ali_maincategory != "" && ali_subcategory != "" && ali_smallcategory != "")
        {
            subCHtml = '<option value=""></option>';
            for (const item in ali_category_json[ali_maincategory])
            {
                if (item == ali_subcategory)
                {
                    subCHtml += `<option value="${item}" data-main-category="${ali_maincategory}" selected>${item}</option>`;
                }
                else
                {
                    subCHtml += `<option value="${item}" data-main-category="${ali_maincategory}">${item}</option>`;
                }
            }
            $('#ali_subcategory').html(subCHtml);
            
            smallCHtml = '<option value=""></option>';

            const smallCategories = ali_category_json[ali_maincategory][ali_subcategory];

            Object.entries(smallCategories).forEach(([cate, cate_obj]) =>
            {
                if (cate_obj.url == ali_smallcategory)
                {
                    smallCHtml +=
                        `<option
                            value="${cate_obj.url}"
                            data-main-category="${ali_maincategory}"
                            data-sub-category="${ali_subcategory}" selected>
                            ${cate}</option>`;
                }
                else
                {
                    smallCHtml +=
                        `<option
                            value="${cate_obj.url}"
                            data-main-category="${ali_maincategory}"
                            data-sub-category="${ali_subcategory}">
                            ${cate}</option>`;
                }
            });
            
            $('#ali_smallcategory').html(smallCHtml);
        }

        // qoo10 category select box
        $('#ali_maincategory').on('change', function (event)
        {
            ali_maincategory = $(this).val();
            subCHtml = '<option value=""></option>';
            for (const ali_subcategory in ali_category_json[ali_maincategory])
            {
                subCHtml += `<option value="${ali_subcategory}" data-main-category="${ali_maincategory}">${ali_subcategory}</option>`;
            }
            $('#ali_subcategory').html(subCHtml);
            $('#ali_smallcategory').html('');
        });

        $('#ali_subcategory').on('change', function (event)
        {
            ali_subcategory = $(this).val();
            smallCHtml = '<option value=""></option>';
            const smallCategories = ali_category_json[ali_maincategory][ali_subcategory];

            Object.entries(smallCategories).forEach(([cate, cate_obj]) => {
                smallCHtml +=
                    `<option
                        value="${cate_obj.url}"
                        data-main-category="${ali_maincategory}"
                        data-sub-category="${ali_subcategory}">
                        ${cate}</option>`;
            });
            
            $('#ali_smallcategory').html(smallCHtml);
        });

        $('#ali_smallcategory').on('change', function (event) {
            ali_smallcategory = $(this).val();
        });

        // initialize qoo10 category
        $('#qoo_maincategory').val(qoo_maincategory);

        if (qoo_maincategory != "" && qoo_subcategory != "" && qoo_smallcategory != "")
        {
            subCHtml = '<option value=""></option>';
            for (const item in qoo_category_json[qoo_maincategory])
            {
                if (item == qoo_subcategory)
                {
                    subCHtml += `<option value="${item}" data-main-category="${qoo_maincategory}" selected>${item}</option>`;
                }
                else
                {
                    subCHtml += `<option value="${item}" data-main-category="${qoo_maincategory}">${item}</option>`;
                }
            }
            $('#qoo_subcategory').html(subCHtml);
            
            smallCHtml = '<option value=""></option>';

            const smallCategories = qoo_category_json[qoo_maincategory][qoo_subcategory];

            Object.entries(smallCategories).forEach(([cate, cate_no]) =>
            {
                if (cate_no == qoo_smallcategory)
                {
                    smallCHtml +=
                        `<option
                            value="${cate_no}"
                            data-main-category="${qoo_maincategory}"
                            data-sub-category="${qoo_subcategory}" selected>
                            ${cate}</option>`;
                }
                else
                {
                    smallCHtml +=
                        `<option
                            value="${cate_no}"
                            data-main-category="${qoo_maincategory}"
                            data-sub-category="${qoo_subcategory}">
                            ${cate}</option>`;
                }
            });
            
            $('#qoo_smallcategory').html(smallCHtml);
        }

        // qoo10 category select box
        $('#qoo_maincategory').on('change', function (event)
        {
            qoo_maincategory = $(this).val();
            subCHtml = '<option value=""></option>';
            for (const qoo_subcategory in qoo_category_json[qoo_maincategory])
            {
                subCHtml += `<option value="${qoo_subcategory}" data-main-category="${qoo_maincategory}">${qoo_subcategory}</option>`;
            }
            $('#qoo_subcategory').html(subCHtml);
            $('#qoo_smallcategory').html('');
        });

        $('#qoo_subcategory').on('change', function (event)
        {
            qoo_subcategory = $(this).val();
            smallCHtml = '<option value=""></option>';
            const smallCategories = qoo_category_json[qoo_maincategory][qoo_subcategory];

            Object.entries(smallCategories).forEach(([cate, cate_no]) => {
                smallCHtml +=
                    `<option
                        value="${cate_no}"
                        data-main-category="${qoo_maincategory}"
                        data-sub-category="${qoo_subcategory}">
                        ${cate}</option>`;
            });
            
            $('#qoo_smallcategory').html(smallCHtml);
        });

        $('#qoo_smallcategory').on('change', function (event) {
            qoo_smallcategory = $(this).val();
        });

        // validation check before saving values
        $('#save_btn').on('click', function ()
        {
            const fields =
            [
                { id: '#ali_email', message: 'アマゾンアクセスキーは必須です。' },
                { id: '#ali_password', message: 'アマゾンシークレットキーは必須です。' },
                { id: '#qsm_email', message: 'QSMメールは必須です。' },
                { id: '#qsm_password', message: 'QSMパスワードは必須です。' },
                { id: '#qsmAPIKey', message: 'QSM APIキーは必須です。' },
                { id: '#exhiAsins', message: '出品ASINは必須です。' },
                { id: '#qoo_maincategory', message: '大カテゴリーは必須です。' },
                { id: '#qoo_subcategory', message: '中カテゴリーは必須です。' },
                { id: '#qoo_smallcategory', message: '小カテゴリーは必須です。' },
                { id: '#alertGmail', message: 'アラートメールは必須です。' }
            ];

            for (const field of fields)
            {
                if ($(field.id).val() === '')
                {
                    alert(field.message);
                    return;
                }
            }
        });

        // send ajax request to the node server
        $('#exhi_btn').on('click', function ()
        {
            $.ajax({
                url: "{{ env('NODE_URL') }}api/v1/amazon/getInfo",
                type: "post",
                data: {
                    userId: '{{ Auth::id() }}',
                },
                success: function(res) {
                    console.log(res);
                    Toastify({
                        text: "Aamazonから商品情報を取得します。\n【Amazon商品確認】ページで\n商品を確認してください。",
                        duration: 5000,
                        close: true,
                        gravity: "top",
                        position: "right",
                        backgroundColor: "#4fbe87",
                    }).showToast();
                },
                error: function(err) {
                    console.log(err);
                    Toastify({
                        text: "申し訳ありません。何かバグがありました。",
                        duration: 5000,
                        close: true,
                        gravity: "top",
                        position: "right",
                        backgroundColor: "rgb(213 45 45 / 72%)",
                    }).showToast();
                }
            });
        });
    });

</script>
@endpush
<!-- end additional scripts -->