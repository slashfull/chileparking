<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $this->truncateTables([
            'roles',
            'key_questions',
            'subjects',
            'countries',
            'cities',
            'state_spaces',
            'state_reserves',
        ]);

        $this->call(RolesTableSeeder::class);
        $this->call(KeyQuestionsTableSeeder::class);
        $this->call(SubjectsTableSeeder::class);
        $this->call(CountriesTableSeeder::class);
        $this->call(CitiesTableSeeder::class);
        $this->call(StateSpacesTableSeeder::class);
        $this->call(StateReservesTableSeeder::class);
    }

    public function truncateTables(array $tables){
        DB::statement('SET FOREIGN_KEY_CHECKS = 0;');
        foreach ($tables as $table) {
            DB::table($table)->truncate();
        }
        DB::statement('SET FOREIGN_KEY_CHECKS = 1;');
    }
}
