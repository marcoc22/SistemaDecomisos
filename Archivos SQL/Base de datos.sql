conn system/root


alter table ActaDevolucion drop constraint ActaDevolucion_fk;
alter table ActaDevolucion drop constraint ActaDevolucion_fk1;
alter table ActaDevolucion drop constraint ActaDevolucion_fk2;
alter table Objeto drop constraint Objeto_fk; 
alter table Objeto drop constraint Objeto_fk1;
alter table ActaDonacion drop constraint ActaDonacion_fk; 
alter table ActaDonacion drop constraint ActaDonacion_fk1;
alter table ActaDecomiso drop constraint ActaDecomiso_fk; 
alter table ActaDecomiso drop constraint ActaDecomiso_fk1;
alter table PoliciaMunicipal drop constraint PoliciaMunidipal_fk; 
alter table ActaDestruccion drop constraint ActaDestruccion_fk;

drop table Funcionario;
drop table PoliciaMunicipal;
drop table Interesado;
drop table ActaDecomiso;
drop table ActaDonacion;
drop table Objeto;
drop table ActaDevolucion;
drop table UsuarioM;
drop table ActaDestruccion;
drop user muni cascade;

create user muni identified by muni123;
grant dba to muni;

conn muni/muni123;

create table Funcionario
(IdFuncionario varchar2(20)not null,
nombre varchar2(40)not null,
puesto varchar2(20)
);

create table PoliciaMunicipal
(IdPolicia number not null,
IdFuncionario varchar2(20)not null,
nombre varchar2(20)not null
);

create table Interesado
(IdInteresado varchar2(20)not null,
nombre varchar2(40)not null,
fechanac date,
residencia varchar2(40)not null
);


create table ActaDecomiso
(IdDecomiso number not null,
IdPolicia number not null,
IdInteresado varchar2(20)not null,
lugar varchar2(30),
fecha date,
Idacompanante varchar2(20)not null,
observaciones varchar2(40)
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
IdInteresado varchar2(20)not null,
IdDecomiso number not null
);

create table ActaDestruccion
(IdDestruccion number not null,
fecha date,
lugar varchar2(20)not null,
Encargado varchar2(20)not null,
IdDecomiso number not null);

create table ActaDevolucion
(
IdDevolucion number not null,
IdPolicia number not null,
IdDecomiso number not null,
IdInteresado varchar2(20)not null,
fecha date
);


create table UsuarioM
(IdUser varchar2(15)not null,
contrasena varchar2(15)not null,
IdFuncionario varchar2(20)not null);







alter table ActaDecomiso add constraint ActaDecomiso_pk primary key(IdDecomiso);
alter table ActaDestruccion add constraint ActaDestruccion_pk primary key(IdDestruccion);
alter table ActaDevolucion add constraint ActaDevolucion_pk primary key(IdDevolucion);
alter table UsuarioM add constraint UsuarioM_pk primary key(IdUser);
alter table PoliciaMunicipal add constraint PoliciaMunicipal_pk primary key(IdPolicia);
alter table Funcionario add constraint Funcionario_pk primary key(IdFuncionario);
alter table Objeto add constraint Objeto_pk primary key(IdObjeto);
alter table Interesado add constraint Interesado_pk primary key(IdInteresado);
alter table ActaDonacion add constraint ActaDonacion_pk primary key(IdDonacion);




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

alter table PoliciaMunicipal add constraint PoliciaMunidipal_fk
foreign key (IdFuncionario) references Funcionario;
alter table ActaDestruccion add constraint ActaDestruccion_fk
foreign key(IdDecomiso) references ActaDecomiso;


PROMPT PRC_INS_REG
create or replace procedure prc_ins_user
(PIdUser in varchar2,
Pcontrasena in varchar2,
PIdFuncionario in varchar2
)is
begin
insert into UsuarioM(IdUser,contrasena,IdFuncionario)
values(PIdUser,Pcontrasena,PIdFuncionario);
commit;
end prc_ins_user;
/
show error;

insert into Funcionario (IdFuncionario,nombre,puesto) values ('12','Mario','Jefe');
exec prc_ins_user('2','123','12');

