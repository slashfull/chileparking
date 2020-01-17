<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        // Table Roles
        Schema::create('roles', function (Blueprint $table2) {
            $table2->increments('id');
            $table2->string('name');
            $table2->timestamps();
        });
        // Table Personas
        Schema::create('persons', function (Blueprint $table1) {
            $table1->increments('id');
            $table1->string('name');
            $table1->string('lastname');
            $table1->string('email')->unique();
            $table1->string('phone');
            $table1->timestamps();
        });
        // Tabla Usuario
        Schema::create('users', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name');
            $table->string('role');
            $table->string('email')->unique();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password');
            $table->rememberToken();
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
        Schema::dropIfExists('roles');
        Schema::dropIfExists('persons');
        Schema::dropIfExists('users');
    }
}
