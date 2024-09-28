<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateQooProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('qoo_products', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained()->onDelete('cascade');
            $table->string('gd_no')->unique();
            $table->text('title')->nullable();
            $table->string('url')->nullable();
            $table->text('img_url_main')->nullable();
            $table->text('img_url_thumb')->nullable();
            $table->string('category')->nullable();
            $table->integer('price')->nullable()->default(0);
            $table->integer('quantity')->unsigned()->nullable()->default(0);
            $table->string('shipping')->nullable();
            $table->text('description')->nullable();
            $table->string('color')->nullable();
            $table->string('size')->nullable();
            $table->string('weight')->nullable();
            $table->string('material')->nullable();
            $table->string('origin')->nullable();
            $table->string('exhibit')->nullable();
            $table->string('reason')->nullable();
            $table->string('seller_code')->nullable();
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('qoo_products');
    }
}
