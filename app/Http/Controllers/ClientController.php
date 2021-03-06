<?php

namespace App\Http\Controllers;

use App\User;
use App\Store;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use DataTables;
use App\Helpers\Mail\SenderHelper as MailDispatch;
use App\Traits\GlobalFunction;

class ClientController extends Controller
{
    use GlobalFunction;
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }
    
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        

        if($request->filter_status != 'all'){
            if($request->filter_status == 1){
                $where = ['is_active' => $request->filter_status, 'is_pending' => 0];
            } else if($request->filter_status == 0){
                $where = ['is_active' => $request->filter_status, 'is_pending' => 0];
            } else {
                $where = ['is_active' => 0, 'is_pending' => 1];
            }
            $client = User::latest()->where($where)->where('user_role', "2")->get();
        } else {
            $client = User::latest()->where('user_role', "2")->get();
        }

        // echo "<pre>";
        // var_dump($client);
        // echo "</pre>";

        if ($request->ajax()) {
            return Datatables::of($client)
                ->addIndexColumn()
                ->addColumn('action', function ($row) {

                    $status = '';
                    $delete_status = '';
                    $delete_btn = '';

                    if($row->is_active == 0){
                        $status = 1;
                        $delete_status = 'Activate';
                        $delete_btn = 'btn-success';
                    }else{
                        $status = 0;
                        $delete_status = 'Deactivate';
                        $delete_btn = 'btn-danger';
                    }

                    // if($row->is_pending == 1){
                    //     $status = 2;
                    //     $delete_status = 'Pending';
                    //     $delete_btn = 'btn-outline-info';
                    // }
   
                    $btn = '<a href="javascript:void(0)"  data-id="'.$row->id.'" data-original-title="Edit" class="edit btn btn-primary btn-sm editClient">Edit</a>';

                    if($row->is_pending == 0){
                        $btn .= ' <a href="javascript:void(0)" data-stat="'.$status.'" data-toggle="tooltip" data-id="'.$row->id.'" data-original-title="Delete" class="btn '.$delete_btn.' btn-sm deleteClient">'.$delete_status.'</a>';
                        $btn .=' <a href="/client/'.$row->id.'/stores" class="btn btn-warning btn-sm">'.'Store'.'</a>';
                        $btn .=' <a href="javascript:void(0)"  class="btn btn-info btn-sm">Profile</a>';
                    }
                    if($row->is_pending == 1){
                        $btn .= '<div class="dropdown">
                            <button class="dropbtn">Status</button>
                            <div class="dropdown-content">
                                <a href="javascript://;" data-id="'.$row->id.'" class="status_update" data-status="accept">Accept</a>
                                <a href="javascript://;" data-id="'.$row->id.'" class="status_update" data-status="decline">Decline</a>
                            </div>
                        </div>';
                    }

                    return $btn;
                })
                ->rawColumns(['action'])
                ->make(true);
        }

        return view('client/client', compact('client'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        if($request->action == 'assign_client'){

            Store::updateOrCreate([
                'user_id' => $request->assign_id,
            ],[
                'user_id' => $request->assign_id,
                'area_id' => $request->area_id,
                'store_name' => "",
                'store_address' => "",
            ]);

            // return response
            $response = [
                'success' => true,
                'message' => 'Successfully Assigned.',
            ];
            return response()->json($response, 200);

        }else if($request->action == 'update_client_profile'){
            User::updateOrCreate([
                'id' => $request->client_id
            ],[
                'fname' => $request->fname,
                'mname' => $request->mname,
                'lname' => $request->lname,
                'email' => $request->email,
                'contact_num' => $request->contact_num,
                'address' => "NA",
                'email_verified_at' => "2020-06-08 07:57:47",
                'img' => "NA",
                'remember_token' => "NA"
            ]);

            // return response
            $response = [
                'success' => true,
                'message' => 'Client successfully updated.',
            ];
            return response()->json($response, 200);
        }else{
            User::updateOrCreate([
                'id' => $request->client_id
            ],[
                'fname' => $request->fname,
                'mname' => $request->mname,
                'lname' => $request->lname,
                'email' => $request->email,
                'contact_num' => $request->contact_num,
                'user_role' => 2,   //2 for client
                'is_pending' => 1,   //0 means not pending
                'password' => Hash::make($request->password),
                'address' => "NA",
                'email_verified_at' => "2020-06-08 07:57:47",
                'img' => "NA",
                'remember_token' => "NA"
            ]);

            // return response
            $response = [
                'success' => true,
                'message' => 'Client successfully saved.',
            ];
            return response()->json($response, 200);
        }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\User  $client
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $client = User::find($id);
        return response()->json($client);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Client  $client
     * @return \Illuminate\Http\Response
     */
    public function createClientStore(Request  $request){
        Store::updateOrCreate([
            'id' => $request->id
        ],[
            'store_name'        => $request->store_name,
            'store_address'     => $request->store_address,
            'area_id'           => $request->area_id,
            'user_id'           => $request->user_id,
            'is_deleted'        => 0
        ]);

        // return response
        $response = [
            'success' => true,
            'message' => 'Client Store successfully submitted.',
        ];
        return response()->json($response, 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\User  $client
     * @return \Illuminate\Http\Response
     */
    public function destroy(User $client)
    {
        $output = '';

        // $client->delete();
        if($client->is_active == 0){
            User::where('id', $client->id)->update(["is_active" => 1]);
            $output = 'Successfully Activated!';
        }else{
            User::where('id', $client->id)->update(["is_active" => 0]);
            $output = 'Successfully Deactivated!';
        }

        if($client->is_pending == 1){
            //set text message
            $text_message = `Thank you for registering Creamline Products. You're account has been approved and you can now login to our official website. Enjoy!`;

            //send it to customer
            $this->global_itexmo($client->contact_num, $text_message." \n\n\n\n","ST-CREAM343228_LGZPB", '#5pcg2mpi]');
            
            User::where('id', $client->id)->update(["is_pending" => 0, "is_active" => 1]);
            $output = 'Successfully Approved!';
        }

        // return response
        $response = [
            'success', true,
            'message' => $output,
        ];
        return response()->json($response, 200);
    }


    /**
     * Update Status Accept/ Decline
     *
     * @param  \App\User  $client
     * @return \Illuminate\Http\Response
     */
    public function acceptDeclineUserStatus(Request $request)
    {
        $output = '';
        $user = User::find($request->client_id);     
        new MailDispatch('client_approval', trim($user->email), array(
            'subject'   => 'Creamline Registration Update',
            'title'     => 'Creamline Registration Update', 
            "status"    => $request->status,
            "name"      => trim($user->fname)
        ));
        
        if($request->status == 'accept'){
            User::where('id', $user->id)->update(["is_pending" => 0, "is_active" => 1]);

            $text_message = 'Hi, '. $user->fname . `
                \n\nWelcome to Creamline! We are glad
                to inform you that you are now one of
                our retailers. \n you can now login <a href="/login">here</a>.`;

            $output = 'Successfully Accepted!';
        } else {

            $text_message = 'Hi, '. $user->fname . `
                \n\n We are sorry to inform you that you
                did not passed the qualification as our
                retailer based on the documents you
                submitted. 
                \n Please contact your sales
                agent or the administration for more
                details. 
                \n 
                You can still register in our
                website once you finalized the
                requirements we needed.`;

            $output = 'Successfully Declined!';            
        }

        $this->global_itexmo($user->contact_num, $text_message." \n\n\n\n","ST-CREAM343228_LGZPB", '#5pcg2mpi]');
        
        if($request->status != 'accept')
            User::where('id', $user->id)->delete();
        
        return response()->json([
            'success', true,
            'message' => $output,
            'user'  => $user
        ], 200);
    }

    public function storeList($id, Request $request)
    {
        $client = User::find($id);


       if ($request->ajax()) {
            // $stores = $client->stores;

            $stores = Store::leftJoin('users', ['users.area_id' => 'stores.area_id'])
                            ->selectRaw("stores.*, CONCAT(users.fname, ' ', users.lname) as fullname")
                                ->where('stores.user_id', $id)
                                    ->get();

            return Datatables::of($stores)
                ->addIndexColumn()
                ->addColumn('area', function($row) {
                    return $row->area->area_name;
                })
                ->addColumn('action', function ($row) {
                    $status = '';
                    $delete_status = '';
                    $delete_btn = '';
                    $btn_label = '';
                    $title = '';

                    if($row->is_deleted == 0){
                        $status = 0;
                        $delete_status = 'Active';
                        $delete_btn = 'btn-danger';
                        $btn_label = 'Deactivate';
                        $btn_type = "deactivate";
                        $title = "Deactivate Store";
                    }else{
                        $status = 0;
                        $delete_status = 'Deactivate';
                        $delete_btn = 'btn-success';
                        $btn_label = 'Activate';
                        $btn_type = "activate";
                        $title = "Activate Store";
                    }
                    $btn = '<a href="javascript:void(0)" data-toggle="tooltip" data-placement="top" title="Edit Store" data-id="'.$row->id.'" data-original-title="Edit" class="edit btn btn-primary btn-sm editStore">Edit</a> ';
                    $btn .= '<a href="javascript:void(0)" data-toggle="tooltip" data-placement="top" title="'.$title.'" data-id="'.$row->id.'" data-original-title="Edit" class="edit btn '.$delete_btn.' btn-sm '.$btn_type.'">'. $btn_label .'</a>';
                    
                    // $store = User::where(['area_id' => $row->area_id])->first();
                    // $btn .=' <button type="button" data-toggle="tooltip" data-placement="top" '.(!$store ? 'disabled' : '').' title="Assigned Staff" data-toggle="tooltip" data-area="'.$row->area_id.'" data-id="'.($store ? $store->user_id : 0).'" data-original-title="Assigned Store" class="btn btn-success btn-sm viewStore">Assigned Staff</button>';
                    return $btn;
                })
                ->rawColumns(['action'])
                ->make(true);
        }

        return view("client/store_list", compact('client'));
    }


    public function storeListJson($id)
    {
        $client = User::find($id);

        return response()->json( $client->stores);
    }

    public function staffClientStore(Request $request)
    {
        $client = User::join('stores', ['users.id' => 'stores.user_id'])
                        ->selectRaw('stores.*')
                        ->where([
                            // 'stores.user_id' => $request->user_id,
                            'stores.area_id' => $request->area_id
                        ])
                        ->get();

        return response()->json( $client );
    }

    public function getClientStore(Request $request){
        $store = Store::find($request->id);
        return response()->json( $store );
    }

    public function getStaffList(Request $request){
        $staff = User::where(['area_id' => $request->area_id])->first();
        return response()->json( $staff);
    }
}
