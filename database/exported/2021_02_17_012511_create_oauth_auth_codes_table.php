<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOauthAuthCodesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('oauth_auth_codes', function(Blueprint $table)
		{
			$table->string('id', 100)->primary();
			$table->integer('user_id');
			$table->integer('client_id')->unsigned();
			$table->text('scopes')->nullable();
			$table->boolean('revoked');
			$table->dateTime('expires_at')->nullable();
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('oauth_auth_codes');
	}

}
