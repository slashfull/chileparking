<?php

use Illuminate\Database\Seeder;

class CitiesTableSeeder extends Seeder
{
    protected $cities = [
        'Arica',
        'Iquique'
    ];

    public function run()
    {
        foreach($this->cities as $city){
            DB::table('cities')->insert([
                'name'          =>  $city,
                'country_id'    =>  1,
                'created_at'    =>  date('Y-m-d H:i:s'),
                'updated_at'    =>  date('Y-m-d H:i:s'),
            ]);
        }
    }
}
