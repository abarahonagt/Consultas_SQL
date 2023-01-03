CREATE TABLE STG_TRANSACCION
(   CORRELATIVO         NUMBER(8,0),
    FECHA			    DATE,
    HORA_OCURRENCIA		NUMBER(3,0),
    G_HORA			    NUMBER(3,0),
    G_HORA_5			NUMBER(3,0),
    DEPARTAMENTO		NUMBER(3,0),
    MUNICIPIO			NUMBER(4,0),		
    ZONA_OCURRENCIA		NUMBER(4,0),
    GENERO			    NUMBER(1,0),		
    EDAD_PERSONA		NUMBER(3,0),
    G_EDAD_80_MAS		NUMBER(3,0),
    G_EDAD_60_MAS		NUMBER(3,0),
    EDAD_QUINCENAL		NUMBER(3,0),
    MAYOR_MENOR			NUMBER(1,0),
    TIPO_VEHICULO		NUMBER(2,0),
    MARCA_VEHICULO		NUMBER(3,0),
    COLOR_VEHICULO		NUMBER(3,0),
    MODELO_VEHICULO		NUMBER(4,0),
    G_MODELO_VEHICULO	NUMBER(2,0),
    TIPO_EVENTO			NUMBER(2,0),
    FALLECIDO_LESIONADO	NUMBER(1,0),
    INTERNADO			NUMBER(1,0),
    CANTIDAD_PERSONAS	NUMBER(8,0),	
    GTOS_CALC_PER		NUMBER(10,2),	
    GTOS_CALC_BIE		NUMBER(10,2)
);

CREATE TABLE STG_HORA_OCURRENCIA
(   
	ID_HORA			   	NUMBER(3,0),
	DSC_HORA_OCURRENCIA	VARCHAR2(50)
);

CREATE TABLE STG_G_HORA
(   
	ID_G_HORA		   		NUMBER(3,0),
	DSC_G_HORA_OCURRENCIA	VARCHAR2(50)
);

CREATE TABLE STG_G_HORA_5
(   
	ID_G_HORA_5		NUMBER(3,0),
	DSC_G_HORA_5	VARCHAR2(50)
);

CREATE TABLE STG_DEPARTAMENTO
(   
	ID_DEPARTAMENTO		NUMBER(3,0),
	DSC_DEPARTAMENTO	VARCHAR2(100)
);

CREATE TABLE STG_MUNICIPIO
(   
	ID_MUNICIPIO	NUMBER(4,0),
	DSC_MUNICIPIO	VARCHAR2(100)
);

CREATE TABLE STG_ZONA
(   
	ID_ZONA		NUMBER(4,0),
	DSC_ZONA	VARCHAR2(100)
);

CREATE TABLE STG_GENERO
(   
	ID_GENERO	NUMBER(1,0),
	DSC_GENERO	VARCHAR2(100)
);

CREATE TABLE STG_EDAD
(   
	ID_EDAD		NUMBER(3,0),
	DSC_EDAD	VARCHAR2(100)
);

CREATE TABLE STG_G_EDAD_80_MAS
(   
	ID_G_EDAD_80_MAS   NUMBER(3,0),
	DSC_G_EDAD_80_MAS  VARCHAR2(100)
);

CREATE TABLE STG_G_EDAD_60_MAS
(   
	ID_G_EDAD_60_MAS   NUMBER(3,0),
	DSC_G_EDAD_60_MAS  VARCHAR2(100)
);

CREATE TABLE STG_EDAD_QUINCENAL
(   
	ID_EDAD_QUINCENAL   NUMBER(3,0),
	DSC_EDAD_QUINCENAL  VARCHAR2(100)
);

CREATE TABLE STG_MAYOR_MENOR
(   
	ID_MAYOR_MENOR   NUMBER(1,0),
	DSC_MAYOR_MENOR  VARCHAR2(100)
);

CREATE TABLE STG_TIPO_VEHICULO
(   
	ID_TIPO_VEHICULO   NUMBER(2,0),
	DSC_TIPO_VEHICULO  VARCHAR2(100)
);

CREATE TABLE STG_MARCA_VEHICULO
(   
	ID_MARCA_VEHICULO  NUMBER(3,0),
	DSC_MARCA_VEHICULO VARCHAR2(100)
);

