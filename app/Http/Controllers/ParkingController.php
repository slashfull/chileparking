<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Parking;

class ParkingController extends Controller
{
    public function crear(){
        return view('parking.crear');
    }

    public function add(Request $request){
        $validateForm = Validate($request->input(), [
            "name" => "required|String|min:5|max:30",
            "address" => "required|String|min:5|max:50",
            "latitude" => "required|String|min:7|max:10",
            "longitude" => "required|String|min:7|max:10",
            "idCity" => "required|Integer|min:1",
            "horaryStart" => "required|String|min:6|max:6",
            "horaryEnd" => "required|String|min:6|max:6",
            "rate" => "required|Integer|min:1000|max:5000",
            "capacity" => "required|Integer|min:5|max:150"
        ]);
        $parking = new Parking();
    }

}
