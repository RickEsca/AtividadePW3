<?php
require_once './model/UsuarioDAO.php';
require_once './model/Usuario.php';


// $userDAO = new UsuarioDAO();

// $consulta = $userDAO->select('');

// $result['result'] = false;
// $result['quant'] = 0;
// $result['dados'] = [];

// if($consulta){
//     $result['result'] = true;
//     $result['quant'] = sizeof($consulta);
//     $result['dados'] = $consulta;
// }

// echo json_encode($result);

var_dump(new Usuario(true));