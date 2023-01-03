--USURARIOS

alter session set "_oracle_script"=true;

drop user usr_dw cascade;
drop user usr_produccion cascade;
drop user usr_stage cascade;

create user USR_DW identified by DW2022;
create user USR_PRODUCCION identified by PRODUCCION;
create user USR_STAGE identified by STAGE;

GRANT CONNECT, RESOURCE TO USR_DW;
GRANT CONNECT, RESOURCE TO USR_PRODUCCION;
GRANT CONNECT, RESOURCE TO USR_STAGE;

alter user USR_DW quota unlimited on USERS;
alter user USR_PRODUCCION quota unlimited on USERS;
alter user USR_STAGE quota unlimited on USERS;

--CREACION DE TABLAS


 
