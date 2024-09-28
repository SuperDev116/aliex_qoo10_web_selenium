<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSettingsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('settings', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained()->onDelete('cascade'); // Foreign key to users table
            $table->string('amazon_email')->nullable();
            $table->string('amazon_password')->nullable();
            $table->string('qsm_email')->nullable();
            $table->string('qsm_password')->nullable();
            $table->string('qsm_apikey')->nullable();
            $table->decimal('multiplier', 10, 2)->nullable(); // Adjust precision as needed
            $table->string('qoo_maincategory')->nullable();
            $table->string('qoo_subcategory')->nullable();
            $table->string('qoo_smallcategory')->nullable();
            $table->text('exhi_asins')->nullable(); // Use text if ASINs can be long
            $table->text('ng_asins')->nullable();
            $table->text('ng_words')->nullable();
            $table->string('alert_email')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('settings');
    }
}
