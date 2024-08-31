{$codepage utf-8}
program algoritmos;
uses crt,dos;

const
  N=4;

type
  //registro sebastian
  Rsocio=record
      categoria:string;
      nombre:string;
      apellido:string;
      edad:byte;
      dni:string;
      precio:integer;
      codigo:integer;
      alta:boolean;
  end;
  //registro camila
  tDatos = record
                         nombre : string;
                         apellido : string;
                         edad : byte;
                         sexo: string;
                         DNI: longint;
                         Fcontratacion: string;
                         Email : string;
                         domicilio: string;
                         telefono : string;
                         baja : boolean;
                         categoria : string;
                      end;
 //registro yoel
    type
  Tcliente = record
    Nombre: string[25];
    Apellido: string[35];
    Sexo: string;
    Edad: byte;
    Documento: string;
    Telefono: string;
    Mail: string;
    Categoria: char;
    baja: boolean;
  end;
   //array yoel
   Vcliente = array[1..N] of Tcliente;
   //array sebastian
  Vsocios = array [1..N] of Rsocio;
  //array camila
  vectorD = array [1..N] of tDatos;

var
op,op2,opc,opP,opB ,opSub, opM,opE,opcarga :char;
opmenu,CantidadCargado,SocioBuscado,i,IdABuscar,CantidadSocios,CodigoFactura:byte;
Socio:Vsocios;
Datos : tDatos;
vecDatos : vectorD;
cont, indice : integer;
dniBuscado: longint;
Cliente: Vcliente;
opcion,opfactura: char;
Idcliente: byte;
g, opMod: byte;








procedure menu(opmenu:byte);



begin

clrscr;
case opmenu of
1:  begin
gotoxy (1,2);
write ('------------------------------------------------------------------------------------------------------------------------');
gotoxy (1,25);
write ('------------------------------------------------------------------------------------------------------------------------');
gotoxy(1,27);
write ('------------------------------------------------------------------------------------------------------------------------');
gotoxy(51,1);
write('MENU PRINCIPAL');
gotoxy(48,4);
write('<A>');
gotoxy(48,5);
write('<B>');
gotoxy(48,6);
write('<C>');
gotoxy(48,7);
write('<D>');
gotoxy(48,8);
write('<S>');
gotoxy(52,4);
write('PERSONAL');
gotoxy(52,5);
write('DESTINATARIO');
gotoxy(52,6);
write('BIENES');
gotoxy(52,7);
write('FACTURACION');
gotoxy(52,8);
write('SALIR');
gotoxy(53,10);
write('OPCION');
 end;
2:begin
 gotoxy(51,1);
 write('SOCIOS');
 gotoxy (1,2);
 write ('------------------------------------------------------------------------------------------------------------------------');
 gotoxy (1,25);
 write ('------------------------------------------------------------------------------------------------------------------------');
 gotoxy(1,27);
 write ('------------------------------------------------------------------------------------------------------------------------');
gotoxy(48,4);
write('<A>');
gotoxy(48,5);
write('<B>');
gotoxy(48,6);
write('<C>');
gotoxy(48,7);
write('<S>');
gotoxy(52,4);
write('CARGAR SOCIO');
gotoxy(52,5);
write('MODIFICAR SOCIO');
gotoxy(52,6);
write('MOSTRAR SOCIO');
gotoxy(52,7);
write('SALIR');
gotoxy(53,8);
write('OPCION');
end;
3:begin
 gotoxy (1,2);
 write ('------------------------------------------------------------------------------------------------------------------------');
 gotoxy (1,25);
 write ('------------------------------------------------------------------------------------------------------------------------');
 gotoxy(1,27);
 write ('------------------------------------------------------------------------------------------------------------------------');
     gotoxy(51,1);
     write('MENU CARGA');
     gotoxy(49,3);
     write('SELECCIONE EL DEPORTE');
     gotoxy(50,5);
     write('<A>');
     gotoxy(50,6);
     write('<B>');
     gotoxy(50,7);
     write('<C>');
     gotoxy(50,8);
     write('<D>');
     gotoxy(54,5);
     write('FUTBOL');
     gotoxy(54,6);
     write('BASKET');
     gotoxy(54,7);
     write('VOLEY');
     gotoxy(54,8);
     write('GOLF');
     gotoxy(53,11);
     write('OPCION');
end;
4:begin
clrscr();
gotoxy(51,1);
write('MENU DE MODIFICACION');
gotoxy (1,2);
write ('------------------------------------------------------------------------------------------------------------------------');
gotoxy (1,25);
write ('------------------------------------------------------------------------------------------------------------------------');
gotoxy(1,27);
write ('------------------------------------------------------------------------------------------------------------------------');
gotoxy(48,4);
write('<A>');
gotoxy(48,5);
write('<B>');
gotoxy(48,6);
write('<C>');
gotoxy(48,7);
write('<D>');
gotoxy(48,8);
write('<E>');
gotoxy(48,9);
write('<S>');
gotoxy(52,4);
write('MODIFICAR NOMBRE');
gotoxy(52,5);
write('MODIFICAR EDAD');
gotoxy(52,6);
write('MODIFICAR DNI');
gotoxy(52,7);
write('DARESE DE BAJA');
gotoxy(52,8);
write('MODIFICAR DEPORTE');
gotoxy(52,9);
write('SALIR');
gotoxy(53,11);
write('OPCION');

end;
5:begin
  gotoxy (1,2);
 write ('------------------------------------------------------------------------------------------------------------------------');
 gotoxy (1,25);
 write ('------------------------------------------------------------------------------------------------------------------------');
 gotoxy(1,27);
 write ('------------------------------------------------------------------------------------------------------------------------');
 gotoxy(51,1);
 write('MUESTRA DE SOCIO');
 gotoxy(1,26);
 write('Presione enter para salir');
end;
end;
end;

//funcion sebastian
function BuscarDatos (Socio:Vsocios;CantidadSocios:byte;CodigoBuscado:byte):byte;
var
i:byte;
begin
for i := 1 to CantidadSocios do
begin
if Socio[i].codigo=CodigoBuscado then
result := CodigoBuscado;
exit;
end;

