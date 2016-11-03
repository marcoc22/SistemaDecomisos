alter table ActaDevolucion drop constraint ActaDevolucion_fk;
alter table ActaDevolucion drop constraint ActaDevolucion_fk1;
alter table ActaDevolucion drop constraint ActaDevolucion_fk2;
alter table Objeto drop constraint Objeto_fk; 
alter table Objeto drop constraint Objeto_fk1;
alter table ActaDonacion drop constraint ActaDonacion_fk; 
alter table ActaDonacion drop constraint ActaDonacion_fk1;
alter table ActaDecomiso drop constraint ActaDecomiso_fk; 
alter table ActaDecomiso drop constraint ActaDecomiso_fk1;
alter table ActaDecomiso drop constraint ActaDecomiso_fk2;
alter table PoliciaMunicipal drop constraint PoliciaMunidipal_fk; 
alter table ActaDestruccion drop constraint ActaDestruccion_fk;
alter table ActaDestruccion drop constraint ActaDestruccion_fk1;
alter table ActaDestruccion drop constraint ActaDestruccion_fk2;
drop sequence cod_id_int;
drop sequence cod_id_test;
drop sequence sequence_obj;
drop sequence sequence_adecomiso;
drop sequence sequence_adonacion;
drop sequence sequence_adevolucion;
drop sequence sequence_adestruccion;
drop sequence sequence_func;
drop sequence sequence_user;
drop sequence sequence_policia;

drop table Funcionario;
drop table PoliciaMunicipal;
drop table Interesado;
drop table ActaDecomiso;
drop table ActaDonacion;
drop table Objeto;
drop table ActaDevolucion;
drop table UsuarioM;
drop table ActaDestruccion;
drop table Testigos;

create table Funcionario
(IdFuncionario number not null,
nombre varchar2(40)not null,
puesto varchar2(20)
);

create table PoliciaMunicipal
(IdPolicia number not null,
IdFuncionario number not null,
nombre varchar2(20)not null
);

create table Interesado
(IdInteresado number not null,
cedula varchar2(20)not null,
nombre varchar2(40)not null,
primerapellido varchar2(40)not null,
segundoapellido varchar2(40),
fechanac date,
residencia varchar2(40)not null
);


create table ActaDecomiso
(IdDecomiso number not null,
IdPolicia number not null,
IdInteresado number not null,
lugar number,
fecha date,
Idacompanante number not null,
observaciones varchar2(40),
idtest number
);

create table ActaDonacion
(IdDonacion number not null,
Institucion varchar2(20)not null,
IdPolicia number not null,
IdDecomiso number not null);

create table Objeto
(
IdObjeto number not null,
descripcion varchar2(30)not null,
IdInteresado number not null,
IdDecomiso number not null
);

create table ActaDestruccion
(IdDestruccion number not null,
fecha date,
IdPolicia number not null,
idt1 number,
idt2 number,
lugar varchar2(20)not null,
Encargado varchar2(20)not null,
IdDecomiso number not null);

create table ActaDevolucion
(
IdDevolucion number not null,
IdPolicia number not null,
IdDecomiso number not null,
IdInteresado number not null,
fecha date
);

create table Testigos(
IdTest number,
nombre varchar2(30),
apellido1 varchar2(30),
apellido2 varchar2(30)
);


create table UsuarioM
(IdUser number not null,
contrasena varchar2(15)not null,
IdFuncionario varchar2(20)not null,
nick varchar2(40)not null,
estado number,
privilegio number);





create sequence cod_id_int start with 1 increment by 1;
create sequence cod_id_test start with 1 increment by 1;
create sequence sequence_user start with 1 increment by 1;
create sequence sequence_func start with 1 increment by 1;
create sequence sequence_adecomiso start with 1 increment by 1;
create sequence sequence_adestruccion start with 1 increment by 1;
create sequence sequence_adevolucion start with 1 increment by 1;
create sequence sequence_adonacion start with 1 increment by 1;
create sequence sequence_obj start with 1 increment by 1;
create sequence sequence_policia start with 1 increment by 1;


alter table ActaDecomiso add constraint ActaDecomiso_pk primary key(IdDecomiso);
alter table ActaDestruccion add constraint ActaDestruccion_pk primary key(IdDestruccion);
alter table ActaDevolucion add constraint ActaDevolucion_pk primary key(IdDevolucion);
alter table UsuarioM add constraint UsuarioM_pk primary key(IdUser);
alter table PoliciaMunicipal add constraint PoliciaMunicipal_pk primary key(IdPolicia);
alter table Funcionario add constraint Funcionario_pk primary key(IdFuncionario);
alter table Objeto add constraint Objeto_pk primary key(IdObjeto);
alter table Interesado add constraint Interesado_pk primary key(IdInteresado);
alter table ActaDonacion add constraint ActaDonacion_pk primary key(IdDonacion);
alter table Testigos add constraint Testigos_pk primary key(IdTest);



