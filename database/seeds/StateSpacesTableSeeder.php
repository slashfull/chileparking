<?php

use Illuminate\Database\Seeder;

class StateSpacesTableSeeder extends Seeder
{
    protected $state_spaces = [
        'Libre',
        'Ocupado'
    ];
    public function run()
    {
        foreach($this->state_spaces as $state){
            DB::table('state_spaces')->insert([
                'name'          =>  $state,
                'created_at'    =>  date('Y-m-d H:i:s'),
                'updated_at'    =>  date('Y-m-d H:i:s'),
            ]);
        }
    }
}