end;

//funcion yoel
function BuscarClientePorId(IdABuscar: byte; Cliente: Vcliente; Idcliente: byte): Tcliente;
var
  i: byte;
  ClienteEncontrado: Tcliente;
begin
  ClienteEncontrado := Cliente[1];
  for i := 1 to Idcliente do
  begin
    if (i = IdABuscar) and (not Cliente[i].baja) then
    begin
      ClienteEncontrado := Cliente[i];
    end;
  end;
  BuscarClientePorId := ClienteEncontrado;
end;

//funcion camila
function BuscarDni (vecDatos: vectorD; cont: integer; dniBuscado: longint): integer;
                 var
                    i : integer;
                 begin
                      for i := 1 to cont do begin
                          if (vecDatos[i].dni = dniBuscado) and (vecDatos[i].baja = false) then begin
                             buscarDni := i;
                          end;
                      end;

                 end;

//procedimiento yoel
Procedure DECORACION();
Begin
  textcolor(5);
  gotoxy (1,1);
  writeln ('========================================================================================================================');
  gotoxy (1,3);
  writeln ('========================================================================================================================');
  gotoxy (1,25);
  writeln ('========================================================================================================================');
  textcolor(7);
end;

procedure cargacliente(var Cliente: Vcliente; var Idcliente: byte; var i: byte);
 var
   opcion:char;
begin
  i := i + 1;
  Idcliente := i;

  if (i > N) then
  begin
    clrscr();
    gotoxy(50, 1);
    write('Máximo número de socios alcanzado');
    readln();
  end;

  if (i <= N) then
  begin
    clrscr();
    DECORACION();
    with(Cliente[Idcliente]) do begin
      gotoxy(50, 2);
      writeln('Archivo Socios');
      gotoxy(47, 6);
      writeln('Codigo de Socio: ', Idcliente);
      gotoxy(47,8);
      write('Nombre: ');
      gotoxy(47,9);
      write('Apellido: ');
      gotoxy(47,10);
      write('Edad: ');
      gotoxy(47,11);
      write('Sexo <F> Femenino o <M> Masculino: ');
      gotoxy(47,12);
      write('Documento: ');
      gotoxy(47,13);
      write('Telefono: ');
      gotoxy(47,14);
      write('Email: ');
      gotoxy(47,15);
      write('Categoria: ');
      baja := false;
      writeln;
      writeln;

      gotoxy(54,8);
      readln(Nombre);
      gotoxy(56,9);
      readln(Apellido);
      gotoxy(52,10);
      repeat
      readln(Edad);
      until(Edad>1) and (Edad<=100);
      repeat
        gotoxy(81,11);
        readln(Sexo);
        Sexo := upcase(Sexo);
        if(Sexo='F') then
        begin
          Sexo:='Femenino';
        end;
        if(Sexo='M') then
        begin
          Sexo:='Masculino';
        end;
      until (Sexo = 'Masculino') or (Sexo = 'Femenino');
      gotoxy(57,12);
      readln(Documento);
      gotoxy(56,13);
      readln(Telefono);
      gotoxy(53,14);
      readln(Mail);
      gotoxy(57,15);
      readln(Categoria);
      Categoria:=upcase(Categoria);
      if(Idcliente=Idcliente) then begin
             repeat
        gotoxy(45,26);
        write('SEGURO QUE QUIERE CARGAR AL USUARIO');
        gotoxy(45,27);
        write('Presione<C> para cancelar');
        gotoxy(45,28);
        write('Presione<A> para confirmar');
        gotoxy(45,29);
        write('Opción: ');
        gotoxy(52,29);
        readln(opcion);
        opcion:=upcase(opcion);
        until(opcion='C') or (opcion='A');
        if(opcion='A') then begin
          clrscr();
          DECORACION();
          gotoxy(50, 2);
          write('archivo Socio');
          gotoxy(50,15);
          write('SOCIO CARGADO');
          delay(3000);
          end;
         if(opcion='C') then begin
         Idcliente:=Idcliente-1;
         i:=i-1;
         clrscr();
         DECORACION();
         gotoxy(50, 2);
         write('archivo Socio');
         gotoxy(50,15);
         write('CANCELACÓN DE LA CARGA...');
         delay(3000);
    end;
        end;

      end;
    end;
  end;

procedure VerClientes(Clientes: Vcliente; Idcliente: byte);
var
  i: byte;
  IdABuscar: byte;
  ClienteEncontrado: Tcliente;
begin
  clrscr();
  DECORACION();

  if (Idcliente < 1) then
  begin
    gotoxy(50,2);
    writeln('Archivo Socios');
    gotoxy(50,15);
    writeln('No se cargaron datos');
    delay(3000);
  end
  else
  begin
    clrscr();
    DECORACION();
    gotoxy(50,2);
    writeln('Archivo Socios');
    writeln;
    writeln('Lista de Socios');

    for i := 1 to Idcliente do
      writeln('Cliente: ' , i , 'ID');
    gotoxy(45, 26);
    write('Ingrese el ID del Socio a ver: ');
    gotoxy(77, 26);
    readln(IdABuscar);

    if(IdABuscar <= Idcliente) then
    begin
      ClienteEncontrado := BuscarClientePorId(IdABuscar, Clientes, Idcliente);

      if (not ClienteEncontrado.baja) then
      begin
        clrscr();
        DECORACION();
        with(ClienteEncontrado) do begin
          gotoxy(50,2);
          write('Archivo Socio');
          gotoxy(45,5);
          writeln(IdABuscar, '-Socio');
          gotoxy(45,6);
          writeln('Nombre: ', Nombre);
          gotoxy(45,7);
          writeln('Apellido: ', Apellido);
          gotoxy(45,8);
          writeln('Edad: ', Edad);
          gotoxy(45,9);
          writeln('Sexo: ', Sexo);
          gotoxy(45,10);
          writeln('Documento: ', Documento);
          gotoxy(45,11);
          writeln('Telefono: ',Telefono);
          gotoxy(45,12);
          writeln('Email: ', Mail);
          gotoxy(45,13);
          writeln('Categoria: ', Categoria);
        end;
        readln();
      end
      else
      begin
        clrscr();
        DECORACION();
        gotoxy(50,2);
        write('Archivo Socio');
        gotoxy(50,15);
        writeln('Socio eliminado');
        delay(3000);
      end;
    end
    else
    begin
      clrscr();
      DECORACION();
      gotoxy(50,2);
      write('Archivo Socios');
      gotoxy(50,15);
      writeln('Socio no encontrado');
      delay(3000);
    end;
  end;
