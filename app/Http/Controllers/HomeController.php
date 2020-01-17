<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        // $this->middleware('auth');
    }

    public function index()
    {
        return view('home');
    }

    // Vistas principales - empresariales
    public function welcome()
    {
        return view('welcome');
    }
    public function aboutus()
    {
        return view('aboutus');
    }
    public function contact()
    {
        return view('contact');
    }
}
