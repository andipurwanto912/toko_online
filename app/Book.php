<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Book extends Model
{
    //relaso ke categories
    public function categories(){
        return $this->belongsToMany('App\Category');
        }
}
