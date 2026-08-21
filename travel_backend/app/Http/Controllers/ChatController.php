<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ChatController extends Controller
{
    public function sendMessage(Request $request)
    {
        // This is the hardcoded reply for testing
        return response()->json([
            'reply' => "Success! Your backend is officially working."
        ]);
    }
}