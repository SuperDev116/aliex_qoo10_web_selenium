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
		'amazon_email',
		'amazon_password',
		'qsm_email',
		'qsm_password',
		'qsm_apikey',
		'multiplier',
		'qoo_maincategory',
		'qoo_subcategory',
		'qoo_smallcategory',
		'exhi_asins',
		'ng_asins',
		'ng_words',
		'alert_email',
	];

	public function user() {
		return $this->belongsTo(
			User::class,
			'user_id'
		);
	}
}
