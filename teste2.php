<?php
class Calculadora{
    private $result;
    public function getResult(){
        return $this->result;
    }
    public function setValorInicial($valor_inicio){
        if($this->result == null){
            $this->result = $valor_inicio;
        }        
    }
    public function somar($valor){
        $this->result += $valor;
        return $this->result;
    }
    public function sub($valor){
        $this->result -= $valor;
        return $this->result;
    }
    public function div($valor){
        $this->result /= $valor;
        return $this->result;
    }
    public function mult($valor){
        $this->result *= $valor;
        return $this->result;
    }
}
$calc1 = new Calculadora();
$calc2 = new Calculadora();

$calc1->setValorInicial(0);
$calc1->div(1);

// echo 'Valor: ínicial: 10';
// $calc1->setValorInicial(10);

// echo '<br>'.$calc1->getResult().' + 10 = '. $calc1->somar(10);
// echo '<br>'.$calc1->getResult().' - 10 = '. $calc1->sub(10);
// echo '<br>'.$calc1->getResult().' + 5  = '. $calc1->somar(5);
// echo '<br>'.$calc1->getResult().' * 2  = '. $calc1->mult(2);
// echo '<br>'.$calc1->getResult().' / 3  = '. $calc1->div(3);


