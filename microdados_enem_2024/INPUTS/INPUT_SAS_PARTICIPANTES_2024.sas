/**************************************************************************/
/*  INEP/Daeb-Diretoria de Avalia��o da Educa��o B�sica              	  */      
/*                                   									  */	
/*  Coordena��o-Geral de Medidas da Educa��o B�sica(CGMEB)				  */
/*------------------------------------------------------------------------*/
/*  PROGRAMA:                                                             */
/*           INPUT_SAS_PARTICIPANTES_2024.sas                        	  */
/*------------------------------------------------------------------------*/
/*  DESCRICAO: PROGRAMA PARA LEITURA DA BASE DE PARTICIPANTES DO ENEM 2024*/    
/*                                                                        */
/**************************************************************************/
/**************************************************************************/
/* Obs:                                                                   */
/* 		                                                                  */
/* Para abrir a base de Participantes � necess�rio salvar este programa e */
/* o arquivo PARTICIPANTES_2024.CSV no diret�rio C:\ do computador.	      */
/*															 			  */                                           
/* Ao terminar esses procedimentos execute o programa salvo utilizando    */
/* as vari�veis de interesse.                                             */
/**************************************************************************/
/*				                  ATEN��O                                 */  
/**************************************************************************/
/* Este programa abre a base de dados com os r�tulos das vari�veis de	  */
/* acordo com o dicion�rio de dados que comp�em os microdados. Para abrir */
/* os dados sem os r�tulos basta importar diretamente no SAS.			  */
/* 																	      */ 																          
/**************************************************************************/

