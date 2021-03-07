<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class UserFridge extends Model
{
    protected $table        = "user_fidges";
    protected $primaryKey   = 'id';
    protected $guarded      = ['id'];
}
