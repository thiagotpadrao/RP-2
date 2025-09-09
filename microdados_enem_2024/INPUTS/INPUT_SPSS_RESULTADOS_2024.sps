/*****************************************************************************************************/
/*  INEP/Daeb-Diretoria de Avalia��o da Educa��o B�sica                                          */ 
/*                                   			                                    */
/*  Coordena��o-Geral de Medidas da Educa��o B�sica (CGMEB)		*/
/*----------------------------------------------------------------------------------------------------------------------------*/
/*  PROGRAMA:                                                                                                      */
/*           INPUT_SPSS_RESULTADOS_2024                                                 	*/
/*----------------------------------------------------------------------------------------------------------------------------*/
/*DESCRICAO: PROGRAMA PARA LEITURA DA BASE DE DADOS		*/
/* RESULTADOS_2024     					*/
/*****************************************************************************************************/
/*****************************************************************************************************/
/* Obs:                                                                                                                    */
/* 		                                                                                          */
/* Para abrir a base de dados � necess�rio salvar este programa e o arquivo                 */
/* RESULTADOS_2024.csv no diret�rio C:\ do computador.	                   	*/
/*							 */ 
/*							 */
/* Para a leitura dos microdados � necess�rio a sele��o do programa abaixo,               */
/* depois execute-o.						 */
/*							 */ 
/******************************************************************************************************/
/*                                                   ATEN��O                                                          */ 
/******************************************************************************************************/
/* Este programa abre a base de dados com os r�tulos das vari�veis de	                    */
/* acordo com o dicion�rio de dados que comp�em os microdados. Para abrir                */
/* os dados sem os r�tulos basta importar diretamente no SPSS.		  */
/* 							   */
/*******************************************************************************************************/

GET DATA
  /TYPE=TXT
  /FILE="C:\RESULTADOS_2024.csv" /*local do arquivo*/
  /DELCASE=LINE
  /DELIMITERS=";"
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /IMPORTCASE= ALL
  /VARIABLES=
  NU_SEQUENCIAL F21.0
  NU_ANO F4.0
  CO_ESCOLA F8.0
  CO_MUNICIPIO_ESC F7.0
  NO_MUNICIPIO_ESC A32
  CO_UF_ESC F2.0
  SG_UF_ESC A2
  TP_DEPENDENCIA_ADM_ESC F1.0
  TP_LOCALIZACAO_ESC F1.0
  TP_SIT_FUNC_ESC F1.0
  CO_MUNICIPIO_PROVA F7.0
  NO_MUNICIPIO_PROVA A27
  CO_UF_PROVA F2.0
  SG_UF_PROVA A10
  TP_PRESENCA_CN F1.0
  TP_PRESENCA_CH F1.0
  TP_PRESENCA_LC F1.0
  TP_PRESENCA_MT F1.0
  CO_PROVA_CN F4.0
  CO_PROVA_CH F4.0
  CO_PROVA_LC F4.0
  CO_PROVA_MT F4.0
  NU_NOTA_CN COMMA8.2
  NU_NOTA_CH COMMA8.2
  NU_NOTA_LC COMMA8.2
  NU_NOTA_MT COMMA8.2
  TX_RESPOSTAS_CN A45
  TX_RESPOSTAS_CH A45
  TX_RESPOSTAS_LC A50
  TX_RESPOSTAS_MT A45
  TP_LINGUA F1.0
  TX_GABARITO_CN A45
  TX_GABARITO_CH A45
  TX_GABARITO_LC A50
  TX_GABARITO_MT A45
  TP_STATUS_REDACAO F2.0
  NU_NOTA_COMP1 F3.0
  NU_NOTA_COMP2 F3.0
  NU_NOTA_COMP3 F3.0
  NU_NOTA_COMP4 F3.0
  NU_NOTA_COMP5 F3.0
  NU_NOTA_REDACAO F4.0.

CACHE.
EXECUTE.
DATASET NAME RESULTADOS_2024 WINDOW=FRONT.

