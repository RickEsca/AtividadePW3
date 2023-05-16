<?php

class Numero {
    public int    $numero;
    public int    $fk_Rifa_id;
    public int    $fk_Pedido_id;
    public string $creation_time;
    public string $modification_time;
  
  public function __construct($c=false, $fk_Rifa_id="", $fk_Pedido_id="", $creation_time="", $modification_time="") {
    if($c){
      $this->fk_Rifa_id = $fk_Rifa_id;
      $this->fk_Pedido_id =  $fk_Pedido_id;
      $this->creation_time = $creation_time;
      $this->modification_time = $modification_time;
    }
  }
}


?>
