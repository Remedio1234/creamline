@inject('stores','App\Store')
@extends('layouts.app')

@section('content')
<div class="container">
    <div class="container-fluid">
        <div class="row">
            <h4 class="center">Manage Client ({{ auth()->user()->area->area_name }} Branch) </h4>
        </div>
    </div>
    <br>
    <table id="dataTable" style="width: 100%" class="table table-striped table-bordered">
        <thead class="bg-indigo-1 text-white">
        <tr>
            <th>Client ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Email</th>
            <th>Contact</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
</div>

{{-- create/update client modal--}}
<div class="modal fade" id="ajaxModel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="modelHeading"></h4>
            </div>
            <div class="modal-body">
                <form id="clientForm" name="clientForm" class="form-horizontal">
                    <div class="row">
                        <div class="col-md-12">
                            <input type="hidden" name="client_id" id="client_id">
                            <input type="hidden" name="action" id="action">
                            <div class="form-group">
                                <label for="fname" class="col-sm-12 control-label">First Name</label>
                                <div class="col-sm-12">
                                    <input type="text" class="form-control" id="fname" name="fname" placeholder="Enter First Name"
                                           value="" maxlength="50" required="" autocomplete="off" onkeypress="return onlyLetters(event)">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="mname" class="col-sm-12 control-label">Middle Name</label>
                                <div class="col-sm-12">
                                    <input type="text" class="form-control" id="mname" name="mname" placeholder="Enter Middle Name"
                                           value="" maxlength="50" required="" autocomplete="off" onkeypress="return onlyLetters(event)">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="lname" class="col-sm-12 control-label">Last Name</label>
                                <div class="col-sm-12">
                                    <input type="text" class="form-control" id="lname" name="lname" placeholder="Enter Last Name"
                                           value="" maxlength="50" required="" autocomplete="off" onkeypress="return onlyLetters(event)">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-12 control-label" for="email">Email</label>
                                <div class="col-sm-12">
                                    <input type="email" class="form-control" id="email" name="email"
                                           placeholder="Enter Email"
                                           value="" maxlength="50" required="" autocomplete="off">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="contact_num" class="col-sm-12 control-label">Contact Number</label>
                                <div class="col-sm-12">
                                    <input type="number" class="form-control" id="contact_num" name="contact_num" placeholder="Enter Contact"
                                           value="" required="" autocomplete="off" onkeypress="return onlyNumbers(event)">
                                </div>
                            </div>
                            <div class="form-group" id="div_password">
                                <label class="col-sm-12 control-label" for="password">Generated Password</label>
                                <div class="col-sm-12">
                                    <input type="text" class="form-control" id="password" name="password"
                                           placeholder="Enter Password"
                                           value="" maxlength="50" required="" autocomplete="off">
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-sm-offset-12 col-sm-10">
                        <button type="submit" class="btn btn-primary" id="saveBtn">Save</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

{{-- update store list modal--}}
<div class="modal fade" id="storeListModal" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Store List</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="frmPendingOrder" name="frmPendingOrder" class="form-horizontal">
                    <table class="table table-stripped" id="store_list_html">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Address</th>
                                <th>Date Created</th>
                                <th>Fridges</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">

    $(function () {

        //ajax setup
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        // datatable
        var table = $('#dataTable').DataTable({
            processing: true,
            serverSide: true,
            ajax: "{{ url('client_list') }}",
            columns: [
                // {data: 'DT_RowIndex', name: 'DT_RowIndex'},
                {data: 'id', name: 'id'},
                {data: 'fname', name: 'fname'},
                {data: 'lname', name: 'lname'},
                {data: 'email', name: 'email'},
                {data: 'contact_num', name: 'contact_num'},
                {data: 'action', name: 'action', orderable: false, searchable: false},
            ]
        });

        function fridgesRaw(fridges){
            if(fridges.length == 0){
                return 'No fridge available.'
            } else {
                var htmlData = ''
                $.each(fridges, function( x, row ) {
                    htmlData += `<div class="card mt-2">
                        <div class="card-body" style="padding: 2px;">
                            <p class="card-text">
                                <strong>Fridge Model:</strong> ${row.model} 
                                <br> 
                                <strong>Description:</strong> ${row.description} </p>
                                <select name='fridge_status' id='fridge_status_${row.id}'>
                                    <option value='3' ${row.status == 3 ? 'selected' : ''}>Pull-Out</option>
                                    <option value='4' ${row.status == 4 ? 'selected' : ''}>Deployed</option>
                                </select>
                                <button type='button' data-id='${row.id}' id='confirm_fridge' class='btn btn-primary' style='padding: 2px;'>Confirm</button>
                        </div>
                    </div>`
                }); 
            }
            
            return htmlData;
        }

        $(document).on('click', '.viewStore', function(e){
            e.preventDefault();
            var user_id = $(this).data('id')
            $.getJSON( "/client/"+user_id+"/stores/json", function( data ) {
                var htmlData = ''
                $.each(data, function( index, row ) {
                    htmlData += `<tr>
                        <td>${row.id}</td>
                        <td>${row.store_name}</td>
                        <td>${row.store_address}</td>
                        <td>${moment(row.created_at).format('MMMM D YYYY')}</td>
                        <td>${fridgesRaw(row.fridges)}</td></tr>`
                });
               $("#store_list_html").find('tbody').html("").append(htmlData) 
               $('#storeListModal').modal('show');
            });
        })

        $(document).on('click', '#confirm_fridge', function(e){
            e.preventDefault()
            var id = $(this).data('id')
            var status = $('#fridge_status_'+id).val()
            $.get( "/fridge/edit/history/"+status+'/'+id+'/'+'setB', function( data ) {
                swal('Status has been changed.', {
                                icon: "success",
                            });
            });
        })
    });
</script>
@endsection
