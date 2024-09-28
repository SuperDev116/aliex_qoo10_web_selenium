<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Fortify\TwoFactorAuthenticatable;
use Laravel\Jetstream\HasProfilePhoto;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasFactory;
    use Notifiable;
    use HasApiTokens;

    /**
     * The attributes that are mass assignable.
     *
     * @var string[]
     */
    protected $fillable = [
        'email',
        '_token',
        'email_verified_at',
        'password',
        'tool_id',
        'tool_pass',
        'role',
        'full_name',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array
     */
    protected $hidden = [
        'password',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array
     */
    protected $casts = [];

    /**
     * The accessors to append to the model's array form.
     *
     * @var array
     */
    protected $appends = [];

    public function amazon_products()
    {
        return $this->hasMany(
            AmazonProduct::class,
            'user_id'
        );
    }
    
    public function qoo_products()
    {
        return $this->hasMany(
            QooProduct::class,
            'user_id'
        );
    }
    
    public function setting()
    {
        return $this->hasOne(
            Setting::class,
            'user_id'
        );
    }
}