alter table ActaDevolucion add constraint  ActaDevolucion_fk
foreign key (IdPolicia) references PoliciaMunicipal;
alter table ActaDevolucion add constraint  ActaDevolucion_fk1
foreign key (IdDecomiso) references ActaDecomiso;
alter table ActaDevolucion add constraint  ActaDevolucion_fk2
foreign key (IdInteresado) references Interesado;

alter table Objeto add constraint  Objeto_fk
foreign key (IdDecomiso) references ActaDecomiso;
alter table Objeto add constraint  Objeto_fk1
foreign key (IdInteresado) references Interesado;

alter table ActaDonacion add constraint  ActaDonacion_fk
foreign key (IdPolicia) references PoliciaMunicipal;
alter table ActaDonacion add constraint  ActaDonacion_fk1
foreign key (IdDecomiso) references ActaDecomiso;

alter table ActaDecomiso add constraint ActaDecomiso_fk
foreign key (IdPolicia) references PoliciaMunicipal;
alter table ActaDecomiso add constraint ActaDecomiso_fk1
foreign key (IdInteresado) references Interesado;
alter table ActaDecomiso add constraint ActaDecomiso_fk2
foreign key (Idtest) references Testigos;




alter table PoliciaMunicipal add constraint PoliciaMunidipal_fk
foreign key (IdFuncionario) references Funcionario;
alter table ActaDestruccion add constraint ActaDestruccion_fk
foreign key(IdDecomiso) references ActaDecomiso;
alter table ActaDestruccion add constraint ActaDestruccion_fk1
foreign key(Idt1) references Testigos;
alter table ActaDestruccion add constraint ActaDestruccion_fk2
foreign key(Idt2) references Testigos;

ALTER TABLE Interesado ADD CONSTRAINT Interesado_ck UNIQUE(cedula);
PROMPT PRC_INS_REG

create or replace procedure prc_ins_user
(
Pcontrasena in varchar2,
PIdFuncionario in number,
Pnick in varchar2,
Pestado in number,
Pprivilegio in number
)is
begin
insert into UsuarioM(IdUser,contrasena,IdFuncionario,nick,estado,privilegio)
values(sequence_user.nextval,Pcontrasena,PIdFuncionario,Pnick,Pestado,Pprivilegio);
commit;
end prc_ins_user;
/
show error;


CREATE OR REPLACE PROCEDURE prc_sel_user
(  P_IDUSER IN NUMBER,
   P_CONTRASENA OUT VARCHAR2,
   P_IDFUNC OUT VARCHAR2,
   P_NICK OUT VARCHAR2,
   P_ESTADO OUT NUMBER,
   P_PRIVILEGIO OUT NUMBER
)
AS
BEGIN
   SELECT contrasena,IdFuncionario,nick,estado,privilegio INTO P_CONTRASENA,P_IDFUNC,P_NICK,P_ESTADO,P_PRIVILEGIO      
   FROM UsuarioM 
   WHERE UsuarioM.IdUser = P_IDUSER;
end prc_sel_user;
/
show error;

PROMPT PRC_INS_FUNC
create or replace procedure prc_ins_func
(
Pnombre in varchar2,
Ppuesto in varchar2
)is
begin
insert into Funcionario(IdFuncionario,nombre,puesto)
values(sequence_func.nextval,Pnombre,Ppuesto);
commit;
end prc_ins_func;
/
show error;



CREATE OR REPLACE PROCEDURE prc_sel_func
(  P_IDFUNC IN NUMBER,
   P_NOMBRE OUT VARCHAR2,
   P_PUESTO OUT VARCHAR2
)
AS
BEGIN
   SELECT nombre,puesto INTO P_NOMBRE,P_PUESTO      
   FROM Funcionario 
   WHERE Funcionario.IdFuncionario = P_IDFUNC;
end prc_sel_func;
/
show error;



PROMPT PRC_INS_PM
create or replace procedure prc_ins_pm
(
PIdFuncionario in number,
Pnombre in varchar2
)is
begin
insert into PoliciaMunicipal(IdPolicia,IdFuncionario,nombre)
values(sequence_policia.nextval,PIdFuncionario,Pnombre);
commit;
end prc_ins_pm;
/
show error;

