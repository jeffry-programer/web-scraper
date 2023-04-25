<?php

class ControllerProducts{

    public function readFile($routeFile){
        if (($gestor = fopen($routeFile, "r")) !== FALSE){
            while (($data = fgetcsv($gestor, 1000, ",")) !== FALSE){
                $numero = count($data);
                $rowSend = "";
                for ($c = 0; $c < $numero; $c++){
                    $rowSend = $rowSend. $data[$c];
                }
                if(str_contains($rowSend, "('") && str_contains($rowSend, "')")){
                    $controller = new ControllerProducts();
                    $prodSend = $controller->clearData($rowSend);
                    $nameWebSiteBussiness = 'https://tienda.makro.com.co/';
                    $controller->scrapProduct($prodSend, $nameWebSiteBussiness);
                }
            }
            fclose($gestor);
            unlink($routeFile);
        }
    }

    public function clearData($rowSend){
        $rowSend = str_replace("('", "", $rowSend);
        $rowSend = str_replace("')", "", $rowSend);
        $rowSend = str_replace(";", "", $rowSend);
        
        return $rowSend;
    }

    function scrapProduct($prod, $nameWebSiteBussiness){
        $priceFinaly = "";
        $search = $prod . ' ' . $nameWebSiteBussiness;
        $searchFinally = str_replace(' ', '+', $search);
        $html = file_get_html('https://www.google.com/search?q=' . $searchFinally);

        $controller = new ControllerProducts();
        $price = $controller->findData($html, $nameWebSiteBussiness, $prod, $priceFinaly);

        $sizeString = strlen($price);
        if(str_contains($price, ")")){
            $price = str_replace(")","",$price);
        }
        if(str_contains($price, " ..")){
            $price = str_replace(" ..","",$price);
        }
        if($sizeString < 4 && $sizeString >= 1){
            $price = $price.',000.00';
        }
        if($price == ""){
            $price = "NULL";
        }

        $bussinessId = $controller->findBussiness($nameWebSiteBussiness);

        if($bussinessId == 0){
            echo "La empresa no esta registrada en el sistema<br>";
            return false;
        }

        if($price !== "NULL"){
            $controller->saveDataDb($prod, $price, $bussinessId);
        }
    }
    
    public function findData($html, $nameWebSiteBussiness, $prod, $priceFinaly){
        foreach ($html->find('div') as $div) {
            if (str_contains($div->getElementByTagName('a'), $nameWebSiteBussiness) && !(str_contains($div->getElementByTagName('div'), 'Falta(n):')) && str_contains($div->getElementByTagName('div'), $prod)){
                if (str_contains($div->getElementByTagName('div'), '$') || str_contains($div->getElementByTagName('div'), 'COP') || str_contains($div->getElementByTagName('div'), 'USD')) {
                    $array = explode("$", $div->plaintext);
                    foreach ($array as $key){
                        if (str_contains($key, '0.') && str_contains($key, ',') && !(str_contains($key, 'Antes')) && !(str_contains($key, 'Ahorro')) && !(str_contains($key, 'Extensible.')) && !(str_contains($key, 'Tienda'))){
                            $priceFinaly = explode('0.', $key)[0].'0.00';
                            return $priceFinaly;
                        }else if (str_contains($key, '; Valor cuota:')) {
                            $priceFinaly = explode('; Valor cuota:', $key)[0];
                            return number_format($priceFinaly).'.00';
                        }else if (str_contains($key, ').')) {
                            $priceFinaly = explode(').', $key)[0];
                            if(!(str_contains($prod, 'Nevera No Frost Challenger Lumina 290L'))){
                                return $priceFinaly;
                            }
                        }else if (str_contains($key, '. ') && !(str_contains($key, 'Agregar')) && !(str_contains($key, 'Tienda'))){
                            $priceFinaly = explode('. ', $key)[0];
                            return $priceFinaly;
                        }else if (str_contains($key, ' .') && !(str_contains($key, ':'))){
                            $priceFinaly = explode(' .', $key)[0];
                        }else if(str_contains($key, '. (')){
                            $priceFinaly = explode('. (', $key)[0];
                            return $priceFinaly;
                        }
                    }
                    return $priceFinaly;
                }
            }
        }
    }
    
    public function saveDataDb($nameProd, $price, $bussinessId){
        $query = new Model();
        $prodId = $query->queryProdId($nameProd);
        $relationExist = $query->queryRelationsProdExist($prodId, $bussinessId);
        if($relationExist == false){
            $res = $query->insertRelation($prodId, $bussinessId, $price);
        }else{
            $res = $query->updateRelation($prodId, $bussinessId, $price);
        }

        if($res == "error"){
            echo "Ups, ocurred an error!";
        }else{
            echo "scrape successfull!!";
        }
    }

    public function findBussiness($nameWebSiteBussiness){
        $model = new Model();
        $bussinessId = 0;
        $response = $model->findBussiness();
        foreach($response as $bussiness){
            if(str_contains($nameWebSiteBussiness, $bussiness['nombreEmpresa'])){
                $bussinessId = $bussiness['idEmpresa'];
            }
        }
        return $bussinessId;
    }

}