proc format;

	value IN_TREINEIRO
		0='N�o'
		1='Sim';

	value $TP_SEXO
		M ='Masculino'
		F ='Feminino';

	value TP_NACIONALIDADE
	   0= 'N�o informado'
	   1= 'Brasileiro(a)'
	   2= 'Brasileiro(a) Naturalizado(a)'
	   3= 'Estrangeiro(a)'
	   4= 'Brasileiro(a) Nato(a), nascido(a) no exterior';

	value TP_ST_CONCLUSAO
		1='J� conclu� o Ensino M�dio'
		2='Estou cursando e concluirei o Ensino M�dio em 2024'	
		3='Estou cursando e concluirei o Ensino M�dio ap�s 2024'
		4='N�o conclu� e n�o estou cursando o Ensino M�dio';

    value TP_ANO_CONCLUIU
        0= 'N�o informado'
        1= '2023'
        2= '2022'
        3= '2021'
        4= '2020'
        5= '2019'
        6= '2018'
        7= '2017'
        8= '2016'
        9= '2015'
        10= '2014'
        11= '2013'
        12= '2012'
        13= '2011'
        14= '2010'
        15= '2009'
        16= '2008'
        17= '2007'
        18= 'Antes de 2007';

	value TP_ENSINO
		1='Ensino Regular'
		2='Educa��o Especial - Modalidade Substitutiva';

	value TP_ESTADO_CIVIL
		0='N�o informado'
		1='Solteiro(a)'
		2='Casado(a)/Mora com um(a) companheiro(a)'
		3='Divorciado(a)/Desquitado(a)/Separado(a)'
		4='Vi�vo(a)';

	value TP_COR_RACA
		0='N�o declarado'
		1='Branca'
		2='Preta'
		3='Parda'
		4='Amarela'
		5='Ind�gena'
		6='N�o disp�e da informa��o';

	value TP_FAIXA_ETARIA
		1  = 'Menor de 17 anos'
		2  = '17 anos'
		3  = '18 anos'
		4  = '19 anos'
		5  = '20 anos'
		6  = '21 anos'
		7  = '22 anos'
		8  = '23 anos'
		9  = '24 anos'
		10 = '25 anos'
		11 = 'Entre 26 e 30 anos'
		12 = 'Entre 31 e 35 anos'
		13 = 'Entre 36 e 40 anos'
		14 = 'Entre 41 e 45 anos'
		15 = 'Entre 46 e 50 anos'
		16 = 'Entre 51 e 55 anos'
		17 = 'Entre 56 e 60 anos'
		18 = 'Entre 61 e 65 anos'
		19 = 'Entre 66 e 70 anos'
		20 = 'Maior de 70 anos';
				
	value $Qum
        A= 'Nunca estudou.'
        B= 'N�o completou a 4� s�rie/5� ano do Ensino Fundamental.'
        C= 'Completou a 4� s�rie/5� ano, mas n�o completou a 8� s�rie/9� ano do Ensino Fundamental.'
        D= 'Completou a 8� s�rie/9� ano do Ensino Fundamental, mas n�o completou o Ensino M�dio.'
        E= 'Completou o Ensino M�dio, mas n�o completou a Faculdade.'
        F= 'Completou a Faculdade, mas n�o completou a P�s-gradua��o.'
        G= 'Completou a P�s-gradua��o.'
        H= 'N�o sei.';

	value $Qdois
        A= 'Nunca estudou.'
        B= 'N�o completou a 4� s�rie/5� ano do Ensino Fundamental.'
        C= 'Completou a 4� s�rie/5� ano, mas n�o completou a 8� s�rie/9� ano do Ensino Fundamental.'
        D= 'Completou a 8� s�rie/9� ano do Ensino Fundamental, mas n�o completou o Ensino M�dio.'
        E= 'Completou o Ensino M�dio, mas n�o completou a Faculdade.'
        F= 'Completou a Faculdade, mas n�o completou a P�s-gradua��o.'
        G= 'Completou a P�s-gradua��o.'
        H= 'N�o sei.';

	value $Qtres
        A= 'Grupo 1: Lavrador, agricultor sem empregados, b�ia fria, criador de animais (gado, porcos, galinhas, ovelhas, cavalos etc.), apicultor, pescador, lenhador, seringueiro, extrativista.'
        B= 'Grupo 2: Diarista, empregado dom�stico, cuidador de idosos, bab�, cozinheiro (em casas particulares), motorista particular, jardineiro, faxineiro de empresas e pr�dios, vigilante, porteiro, carteiro, office-boy, vendedor, caixa, atendente de loja, auxiliar administrativo, recepcionista, servente de pedreiro, repositor de mercadoria.'
        C= 'Grupo 3: Padeiro, cozinheiro industrial ou em restaurantes, sapateiro, costureiro, joalheiro, torneiro mec�nico, operador de m�quinas, soldador, oper�rio de f�brica, trabalhador da minera��o, pedreiro, pintor, eletricista, encanador, motorista, caminhoneiro, taxista.'
        D= 'Grupo 4: Professor (de ensino fundamental ou m�dio, idioma, m�sica, artes etc.), t�cnico (de enfermagem, contabilidade, eletr�nica etc.), policial, militar de baixa patente (soldado, cabo, sargento), corretor de im�veis, supervisor, gerente, mestre de obras, pastor, microempres�rio (propriet�rio de empresa com menos de 10 empregados), pequeno comerciante, pequeno propriet�rio de terras, trabalhador aut�nomo ou por conta pr�pria.'
        E= 'Grupo 5: M�dico, engenheiro, dentista, psic�logo, economista, advogado, juiz, promotor, defensor, delegado, tenente, capit�o, coronel, professor universit�rio, diretor em empresas p�blicas ou privadas, pol�tico, propriet�rio de empresas com mais de 10 empregados.'
        F= 'N�o sei.';
		
	value $Qquatro
        A= 'Grupo 1: Lavradora, agricultora sem empregados, b�ia fria, criadora de animais (gado, porcos, galinhas, ovelhas, cavalos etc.), apicultora, pescadora, lenhadora, seringueira, extrativista.'
        B= 'Grupo 2: Diarista, empregada dom�stica, cuidadora de idosos, bab�, cozinheira (em casas particulares), motorista particular, jardineira, faxineira de empresas e pr�dios, vigilante, porteira, carteira, office-boy, vendedora, caixa, atendente de loja, auxiliar administrativa, recepcionista, servente de pedreiro, repositora de mercadoria.'
        C= 'Grupo 3: Padeira, cozinheira industrial ou em restaurantes, sapateira, costureira, joalheira, torneira mec�nica, operadora de m�quinas, soldadora, oper�ria de f�brica, trabalhadora da minera��o, pedreira, pintora, eletricista, encanadora, motorista, caminhoneira, taxista.'
        D= 'Grupo 4: Professora (de ensino fundamental ou m�dio, idioma, m�sica, artes etc.), t�cnica (de enfermagem, contabilidade, eletr�nica etc.), policial, militar de baixa patente (soldado, cabo, sargento), corretora de im�veis, supervisora, gerente, mestre de obras, pastora, microempres�ria (propriet�ria de empresa com menos de 10 empregados), pequena comerciante, pequena propriet�ria de terras, trabalhadora aut�noma ou por conta pr�pria.'
        E= 'Grupo 5: M�dica, engenheira, dentista, psic�loga, economista, advogada, ju�za, promotora, defensora, delegada, tenente, capit�, coronel, professora universit�ria, diretora em empresas p�blicas ou privadas, pol�tica, propriet�ria de empresas com mais de 10 empregados.'
        F= 'N�o sei.';

	value Qcinco
        1= '1, pois moro sozinho(a).'
        2= '2'
        3= '3'
        4= '4'
        5= '5'
        6= '6'
        7= '7'
        8= '8'
        9= '9'
        10= '10'
        11= '11'
        12= '12'
        13= '13'
        14= '14'
        15= '15'
        16= '16'
        17= '17'
        18= '18'
        19= '19'
        20= '20';

	value $Qseis
        A= 'N�o'
        B= 'Sim';

	value $Qsete
        A='Nenhuma Renda'
		B='At� R$ 1.412,00.'
		C='De R$ 1.412,01 at� R$ 2.118,00.'
		D='De R$ 2.118,01 at� R$ 2.824,00.'
		E='De R$ 2.824,01 at� R$ 3.530,00.'
		F='De R$ 3.530,01 at� R$ 4.236,00.'
		G='De R$ 4.236,01 at� R$ 5.648,00.'
		H='De R$ 5.648,01 at� R$ 7.060,00.'
		I='De R$ 7.060,01 at� R$ 8.472,00.'
		J='De R$ 8.472,01 at� R$ 9.884,00.'
		K='De R$ 9.884,01 at� R$ 11.296,00.'
		L='De R$ 11.296,01 at� R$ 12.708,00.'
		M='De R$ 12.708,01 at� R$ 14.120,00.'
		N='De R$ 14.120,01 at� R$ 16.944,00.'
		O='De R$ 16.944,01 at� R$ 21.180,00.'
		P='De R$ 21.180,01 at� R$ 28.240,00.'
		Q='Acima de R$ 28.240,00.';

	value $Qoito
		A='N�o.'
		B='Sim, um ou dois dias por semana.'
		C='Sim, tr�s ou quatro dias por semana.'
		D='Sim, pelo menos cinco dias por semana.';

	value $Qnove
		A='N�o.'
		B='Sim, um.'
		C='Sim, dois.'
		D='Sim, tr�s ou mais.';

	value $Qdez
		A='N�o.'
		B='Sim, um.'
		C='Sim, dois.'
		D='Sim, tr�s ou mais.';

	value $Qonze
		A='N�o.'
		B='Sim, um.'
		C='Sim, dois.'
		D='Sim, tr�s ou mais.';

	value $Qdoze
		A='N�o.'
		B='Sim, um.'
		C='Sim, dois.'
		D='Sim, tr�s ou mais.';

	value $Qtreze
		A='N�o.'
		B='Sim, um.'
		C='Sim, dois.'
		D='Sim, tr�s ou mais.';

	value $Qcatorze
		A='N�o.'
		B='Sim';

	value $Qquinze
		A='N�o.'
		B='Sim';

	value $Qdezesseis
		A='N�o.'
		B='Sim';

	value $Qdezessete
		A='N�o.'
		B='Sim';

	value $Qdezoito
		A='N�o.'
		B='Sim, uma.'
		C='Sim, duas.'
		D='Sim, tr�s ou mais.';

	value $Qdezenove
		A='N�o.'
		B='Sim';

	value $Qvinte
		A='N�o.'
		B='Sim';

	value $Qvinteum
		A='N�o.'
		B='Sim, um.'
		C='Sim, dois.'
		D='Sim, tr�s.'
		E='Sim, quatro ou mais.';

	value $Qvintedois
		A='N�o'
		B='Sim, um'
		C='Sim, dois'
		D='Sim, tr�s ou mais'
		E='Sim, quatro ou mais';

	value $Qvintetres
		A='Somente em escola p�blica.'
		B='Parte em escola p�blica e parte em escola privada sem bolsa de estudo integral.'
		C='Parte em escola p�blica e parte em escola privada com bolsa de estudo integral.'
		D='Somente em escola privada sem bolsa de estudo integral.'
		E='Somente em escola privada com bolsa de estudo integral.'
		F='N�o frequentei escola de Ensino M�dio.';
	
