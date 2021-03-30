<?php

namespace App\Http\Controllers;

use App\Notification;
use App\{Area, User};
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use DataTables;
use App\Helpers\Mail\SenderHelper as MailDispatch;
use App\SystemNotification;
use App\Traits\GlobalFunction;
class NotificationController extends Controller
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
        $users = User::where('is_pending','0')
                        ->where('is_active','1')
                            ->where('user_role',2)
                                ->where('expiry', '<=',  date("Y-m-d"))
                                    ->where('sent', 0)
                                        ->get();
        // return response()->json($users);
        foreach ($users as $key => $value) {
            //client reminder
            $this->notificationDispatch([
                'user_id'   => $value->id,
                'type'      => 'reminder_client',
                'area_id'   => $value->area_id,
                'email_to'  => 'client',
                'message'   => "Hi, " .$value->fname. ". <br> We’ve noticed you don’t have any transactions with us for 2 months. <br/> Please be reminded that you will be deactivated in 7 days if the situation is still the same.",
                'status'    => 'unread'
            ]);   
            //staff reminder
            $this->notificationDispatch([
                'user_id'   => $value->id,
                'type'      => 'reminder_staff',
                'area_id'   => $value->area_id,
                'email_to'  => 'staff',
                'message'   => "(" . $value->id . ") " . $value->fname. " ". $value->lname . " will be deactivated in 7 days if there is still no transaction made. Please follow up client. ",
                'status'    => 'unread'
            ]);   

            //set text message
            $text_message = "Hi, ". $value->fname . "\n \nWe’ve noticed you don’t have any transactions with us for 2 months. Please be reminded that you will be deactivated in 7 days if the situation is still the same. 
            \nBest regards,\nCharpling Square Enterprise \nCreamline Authorized Distributor";

            //send it to customer
            $this->global_itexmo($value->contact_num, $text_message, "ST-CREAM343228_F3PNT", '8)tg(84@$$');

            new MailDispatch('reminder', trim($value->email), array(
                'subject'   => 'Reminder of 2 months without ordering',
                'title'     => 'Reminder of 2 months without ordering', 
                "site"      => '',
                "name"      => trim($value->fname)
            ));

            User::whereId($value->id)->update(['sent' => 1]);
        }


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

        $users = User::where('is_pending','0')->where('is_active','1')->get();
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
