<?php
require_once 'DataBase.php';
require_once 'Numero.php';
class NumeroDAO
{
    private $pdo;
    private $erro;

    public function getErro(){
        return $this->erro;
    }

    public function __construct()
    {
        try {
            $this->pdo = (new DataBase())->connection();
            $this->pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (\PDOException $e) {
            $this->erro = 'Erro ao conectar com o banco de dados: ' . $e->getMessage();
            die;
        }
    }


    public function insert(Numero $numero)
    {
        $stmt = $this->pdo->prepare("INSERT INTO Numero (numero,:fk_Rifa_id,:fk_Pedido_id) VALUES (:numero,:fk_Rifa_id,:fk_Pedido_id)");
        $dados = [
            'numero'     => $numero->numero,
            'fk_Rifa_id'     => $numero->fk_Rifa_id,
            'fk_Pedido_id'      => $numero->fk_Pedido_id,
        ];
        try {
            $stmt->execute($dados);
            return $this->selectById($this->pdo->lastInsertId());
        } catch (\PDOException $e) {
            $this->erro = 'Erro ao inserir usuário: ' . $e->getMessage();
            return false;
        }
    }

    public function listarTodos(){
        $cmdSql = "SELECT * FROM Numero";
        $cx = $this->pdo->prepare($cmdSql);
        $cx->execute();
        if($cx->rowCount() > 0){
            $cx->setFetchMode(PDO::FETCH_CLASS, 'Numero');
            return $cx->fetchAll();
        }
        return false;
    }

    public function __destruct()
    {
        $this->pdo = null;
    }
}
