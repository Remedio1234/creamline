@extends('layouts.app')

@section('content')
<div class="container">
    <div class="container-fluid">
        <div class="row">
            <h4 class="center">Orders Report</h4>
        </div>
        <div class="row">
            <div class="col-md-6" style="padding:0px;">
                <select class="form-control float-left" id="filter_status" style="width: 300px;">
                    <option value="all">ALL</option>
                    <option value="pending">PENDING</option>
                    <option value="for_delivery">FOR DELIVERY</option>
                    <option value="undelivered">UNDELIVERED</option>
                    <option value="replacement">REPLACEMENT</option>
                    <option value="completed">COMPLETED</option>
                </select>
            </div>
            <div class="col-md-6" style="padding:0px;">
                <button class="btn btn-success ml-auto float-right">Print</button>
            </div>
        </div>
    </div>
    <br>
    <br>
    <table style="width: 100%" border="1" id="order_list_html" cellpadding="10">
        <thead>
            <tr>
                <th>INVOICE NO.</th>
                <th>CLIENT NAME</th>
                <th>EMAIL</th>
                <th>CONTACT NO.</th>
                <th>STORE NAME</th>
                <th>TOTAL</th>
                <th>DATE ORDERED</th>
                <th>DELIVERY DATE</th>
                {{-- <th>Status</th> --}}
            </tr>
        </thead>
        <tbody>
            {{-- <tr>
                <td>1</td>
                <td>1</td>
                <td>1</td>
                <td>1</td>
                <td>1</td>
                <td>1</td>
                <td>1</td>
                <td>1</td>
                <td>1</td>
            </tr>
            <tr>
                <th colspan="9" style="text-align:center;">
                    ITEMS
                </th>
            </tr>
            <tr>
                <th colspan="9">
                    <table style="width: 100%;border:0px;" border="1" cellpadding="5">
                        <tr>
                            <th>ID</th>
                            <th>PRODUCT</th>
                            <th>SIZE</th>
                            <th>QUANTITY</th>
                            <th>SUBTOTAL</th>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>2</td>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                        </tr>
                    </table>
                </th>
            </tr> --}}
        </tbody>
    </table>
</div>

<script type="text/javascript">
    $(function () {
        //ajax setup
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        order_reports($("#filter_status").val())

        // $(document).on('change')

        function order_reports(filter_status){
            $.getJSON( "{{ url('order/reports/json') }}" + '/'+ filter_status, function( data ) {
                
                var htmlData = ''
                $.each(data, function( index, row ) {
                    htmlData += `<tr>
                        <td>${row.invoice_no}</td>
                        <td>${row.fullname}</td>
                        <td>${row.email}</td>
                        <td>${row.contact_num}</td>
                        <td>${row.store_name}</td>
                        <td>${parseFloat(row.total_price).toFixed(2)}</td>
                        <td>${row.date_ordered}</td>
                        <td>${row.delivery_date}</td>
                        </tr>`
                    htmlData += `<tr>
                            <th colspan="9" style="text-align:left;">
                                ITEMS
                            </th>
                        </tr>`   
                    htmlData +=`<tr>
                        <td colspan="9">
                            <table style="width: 100%;border:0px;" border="1" cellpadding="3">
                                <tr>
                                    <th>Id</th>
                                    <th>Product</th>
                                    <th>Size</th>
                                    <th>Qty</th>
                                    <th style="text-align:right;">Sub Total</th>
                                </tr>` 
                    $.each(row.items, function( x, y ) {
                        htmlData += `
                                    <tr>
                                        <td>${y.id}</td>
                                        <td>${y.product_name}</td>
                                        <td>${y.size}</td>
                                        <td>${y.quantity_ordered}</td>
                                        <td style="text-align:right;">${y.ordered_total_price}</td>
                                    </tr>
                                `
                    }); 
                    htmlData += `</table>
                            </td>
                        </tr>` 
                });
               $("#order_list_html").find('tbody').html("").append(htmlData) 
            });
        }
    });
</script>
@endsection
