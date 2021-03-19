<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Auth;
use App\Order;
use Illuminate\Support\Facades\DB;
class ReportsController extends Controller
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
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        return view('reports.report_orders');
    }

    public function getOrders(){
        $response = DB::table('order_invoice')
                ->join('orders', 'orders.invoice_id', '=', 'order_invoice.id')
                ->join('users', 'orders.client_id', '=', 'users.id')
                ->join('stores', 'stores.id', '=', 'orders.store_id')
                ->selectRaw("order_invoice.id, order_invoice.created_at as date_ordered,orders.delivery_date, 
                    order_invoice.invoice_no, 
                    SUM(orders.ordered_total_price) as total_price, CONCAT(users.fname, ' ', users.lname) as fullname, 
                    users.email, 
                    users.contact_num,
                    stores.store_name
                ")
                ->groupBy('orders.invoice_id')
                ->get()
                ->map(function($item){
                    $item->items = Order::join('products', ['products.id' => 'orders.product_id'])
                                ->selectRaw('orders.*, products.name as product_name')
                                    ->where('orders.invoice_id', $item->id)->get();
                    return $item;
                });

        return response()->json($response, 200);        
    }
}