run;

DATA WORK.PARTICIPANTES_2024;
INFILE 'C:\PARTICIPANTES_2024.csv' /*local do arquivo*/
        LRECL=150
        FIRSTOBS=2
        DLM=';'
        MISSOVER
        DSD ;

    INPUT
        NU_INSCRICAO     : ?? BEST12.
        NU_ANO           : ?? BEST4.
        TP_FAIXA_ETARIA  : ?? BEST2.
        TP_SEXO          : $CHAR1.
        TP_ESTADO_CIVIL  : ?? BEST1.
        TP_COR_RACA      : ?? BEST1.
        TP_NACIONALIDADE : ?? BEST1.
        TP_ST_CONCLUSAO  : ?? BEST1.
        TP_ANO_CONCLUIU  : ?? BEST2.
        TP_ENSINO        : ?? BEST1.
        IN_TREINEIRO     : ?? BEST1.
        CO_MUNICIPIO_PROVA : ?? BEST7.
        NO_MUNICIPIO_PROVA : $CHAR30.
        CO_UF_PROVA      : ?? BEST2.
        SG_UF_PROVA      : $CHAR2.
        Q001             : $CHAR1.
        Q002             : $CHAR1.
        Q003             : $CHAR1.
        Q004             : $CHAR1.
        Q005             : ?? BEST2.
        Q006             : $CHAR1.
        Q007             : $CHAR1.
        Q008             : $CHAR1.
        Q009             : $CHAR1.
        Q010             : $CHAR1.
        Q011             : $CHAR1.
        Q012             : $CHAR1.
        Q013             : $CHAR1.
        Q014             : $CHAR1.
        Q015             : $CHAR1.
        Q016             : $CHAR1.
        Q017             : $CHAR1.
        Q018             : $CHAR1.
        Q019             : $CHAR1.
        Q020             : $CHAR1.
        Q021             : $CHAR1.
        Q022             : $CHAR1.
        Q023             : $CHAR1. ;

