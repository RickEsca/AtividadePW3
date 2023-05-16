<?php
class Conta{
    private int     $numero;
    private string  $titular;
    private float   $saldo;

    public function __construct($numero=0,$titular='')
    {        
        $this->numero = is_null($numero)?0:$numero;
        $this->titular = is_null($titular)?'':$titular;
        $this->saldo   = 0;
    }
    public function setTitular($nome){
        $this->titular = $nome;
    }
    public function getTitular():string{        
        return $this->titular;
    }
    public function getSaldo():float{
        return $this->saldo;
    }
    public function depositar($valor): bool{
        if($valor > 0){
            $this->saldo += $valor;
            return true;
        }
        return false;
    }
    public function sacar($valor):bool{        
        if($valor > 0 && $this->saldo >= $valor){            
            $this->saldo -= $valor;
            return true;
        }
        return false;
    }
    public function transferir($valor, Conta $destino):bool{
        if($this->sacar($valor)){
            $destino->depositar($valor);
            return true;
        }
        return false;
    }
}

$contas = [];
$contas[] = new Conta(1, "Marcos");
$contas[] = new Conta(2, "Eliton");
$contas[] = new Conta(3, "Alana");
$contas[] = new Conta(4, "Alex");

$x = 1;

foreach ($contas as $conta) {
    $x += 1; 
    $conta->depositar(100*$x);
    echo 'Cliente: '.$conta->getTitular().' - Saldo: R$'.$conta->getSaldo().'; ';
}





// $conta2->transferir(100,$conta1);
// $conta1->sacar(200);
// $conta2->depositar(-3);
// echo $conta1->getSaldo();
// echo $conta2->getSaldo();


// $conta1 = new Conta(1,"Marcos");
// var_dump(
//     $conta1->depositar(100.00),
//     $conta1->sacar(20)    
// );

// echo "<br>";
// echo $conta1->getSaldo();


// $c1 = new Conta(1,"Eliton");
// $c2 = new Conta(2,"Daniel");

// $c1->depositar(100);
// $c2->depositar(1000);  

// var_dump($c1,$c2);

// $c2->transferir(450,$c1);

// var_dump($c1,$c2);