end;

procedure ModificarCliente(var Cliente: Vcliente; var Idcliente: byte);
var
  Nuevaid: byte;
  M:byte;
begin
  if (Idcliente < 1) then
  begin
    clrscr();
    DECORACION();
    gotoxy(50, 2);
    write('Modificar Socio');
    gotoxy(50,20);
    writeln('No se cargaron datos');
    delay(3000);
  end
  else
  begin
    clrscr();
    DECORACION();
    gotoxy(50, 2);
    write('Modificar Socio');
    gotoxy(40,15);
    writeln('Ingrese la ID del Socio a modificar: ');
    gotoxy(81,15);
    readln(Nuevaid);
    M:=Nuevaid;
     if (M=Nuevaid) then begin
       repeat
        gotoxy(40,16);
        write('SEGURO QUE QUIERE MODIFICAR AL USUARIO');
        gotoxy(40,17);
        write('Presione<C> para cancelar');
        gotoxy(40,18);
        write('Presione<A> para confirmar');
        gotoxy(40,19);
        write('Opción: ');
        gotoxy(47,19);
        readln(op);
        op:=upcase(op);
        until(op='C') or (op='A');
     end;
     if(op='C') then begin
      clrscr();
      DECORACION();
      gotoxy(50, 2);
      write('Modificar Socio');
      gotoxy(50,15);
      write('CANCELACÓN DE LA MODIFICACIÓN...');
      delay(3000);
    end
    else
    begin

       if(Nuevaid<>Idcliente) then begin
         gotoxy(40,27);
         write('Socio no encontrado o eliminado');
         readln();

      end
      else
      begin

    if (Nuevaid > 0) and (Nuevaid <= Idcliente) then
    begin

         with(Cliente[Idcliente])do begin
          clrscr();
          DECORACION();
          gotoxy(50,2);
          write('Modificando Socio');
          gotoxy(30,5);
          writeln(Idcliente, '-Socio');
          gotoxy(30,6);
          writeln('Nombre: ', Nombre);
          gotoxy(30,7);
          writeln('Apellido: ', Apellido);
          gotoxy(30,8);
          writeln('Edad: ', Edad);
          gotoxy(30,9);
          writeln('Sexo: ', Sexo);
          gotoxy(30,10);
          writeln('Documento: ', Documento);
          gotoxy(30,11);
          writeln('Telefono: ',Telefono);
          gotoxy(30,12);
          writeln('Email: ', Mail);
          gotoxy(30,13);
          writeln('Categoria: ', Categoria);
         end;
       with(Cliente[Nuevaid]) do begin
        gotoxy(60,5);
        writeln(Nuevaid, '-Socio');
        gotoxy(60,6);
        write('Nombre: ');
        gotoxy(60,7);
        write('Apellido: ');
        gotoxy(60,8);
        write('Edad: ');
        gotoxy(60,9);
        write('Sexo <F> Femenino o <M> Masculino: ');
        gotoxy(60,10);
        write('Documento: ');
        gotoxy(60,11);
        write('Telefono: ');
        gotoxy(60,12);
        write('Email: ');
        gotoxy(60,13);
        write('Categoria: ');
        gotoxy(67,6);
        readln(Nombre);
        gotoxy(69,7);
        readln(Apellido);
        repeat
          gotoxy(65,8);
          readln(Edad);
        until(Edad>1) and (Edad<=100);
        repeat
          gotoxy(95,9);
          readln(Sexo);
          Sexo := upcase(Sexo);
            if(Sexo='F') then
             begin
              Sexo:='Femenino';
             end;
            if(Sexo='M') then
             begin
              Sexo:='Masculino';
             end;
        until (Sexo = 'Masculino') or (Sexo = 'Femenino');
        gotoxy(70,10);
        readln(Documento);
        gotoxy(69,11);
        readln(Telefono);
        gotoxy(66,12);
        readln(Mail);
        gotoxy(70,13);
        readln(Categoria);
        Categoria:=upcase(Categoria);
            end;
         end;
       end;
     end;
   end;
  end;

procedure DarDeBaja(var Cliente: Vcliente; var Idcliente: byte);
var
  nuevaid: byte;
  L:byte;
  op:char;
begin
  clrscr();

  if (Idcliente < 1) then
  begin
    DECORACION();
    gotoxy(50, 2);
    write('Eliminar Socio');
    gotoxy(50,15);
    writeln('No se cargaron datos');
    delay(3000);
  end
  else
  begin
    clrscr();
    DECORACION();
    gotoxy(50, 2);
    write('Eliminar Socio');
    gotoxy(40,15);
    writeln('Ingrese el ID del Socio a eliminar: ');
    gotoxy(77,15);
    readln(nuevaid);
    L:=nuevaid;
     if (L=nuevaid) then begin
       repeat
        gotoxy(40,16);
        write('SEGURO QUE QUIERE ELIMINAR AL USUARIO');
        gotoxy(40,17);
        write('Presione<C> para cancelar');
        gotoxy(40,18);
        write('Presione<A> para confirmar');
        gotoxy(40,19);
        write('Opción: ');
        gotoxy(47,19);
        readln(op);
        op:=upcase(op);
        until(op='C') or (op='A');
     end;
    if(op='C') then begin
      clrscr();
      DECORACION();
      gotoxy(50, 2);
      write('Eliminar Socio');
      gotoxy(50,15);
      write('CANCELACÓN DE LA ELIMINACION...');
      delay(3000);
    end
    else
    begin
    if (nuevaid > 0) and (nuevaid <= Idcliente) and (not Cliente[nuevaid].baja) then
    begin
      Cliente[nuevaid].baja := true;

      gotoxy(50,27);
      write('Socio eliminado');
      readln();
    end
    else
    begin
      clrscr();
      DECORACION();
      gotoxy(50,2);
      write('Eliminar Socio');
      gotoxy(30,15);
      write('No existe ningún Socio con esa ID o el socio ya está marcado como eliminado.');
      readln();
      end;
    end;
  end;
 end;

