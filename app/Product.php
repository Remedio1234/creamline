<?php

namespace App;

use App\Stock;
use App\ProductImage;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $fillable = [
        'name', 'description', 'product_image'
    ];

    public function stock()
    {
    	return $this->hasOne(Stock::class);
    }

    public function images()
    {
        return $this->hasMany(ProductImage::class);
    }

    public function getProduct(){
        return Product::join('stocks', ['stocks.product_id' => 'products.id'])
                    ->selectRaw('products.*,stocks.quantity, stocks.threshold')
                        ->where('is_deleted', '!=', 1)
                            ->latest()
                                ->get();
    }
}
