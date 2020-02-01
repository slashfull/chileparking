<?php

use Illuminate\Database\Seeder;

class SubjectsTableSeeder extends Seeder
{
    protected $subjects = [
        'Informativo',
        'Reclamo'
    ];

    public function run()
    {
        foreach($this->subjects as $subject){
            DB::table('subjects')->insert([
                'name'          =>  $subject,
                'created_at'    =>  date('Y-m-d H:i:s'),
                'updated_at'    =>  date('Y-m-d H:i:s'),
            ]);
        }
    }
}
