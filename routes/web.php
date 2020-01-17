<?php

Route::get('/', 'HomeController@welcome')->name('index');
Route::get('/nosotros', 'HomeController@aboutus')->name('aboutus');
Route::get('/contacto', 'HomeController@contact')->name('contact');

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