procedure MenuCliente(var op: char);
begin
  repeat
    repeat
      clrscr();
      DECORACION();
      gotoxy(50, 2);
      write('Menu Socios');
      gotoxy(46, 5);
      write('A)_Cargar Socio');
      gotoxy(46, 7);
      write('B)_Mostrar Socio');
      gotoxy(46, 9);
      write('C)_Modificar Socio');
      gotoxy(46, 11);
      write('D)_Eliminar Socio');
      gotoxy(46, 13);
      write('E)_Salir');
      gotoxy(46, 15);
      write('Opcion: ');
      gotoxy(53, 15);
      readln(op);
      op := upcase(op);
    until (op = 'A') or (op = 'B') or (op = 'C') or (op = 'D') or (op = 'E');
    case (op) of
      'A':
      begin
        cargacliente(Cliente, Idcliente, i );
      end;
      'B':
      begin
        VerClientes(Cliente, Idcliente);
      end;
      'C':
      begin
        ModificarCliente(Cliente, Idcliente);
      end;
      'D':
      begin
        DarDeBaja(Cliente, Idcliente);
      end;
      'E':
      begin
        clrscr();
        DECORACION();
        gotoxy(50, 2);
        write('SALIR');
        gotoxy(50, 14);
        write('Presione (E) nuevamente para salir');
        gotoxy(50, 15);
        write('Presione otra tecla para volver al menú');
        gotoxy(50,16);
        write('Opcion: ');
        gotoxy(58, 16);
        readln(op);
        op := upcase(op);

        if (op = 'E') then
        begin
          clrscr();
          DECORACION();
          gotoxy(50,2);
          write('SALIR');
          gotoxy(50,15);
          write('SALIENDO DEL SISTEMA...');
          delay(2000);
        end
        else
        begin
          clrscr();
          DECORACION();
          gotoxy(50,2);
          write('VOLVER');
          gotoxy(50,15);
          write('VOLVIENDO AL MENU...');
          delay(2000);
        end;
      end;
    end;
  until (op = 'E');
end;

//procedimientos sebastian
procedure BorrarLineas (x:Byte;y:byte);

begin
gotoxy(x,y);
ClrEol;
end;

procedure CargarSocio (Var Socio:Vsocios;var CantidadSocios:byte);

var
opcategoria,opcarga,opmenu:char;
i:byte;

begin

    repeat
    i:=CantidadSocios+1;
    CantidadSocios:=i;
    Socio[i].codigo:=i;
    Socio[i].alta := true;
    ClrScr();
    gotoxy (1,2);
    write ('------------------------------------------------------------------------------------------------------------------------');
    gotoxy (1,25);
    write ('------------------------------------------------------------------------------------------------------------------------');
    gotoxy(1,27);
    write ('------------------------------------------------------------------------------------------------------------------------');
    gotoxy(50,4);
    write('Ingrese su nombre:');
    gotoxy(50,5);
    write('Ingrese su apellido:');
    gotoxy(50,6);
    write('Ingrese su dni:');
    gotoxy(50,7);
    write('Ingrese su edad:');
    gotoxy(70,4);
    readln(Socio[i].nombre);
    gotoxy(71,5);
    readln(Socio[i].apellido);
    gotoxy(67,6);
    readln(Socio[i].dni);
    gotoxy(68,7);
    readln(Socio[i].edad);
    repeat
    gotoxy(1,26);
    write('seleccione la categoria');
    menu(3);
    opcategoria:=readkey ;
    opcategoria:=upcase(opcategoria);
    if (opcategoria = 'A') or (opcategoria = 'C') or (opcategoria = 'B') or (opcategoria = 'D') then begin

    case opcategoria of
         'A':begin
            Socio[i].categoria:='Futbol';
            Socio[i].precio:= 2000;
            end;
          'B':begin
            Socio[i].categoria:='Basket';
            Socio[i].precio:= 1700;
         end;
           'C':begin
            Socio[i].categoria:='voley';
            Socio[i].precio:= 1500;

         end;
            'D':begin
            Socio[i].categoria:='golf';
            Socio[i].precio:= 3000;
            end;
    end
    end else begin
    write('la opcion es incorrecta');
    end;

    until (opcategoria = 'A')or(opcategoria = 'B')or(opcategoria = 'C')or(opcategoria = 'D');
    repeat
         ClrScr;
         gotoxy(1, 2);
         write('------------------------------------------------------------------------------------------------------------------------');
         gotoxy(1, 25);
         write('------------------------------------------------------------------------------------------------------------------------');
         gotoxy(1, 27);
         write('------------------------------------------------------------------------------------------------------------------------');
         gotoxy(50, 4);
         write('¿Está seguro de cargar el usuario? (S/N): ');
         opmenu := upcase(readkey);
         if (opmenu = 'N') then
         begin
           BorrarLineas(1, 26);
           gotoxy(1, 26);
           write('No se cargó el socio.');
         end
         else if (opmenu <> 'S') then
         begin
           gotoxy(1, 26);
           write('Opción no válida. Presione S para confirmar o N para cancelar.');
         end;
       until (opmenu = 'S') or (opmenu = 'N');

       if opmenu = 'S' then
       begin
         CantidadSocios := i;
         BorrarLineas(1, 26);
         gotoxy(1, 26);
         write('Su código de socio es: ', Socio[i].codigo);
       end;

       gotoxy(41, 26);
       write('Para salir presione S');
       gotoxy(75, 26);
       write('Para cargar otro socio presione Enter');
       opcarga := readkey;
       opcarga := upcase(opcarga);
     until opcarga = 'S'
   end;

