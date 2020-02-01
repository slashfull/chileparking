<?php

use Illuminate\Database\Seeder;

class StateReservesTableSeeder extends Seeder
{
    protected $state_reserves = [
        'Activo',
        'Finalizada',
        'Petición',
    ];
    public function run()
    {
        foreach($this->state_reserves as $state){
            DB::table('state_reserves')->insert([
                'name'          =>  $state,
                'created_at'    =>  date('Y-m-d H:i:s'),
                'updated_at'    =>  date('Y-m-d H:i:s'),
            ]);
        }
    }
}