ATTRIB IN_TREINEIRO			   FORMAT=IN_TREINEIRO.;
ATTRIB TP_SEXO 				   FORMAT=$TP_SEXO.;
ATTRIB TP_NACIONALIDADE 	   FORMAT=TP_NACIONALIDADE.;
ATTRIB TP_ST_CONCLUSAO 		   FORMAT=TP_ST_CONCLUSAO.;
ATTRIB TP_ANO_CONCLUIU		   FORMAT=TP_ANO_CONCLUIU.;
ATTRIB TP_ENSINO 			   FORMAT=TP_ENSINO.;
ATTRIB TP_ESTADO_CIVIL 		   FORMAT=TP_ESTADO_CIVIL.;
ATTRIB TP_COR_RACA 			   FORMAT=TP_COR_RACA.;
ATTRIB TP_FAIXA_ETARIA		   FORMAT=TP_FAIXA_ETARIA.;
ATTRIB Q001                    FORMAT=$Qum.;
ATTRIB Q002                    FORMAT=$Qdois.;
ATTRIB Q003                    FORMAT=$Qtres.;
ATTRIB Q004                    FORMAT=$Qquatro.;
ATTRIB Q005                    FORMAT=Qcinco.;
ATTRIB Q006                    FORMAT=$Qseis.;
ATTRIB Q007                    FORMAT=$Qsete.;
ATTRIB Q008                    FORMAT=$Qoito.;
ATTRIB Q009                    FORMAT=$Qnove.;
ATTRIB Q010                    FORMAT=$Qdez.;
ATTRIB Q011                    FORMAT=$Qonze.;
ATTRIB Q012                    FORMAT=$Qdoze.;
ATTRIB Q013                    FORMAT=$Qtreze.;
ATTRIB Q014                    FORMAT=$Qcatorze.;
ATTRIB Q015                    FORMAT=$Qquinze.;
ATTRIB Q016                    FORMAT=$Qdezesseis.;
ATTRIB Q017                    FORMAT=$Qdezessete.;
ATTRIB Q018                    FORMAT=$Qdezoito.;
ATTRIB Q019                    FORMAT=$Qdezenove.;
ATTRIB Q020                    FORMAT=$Qvinte.;
ATTRIB Q021                    FORMAT=$Qvinteum.;
ATTRIB Q022                    FORMAT=$Qvintedois.;
ATTRIB Q023                    FORMAT=$Qvintetres.;

