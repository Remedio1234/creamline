<?php

namespace App\Http\Controllers;

use App\Notification;
use App\{Area, User};
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use DataTables;
use App\SystemNotification;

class NotificationController extends Controller
{
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
        if(Auth::user()->user_role == 99){
            $notification = SystemNotification::where('email_to', 'admin')->orderBy('id', 'desc')->get();
            return response()->json($notification);
        } 
        else if(Auth::user()->user_role == 2){#client notifications
            $user = User::find(@Auth::user()->id);
            $notification = SystemNotification::where('user_id', $user->id)->where('email_to', 'client')->orderBy('id', 'desc')->get();
            return response()->json($notification);
        } 
        else { //staff notifications
            $user = User::find(@Auth::user()->id);
            $notification = SystemNotification::where('area_id', $user->area_id)->where('email_to', 'staff')->orderBy('id', 'desc')->get();
            return response()->json($notification);
        }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // Notification::updateOrCreate([
        //     'id' => $request->notification_id
        // ],[
        //     'notification_name' => $request->notification_name,
        //     'notification_code' => $request->notification_code
        // ]);

        // // return response
        // $response = [
        //     'success' => true,
        //     'message' => 'Notification saved successfully.',
        // ];
        // return response()->json($response, 200);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Notification  $notification
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        // $notification = Notification::find($id);
        // return response()->json($notification);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Notification  $notification
     * @return \Illuminate\Http\Response
     */
    public function destroy(Notification $notification)
    {
        // $output = '';

        // // $notification->delete();
        // if($notification->is_deleted == 0){
        //     Notification::where('id', $notification->id)->update(["is_deleted" => 1]);
        //     $output = 'Successfully Deactivated!';
        // }else{
        //     Notification::where('id', $notification->id)->update(["is_deleted" => 0]);
        //     $output = 'Successfully Activated!';
        // }

        // // return response
        // $response = [
        //     'success', true,
        //     'message' => $output,
        // ];
        // return response()->json($response, 200);
    }
}
