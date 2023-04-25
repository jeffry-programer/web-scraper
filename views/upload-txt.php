<?php

include('../plugins/simple_html_dom.php');
include('../controllers/controller.php');
include('../models/model.php');

$routeFile = "C:/xampp/htdocs/web-scraper/files/";

uploadFile();

function uploadFile(){
    $file = $_FILES['files']['name'];
    $routeFile = $_FILES['files']['tmp_name'];
    $response = moveArchive($routeFile, $file);
    if($response == "exist"){
        echo "This file already exist!!";
    }else if($response != "error"){
        $finalyFile = $GLOBALS["routeFile"].$response;
        $controller = new ControllerProducts();
        $controller->readFile($finalyFile);
    }else{
        echo "Ups ha ocurrido un error";
    }
}

function moveArchive($routeFile, $file){
    if(!str_contains($file,'.sql')) return "archive-not-valid";
    $folder = $GLOBALS["routeFile"];
    $nameImg = $file;
    $file = $folder.$nameImg;
    if (!file_exists($folder)){
        mkdir($folder, 0777, true);
        if (file_exists($folder)){
            if (move_uploaded_file($routeFile, $file)){
                return $nameImg;
            }else{
                return "error";
            }
        }
    }else{
        if(file_exists($file)) return "exist";
        if (move_uploaded_file($routeFile, $file)){
            return $nameImg;
        }else{
            return "error";
        }
    }
}