procedure MostrarRegistro (Socio:Vsocios;CantidadSocios:byte);
var
CodigoBuscado,i:byte;
begin
gotoxy(1,26);
Write('ingrese su codigo:');
gotoxy(20,26);
ReadLn(CodigoBuscado);
clrscr();
menu(5);
for i:= 1 to CantidadSocios do
begin
if Socio[i].codigo = CodigoBuscado then begin
gotoxy(51,4);
write('Nombre: ',Socio[i].nombre);
gotoxy(51,5);
write('Categoria: ',Socio[i].categoria);
gotoxy(51,6);
write('Precio: ',Socio[i].precio);
gotoxy(51,7);
write('Edad: ',Socio[i].edad);
gotoxy(51,8);
write('DNI: ',Socio[i].dni);
gotoxy(51,9);
write('Codigo: ',Socio[i].codigo);

end;
end;
if Socio[i].alta = false then begin
ClrScr;
GotoXY(51,1);
Write('La membrecia esta dada de baja');
end;
readln();
end;

procedure ModificarSocio (var Socio:Vsocios;CantidadSocios:byte);
var
i,CodigoBuscado,NuevaEdad:byte;
op3,opcategoria:char;
NuevoNombre,NuevoDni,NuevaCategoria:string;


begin


gotoxy(1,26);
write('ingrse el codigo del cliente a modificar');
gotoxy(42,26);
readln(CodigoBuscado);
i:=BuscarDatos(Socio,CantidadSocios,CodigoBuscado);
if i = CodigoBuscado then

menu(4);

repeat

op3:=readkey;
op3:=Upcase(op3);
case op3 of
 'A': begin
   BorrarLineas(1,26);
   gotoxy(1,26);
 write('ingrese el nuevo nombre:');
 gotoxy(26,26);
 readln(NuevoNombre);
 Socio[i].nombre:=NuevoNombre;
   BorrarLineas(1,26);

 end;

 'B':begin
 BorrarLineas(1,26);
 gotoxy(1,26);
 write('ingrese la nueva edad:');
 gotoxy(23,26);
 readln(Socio[i].edad);
   BorrarLineas(1,26);

 end;

 'C':begin
   BorrarLineas(1,26);
   gotoxy(1,26);
 write('ingrese el nuevo dni:');
 gotoxy(22,26);
 readln(Socio[i].dni);
   BorrarLineas(1,26);

 end;
 'D':begin
   BorrarLineas(1,26);
   gotoxy(1,26);
 write('Dado de baja');
 Socio[i].alta:=false;
   Delay(2000);
   BorrarLineas(1,26);
 end;

 'E':begin
 write('seleccione el nuevo deporte');
 repeat
    write('seleccione el deporte');
    menu(3);
    opcategoria:=readkey ;
    opcategoria:=upcase(opcategoria);
    if (opcategoria = 'A') or (opcategoria = 'C') or (opcategoria = 'B') or (opcategoria = 'D') then begin

    case opcategoria of
         'A':begin
            Socio[i].categoria:='Futbol';
            Socio[i].precio:= 2000;
            end;
          'B':begin
            Socio[i].categoria:='Basket';
            Socio[i].precio:= 1000;
         end;
           'C':begin
            Socio[i].categoria:='Voley';
            Socio[i].precio:= 1500;
         end;
            'D':begin
            Socio[i].categoria:='Golf';
            Socio[i].precio:= 3000;
         end;
    end;
    menu(4);
    end  else begin
    write('la opcion es incorrecta');
    end;

    until (opcategoria = 'A')or(opcategoria = 'B')or(opcategoria = 'C')or(opcategoria = 'D');


 end;

end;

until op3='S' ;
end;

//procedimientos camila
procedure AgregarDatos (var vecDatos: vectorD; var cont : integer);
	          begin
                       clrscr();
                       textcolor (11);
                       gotoxy (50,1);
                       write ('MENU CARGAR EMPLEADO');

                       if (cont < N) then begin
		           cont := cont + 1;
		           textcolor(15);
                           gotoxy (45,5);
                           write ('Empleado nº: ',cont);
                           gotoxy(45,6);
                           write ('Categoria: ');
                           gotoxy (49,7);
                           write ('<1> Personal administrativo');
                           gotoxy (49,8);
                           write ('<2> Personal de limpieza');
                           gotoxy (49,9);
                           write ('<3> Dirigente');
                           gotoxy(49,10);
                           write ('<4> Entrenador/a ');
                           gotoxy (49,11);
                           write ('Opcion: ');
                           gotoxy(45, 12);
                           write('Nombre: ');
                           gotoxy(45,13);
                           write('Apellido: ');
                           gotoxy(45, 14);
                           write('Edad: ');
                           gotoxy(45,15);
                           write ('Sexo <F> o <M>: ');
                           gotoxy(45,16);
                           write ('DNI: ');
                           gotoxy(45,17);
                           write('Fecha de Contratacion: ');
                           gotoxy(45,18);
                           write('E-mail: ');
                           gotoxy(45,19);
                           write('Domicilio: ');
	                   gotoxy(45,20);
                           write('Telefono: ');
                           repeat
                                 gotoxy (57,11);
                                 readln(vecDatos[cont].categoria);
                                 case (vecDatos[cont].categoria) of
                                      '1' : begin
                                               vecDatos[cont].categoria := 'Personal administrativo'
                                          end;
                                      '2' : begin
                                               vecDatos[cont].categoria := 'Personal de limpieza'
                                          end;
                                      '3' : begin
                                               vecDatos[cont].categoria := 'Dirigente'
                                          end;
                                      '4' : begin
                                               vecDatos[cont].categoria := 'Entrenador/a'
                                          end;
                                 end;
                           until (vecDatos[cont].categoria = 'Personal administrativo') or
                                 (vecDatos[cont].categoria = 'Personal de limpieza') or
                                 (vecDatos[cont].categoria = 'Dirigente') or
                                 (vecDatos[cont].categoria = 'Entrenador/a');
                           gotoxy (54,12);
                           readln(vecDatos[cont].nombre);
                           gotoxy (55,13);
                           readln(vecDatos[cont].apellido);
                           gotoxy(51,14);
                           readln(vecDatos[cont].edad);
                           repeat
                                 gotoxy(61,15);
                                 readln(vecDatos[cont].sexo);
                                 vecDatos[cont].sexo := upcase(vecDatos[cont].sexo);
                                 if(vecDatos[cont].sexo='F') then begin
                                  vecDatos[cont].sexo:='Femenino';
                                 end;
                                 if(vecDatos[cont].sexo='M') then begin
                                              vecDatos[cont].sexo:='Masculino';
                                 end;
                           until (vecDatos[cont].sexo = 'Masculino') or (vecDatos[cont].sexo = 'Femenino');
                           gotoxy(50,16);
                           readln(vecDatos[cont].dni);
                           gotoxy(68,17);
                           readln(vecDatos[cont].Fcontratacion);
                           gotoxy(53,18);
                           readln(vecDatos[cont].email);
                           gotoxy(56,19);
                           readln(vecDatos[cont].domicilio);
                           gotoxy(55,20);
                           readln(vecDatos[cont].telefono);
                           vecDatos [cont].baja := false;
                       end else begin
                           textcolor (4);
                           gotoxy (45,25);
                           write ('No se pueden cargar mas empleados');
                           delay (2000);
                       end;
                  end;

