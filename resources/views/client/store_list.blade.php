@inject('areas','App\Area')
@extends('layouts.app')

@section('content')
<div class="container">
    <div class="container-fluid">
        <div class="row">
            <h4 class="center">{{ $client->fname . " ". $client->lname  }}</h4>
            <button class="btn btn-info ml-auto" id="addNewstore">Create Store</button>
        </div>
    </div>
    <br>
    <table id="dataTable" class="table table-striped table-bordered">
        <thead class="bg-indigo-1 text-white">
        <tr>
            <th>Store ID</th>
            <th>Name</th>
            <th>Address</th>
            <th>Area</th>
            <th>Status</th>
            <th width="280px">Action</th>
        </tr>   
        </thead>
        <tbody>
        </tbody>
    </table>
</div>

{{-- create/update client modal--}}
<div class="modal fade" id="formModal" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="modelHeading"></h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="storeForm" name="storeForm" class="form-horizontal">
                    <div class="row">
                        <div class="col-md-12">
                            <input type="hidden" name="id" id="id">
                            <input type="hidden" name="user_id" id="user_id" value="{{ $client->id }}">
                            <div class="form-group">
                                <label for="name" class="col-sm-12 control-label">Store Name</label>
                                <div class="col-sm-12">
                                    <input type="text" class="form-control" id="store_name" name="store_name" placeholder="Enter Store Name"
                                           value="" maxlength="50" required="" autocomplete="off" onkeypress="return onlyLetters(event)">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="address" class="col-sm-12 control-label">Store Address</label>
                                <div class="col-sm-12">
                                    <input type="text" class="form-control" id="store_address" name="store_address" placeholder="Enter Address"
                                           value="" maxlength="50" required="" autocomplete="off" onkeypress="return onlyLetters(event)">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="lname" class="col-sm-12 control-label">Area</label>
                                <div class="col-sm-12">
                                    <select  class="form-control" id="area_id" name="area_id" required>
                                        <option value='' selected>Please Select Area</option>
                                        @foreach(\App\Area::all() as $area )
                                            <option value="{{$area->id}}">{{ $area->area_name.": ".$area->area_code }}</option>
                                        @endforeach
                                    </select>
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

</body>
<script type="text/javascript">

    $(document).ready(function(){
        //ajax setup
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
        const id = {!! $client->id !!};
        // datatable
        var table = $('#dataTable').DataTable({
            processing: true,
            serverSide: true,
            ajax: `/client/${id}/stores`,
            columns: [
                // {data: 'DT_RowIndex', name: 'DT_RowIndex'},
                {data: 'id', name: 'id'},
                {data: 'store_name', name: 'store_name'},
                {data: 'store_address', name: 'store_address'},
                {data: 'area', name: 'area'},
                {
                    data: 'is_deleted', name: 'is_deleted',
                    "render": function (data, type, full, meta) {
                        var output = '';
                        if(!full.is_deleted){
                            output = '<span class="text-success font-weight-bold">Active</span>';
                        }else{
                            output = '<span class="text-danger font-weight-bold"">In-Active</span>';
                        }

                        return output;
                    },
                },
                {data: 'action', name: 'action', orderable: false, searchable: false},
            ]
        });

        // deacttivate store
         $('body').on('click', '.deactivate', function () {
            var store_id = $(this).data("id");

            var swal_text = 'Are you sure you want to deactivate the store?';

            swal({
                title: "Are you sure?",
                text: swal_text,
                icon: "warning",
                buttons: true,
                dangerMode: true,
            })

            .then((isTrue) => {
                if (isTrue) {
                    $.ajax({
                        type: "DELETE",
                        url: "{{ url('store') }}" + '/' + store_id,
                        success: function (data) {
                            table.draw();
                            swal(data.message, {
                                icon: "success",
                            });
                        },
                        error: function (data) {
                            console.log('Error:', data);
                        }
                    });
                }
            });
        });

        // deacttivate store
        $('body').on('click', '.activate', function () {
            var store_id = $(this).data("id");

            var swal_text = 'Are you sure you want to activate the store?';

            swal({
                title: "Are you sure?",
                text: swal_text,
                icon: "warning",
                buttons: true,
                dangerMode: true,
            })

            .then((isTrue) => {
                if (isTrue) {
                    $.ajax({
                        type: "DELETE",
                        url: "{{ url('store') }}" + '/' + store_id,
                        success: function (data) {
                            table.draw();
                            swal(data.message, {
                                icon: "success",
                            });
                        },
                        error: function (data) {
                            console.log('Error:', data);
                        }
                    });
                }
            });
        });

        $('#addNewstore').on('click', () => {
            $("#id").val('')
            $("#storeForm").trigger("reset")
            $('#saveBtn').text("Save")
            $('#modelHeading').text('Create Store')
            $('#formModal').modal('show')
        });  
        
        $(document).on('click', ".editStore", function(e){
            e.preventDefault();
            var id = $(this).data('id');
            $.get("{{ url('client/stores/edit') }}" + '/' + id, function (data) {
                $('#saveBtn').text("Update")
                $("#id").val(data.id)
                $('#user_id').val(data.user_id);
                $('#store_name').val(data.store_name);
                $('#store_address').val(data.store_address);
                $('#area_id').val(data.area_id);
                $('#modelHeading').text('Edit Store')
                $('#formModal').modal('show')
            })
        })
        
        $(document).on('submit', '#storeForm', function(e){
            e.preventDefault();
            $.ajax({
                    data: $(this).serialize(),
                    url: "{{ url('client/stores/add') }}",
                    type: "POST",
                    dataType: 'json',
                    success: function (data) {
                        $('#storeForm').trigger("reset");
                        $('#formModal').modal('hide');
                        table.draw();
                    },
                    error: function (data) {
                        console.log('Error:', data);
                        $('#saveBtn').html('Save');
                    }
                });
            return
        })
    });
</script>
@endsection
