<!-- extend layouts -->
@extends("layouts.main")
<!-- start additional css  -->
@section('additional_CSS')
<!-- start datatable css -->

<link rel="stylesheet" href="{{ asset('assets/extensions/filepond/filepond.css')}}">
<link rel="stylesheet" href="{{ asset('assets/extensions/filepond-plugin-image-preview/filepond-plugin-image-preview.css')}}">

<link rel="stylesheet" href="{{ asset('assets/css/pages/filepond.css')}}">
<link rel="stylesheet" href="{{asset('assets/extensions/datatables.net-bs5/css/dataTables.bootstrap5.min.css')}}">
<link rel="stylesheet" href="{{asset('assets/css/pages/datatables.css')}}">
<!-- end file css -->
<style>
    table td {
        text-align: right;
    }
</style>
<!-- end additional css -->
@endsection
<!-- start this page -->
@section('content')
<div class="page-heading" id="product_list">
    <div class="page-title">
        <div class="row">
            {{-- <h3>商品情報（価格と在庫を確認しましょう！）</h3> --}}
            <div class="col-4 col-md-4 order-md-1 order-last">
                {{-- <h5 style="color:#3550b1" class="mt-3">【データ取得中の商品】:<strong style="color:#3550b1" id="updating">0</strong></h5> --}}
            </div>
            <div class="col-4 col-md-4 order-md-1 order-last">
                {{-- <h5 style="color: #7c8d21;" class="mt-3">【データ取得完了の商品】:<strong style="color: #7c8d21;" id="complete">22</strong></h5> --}}
            </div>
            <div class="col-4 col-md-4 order-md-2 order-first">
                <button type="button" class="m-2 btn btn-danger btn-icon float-lg-end" id="remove_products">
                    <i class="bi bi-trash"></i> 削除
                </button>
                <button type="button" class="m-2 btn btn-primary block float-start float-lg-end" id="exhibit_products">
                    <i class="bi bi-upload"></i> Qoo10に出品
                </button>
            </div>
        </div>
    </div>
    <section class="section">
        <div class="card">
            <div class="card-body">
                <table class="table table-bordered table-hover datatable" style="min-width:980px">
                    <thead>
                        <tr>
                            <th style="text-align: center;"></th>
                            <th style="text-align: center;">ASIN</th>
                            <th style="text-align: center;">商品名</th>
                            <th style="text-align: center;">画像</th>
                            <th style="text-align: center;">価格</th>
                            <th style="text-align: center;">在庫</th>
                        </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </div>
        </div>
    </section>
</div>

@endsection
@push('scripts')
<script src="{{asset('assets/extensions/jquery/jquery.min.js')}}"></script>
<script src="{{asset('assets/js/pages/datatables.min.js')}}"></script>
<script>
    $(document).ready(function() {
        $('.datatable').DataTable().ajax.reload();
    });

    var datatable = $('.datatable').DataTable({
        processing: true,
        serverSide: true,
        autoConfig: true,
        pageLength: 10,
        ajax: "{{ route('amazon.list') }}",
        columns: [
            {
                data: null,
                name: 'id',
                render: function(data, type, row) {
                    return (
                        `<div style="text-align: center;">
                            <input type="checkbox" data-id="${row.id}" />
                        </div>`
                    );
                }
            },
            {
                data: null,
                name: 'asin',
                render: function(data, type, row) {
                    if (row.is_prime) {
                        return (
                            `<div style="text-align: center;">
                                <span class="badge bg-info">${row.asin}</span>
                            </div>
                            <div style="text-align: center;">
                                <span class="badge bg-light-primary">Prime</span>
                            </div>`
                        );
                    } else {
                        return (
                            `<div style="text-align: center;">
                                <span class="badge bg-info">${row.asin}</span>
                            </div>
                            <div style="text-align: center;">
                                <span class="badge bg-danger">非Prime</span>
                            </div>`
                        );
                    }
                }
            },
            {
                data: null,
                name: 'title',
                render: function(data, type, row) {
                    return (
                        `<div style="padding: 10px; text-align: center;">
                            <a href="${row.url}" target="_blank">${row.title}</a>
                        </div>`
                    )
                }
            },
            {
                data: null,
                name: 'image',
                render: function(data, type, row) {
                    return (
                        `<div style="text-align: center; padding: 10px;">
                            <a href="${row.url}" target="_blank">
                                <img src="${row.img_url_main}" alt="IMG 取得中" style="width: 100px; height: 100px;">
                            </a>
                        </div>`
                    );
                }
            },
            {
                data: null,
                name: 'price',
                render: function(data, type, row) {
                    if (row.price == 0)
                    {
                        return (
                            `<span class="badge bg-light-warning">価格なし</span>`
                        )
                    }
                    if (row.r_price == 0 && row.price == 0)
                    {
                        return (
                            `<span class="badge bg-light-warning">取得中</span>`
                        )
                    }
                    if (row.price > row.r_price)
                    {
                        return (
                            `<span title="現在価格" class="badge bg-light-danger">
                                <i class="bi bi-arrow-up"></i> ¥ ${row.price}
                            </span>
                            <br/>
                            <span title="登録価格" class="badge bg-light-secondary">¥ ${row.r_price}</span>`
                        )
                    }
                    else if (row.price < row.r_price)
                    {
                        return (
                            `<span title="現在価格" class="badge bg-light-warning">
                                <i class="bi bi-arrow-down"></i> ¥ ${row.price}
                            </span>
                            <br/>
                            <span title="登録価格" class="badge bg-light-secondary">¥ ${row.r_price}</span>`
                        )
                    }
                    else if (row.price == row.r_price)
                    {
                        return (
                            `<span title="現在価格" class="badge bg-light-success">¥ ${row.price} </span>
                            <br/>
                            <span title="登録価格" class="badge bg-light-secondary">¥ ${row.r_price} </span>`
                        );
                    }
                }
            },
            {
                data: null,
                name: 'quantity',
                render: function(data, type, row) {
                    if (row.quantity == 0) {
                        return (
                            `<div style="text-align: center;">
                                <span class="badge bg-warning">在庫切れ</span>
                            </div>`
                        )
                    } else {
                        return (
                            `<div style="text-align: center;">
                                <span class="badge bg-light-info">${row.quantity}個</span>
                            </div>`
                        )
                    }
                }
            },
        ]
    });

    $('#remove_products').on('click', function() {
        console.log('remove products');
        var checkedCheckboxes = $('input[type=checkbox]:checked');
        var ids = [];
        checkedCheckboxes.each(function() {
            ids.push($(this).data('id'));
        });
        
        $.ajax({
            url: "{{ route('amazon.destroy') }}",
            type: "post",
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            data: {
                ids: ids,
            },
            beforeSend: function() {
                return window.confirm('選択されている商品を本当に削除しますか。');
            },
            success: function(res) {
                console.log(res);
                Toastify({
                    text: "選択された商品を正常に削除しました。",
                    duration: 5000,
                    close: true,
                    gravity: "top",
                    position: "right",
                    backgroundColor: "#4fbe87",
                }).showToast();
                $('.datatable').DataTable().ajax.reload();
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

    $('#exhibit_products').on('click', function() {
        console.log('exhibit products');
        $.ajax({
            url: "{{ env('NODE_URL') }}api/v1/qoo/exhibit",
            type: "post",
            data: {
                userId: '{{ Auth::id() }}',
            },
            success: function(res) {
                console.log(res);
                Toastify({
                    text: "Qoo10に商品を出品します。\n【Qoo10商品確認】ページで\n商品を確認してください。",
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
</script>
@endpush