procedure subMenuTrabajador (var opSub : char);
	          begin
                       clrscr();
                       textcolor (11);
                       gotoxy (50,1);
                       write ('MENU EMPLEADOS');
                       textcolor(15);
                       gotoxy (1,26);
                       write ('<ESC> para salir');
                       gotoxy (45,6);
                       write('<A> Agregar');
                       gotoxy (45,7);
                       write('<B> Modificar');
                       gotoxy(45,8);
                       write('<C> Eliminar');
                       gotoxy (45,9);
                       write ('<D> Mostrar');
                       gotoxy (45,10);
                       write ('<E> Buscar');
                       gotoxy (45,12);
                       write('Opcion: ');
                       repeat
                              gotoxy (53,12);
                              opSub := readkey();
                              opSub:=Upcase(opSub);
                              if (opSub <> 'A') and (opSub <> 'B') and (opSub <> 'C')and (opSub <> 'D') and (opSub <> 'E')then begin
                                 gotoxy (53,12);
                                 clreol;
                                 textcolor (4);
                                 gotoxy(1,28);
                                 write ('Opcion no valida');
                              end;
                       until (opSub = 'A') or (opSub = 'B') or (opSub = 'C')or (opSub = 'D') or (opSub = 'E') or (ord (opsub) = 27);
		  end;

procedure ConfGuardar(var opC: char);
                  begin
                       repeat
                             clrscr();
                             textcolor (11);
                             gotoxy(50, 1);
                             write('CONFIRMACION');
                             textcolor (15);
                             gotoxy(45, 6);
                             write('¿Desea guardar los datos?');
                             textcolor (4);
                             gotoxy(20, 10);
                             write('<N> No');
                             textcolor (2);
                             gotoxy(70, 10);
                             write('<S> Si');
                             opC := readkey();
                             opC := upcase(opC);
                       until (opC ='N') or (opC = 'S');
                  end;

procedure preguntar ( opP : char ; opConf : char );
                  var
                     opPreguntar : string;
                  begin
                       repeat
                       clrscr();
                       textcolor (11);
                       gotoxy (50,1);
                       write ('CONFIRMACION');
                       case (opConf) of
                            '1' : begin
                                       opPreguntar := 'agregando';
                                  end;
                            '2' : begin
                                       opPreguntar := 'modificando';
                                  end;
                            '3' : begin
                                       opPreguntar := 'eliminando';
                                  end;
                            '4' : begin
                                       opPreguntar := 'mostrando';
                                  end;
                            '5' : begin
                                       opPreguntar := 'buscando';
                                  end;
                       end;
                       textcolor (15);
                       gotoxy (45,6);
                       write ('¿Desea seguir ',opPreguntar,'?');
                       textcolor (4);
                       gotoxy (20,10);
                       write ('<ESC> Salir');
                       textcolor (2);
                       gotoxy (70,10);
                       write ('<ENTER> Continuar');
                       opP:= readkey ();
                       opP:= upcase (opP);

                       until (ord (opP) = 27 ) or (ord (opP) = 13) ;

                  end;

procedure ModificarDatos(var vecDatos : vectorD; indice: integer);
                  var
                     i: byte;
                  begin
		           repeat
		             clrscr();
                             textcolor (12);
		             gotoxy (45,10);
                             write ('¿Qué desea modificar?');
                             textcolor (15);
			     gotoxy (45,14);
                             write ('<1> Email');
			     gotoxy (45,15);
                             write ('<2> Domicilio');
			     gotoxy (45,16);
                             write ('<3> Telefono');
			     gotoxy (45,18);
			     write ('opcion: ');

                             textcolor(12);
                             gotoxy (10,10);
                             write ('DATOS ACTUALES');
                             textcolor (15);
                             gotoxy(5,14);
                             write ('Email: ',vecDatos[indice].email);
                             gotoxy(5,15);
                             write ('Domicilio: ',vecDatos[indice].domicilio);
                             gotoxy (5,16);
                             write ('telefono: ',vecDatos[indice].telefono);

                             //solicito nuevos valores//
                             textcolor (12);
                             gotoxy (85,10);
                             write ('DATOS NUEVOS');
                             textcolor(15);
                             gotoxy (85,14);
                             write ('Email: ');
                             gotoxy (85,15);
                             write ('Domicilio: ');;
                             gotoxy (85,16);
                             write ('Telefono: ');
                             gotoxy (53,18);
		             readln (opMod);
		       until (opMod = 1)or (opMod = 2) or (opMod = 3);
		       case (opMod) of
		            1 : begin
			             gotoxy (87,14);
				     readln (vecDatos[indice].email);
			        end;
			    2 : begin
			             gotoxy (91,15);
				     readln (vecDatos[indice].domicilio);
			        end;
			    3 : begin
		                     gotoxy (90,16);
				     readln (vecDatos[indice].email);
			        end;

		       end;


                       end;