CREATE OR REPLACE PROCEDURE prc_sel_pm
(  P_IDPOL IN number,
   P_IDFUNC OUT number,
   P_NOMBRE OUT VARCHAR2
)
AS
BEGIN
   SELECT IdFuncionario,nombre INTO P_IDFUNC,P_NOMBRE      
   FROM PoliciaMunicipal 
   WHERE PoliciaMunicipal.IdPolicia = P_IDPOL;
end prc_sel_pm;
/
show error;



PROMPT PRC_INS_Int
create or replace procedure prc_ins_int
(
Pnombre in varchar2,
Pcedula in varchar2,
Pprimerapellido in varchar2,
Psegundoapellido in varchar2,
Pfechanac in date,
Presidencia in varchar2
)is
begin
insert into Interesado(IdInteresado,nombre,cedula,primerapellido,segundoapellido,fechanac,residencia)
values(cod_id_int.nextval,Pnombre,Pcedula,Pprimerapellido,Psegundoapellido,Pfechanac,Presidencia);
commit;
end prc_ins_int;
/
show error;


PROMPT PROCEDURE SELECCIONAR INT
CREATE OR REPLACE PROCEDURE prc_sel_int
(  P_IDINT IN NUMBER,
   P_NOMBRE OUT VARCHAR2,
   P_CEDULA OUT VARCHAR2,
   P_PRIMERAPELLIDO OUT VARCHAR2,
   P_SEGUNDOAPELLIDO OUT VARCHAR2,
   P_FECHANAC OUT DATE,
   P_RESIDENCIA OUT VARCHAR2
)
AS
BEGIN
   SELECT nombre,cedula,primerapellido,segundoapellido,fechanac,residencia INTO P_NOMBRE,P_CEDULA,P_PRIMERAPELLIDO,P_SEGUNDOAPELLIDO,P_FECHANAC,P_RESIDENCIA      
   FROM Interesado 
   WHERE Interesado.IdInteresado = P_IDINT;
end prc_sel_int;
/
show error;


PROMPT PRC_INS_OBJ
create or replace procedure prc_ins_obj
(
Pdescripcion in varchar2,
PIdInteresado in number,
PIdDecomiso in number
)is
begin
insert into Objeto(IdObjeto,descripcion,IdInteresado,IdDecomiso)
values(sequence_obj.nextval,Pdescripcion,PIdInteresado,PIdDecomiso);
commit;
end prc_ins_obj;
/
show error;



PROMPT PROCEDURE SELECCIONAR OBJ
CREATE OR REPLACE PROCEDURE prc_sel_obj
( 
P_IDOBJETO IN number,
P_DESCRIPCION OUT varchar2,
P_IDINTERESADO OUT number,
P_IDDECOMISO OUT number
)
AS
BEGIN
   SELECT descripcion,IdInteresado,IdDecomiso INTO P_DESCRIPCION,P_IDINTERESADO,P_IDDECOMISO      
   FROM Objeto 
   WHERE Objeto.IdObjeto = P_IDOBJETO;
end prc_sel_obj;
/
show error;


PROMPT ACTAS

PROMPT PRC_INS_AD
create or replace procedure prc_ins_adecomiso
(PIdDecomiso in number,
PIdPolicia in number,
PIdInteresado in number,
Plugar in number,
Pfecha in date,
PidAcompanante in varchar2,
Pobservaciones in varchar2,
Pidtest in number
)is
begin
insert into ActaDecomiso(IdDecomiso,IdPolicia,IdInteresado,lugar,fecha,idacompanante,observaciones,idtest)
values(PIdDecomiso,PIdPolicia,PIdInteresado,Plugar,Pfecha,PidAcompanante,Pobservaciones,Pidtest);
commit;
end prc_ins_adecomiso;
/
show error;



PROMPT PROCEDURE SELECCIONAR ACTA DECOMISO
CREATE OR REPLACE PROCEDURE prc_sel_adecomiso
(PIdDecomiso in number,
PIdPolicia out number,
PIdInteresado out number,
Plugar out number,
Pfecha out date,
PidAcompanante out varchar2,
Pobservaciones out varchar2,
Pidtest out number
)
AS
BEGIN
   SELECT IdPolicia,IdInteresado,lugar,fecha,idacompanante,observaciones,idtest INTO PIdPolicia,PIdInteresado,Plugar,Pfecha,PidAcompanante,Pobservaciones,Pidtest      
   FROM ActaDecomiso 
   WHERE ActaDecomiso.IdDecomiso = PIdDecomiso;
end prc_sel_adecomiso;
/
show error;





