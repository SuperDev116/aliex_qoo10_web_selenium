<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
// use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Model;

class AliProduct extends Model
{
    use HasFactory;
    // use SoftDeletes;
    
    protected $table = 'ali_products';

    protected $fillable = [
        'user_id',
        'title',
        'url',
        'shipping',
        'quantity',
        'img_url_main',
        'img_url_thumb',
        'r_price',
        'price',
        'category',
        'description',
        'color',
        'size',
        'weight',
        'material',
        'origin',
        'exhibit',
        'reason',
    ];

    public function user()
    {
        return $this->belongsTo(
            User::class,
            'user_id'
        );
    }
}
