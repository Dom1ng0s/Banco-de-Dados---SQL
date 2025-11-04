-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: projetobanco
-- ------------------------------------------------------
-- Server version	8.0.43

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `v_hierarquia_funcionarios`
--

DROP TABLE IF EXISTS `v_hierarquia_funcionarios`;
/*!50001 DROP VIEW IF EXISTS `v_hierarquia_funcionarios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_hierarquia_funcionarios` AS SELECT 
 1 AS `CPF_Funcionario`,
 1 AS `Nome_Funcionario`,
 1 AS `Funcao`,
 1 AS `Salario`,
 1 AS `CPF_Supervisor`,
 1 AS `Nome_Supervisor`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_ganho_de_peso_diario`
--

DROP TABLE IF EXISTS `v_ganho_de_peso_diario`;
/*!50001 DROP VIEW IF EXISTS `v_ganho_de_peso_diario`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_ganho_de_peso_diario` AS SELECT 
 1 AS `Brinco_Boi`,
 1 AS `Status`,
 1 AS `Data_Inicial`,
 1 AS `Peso_Inicial`,
 1 AS `Data_Final`,
 1 AS `Peso_Final`,
 1 AS `Ganho_Total_Kg`,
 1 AS `Dias_No_Periodo`,
 1 AS `GMD_Kg_Dia`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_analise_financeira_boi`
--

DROP TABLE IF EXISTS `v_analise_financeira_boi`;
/*!50001 DROP VIEW IF EXISTS `v_analise_financeira_boi`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_analise_financeira_boi` AS SELECT 
 1 AS `Brinco`,
 1 AS `Status`,
 1 AS `Valor_Compra`,
 1 AS `Custo_Total_Vacinas`,
 1 AS `Custo_Acumulado`,
 1 AS `Valor_Venda`,
 1 AS `Lucro_Realizado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_resumo_pastos`
--

DROP TABLE IF EXISTS `v_resumo_pastos`;
/*!50001 DROP VIEW IF EXISTS `v_resumo_pastos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_resumo_pastos` AS SELECT 
 1 AS `ID_Pasto`,
 1 AS `Nome_Pasto`,
 1 AS `Tamanho`,
 1 AS `Situacao_Cerca`,
 1 AS `Quantidade_Bovinos_Ativos`,
 1 AS `Data_Ultima_Manutencao`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `v_hierarquia_funcionarios`
--

/*!50001 DROP VIEW IF EXISTS `v_hierarquia_funcionarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_hierarquia_funcionarios` AS select `f`.`CPF_CNPJ` AS `CPF_Funcionario`,`p_func`.`Nome` AS `Nome_Funcionario`,`f`.`Funcao` AS `Funcao`,`f`.`Salario` AS `Salario`,`sup`.`CPF_CNPJ` AS `CPF_Supervisor`,coalesce(`p_sup`.`Nome`,'--- Sem Supervisor ---') AS `Nome_Supervisor` from (((`funcionario` `f` join `pessoa` `p_func` on((`f`.`CPF_CNPJ` = `p_func`.`CPF_CNPJ`))) left join `funcionario` `sup` on((`f`.`CPF_Supervisor` = `sup`.`CPF_CNPJ`))) left join `pessoa` `p_sup` on((`sup`.`CPF_CNPJ` = `p_sup`.`CPF_CNPJ`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_ganho_de_peso_diario`
--

/*!50001 DROP VIEW IF EXISTS `v_ganho_de_peso_diario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_ganho_de_peso_diario` AS with `pesagensordenadas` as (select `pesagem`.`Brinco_Boi` AS `Brinco_Boi`,`pesagem`.`Data_Pesagem` AS `Data_Pesagem`,`pesagem`.`Peso_Kg` AS `Peso_Kg`,row_number() OVER (PARTITION BY `pesagem`.`Brinco_Boi` ORDER BY `pesagem`.`Data_Pesagem` )  AS `rn_asc`,row_number() OVER (PARTITION BY `pesagem`.`Brinco_Boi` ORDER BY `pesagem`.`Data_Pesagem` desc )  AS `rn_desc` from `pesagem`), `primeiraultima` as (select `pesagensordenadas`.`Brinco_Boi` AS `Brinco_Boi`,max((case when (`pesagensordenadas`.`rn_asc` = 1) then `pesagensordenadas`.`Data_Pesagem` end)) AS `Data_Inicial`,max((case when (`pesagensordenadas`.`rn_asc` = 1) then `pesagensordenadas`.`Peso_Kg` end)) AS `Peso_Inicial`,max((case when (`pesagensordenadas`.`rn_desc` = 1) then `pesagensordenadas`.`Data_Pesagem` end)) AS `Data_Final`,max((case when (`pesagensordenadas`.`rn_desc` = 1) then `pesagensordenadas`.`Peso_Kg` end)) AS `Peso_Final` from `pesagensordenadas` group by `pesagensordenadas`.`Brinco_Boi`) select `p`.`Brinco_Boi` AS `Brinco_Boi`,`b`.`Status` AS `Status`,`p`.`Data_Inicial` AS `Data_Inicial`,`p`.`Peso_Inicial` AS `Peso_Inicial`,`p`.`Data_Final` AS `Data_Final`,`p`.`Peso_Final` AS `Peso_Final`,(`p`.`Peso_Final` - `p`.`Peso_Inicial`) AS `Ganho_Total_Kg`,(to_days(`p`.`Data_Final`) - to_days(`p`.`Data_Inicial`)) AS `Dias_No_Periodo`,(case when ((to_days(`p`.`Data_Final`) - to_days(`p`.`Data_Inicial`)) > 0) then ((`p`.`Peso_Final` - `p`.`Peso_Inicial`) / (to_days(`p`.`Data_Final`) - to_days(`p`.`Data_Inicial`))) else NULL end) AS `GMD_Kg_Dia` from (`primeiraultima` `p` join `boi` `b` on((`p`.`Brinco_Boi` = `b`.`Brinco`))) where (`p`.`Data_Inicial` <> `p`.`Data_Final`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_analise_financeira_boi`
--

/*!50001 DROP VIEW IF EXISTS `v_analise_financeira_boi`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_analise_financeira_boi` AS select `b`.`Brinco` AS `Brinco`,`b`.`Status` AS `Status`,`b`.`Valor_Compra` AS `Valor_Compra`,coalesce(sum(`p`.`Preco`),0) AS `Custo_Total_Vacinas`,(`b`.`Valor_Compra` + coalesce(sum(`p`.`Preco`),0)) AS `Custo_Acumulado`,`b`.`Valor_Venda` AS `Valor_Venda`,(case when ((`b`.`Status` = 'Vendido') and (`b`.`Valor_Venda` is not null)) then (`b`.`Valor_Venda` - (`b`.`Valor_Compra` + coalesce(sum(`p`.`Preco`),0))) else NULL end) AS `Lucro_Realizado` from ((`boi` `b` left join `aplicacao_vacina` `av` on((`b`.`Brinco` = `av`.`Brinco_Boi`))) left join `produto` `p` on((`av`.`ID_Produto` = `p`.`ID_Produto`))) group by `b`.`Brinco`,`b`.`Status`,`b`.`Valor_Compra`,`b`.`Valor_Venda` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_resumo_pastos`
--

/*!50001 DROP VIEW IF EXISTS `v_resumo_pastos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_resumo_pastos` AS select `p`.`ID_Pasto` AS `ID_Pasto`,`p`.`Nome_Pasto` AS `Nome_Pasto`,`p`.`Tamanho` AS `Tamanho`,`p`.`Situacao_Cerca` AS `Situacao_Cerca`,count(`b`.`Brinco`) AS `Quantidade_Bovinos_Ativos`,(select max(`m`.`Data_Manutencao`) from `manutencao` `m` where (`m`.`ID_Pasto` = `p`.`ID_Pasto`)) AS `Data_Ultima_Manutencao` from (`pasto` `p` left join `boi` `b` on(((`p`.`ID_Pasto` = `b`.`ID_Pasto`) and (`b`.`Status` = 'Ativo')))) group by `p`.`ID_Pasto`,`p`.`Nome_Pasto`,`p`.`Tamanho`,`p`.`Situacao_Cerca` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping routines for database 'projetobanco'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-04 13:49:09