LABEL

NU_INSCRICAO = 'N�mero de inscri��o'
NU_ANO = 'Ano do Enem'
IN_TREINEIRO = 'Indica se o inscrito fez a prova com intuito de apenas treinar seus conhecimentos'
TP_FAIXA_ETARIA = 'Faixa Et�ria'
TP_SEXO = 'Sexo'
TP_NACIONALIDADE = 'Nacionalidade'
TP_ST_CONCLUSAO = 'Situa��o de conclus�o do Ensino M�dio'
TP_ANO_CONCLUIU = 'Ano de Conclus�o do Ensino M�dio'
TP_ENSINO = 'Tipo de institui��o que concluiu ou concluir� o Ensino M�dio'
TP_ESTADO_CIVIL = 'Estado Civil'
TP_COR_RACA = 'Cor/ra�a'
CO_MUNICIPIO_PROVA = 'C�digo do munic�pio da aplica��o da prova'
NO_MUNICIPIO_PROVA = 'Nome do munic�pio da aplica��o da prova'
CO_UF_PROVA = 'C�digo da Unidade da Federa��o da aplica��o da prova'
SG_UF_PROVA = 'Sigla da Unidade da Federa��o da aplica��o da prova'
Q001 = 'At� que s�rie seu pai, ou o homem respons�vel por voc�, estudou?'
Q002 = 'At� que s�rie sua m�e, ou a mulher respons�vel por voc�, estudou?'
Q003 = 'A partir da apresenta��o de algumas ocupa��es divididas em grupos ordenados, indique o grupo que contempla a ocupa��o mais pr�xima da ocupa��o do seu pai ou do homem respons�vel por voc�. (Se ele n�o estiver trabalhando, escolha uma ocupa��o pensando no �ltimo trabalho dele).'
Q004 = 'A partir da apresenta��o de algumas ocupa��es divididas em grupos ordenados, indique o grupo que contempla a ocupa��o mais pr�xima da ocupa��o da sua m�e ou da mulher respons�vel por voc�. (Se ela n�o estiver trabalhando, escolha uma ocupa��o pensando no �ltimo trabalho dela).'
Q005 = 'Incluindo voc�, quantas pessoas moram atualmente em sua resid�ncia?'
Q006 = 'Voc� possui renda?'
Q007 = 'Qual � a renda mensal de sua fam�lia? (Considere a sua renda com a das pessoas que moram com voc�.)'
Q008 = 'Em sua casa, voc� ou a pessoa respons�vel pela sua fam�lia costuma contratar os servi�os de um(a) empregado(a) dom�stico(a)?'
Q009 = 'Em sua casa, existe banheiro?'
Q010 = 'Em sua casa, existe quarto para dormir?'
Q011 = 'Incluindo voc�, as pessoas com quem voc� mora t�m carro?'
Q012 = 'Incluindo voc�, as pessoas com quem voc� mora t�m motocicleta?'
Q013 = 'Em sua casa, existe geladeira?'
Q014 = 'Em sua casa, existe freezer independente (vertical ou horizontal)? (N�o considere a segunda porta da geladeira.)'
Q015 = 'Em sua casa, existe m�quina de lavar roupa? (N�o considere o tanquinho.)'
Q016 = 'Em sua casa, existe micro-ondas?'
Q017 = 'Em sua casa, existe aspirador de p�?'
Q018 = 'Em sua casa, existe aparelho de TV?'
Q019 = 'Em sua casa, existe TV por assinatura?'
Q020 = 'Em sua casa, existe acesso � internet por rede wi-fi?'
Q021 = 'Em sua casa, existe computador/notebook?'
Q022 = 'Incluindo voc�, as pessoas com quem voc� mora t�m telefone celular?'
Q023 = 'Em que tipo de escola voc� frequentou ou frequenta o Ensino M�dio?';

IF NU_INSCRICAO = . THEN DELETE;

RUN;