PROMPT PRC_INS_ADONACION
create or replace procedure prc_ins_adonacion
(PIdDonacion in number,
PInstitucion in varchar2,
PIdPolicia in number,
PIdDecomiso in number
)is
begin
insert into ActaDonacion(IdDonacion,Institucion,IdPolicia,IdDecomiso)
values(PIdDonacion,PInstitucion,PIdPolicia,PIdDecomiso);
commit;
end prc_ins_adonacion;
/
show error;



PROMPT PROCEDURE SELECCIONAR ACTA DONACION
CREATE OR REPLACE PROCEDURE prc_sel_adonacion
(PIdDonacion in number,
PInstitucion out varchar2,
PIdPolicia out number,
PIdDecomiso out number
)
AS
BEGIN
   SELECT Institucion,IdPolicia,IdDecomiso INTO PInstitucion,PIdPolicia,PIdDecomiso      
   FROM ActaDonacion 
   WHERE ActaDonacion.IdDonacion = PIdDonacion;
end prc_sel_adonacion;
/
show error;





PROMPT PRC_INS_ADESTRUCCION
create or replace procedure prc_ins_adestruccion
(PIdDestruccion in number,
Pfecha in date,
Pidt1 in number,
Pidt2 in number,
Plugar in varchar2,
PEncargado in varchar2,
PIdDecomiso in number
)is
begin
insert into ActaDestruccion(IdDestruccion,fecha,idt1,idt2,lugar,Encargado,IdDecomiso)
values(PIdDestruccion,Pfecha,Pidt1,Pidt2,Plugar,PEncargado,PIdDecomiso);
commit;
end prc_ins_adestruccion;
/
show error;



PROMPT PROCEDURE SELECCIONAR ACTA DESTRUCCION
CREATE OR REPLACE PROCEDURE prc_sel_adestruccion
(PIdDestruccion in number,
Pfecha out date,
Pidt1 out number,
Pidt2 out number,
Plugar out varchar2,
PEncargado out varchar2,
PIdDecomiso out number

)
AS
BEGIN
   SELECT fecha,idt1,idt2,lugar,Encargado,IdDecomiso INTO Pfecha,Pidt1,Pidt2,Plugar,PEncargado,PIdDecomiso      
   FROM ActaDestruccion 
   WHERE ActaDestruccion.IdDestruccion = PIdDestruccion;
end prc_sel_adestruccion;
/
show error;


PROMPT PRC_INS_ADEVOLUCION
create or replace procedure prc_ins_adevolucion
(PIdDevolucion in number,
PIdPolicia in number,
PIdDecomiso in number,
PIdInteresado in number,
Pfecha in date
)is
begin
insert into ActaDevolucion(IdDevolucion,IdPolicia,IdDecomiso,IdInteresado,fecha)
values(PIdDevolucion,PIdPolicia,PIdDecomiso,PIdInteresado,Pfecha);
commit;
end prc_ins_adevolucion;
/
show error;


PROMPT PROCEDURE SELECCIONAR ACTA DEVOLUCION
CREATE OR REPLACE PROCEDURE prc_sel_adevolucion
(PIdDevolucion in number,
PIdPolicia out number,
PIdDecomiso out number,
PIdInteresado out number,
Pfecha out date

)
AS
BEGIN
   SELECT IdPolicia,IdDecomiso,IdInteresado,fecha INTO PIdPolicia,PIdDecomiso,PIdInteresado,Pfecha      
   FROM ActaDevolucion 
   WHERE ActaDevolucion.IdDevolucion = PIdDevolucion;
end prc_sel_adevolucion;
/
show error;



PROMPT PRC_INS_TESTIGOS
create or replace procedure prc_ins_test
(Pnombre in varchar2,
Papellido1 in varchar2,
Papellido2 in varchar2
)is
begin
insert into Testigos(IdTest,nombre,apellido1,apellido2)
values(cod_id_test.nextval,Pnombre,Papellido1,Papellido2);
commit;
end prc_ins_test;
/
show error;



PROMPT PROCEDURE SELECCIONAR TESTIGOS
CREATE OR REPLACE PROCEDURE prc_sel_test
(PIdTest in number,
Pnombre out varchar2,
Papellido1 out varchar2,
Papellido2 out varchar2
)
AS
BEGIN
   SELECT nombre,apellido1,apellido2 INTO Pnombre,Papellido1,Papellido2      
   FROM Testigos 
   WHERE Testigos.IdTest = PIdTest;
end prc_sel_test;
/
show error;

exec prc_ins_func ('Andrea','Secretaria');
exec prc_ins_user('123',1,'mario',1,1);