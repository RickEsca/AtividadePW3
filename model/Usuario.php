<?php

class Usuario {
  public int     $id;
  public string  $email;
  public string  $senha;
  public string  $nome;
  public string  $foto;
  public string  $tel;
  public string  $endereco;
  public string  $cpf;
  public string  $creation_time;
  public string  $modification_time;

  public function __construct($c=0, $id=0, $email="", $senha="", $nome="", $foto="", $tel="", $endereco="", $cpf="", $creation_time="", $modification_time="") {
    if($c){
      $this->id = $id;
      $this->email =  $email;
      $this->senha = $senha;
      $this->nome = $nome;
      $this->foto = $foto;
      $this->tel = $tel;
      $this->endereco = $endereco;
      $this->cpf = $cpf;
      $this->creation_time = $creation_time;
      $this->modification_time = $modification_time;
    }
  }


  public function criptografarSenha(){
      $this->senha = password_hash($this->senha,PASSWORD_BCRYPT,['cost' => 12]);
  }

  public function decriptografarSenha($senha, $criptografia):bool{
      return password_verify($senha, $criptografia);
  }

  public function login($senha):bool{
      return $this->decriptografarSenha($senha,$this->senha);     
  }
}