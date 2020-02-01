<?php

use Illuminate\Database\Seeder;

class KeyQuestionsTableSeeder extends Seeder
{
    protected $key_questions = [
        '¿En qué ciudad naciste?',
        '¿Nombre tu primera mascota?',
        '¿Cuál fue tu primer apodo?'
    ];

    public function run()
    {
        foreach($this->key_questions as $question){
            DB::table('key_questions')->insert([
                'question'      =>  $question,
                'created_at'    =>  date('Y-m-d H:i:s'),
                'updated_at'    =>  date('Y-m-d H:i:s'),
            ]);
        }
    }
}
