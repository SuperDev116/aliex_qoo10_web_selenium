<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Setting extends Model
{
    use HasFactory;

    protected $table = 'settings';
	
	protected $fillable = [
		'user_id',
		'ali_email',
		'ali_password',
		'qsm_email',
		'qsm_password',
		'qsm_apikey',
		'multiplier',
		'ali_maincategory',
		'ali_subcategory',
		'ali_smallcategory',
		'qoo_maincategory',
		'qoo_subcategory',
		'qoo_smallcategory',
		'ng_words',
		'remove_words',
		'alert_email',
	];

	public function user() {
		return $this->belongsTo(
			User::class,
			'user_id'
		);
	}
}