procedure mostrar (VecDatos : vectorD; OpM : char);
                   var
                      j, i : byte;

                   begin
                        j:= 7;
                        repeat
                        for i := 1 to cont do begin
                            j := j+1;
                            textcolor (12);
                            gotoxy (20,5);
                            write ('Nombre');
                            gotoxy(45,5);
                            write ('Apellido');
                            gotoxy (70,5);
                            write ('DNI');
                            textcolor (15);
                            gotoxy (20,j);
                            write (vecDatos[i].nombre);
                            gotoxy (45,j);
                            write (vecDatos[i].apellido);
                            gotoxy(70,j);
                            write (vecDatos[i].dni);
                            textcolor (4);
                            gotoxy (30,15);
                            write ('Si desea salir presione <ESC>');
                        end;
                        OpM := readkey();
                        OpM := upcase (OpM);
                        until (ord (OpM) = 27 );
                   end;

procedure eliminar (var VecDatos : vectorD);
                  var
                     opL: char;
                  begin
                        clrscr();
                        textcolor(11);
                        gotoxy (50,1);
                        write ('MENU ELIMINAR');
                        textcolor(12);
                        gotoxy (45,6);
                        write ('Ingrese el DNI: ');
                        readln (dniBuscado);
                        indice := buscarDni (vecDatos, cont, dniBuscado);
                        if (dniBuscado = vecDatos[indice].dni)then begin
                        repeat
                        clrscr();
                        textcolor (15);
                        gotoxy (30,4);
                        write ('Categoria: ',vecDatos[indice].categoria);
                        gotoxy (30,5);
                        write ('Nombre: ',vecDatos[indice].nombre);
                        gotoxy (30,6);
                        write ('Apellido: ',vecDatos[indice].apellido);
                        gotoxy (30,7);
                        write ('Edad: ',vecDatos[indice].edad);
                        gotoxy (30,8);
                        write ('Sexo: ',vecDatos[indice].sexo);
                        gotoxy (30,9);
                        write ('DNI: ',vecDatos[indice].dni);
                        gotoxy (30,10);
                        write ('Fecha de contratacion: ',vecDatos[indice].Fcontratacion);
                        gotoxy (30,11);
                        write ('Email: ',vecDatos[indice].email);
                        gotoxy (30,12);
                        write ('Domicilio: ',vecDatos[indice].domicilio);
                        gotoxy (30,13);
                        write ('Telefono: ',vecDatos[indice].telefono);
                        if (vecDatos[indice].baja = false) then begin
                           gotoxy (30,14);
                           write ('El empleado está dado de alta');
                        end else begin
                            gotoxy (30,14);
                            write ('El empleado está dado de baja');
                        end;

                        repeat
                              textcolor (12);
                              gotoxy (30,16);
                              write ('Desea dar de baja al empleado?');
                              textcolor (2);
                              gotoxy (80,17);
                              write ('<S> si');
                              textcolor(4);
                              gotoxy (20,18);
                              write ('<N> no');
                              textcolor (15);
                              gotoxy (40,19);
                              write ('Opcion: ');
                              opL := readkey ();
                              opL := upcase (opL);
                        until (opL = 'S') or (opL = 'N');
                        if (opL = 'S') then begin
                           vecDatos[indice].baja := true;
                           clrscr();
                           textcolor (4);
                           gotoxy (45,9);
                           write ('El empleado se dió de baja');
                           cont := cont - 1;
                        end;
                        textcolor (4);
                        gotoxy (20,19);
                        write ('Si desea salir presione <ESC>');
                        OpL := readkey();
                        OpL := upcase (OpL);
                       until (ord (opL) = 27);
                       end else begin
                        clrscr();
                        textcolor (4);
                        gotoxy (45,15);
                        write ('Ingrese un DNI válido');
                        delay (2000);
                        end;
                  end;


