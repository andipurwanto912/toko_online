<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Category extends Model
{
    //relasi ke book
    use SoftDeletes;

    public function books(){
        return $this->belongsToMany('App\Book');
        }
}