VARIABLE LABELS
NU_SEQUENCIAL			"N�mero sequencial da linha de resultados"
NU_ANO	                  		"Ano do Enem"
CO_ESCOLA 			"C�digo da Escola de conclus�o do ensino m�dio"
CO_MUNICIPIO_ESC 			"C�digo do munic�pio da escola"
NO_MUNICIPIO_ESC			"Nome do munic�pio da escola"
CO_UF_ESC			"C�digo da Unidade da Federa��o da escola"
SG_UF_ESC			"Sigla da Unidade da Federa��o da escola"
TP_DEPENDENCIA_ADM_ESC		"Depend�ncia administrativa (Escola)"
TP_LOCALIZACAO_ESC		"Localiza��o (Escola)"
TP_SIT_FUNC_ESC			"Situa��o de funcionamento (Escola)"
CO_MUNICIPIO_PROVA		"C�digo do munic�pio da aplica��o da prova"
NO_MUNICIPIO_PROVA		"Nome do munic�pio da aplica��o da prova"
CO_UF_PROVA			"C�digo da Unidade da Federa��o da aplica��o da prova"
SG_UF_PROVA  			"Sigla da Unidade da Federa��o da aplica��o da prova"
TP_PRESENCA_CN			"Presen�a na prova objetiva de Ci�ncias da Natureza"
TP_PRESENCA_CH			"Presen�a na prova objetiva de Ci�ncias Humanas"
TP_PRESENCA_LC			"Presen�a na prova objetiva de Linguagens e C�digos"
TP_PRESENCA_MT			"Presen�a na prova objetiva de Matem�tica"
CO_PROVA_CN			"C�digo do tipo de prova de Ci�ncias da Natureza"
CO_PROVA_CH			"C�digo do tipo de prova de Ci�ncias Humanas"
CO_PROVA_LC			"C�digo do tipo de prova de Linguagens e C�digos"
CO_PROVA_MT			"C�digo do tipo de prova de Matem�tica"
NU_NOTA_CN			"Nota da prova de Ci�ncias da Natureza"
NU_NOTA_CH			"Nota da prova de Ci�ncias Humanas"
NU_NOTA_LC			"Nota da prova de Linguagens e C�digos"
NU_NOTA_MT			"Nota da prova de Matem�tica"
TX_RESPOSTAS_CN			"Vetor com as respostas da parte objetiva da prova de Ci�ncias da Natureza"
TX_RESPOSTAS_CH			"Vetor com as respostas da parte objetiva da prova de Ci�ncias Humanas"
TX_RESPOSTAS_LC			"Vetor com as respostas da parte objetiva da prova de Linguagens e C�digos"
TX_RESPOSTAS_MT			"Vetor com as respostas da parte objetiva da prova de Matem�tica"
TP_LINGUA				"Tipo de L�ngua Estrangeira"
TX_GABARITO_CN			"Vetor com o gabarito da parte objetiva da prova de Ci�ncias da Natureza"
TX_GABARITO_CH			"Vetor com o gabarito da parte objetiva da prova de Ci�ncias Humanas"
TX_GABARITO_LC			"Vetor com o gabarito da parte objetiva da prova de Linguagens e C�digos"
TX_GABARITO_MT			"Vetor com o gabarito da parte objetiva da prova de Matem�tica"
TP_STATUS_REDACAO		"Situa��o da reda��o do participante"
NU_NOTA_COMP1			"Nota da compet�ncia 1"
NU_NOTA_COMP2			"Nota da compet�ncia 2"
NU_NOTA_COMP3			"Nota da compet�ncia 3"
NU_NOTA_COMP4			"Nota da compet�ncia 4"
NU_NOTA_COMP5			"Nota da compet�ncia 5"
NU_NOTA_REDACAO			"Nota da prova de reda��o".

VALUE LABELS
/TP_DEPENDENCIA_ADM_ESC
	1	"Federal"
	2	"Estadual"
	3	"Municipal"
	4	"Privada"
/TP_LOCALIZACAO_ESC
	1	"Urbana"
	2	"Rural"
/TP_SIT_FUNC_ESC
	1	"Em atividade"
	2	"Paralisada"
	3	"Extinta"
	4	"Escola extinta em anos anteriores"
/TP_PRESENCA_CN
	0	"Faltou � prova"
	1	"Presente na prova"
	2	"Eliminado na prova"