begin
  Idcliente := 0;
   cont := 0;
  repeat
  menu(1);
  gotoxy(60,10);
  op:= readkey();
  op:= upcase(op);

  case op of
        'B':begin
        MenuCliente(opcion);
        end;
     //parte echa por sebastian
       'C':begin

         repeat
            menu(2);
            op2:= readkey();
            op2:= upcase(op2);
            case op2 of
                  'A': begin

                        CargarSocio(Socio,CantidadSocios);

                        end;

                  'B':begin
                           ModificarSocio(Socio,CantidadSocios);
                       end ;
                  'C':begin
                        MostrarRegistro(Socio,CantidadSocios);
                  end;
            end;

         until (opcarga = 'S') or (op2 = 'S');

       end;

       'A' : begin
       //parte echa por camila
       repeat
       clrscr();
       repeat
       subMenuTrabajador(opSub);



                       case (opSub) of
                            'A' : begin
                                       AgregarDatos (vecDatos,cont);
                                       ConfGuardar(opC);
                                       if (opC = 'S') then begin
                                          preguntar (opP, '1');
                                       end else begin
                                           cont := cont - 1;
                                           preguntar (opP,'1');
                                       end;

                                  end;
                            'B' : begin
                                       if (cont > 0) then begin
                                           clrscr();
                                           textcolor(11);
                                           gotoxy(50,1);
                                           write ('MENU MODIFICAR');
                                           g := 11;
                                           for i := 1 to cont do begin
                                           if (vecDatos[cont].baja = false) then begin
                                              textcolor(12);
                                              gotoxy (20,10);
                                              write ('EMPLEADOS');
                                              g := g +1;
                                              textcolor(15);
                                              gotoxy (20,g);
                                              write (vecDatos[i].apellido);
                                              textcolor (12);
                                              gotoxy (45,10);
                                              write ('DNI');
                                              textcolor (15);
                                              gotoxy (45,g);
                                              write (vecDatos[i].dni);
                                           end;
                                           end;
                                           textcolor (12);
                                           gotoxy (80,10);
                                           write ('DNI del empleado a modificar: ');
                                           readln (dniBuscado);
                                           indice := buscarDni (vecDatos, cont, dniBuscado);
                                           modificarDatos (vecDatos, indice);
                                       end else begin
                                           clrscr();
                                           textcolor(4);
                                           gotoxy (40,6);
                                           write ('No hay cargado ningún empleado');
                                           delay (2000);
                                       end;
                                  end;
                            'C' : begin
                                       if (cont > 0) then begin
                                          eliminar (VecDatos);
                                       end else begin
                                           clrscr();
                                           textcolor(4);
                                           gotoxy (40,6);
                                           write ('No hay cargado ningún empleado');
                                           delay (2000);
                                       end;
                                  end;
                            'D' : begin
                                       if (cont > 0) then begin
                                          clrscr();
                                          textcolor(11);
                                          gotoxy (50,1);
                                          write ('MENU MOSTRAR');
                                          mostrar (vecDatos, OpM);
                                       end else begin
                                           clrscr();
                                           textcolor(4);
                                           gotoxy (40,6);
                                           write ('No hay cargado ningún empleado');
                                           delay (2000);
                                       end;
                                  end;
                            'E' : begin
                                       if (cont > 0) then begin

                                             clrscr();
                                             textcolor(11);
                                             gotoxy (50,1);
                                             write ('MENU BUSCAR');
                                             textcolor (12);
                                             gotoxy (45,6);
                                             write ('Ingrese el DNI: ');
                                             readln (dniBuscado);
                                             indice := buscarDni (vecDatos, cont, dniBuscado);
                                             if (dniBuscado = vecDatos[indice].dni)then begin
                                                repeat
                                                 clrscr();
                                                 textcolor (15);
                                                 gotoxy (30,4);
                                                 write ('Categoria: ',vecDatos[indice].categoria);
                                                 gotoxy (30,5);
                                                 write ('Nombre: ',vecDatos[indice].nombre);
                                                 gotoxy (30,6);
                                                 write ('Apellido: ',vecDatos[indice].apellido);
                                                 gotoxy (30,7);
                                                 write ('Edad: ',vecDatos[indice].edad);
                                                 gotoxy (30,8);
                                                 write ('Sexo: ',vecDatos[indice].sexo);
                                                 gotoxy (30,9);
                                                 write ('DNI: ',vecDatos[indice].dni);
                                                 gotoxy (30,10);
                                                 write ('Fecha de contratacion: ',vecDatos[indice].Fcontratacion);
                                                 gotoxy (30,11);
                                                 write ('Email: ',vecDatos[indice].email);
                                                 gotoxy (30,12);
                                                 write ('Domicilio: ',vecDatos[indice].domicilio);
                                                 gotoxy (30,13);
                                                 write ('Telefono: ',vecDatos[indice].telefono);
                                                 if (vecDatos[indice].baja = false) then begin
                                                    textcolor (2);
                                                    gotoxy (30,14);
                                                    write ('El empleado está dado de alta');
                                                 end else begin
                                                     textcolor (4);
                                                     gotoxy (30,14);
                                                     write ('El empleado está dado de baja');

                                                 end;
                                                 textcolor (4);
                                                 gotoxy (1,26);
                                                 write ('<ESC> para salir');
                                                 OpB := readkey();
                                                 OpB := upcase (OpB);
                                                 until (ord (opB) = 27) ;
                                             end else begin
                                                 clrscr();
                                                 textcolor (4);
                                                 gotoxy (45,15);
                                                 write ('Ingrese un DNI válido');
                                                 delay (2000);
                                             end;

                                             preguntar (opP, '5');


                                       end else begin
                                           clrscr();
                                           textcolor(4);
                                           gotoxy (40,6);
                                           write ('No hay cargado ningún empleado');
                                           delay (2000);
                                       end;

                            end;
                       end;

                       until (ord (opSub)= 27 );
                       textcolor(15);

  until (ord (opSub)= 27 );

       end;
       'D':begin
       repeat
           gotoxy(1,26);
           write('Ingrese el código de factura:');
           readln(CodigoFactura);

               if (CodigoFactura > 0) and (CodigoFactura <= CantidadSocios) then
                begin
                SocioBuscado := BuscarDatos(Socio, CantidadSocios, CodigoFactura);

                    if (SocioBuscado <> -1) and (Socio[SocioBuscado].alta) then
                     begin

                       Idcliente := Socio[SocioBuscado].codigo;
                         if (Idcliente > 0) and (Idcliente <= cont) then
                          begin
                            ClrScr;
                            gotoxy (1,2);
                            write ('------------------------------------------------------------------------------------------------------------------------');
                            gotoxy (1,25);
                            write ('------------------------------------------------------------------------------------------------------------------------');
                            gotoxy(1,27);
                            write ('------------------------------------------------------------------------------------------------------------------------');
                            gotoxy(50,1);
                            write('Factura');
                            gotoxy(50,4);
                            write('Código de factura: ', CodigoFactura);
                            gotoxy(50,5);
                            write('Datos del socio:');
                            gotoxy(50,6);
                            write('Nombre: ', Socio[SocioBuscado].nombre);
                            gotoxy(50,7);
                            write('Apellido: ', Socio[SocioBuscado].apellido);
                            gotoxy(50,8);
                            write('Categoría: ', Socio[SocioBuscado].categoria);
                            gotoxy(50,9);
                            write('Precio: ', Socio[SocioBuscado].precio);
                            gotoxy(50,10);
                            write('Datos del cliente:');
                            gotoxy(50,11);
                            write('Nombre: ', Cliente[Idcliente].Nombre);
                            gotoxy(50,12);
                            write('Apellido: ', Cliente[Idcliente].Apellido);
                            gotoxy(50,13);
                            write('Datos del empleado:');
                            gotoxy(50,14);
                            write('Nombre: ', vecDatos[Idcliente].Nombre);
                            gotoxy(50,15);
                            write('Apellido: ', vecDatos[Idcliente].Apellido);

                              end
                        else
                          writeln('ID de cliente no válido.');
                      end
                      else
                        writeln('Socio no válido o inactivo.');
                    end
                    else
                      writeln('Código de factura no válido.');
                      gotoxy(1,26);
                      write('Para salir presione S');
         opfactura:=ReadKey;
         opfactura:= upcase(opfactura);
       until opfactura= 'S' ;
end;


  end;
  until op = 'S' ;
end.
