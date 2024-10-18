<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
// use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Model;

class QooProduct extends Model
{
    use HasFactory;
    // use SoftDeletes;

    protected $fillable = [
        'id',
        'user_id',
        'gd_no',
        'title',
        'url',
        'img_url_main',
        'img_url_thumb',
        'category',
        'price',
        'quantity',
        'shipping',
        'description',
        'color',
        'size',
        'weight',
        'material',
        'origin',
        'exhibit',
        'reason',
        'seller_code',
    ];
    
    public function user()
    {
        return $this->belongsTo(
            User::class,
            'user_id'
        );
    }
}