CREATE TABLE STG_COLOR_VEHICULO
(   
	ID_COLOR_VEHICULO  NUMBER(3,0),
	DSC_COLOR_VEHICULO VARCHAR2(100)
);

CREATE TABLE STG_MODELO_VEHICULO
(   
	ID_MODELO_VEHICULO  NUMBER(4,0),
	DSC_MODELO_VEHICULO VARCHAR2(100)
);

CREATE TABLE STG_G_MODELO_VEHICULO
(   
	ID_G_MODELO_VEHICULO  NUMBER(2,0),
	DSC_G_MODELO_VEHICULO VARCHAR2(100)
);

CREATE TABLE STG_TIPO_EVENTO
(   
	ID_TIPO_EVENTO  NUMBER(2,0),
	DSC_TIPO_EVENTO VARCHAR2(100)
);

CREATE TABLE STG_FALLECIDO_LESIONADO
(   
	ID_FALLECIDO_LESIONADO  NUMBER(1,0),
	DSC_FALLECIDO_LESIONADO VARCHAR2(100)
);

CREATE TABLE STG_INTERNADO
(   
	ID_INTERNADO  NUMBER(1,0),
	DSC_INTERNADO VARCHAR2(100)
);

----------------------------------------------------------------------------
--PROCEDIMIENTO
----------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE PR_SINCRONIZACION IS
    BEGIN
        DELETE FROM STG_TRANSACCION;
        DELETE FROM STG_HORA_OCURRENCIA;
        DELETE FROM STG_G_HORA;
        DELETE FROM STG_G_HORA_5;
        DELETE FROM STG_DEPARTAMENTO;
        DELETE FROM STG_MUNICIPIO;
        DELETE FROM STG_ZONA;
        DELETE FROM STG_GENERO;
        DELETE FROM STG_EDAD;
        DELETE FROM STG_G_EDAD_80_MAS;
        DELETE FROM STG_G_EDAD_60_MAS;
        DELETE FROM STG_EDAD_QUINCENAL;
        DELETE FROM STG_MAYOR_MENOR;
        DELETE FROM STG_TIPO_VEHICULO;
        DELETE FROM STG_MARCA_VEHICULO;
        DELETE FROM STG_COLOR_VEHICULO;
        DELETE FROM STG_MODELO_VEHICULO;
        DELETE FROM STG_G_MODELO_VEHICULO;
        DELETE FROM STG_TIPO_EVENTO;
        DELETE FROM STG_FALLECIDO_LESIONADO;
        DELETE FROM STG_INTERNADO;

        
        INSERT INTO STG_TRANSACCION (CORRELATIVO,FECHA, HORA_OCURRENCIA,
            G_HORA,G_HORA_5,DEPARTAMENTO,MUNICIPIO,ZONA_OCURRENCIA,GENERO,
            EDAD_PERSONA, G_EDAD_80_MAS,G_EDAD_60_MAS,EDAD_QUINCENAL,MAYOR_MENOR,
            TIPO_VEHICULO,MARCA_VEHICULO,COLOR_VEHICULO,MODELO_VEHICULO,
            G_MODELO_VEHICULO,TIPO_EVENTO,FALLECIDO_LESIONADO,INTERNADO,
            CANTIDAD_PERSONAS, GTOS_CALC_PER,GTOS_CALC_BIE) SELECT CORRELATIVO,
            FECHA, HORA_OCURRENCIA,
            G_HORA,G_HORA_5,DEPARTAMENTO,MUNICIPIO,ZONA_OCURRENCIA,GENERO,
            EDAD_PERSONA, G_EDAD_80_MAS,G_EDAD_60_MAS,EDAD_QUINCENAL,MAYOR_MENOR,
            TIPO_VEHICULO,MARCA_VEHICULO,COLOR_VEHICULO,MODELO_VEHICULO,
            G_MODELO_VEHICULO,TIPO_EVENTO,FALLECIDO_LESIONADO,INTERNADO,
            CANTIDAD_PERSONAS, GTOS_CALC_PER,GTOS_CALC_BIE 
            FROM USR_PRODUCCION.TRANSACCION;
            
        INSERT INTO STG_HORA_OCURRENCIA SELECT ID_HORA, DSC_HORA_OCURRENCIA FROM
            USR_PRODUCCION.CAT_HORA_OCURRENCIA;
        
        INSERT INTO STG_G_HORA SELECT ID_G_HORA, DSC_G_HORA_OCURRENCIA
            FROM USR_PRODUCCION.CAT_G_HORA;
            
        INSERT INTO STG_G_HORA_5 SELECT ID_G_HORA_5, DSC_G_HORA_5
            FROM USR_PRODUCCION.CAT_G_HORA_5;
        
        INSERT INTO STG_DEPARTAMENTO SELECT ID_DEPARTAMENTO,DSC_DEPARTAMENTO
            FROM USR_PRODUCCION.CAT_DEPARTAMENTO;
            
        INSERT INTO STG_MUNICIPIO SELECT ID_MUNICIPIO, DSC_MUNICIPIO
            FROM USR_PRODUCCION.CAT_MUNICIPIO;
        
        INSERT INTO STG_ZONA SELECT ID_ZONA, DSC_ZONA
            FROM USR_PRODUCCION.CAT_ZONA;
            
        INSERT INTO STG_GENERO SELECT ID_GENERO, DSC_GENERO
            FROM USR_PRODUCCION.CAT_GENERO;
        
        INSERT INTO STG_EDAD SELECT ID_EDAD, DSC_EDAD
            FROM USR_PRODUCCION.CAT_EDAD;
        
        INSERT INTO STG_G_EDAD_80_MAS SELECT ID_G_EDAD_80_MAS, DSC_G_EDAD_80_MAS
            FROM USR_PRODUCCION.CAT_G_EDAD_80_MAS;
            
        INSERT INTO STG_G_EDAD_60_MAS SELECT ID_G_EDAD_60_MAS, DSC_G_EDAD_60_MAS 
            FROM USR_PRODUCCION.CAT_G_EDAD_60_MAS;
        
        INSERT INTO STG_EDAD_QUINCENAL SELECT ID_EDAD_QUINCENAL, DSC_EDAD_QUINCENAL
            FROM USR_PRODUCCION.CAT_EDAD_QUINCENAL;
        
        INSERT INTO STG_MAYOR_MENOR SELECT ID_MAYOR_MENOR, DSC_MAYOR_MENOR
            FROM USR_PRODUCCION.CAT_MAYOR_MENOR;
        
        INSERT INTO STG_TIPO_VEHICULO SELECT ID_TIPO_VEHICULO, DSC_TIPO_VEHICULO 
            FROM USR_PRODUCCION.CAT_TIPO_VEHICULO;
            
        INSERT INTO STG_MARCA_VEHICULO SELECT ID_MARCA_VEHICULO, DSC_MARCA_VEHICULO
            FROM USR_PRODUCCION.CAT_MARCA_VEHICULO;
            
        INSERT INTO STG_COLOR_VEHICULO SELECT ID_COLOR_VEHICULO, DSC_COLOR_VEHICULO
            FROM USR_PRODUCCION.CAT_COLOR_VEHICULO;
            
        INSERT INTO STG_MODELO_VEHICULO SELECT ID_MODELO_VEHICULO, DSC_MODELO_VEHICULO
            FROM USR_PRODUCCION.CAT_MODELO_VEHICULO;
        
        INSERT INTO STG_G_MODELO_VEHICULO SELECT ID_G_MODELO_VEHICULO, DSC_G_MODELO_VEHICULO
            FROM USR_PRODUCCION.CAT_G_MODELO_VEHICULO;
        
        INSERT INTO STG_TIPO_EVENTO SELECT ID_TIPO_EVENTO, DSC_TIPO_EVENTO
            FROM usr_produccion.CAT_TIPO_EVENTO;
            
        INSERT INTO STG_FALLECIDO_LESIONADO SELECT ID_FALLECIDO_LESIONADO, DSC_FALLECIDO_LESIONADO
            FROM USR_PRODUCCION.CAT_FALLECIDO_LESIONADO;
            
        INSERT INTO STG_INTERNADO SELECT ID_INTERNADO, DSC_INTERNADO
            FROM USR_PRODUCCION.CAT_INTERNADO;
    END;

--------------------------
EXECUTE PR_SINCRONIZACION

--------------------------

SELECT * FROM STG_FALLECIDO_LESIONADO
