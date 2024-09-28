<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use ZipArchive;

class DownloadController extends Controller
{
    public function download_zip()
    {
        // Step 1: Create the account.ini file
        $ini_content = Auth::id();
        $ini_filepath = public_path('account.ini');

        file_put_contents($ini_filepath, $ini_content);
        
        // Step 2: Create a Zip file
        $timestamp = date('Ymd');
        $zip_filename = "amazon_tool_{$timestamp}.zip";
        $zip_filepath = public_path($zip_filename);

        $zip = new ZipArchive;

        if ($zip->open($zip_filepath, ZipArchive::CREATE | ZipArchive::OVERWRITE) === TRUE)
        {
            $exe_filePath = public_path('amazon_tool.exe');
            $zip->addFile($exe_filePath, 'amazon_tool.exe');
            $zip->addFile($ini_filepath, 'account.ini');
            $zip->close();
        }
        else
        {
            return response()->json(['message' => 'Failed to create ZIP file'], 500);
        }

        // Step 3: Download the ZIP file
        return response()->download($zip_filepath)->deleteFileAfterSend(true);
    }
}
