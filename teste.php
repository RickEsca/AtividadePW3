<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<form method="post">
  <label for="nome">Nome:</label>
  <input type="text" id="nome" name="nome" required>
  <br>
  <label for="email">E-mail:</label>
  <input type="email" id="email" name="email" required>
  <br>
  <label for="senha">Senha:</label>
  <input type="password" id="senha" name="senha" required>
  <br>
  <label for="foto">Foto:</label>
  <input type="text" id="foto" name="foto">
  <br>
  <label for="tel">Telefone:</label>
  <input type="text" id="tel" name="tel">
  <br>
  <label for="endereco">Endereço:</label>
  <input type="text" id="endereco" name="endereco">
  <br>
  <label for="cpf">CPF:</label>
  <input type="text" id="cpf" name="cpf" required>
  <br>
  <input type="submit" value="Cadastrar">
</form>
    <?php
    require_once 'model/UsuarioDAO.php';
    require_once 'model/Usuario.php';
    
    // verifica se os dados foram enviados pelo formulário
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
      // obtém os dados do formulário
        $nome = $_POST['nome'];
        $email = $_POST['email'];
        $senha = $_POST['senha'];
        $foto = $_POST['foto'];
        $tel = $_POST['tel'];
        $endereco = $_POST['endereco'];
        $cpf = $_POST['cpf'];
    
      // cria um novo objeto Usuario com os dados do formulário
      $usuario = new Usuario(0, $email, $senha, $nome, $foto, $tel, $endereco, $cpf, "", "");
    
      var_dump($usuario);

      // cria um novo objeto UsuarioDAO e insere o novo usuário no banco de dados
      $usuarioDAO = new UsuarioDAO();
      $usuario = $usuarioDAO->insert($usuario);
      if($usuario){
        var_dump($usuario);
      }
      else{
        var_dump($usuarioDAO->getErro());
      }         
      
    }

    // $usuarioDAO = new UsuarioDAO();
    // var_dump($usuarioDAO->selectByNome());
    ?>
</body>
</html>

