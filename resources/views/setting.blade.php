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
                                    <h4>AMAZON情報</h4>
                                    <div class="mb-3">
                                        <label for="amazon_email" class="form-label">メール<span class="text-danger small"> (必須)</span></label>
                                        <input type="text" class="form-control" id="amazon_email" name="amazon_email" value="{{ isset($setting) ? $setting->amazon_email : '' }}" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="amazon_password" class="form-label">パスワード<span class="text-danger small"> (必須)</span></label>
                                        <input type="password" class="form-control" id="amazon_password" name="amazon_password" value="{{ isset($setting) ? $setting->amazon_password : '' }}" required>
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
    
                                    <h6>Qoo10 カテゴリー</h6>
                                    @php
                                        $category_info = config('global.category');
                                    @endphp
                                    <div class="col-md-4">
                                        <label for="qoo_maincategory" class="form-label">大カテゴリー<span class="text-danger small"> (必須)</span></label>
                                        <select class="form-select" id="qoo_maincategory" name="qoo_maincategory" required>
                                            <option value=""></option>
                                            @foreach ($category_info as $main_category => $sub_categories)
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
                                    <h4>出品設定、除外設定</h4>
                                    <p class="text-danger">出品ASIN、除外ASIN、除外ワードは半角「Enter」切りで入力してください。</p>
                                    <div class="col-md-4">
                                        <label for="exhi_asins" class="form-label">出品ASIN<span class="text-danger small"> (必須)</span></label>
                                        <textarea class="form-control" id="exhi_asins" name="exhi_asins" rows="10" required>{{ isset($setting) ? $setting->exhi_asins : '' }}</textarea>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="ng_asins" class="form-label">除外ASIN</label>
                                        <textarea class="form-control" id="ng_asins" name="ng_asins" rows="10">{{ isset($setting) ? $setting->ng_asins : '' }}</textarea>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="ng_words" class="form-label">除外ワード</label>
                                        <textarea class="form-control" id="ng_words" name="ng_words" rows="10">{{ isset($setting) ? $setting->ng_words : '' }}</textarea>
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
    var qoo_category_json = <?php echo(json_encode($category_info)); ?>;
    
    var qoo_maincategory = "";
    var qoo_subcategory = "";
    var qoo_smallcategory = "";

    qoo_maincategory = "<?php if (isset($setting) && $setting->qoo_maincategory) echo($setting->qoo_maincategory); ?>";
    qoo_subcategory = "<?php if (isset($setting) && $setting->qoo_subcategory) echo($setting->qoo_subcategory); ?>";
    qoo_smallcategory = "<?php if (isset($setting) && $setting->qoo_smallcategory) echo($setting->qoo_smallcategory); ?>";

    $(document).ready(function ()
    {
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
                { id: '#amazon_email', message: 'アマゾンアクセスキーは必須です。' },
                { id: '#amazon_password', message: 'アマゾンシークレットキーは必須です。' },
                { id: '#amazon_partnertag', message: 'アマゾンパートナータグは必須です。' },
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