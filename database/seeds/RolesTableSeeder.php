<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class RolesTableSeeder extends Seeder
{
    protected $roles = [
        'Administrador',
        'Operador',
        'Normal'
    ];

    public function run()
    {
        foreach($this->roles as $rol){
            DB::table('roles')->insert([
                'name'          =>  $rol,
                'created_at'    =>  date('Y-m-d H:i:s'),
                'updated_at'    =>  date('Y-m-d H:i:s'),
            ]);
        }
    }
}
