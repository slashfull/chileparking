<?php

use Illuminate\Database\Seeder;

class CountriesTableSeeder extends Seeder
{
    protected $countries = [
        'Chile',
    ];

    public function run()
    {
        foreach($this->countries as $country){
            DB::table('countries')->insert([
                'name'          =>  $country,
                'created_at'    =>  date('Y-m-d H:i:s'),
                'updated_at'    =>  date('Y-m-d H:i:s'),
            ]);
        }
    }
}
