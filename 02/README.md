# Semestrální práce část 2 - DLM, ETL.

## Zadání

Výstup:
1) datová logická mapa integrovaných dat - názvy atributů v source systému, názvy atributů v target DB, typ historizace apod.
2) upravené DDL s technickými sloupci a správnými klíči
3) ETL procesy pro stage i target (ukázka historizace všech typů) - jeden job, který bude spouštět ostatní transformace, které nahrávají jednotlivé tabulky (co transformace, to tabulka, transformace se nacházejí v transakci)

## Datová logická mapa (DLM)

Datová logická mapa se nachází v souboru DLM/DLM.xlsx

## DDL 

DDL pro stage databázi se nachází v souboru DDL/StageDDL.sql

DDL s technickými sloupci a správnými klíči pro target databázi se nachází v souboru DDL/TargetDDL.sql


## ETL procesy

ETL procesy pro stage se nachází ve složce ETL/Stage

## Ostatní

Ve složce FINANCIAL_DATA se nachází původní datasety potřebné pro ETL procesy pro stage. Ve složce MODELS se nachází model pro stage.
