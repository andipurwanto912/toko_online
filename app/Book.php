<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Book extends Model
{
    use SoftDeletes;
    //relaso ke categories
    public function categories(){
        return $this->belongsToMany('App\Category');
        }
}
