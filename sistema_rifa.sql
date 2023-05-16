-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 09-Maio-2023 às 12:31
-- Versão do servidor: 8.0.31
-- versão do PHP: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `sistema_rifa`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `colaborador`
--

DROP TABLE IF EXISTS `colaborador`;
CREATE TABLE IF NOT EXISTS `colaborador` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `fk_Usuario_id` bigint UNSIGNED DEFAULT NULL,
  `fk_Rifa_id` bigint UNSIGNED DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `saque` int UNSIGNED DEFAULT NULL,
  `creation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modification_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_Colaborador_2` (`fk_Usuario_id`),
  KEY `FK_Colaborador_3` (`fk_Rifa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `imagens`
--

DROP TABLE IF EXISTS `imagens`;
CREATE TABLE IF NOT EXISTS `imagens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `fk_Rifa_id` bigint UNSIGNED DEFAULT NULL,
  `link_img` varchar(200) DEFAULT NULL,
  `creation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modification_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_Imagens_1` (`fk_Rifa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `numero`
--

DROP TABLE IF EXISTS `numero`;
CREATE TABLE IF NOT EXISTS `numero` (
  ` numero` int UNSIGNED NOT NULL,
  ` fk_Rifa_id` bigint UNSIGNED NOT NULL,
  ` fk_Pedido_id` bigint UNSIGNED DEFAULT NULL,
  ` creation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  ` modification_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`numero`,`fk_Rifa_id`),
  KEY `FK_Numero_1` (`fk_Pedido_id`),
  KEY `FK_Numero_2` (`fk_Rifa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido`
--

DROP TABLE IF EXISTS `pedido`;
CREATE TABLE IF NOT EXISTS `pedido` (
  `id` bigint UNSIGNED NOT NULL,
  `fk_Usuario_id` bigint UNSIGNED DEFAULT NULL,
  `fk_Rifa_id` bigint UNSIGNED DEFAULT NULL,
  `valor` double UNSIGNED DEFAULT NULL,
  `status` int UNSIGNED DEFAULT NULL,
  `creation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modification_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_Pedido_2` (`fk_Usuario_id`),
  KEY `FK_Pedido_3` (`fk_Rifa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido_colaborador`
--

DROP TABLE IF EXISTS `pedido_colaborador`;
CREATE TABLE IF NOT EXISTS `pedido_colaborador` (
  `fk_Colaborador_id` bigint UNSIGNED DEFAULT NULL,
  `fk_Pedido_id` bigint UNSIGNED DEFAULT NULL,
  `creation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `FK_Pedido_Colaborador_1` (`fk_Colaborador_id`),
  KEY `FK_Pedido_Colaborador_2` (`fk_Pedido_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `rifa`
--

DROP TABLE IF EXISTS `rifa`;
CREATE TABLE IF NOT EXISTS `rifa` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `titulo` varchar(200) DEFAULT NULL,
  `descricao` varchar(200) DEFAULT NULL,
  `quant_num` int UNSIGNED DEFAULT NULL,
  `valor` double UNSIGNED DEFAULT NULL,
  `data_termino` date DEFAULT NULL,
  `tempo_reserva` int UNSIGNED DEFAULT NULL,
  `fk_Usuario_id` bigint UNSIGNED DEFAULT NULL,
  `creation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modification_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_Rifa_2` (`fk_Usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `rifa_tags`
--

DROP TABLE IF EXISTS `rifa_tags`;
CREATE TABLE IF NOT EXISTS `rifa_tags` (
  `fk_Rifa_id` bigint UNSIGNED DEFAULT NULL,
  `fk_Tags_id` int UNSIGNED DEFAULT NULL,
  `creation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `FK_Rifa_Tags_1` (`fk_Rifa_id`),
  KEY `FK_Rifa_Tags_2` (`fk_Tags_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tags`
--

DROP TABLE IF EXISTS `tags`;
CREATE TABLE IF NOT EXISTS `tags` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) DEFAULT NULL,
  `creation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modification_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `senha` varchar(200) DEFAULT NULL,
  `nome` varchar(200) DEFAULT NULL,
  `foto` varchar(200) DEFAULT NULL,
  `tel` varchar(200) DEFAULT NULL,
  `endereco` varchar(200) DEFAULT NULL,
  `cpf` bigint DEFAULT NULL,
  `creation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modification_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `cpf` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id`, `email`, `senha`, `nome`, `foto`, `tel`, `endereco`, `cpf`, `creation_time`, `modification_time`) VALUES
(129, 'lucasmendes@gmail.com', 'senha123', 'Lucas Mendes', 'foto1.jpg', '11987654321', 'Rua A, 123', 12345678901, '2023-04-18 12:04:16', '2023-04-18 12:04:16'),
(130, 'carlasouza@hotmail.com', 'senha456', 'Carla Souza', 'foto2.jpg', '11976543210', 'Rua B, 456', 23456789012, '2023-04-18 12:04:16', '2023-04-18 12:04:16'),
(131, 'gabrielalves@yahoo.com', 'senha789', 'Gabriela Alves', 'foto3.jpg', '11965432109', 'Rua C, 789', 34567890123, '2023-04-18 12:04:16', '2023-04-18 12:04:16'),
(132, 'pedrooliveira@gmail.com', 'senha123', 'Pedro Oliveira', 'foto4.jpg', '11954321098', 'Rua D, 1011', 45678901234, '2023-04-18 12:04:16', '2023-04-18 12:04:16'),
(133, 'mariasantos@hotmail.com', 'senha456', 'Maria Santos', 'foto5.jpg', '11943210987', 'Rua E, 1213', 56789012345, '2023-04-18 12:04:16', '2023-04-18 12:04:16'),
(134, 'felipepereira@yahoo.com', 'senha789', 'Felipe Pereira', 'foto6.jpg', '11932109876', 'Rua F, 1415', 67890123456, '2023-04-18 12:04:16', '2023-04-18 12:04:16'),
(135, 'julianasilva@gmail.com', 'senha123', 'Juliana Silva', 'foto7.jpg', '11921098765', 'Rua G, 1617', 78901234567, '2023-04-18 12:04:16', '2023-04-18 12:04:16'),
(136, 'renatogomes@hotmail.com', 'senha456', 'Renato Gomes', 'foto8.jpg', '11910987654', 'Rua H, 1819', 89012345678, '2023-04-18 12:04:16', '2023-04-18 12:04:16'),
(137, 'anapaula@yahoo.com', 'senha789', 'Ana Paula', 'foto9.jpg', '11809876543', 'Rua I, 2021', 90123456789, '2023-04-18 12:04:16', '2023-04-18 12:04:16'),
(138, 'joaovictor@gmail.com', 'senha123', 'João Victor', 'foto10.jpg', '11798765432', 'Rua J, 2223', 12345678902, '2023-04-18 12:04:16', '2023-04-18 12:04:16'),
(139, 'larissarodrigues@hotmail.com', 'senha456', 'Larissa Rodrigues', 'foto11.jpg', '11787654321', 'Rua K, 2425', 23456789015, '2023-04-18 12:04:16', '2023-04-18 12:04:16'),
(140, 'mateussouza@yahoo.com', 'senha789', 'Mateus Souza', 'foto12.jpg', '11776543210', 'Rua L, 2627', 34567890128, '2023-04-18 12:04:16', '2023-04-18 12:04:16'),
(141, 'jessicacosta@gmail.com', 'senha123', 'Jessica Costa', 'foto13.jpg', '11765432109', 'Rua M, 2829', 45778901234, '2023-04-18 12:04:16', '2023-04-18 12:04:16'),
(142, 'leonardocarvalho@hotmail.com', 'senha456', 'Leonardo Carvalho', 'foto14.jpg', '11754321098', 'Rua N, 3031', 58789012345, '2023-04-18 12:04:16', '2023-04-18 12:04:16'),
(143, 'camilasantos@yahoo.com', 'senha789', 'Camila Santos', 'foto15.jpg', '11743210987', 'Rua O, 3233', 67890123466, '2023-04-18 12:04:16', '2023-04-18 12:04:16'),
(144, 'viniciusoliveira@gmail.com', 'senha123', 'Vinicius Oliveira', 'foto16.jpg', '11732109876', 'Rua P, 3435', 789012345, '2023-04-18 12:04:16', '2023-04-18 12:04:16'),
(163, 'camargoliveira@gmail.com', '3256723456345', 'ELITON-PC', 'gsdqqqqqqqqqgdf.png', '14996874866', 'Rua Joaquim Antunes de Souza', 45235835875, '2023-05-02 14:03:22', '2023-05-02 14:03:22');

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `colaborador`
--
ALTER TABLE `colaborador`
  ADD CONSTRAINT `FK_Colaborador_2` FOREIGN KEY (`fk_Usuario_id`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `FK_Colaborador_3` FOREIGN KEY (`fk_Rifa_id`) REFERENCES `rifa` (`id`);

--
-- Limitadores para a tabela `imagens`
--
ALTER TABLE `imagens`
  ADD CONSTRAINT `FK_Imagens_1` FOREIGN KEY (`fk_Rifa_id`) REFERENCES `rifa` (`id`);

--
-- Limitadores para a tabela `numero`
--
ALTER TABLE `numero`
  ADD CONSTRAINT `FK_Numero_1` FOREIGN KEY (`fk_Pedido_id`) REFERENCES `pedido` (`id`),
  ADD CONSTRAINT `FK_Numero_2` FOREIGN KEY (`fk_Rifa_id`) REFERENCES `rifa` (`id`);

--
-- Limitadores para a tabela `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `FK_Pedido_2` FOREIGN KEY (`fk_Usuario_id`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `FK_Pedido_3` FOREIGN KEY (`fk_Rifa_id`) REFERENCES `rifa` (`id`);

--
-- Limitadores para a tabela `pedido_colaborador`
--
ALTER TABLE `pedido_colaborador`
  ADD CONSTRAINT `FK_Pedido_Colaborador_1` FOREIGN KEY (`fk_Colaborador_id`) REFERENCES `colaborador` (`id`),
  ADD CONSTRAINT `FK_Pedido_Colaborador_2` FOREIGN KEY (`fk_Pedido_id`) REFERENCES `pedido` (`id`);

--
-- Limitadores para a tabela `rifa`
--
ALTER TABLE `rifa`
  ADD CONSTRAINT `FK_Rifa_2` FOREIGN KEY (`fk_Usuario_id`) REFERENCES `usuario` (`id`);

--
-- Limitadores para a tabela `rifa_tags`
--
ALTER TABLE `rifa_tags`
  ADD CONSTRAINT `FK_Rifa_Tags_1` FOREIGN KEY (`fk_Rifa_id`) REFERENCES `rifa` (`id`),
  ADD CONSTRAINT `FK_Rifa_Tags_2` FOREIGN KEY (`fk_Tags_id`) REFERENCES `tags` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