/TP_PRESENCA_CH
	0	"Faltou � prova"
	1	"Presente na prova"
	2	"Eliminado na prova"
/TP_PRESENCA_LC
	0	"Faltou � prova"
	1	"Presente na prova"
	2	"Eliminado na prova"
/TP_PRESENCA_MT
	0	"Faltou � prova"
	1	"Presente na prova"
	2	"Eliminado na prova"
/CO_PROVA_CN
	1419	"Azul"
	1420	"Amarela"
	1421	"Verde"
	1422	"Cinza"
	1423	"Verde - Ampliada"
	1424	"Verde - Superampliada"
	1426	"Laranja - Adaptada Ledor"
	1427	"Roxa - Videoprova - Libras"
	1428	"Roxa - Videoprova - Libras - Ampliada"
	1373	"Azul (Reaplica��o)"
	1374	"Amarela (Reaplica��o)"
	1375	"Cinza (Reaplica��o)"
	1376	"Verde (Reaplica��o)"
	1377	"Verde - Ampliada (Reaplica��o)"
	1378	"Verde - Superampliada (Reaplica��o)"
	1380	"Laranja - Adaptada Ledor (Reaplica��o)"
/CO_PROVA_CH
	1383	"Azul"
	1384	"Amarela"
	1385	"Branca"
	1386	"Verde"
	1387	"Verde - Ampliada"
	1388	"Verde - Superampliada"
	1390	"Laranja - Adaptada Ledor"
	1391	"Roxa - Videoprova - Libras"
	1392	"Roxa - Videoprova - Libras - Ampliada"
	1393	"Roxa - Videoprova - Libras - Superampliada"
	1343	"Azul (Reaplica��o)"
	1344	"Amarela (Reaplica��o)"
	1345	"Branca (Reaplica��o)"
	1346	"Verde (Reaplica��o)"
	1347	"Verde - Ampliada (Reaplica��o)"
	1348	"Verde - Superampliada (Reaplica��o)"
	1350	"Laranja - Adaptada Ledor (Reaplica��o)"
/CO_PROVA_LC
	1395	"Azul"
	1396	"Amarela"
	1397	"Verde"
	1398	"Branca"
	1399	"Verde - Ampliada"
	1400	"Verde - Superampliada"
	1402	"Laranja - Adaptada Ledor"
	1403	"Roxa - Videoprova - Libras"
	1404	"Roxa - Videoprova - Libras - Ampliada"
	1405	"Roxa - Videoprova - Libras - Superampliada"
	1353	"Azul (Reaplica��o)"
	1354	"Amarela (Reaplica��o)"
	1355	"Verde (Reaplica��o)"
	1356	"Branca (Reaplica��o)"
	1357	"Verde - Ampliada (Reaplica��o)"
	1358	"Verde - Superampliada (Reaplica��o)"
	1360	"Laranja - Adaptada Ledor (Reaplica��o)"
/CO_PROVA_MT
	1407	"Azul"
	1408	"Amarela"
	1409	"Verde"
	1410	"Cinza"
	1411	"Verde - Ampliada"
	1412	"Verde - Superampliada"
	1414	"Laranja - Adaptada Ledor"
	1415	"Roxa - Videoprova - Libras"
	1416	"Roxa - Videoprova - Libras - Ampliada"
	1363	"Azul (Reaplica��o)"
	1364	"Amarela (Reaplica��o)"
	1365	"Verde (Reaplica��o)"
	1366	"Cinza (Reaplica��o)"
	1367	"Verde - Ampliada (Reaplica��o)"
	1368	"Verde - Superampliada (Reaplica��o)"
	1370	"Laranja - Adaptada Ledor (Reaplica��o)"
/TP_LINGUA
	0	"Ingl�s"
	1	"Espanhol"
/TP_STATUS_REDACAO
	1	"Sem problemas"
	2	"Anulada"
	3	"C�pia Texto Motivador"
	4	"Em Branco"
	6	"Fuga ao tema"
	7	"N�o atendimento ao tipo textual"
	8	"Texto insuficiente"
	9	"Parte desconectada".
SAVE OUTFILE='C:\RESULTADOS_2024.sav'
  /COMPRESSED.
