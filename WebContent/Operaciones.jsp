<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="Lol.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.net.URL" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="org.apache.commons.fileupload.FileItem"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, user-scalable=1.0">
	<link rel="stylesheet" href="assets/bootstrap.css">
	<link rel="shortcut icon" href="images/trofeo.png">
	<title>Leaguepedia | Operaciones</title>
</head>
<body>

<%
			//VARIABLES DE CONTROL
			String mensaje="";
			String operacion="correcta";
			
			//VARIABLES
			BDController controladorBD = new BDController();
			int cod_jugador;
			int cod_equipo;
			int cod_campeonato;
			int cod_sede;
			int cod_region;
			int cod_entrenador;
			int cod_patrocinador;
			String nombre;
			String apodo;
			String nacionalidad;
			String pais_fundacion;
			String fecha_fundacion;
			String categoria;
	        String rol;
			String propietario;
			String fecha_inicio;
			String fecha_fin;
			String siglas;
			String localizacion;
			String fecha_nacimiento;
			String region;
			
			//ALTA SEDE
			if(request.getParameter("tipo").equalsIgnoreCase("altasede")){
				cod_sede = controladorBD.calcularCodSede() + 1;
				
				if(request.getParameter("localizacion").equalsIgnoreCase("")){
					mensaje = mensaje + "La localización de la sede no puede estar vacía.";
					operacion = "incorrecta";
				}else if(operacion.equalsIgnoreCase("correcta")){
					localizacion=request.getParameter("localizacion");
					Sede altaSede = new Sede(cod_sede,localizacion);
					controladorBD.altaSede(altaSede);
					mensaje="Sede dada de alta con éxito.";
				}
			}
			
			//ALTA REGION
			if(request.getParameter("tipo").equalsIgnoreCase("altaregion")){
				cod_region = controladorBD.calcularCodRegion() + 1;
				
				if(request.getParameter("nombreregion").equalsIgnoreCase("")){
					mensaje = mensaje + "El nombre de la región no puede estar vacío.";
					operacion = "incorrecta";
				}else if(request.getParameter("siglas").equalsIgnoreCase("")){
					mensaje = mensaje + "Las siglas de la región no pueden estar vacías.";
					operacion = "incorrecta";
				}else if(operacion.equalsIgnoreCase("correcta")){
					nombre=request.getParameter("nombre");
					siglas=request.getParameter("siglas");
					Region altaRegion = new Region(cod_region,nombre,siglas);
					controladorBD.altaRegion(altaRegion);
					mensaje="Región dada de alta con éxito.";
				}
			}
			
			//ALTA PATROCINADOR
			if(request.getParameter("tipo").equalsIgnoreCase("altapatrocinador")){
				cod_patrocinador = controladorBD.calcularCodPatrocinador() + 1;
				
				if(request.getParameter("nombrepatrocinador").equalsIgnoreCase("")){
					mensaje = mensaje + "El nombre del patrocinador no puede estar vacío.";
					operacion = "incorrecta";
				}else if(operacion.equalsIgnoreCase("correcta")){
					nombre=request.getParameter("nombrepatrocinador");
					Patrocinador altaPatrocinador = new Patrocinador(cod_patrocinador,nombre);
					controladorBD.altaPatrocinador(altaPatrocinador);
					mensaje="Patrocinador dado de alta con éxito.";
				}
			}
			
			//ALTA JUGADOR
			if(request.getParameter("tipo").equalsIgnoreCase("altajugador")){
				cod_jugador = controladorBD.calcularCodJugador() + 1;
				
				if(request.getParameter("nombrejugador").equalsIgnoreCase("")){
					mensaje = mensaje + "El nombre del jugador no puede estar vacío.";
					operacion = "incorrecta";
				}else if(request.getParameter("apodojugador").equalsIgnoreCase("")){
					mensaje = mensaje + "El apodo del jugador no puede estar vacío.";
					operacion = "incorrecta";
				}else if(request.getParameter("nacionalidadjugador").equalsIgnoreCase("")){
					mensaje = mensaje + "La nacionalidad del jugador no puede estar vacío.";
					operacion = "incorrecta";
				}else if(request.getParameter("fecha_nacimientojugador").equalsIgnoreCase("")){
					mensaje = mensaje + "La fecha de nacimiento del jugador no puede estar vacío.";
					operacion = "incorrecta";
				}else if(request.getParameter("roljugador").equalsIgnoreCase("")){
					mensaje = mensaje + "El rol del jugador no puede estar vacío.";
					operacion = "incorrecta";
				}else if(operacion.equalsIgnoreCase("correcta")){
					nombre=request.getParameter("nombrejugador");
					apodo=request.getParameter("apodojugador");
					nacionalidad=request.getParameter("nacionalidadjugador");
					fecha_nacimiento=request.getParameter("fecha_nacimientojugador");
					rol=request.getParameter("roljugador");
					cod_equipo=Integer.parseInt(request.getParameter("cod_jugador"));
					
					Jugador altaJugador = new Jugador(cod_jugador,nombre,apodo,nacionalidad,fecha_nacimiento,rol,cod_equipo);
					controladorBD.altaJugador(altaJugador);
					mensaje="Jugador dado de alta con éxito.";
				}
			}
			
			//ALTA ENTRENADOR
			if(request.getParameter("tipo").equalsIgnoreCase("altaentrenador")){
				cod_jugador = controladorBD.calcularCodJugador() + 1;
				
				if(request.getParameter("nombreentrenador").equalsIgnoreCase("")){
					mensaje = mensaje + "El nombre del entrenador no puede estar vacío.";
					operacion = "incorrecta";
				}else if(request.getParameter("apodoentrenador").equalsIgnoreCase("")){
					mensaje = mensaje + "El apodo del entrenador no puede estar vacío.";
					operacion = "incorrecta";
				}else if(request.getParameter("nacionalidadentrenador").equalsIgnoreCase("")){
					mensaje = mensaje + "La nacionalidad del entrenador no puede estar vacío.";
					operacion = "incorrecta";
				}else if(request.getParameter("fecha_nacimientoentrenador").equalsIgnoreCase("")){
					mensaje = mensaje + "La fecha de nacimiento del entrenador no puede estar vacío.";
					operacion = "incorrecta";
				}else if(request.getParameter("categoria").equalsIgnoreCase("")){
					mensaje = mensaje + "El categoria del entrenador no puede estar vacío.";
					operacion = "incorrecta";
				}else if(operacion.equalsIgnoreCase("correcta")){
					nombre=request.getParameter("nombreentrenador");
					apodo=request.getParameter("apodoentrenador");
					nacionalidad=request.getParameter("nacionalidadentrenador");
					fecha_nacimiento=request.getParameter("fecha_nacimientoentrenador");
					categoria=request.getParameter("categoria");
					cod_equipo=Integer.parseInt(request.getParameter("cod_jugador"));
					
					Entrenador altaEntrenador = new Entrenador(cod_jugador,nombre,apodo,nacionalidad,fecha_nacimiento,categoria,cod_equipo);
					controladorBD.altaEntrenador(altaEntrenador);
					mensaje="Entrenador dado de alta con éxito.";
				}
			}
			
			//ALTA EQUIPO
			if(request.getParameter("tipo").equalsIgnoreCase("altaequipo")){
				cod_equipo = controladorBD.calcularCodEquipo() + 1;
				
				if(request.getParameter("nombreequipo").equalsIgnoreCase("")){
					mensaje = mensaje + "El nombre del equipo no puede estar vacío.";
					operacion = "incorrecta";
				}else if(request.getParameter("pais_fundacion").equalsIgnoreCase("")){
					mensaje = mensaje + "El pais de fundacion del equipo no puede estar vacío.";
					operacion = "incorrecta";
				}else if(request.getParameter("fecha_fundacion").equalsIgnoreCase("")){
					mensaje = mensaje + "La fecha de fundacion del equipo no puede estar vacío.";
					operacion = "incorrecta";
				}else if(request.getParameter("propietario").equalsIgnoreCase("")){
					mensaje = mensaje + "El propietario del equipo no puede estar vacío.";
					operacion = "incorrecta";
				}else if(request.getParameter("cod_sede").equalsIgnoreCase("")){
					mensaje = mensaje + "La sede del equipo no puede estar vacío.";
					operacion = "incorrecta";
				}else if(request.getParameter("cod_region").equalsIgnoreCase("")){
					mensaje = mensaje + "La region del equipo no puede estar vacío.";
					operacion = "incorrecta";
				}else if(operacion.equalsIgnoreCase("correcta")){
					nombre=request.getParameter("nombreequipo");
					pais_fundacion=request.getParameter("pais_fundacion");
					fecha_fundacion=request.getParameter("fecha_fundacion");
					propietario=request.getParameter("propietario");
					cod_sede=Integer.parseInt(request.getParameter("cod_sede"));
					cod_region=Integer.parseInt(request.getParameter("cod_region"));
					
					Equipo altaEquipo = new Equipo(cod_equipo,nombre,pais_fundacion,fecha_fundacion,propietario,cod_sede,cod_region);
					controladorBD.altaEquipo(altaEquipo);
					mensaje="Equipo dado de alta con éxito.";
				}
			}
			
			//ALTA CAMPEONATO
			if(request.getParameter("tipo").equalsIgnoreCase("altacampeonato")){
				cod_campeonato = controladorBD.calcularCodCampeonato() + 1;
				
				if(request.getParameter("nombrecampeonato").equalsIgnoreCase("")){
					mensaje = mensaje + "El nombre del campeonato no puede estar vacío.";
					operacion = "incorrecta";
				}else if(request.getParameter("fecha_inicio").equalsIgnoreCase("")){
					mensaje = mensaje + "La fecha de inicio de fundacion del campeonato no puede estar vacía.";
					operacion = "incorrecta";
				}else if(request.getParameter("fecha_fin").equalsIgnoreCase("")){
					mensaje = mensaje + "La fecha de fin del campeonato no puede estar vacía.";
					operacion = "incorrecta";
				}else if(request.getParameter("region").equalsIgnoreCase("")){
					mensaje = mensaje + "La region del campeonato no puede estar vacío.";
					operacion = "incorrecta";
				}else if(request.getParameter("cod_equipo").equalsIgnoreCase("")){
					mensaje = mensaje + "El equipo ganador del campeonato no puede estar vacío.";
					operacion = "incorrecta";
				}else if(operacion.equalsIgnoreCase("correcta")){
					nombre=request.getParameter("nombrecampeonato");
					fecha_inicio=request.getParameter("fecha_inicio");
					fecha_fin=request.getParameter("fecha_fin");
					region=request.getParameter("region");
					cod_equipo=Integer.parseInt(request.getParameter("cod_equipo"));
					
					Campeonato altaCampeonato = new Campeonato(cod_campeonato,nombre,fecha_inicio,fecha_fin,region,cod_equipo);
					controladorBD.altaCampeonato(altaCampeonato);
					mensaje="Campeonato dado de alta con éxito.";
				}
			}
			
			//ALTA EQUIPO_CAMPEONATO
			if(request.getParameter("tipo").equalsIgnoreCase("altaequipo_campeonato")){
				
				if(request.getParameter("cod_equipo").equalsIgnoreCase("")){
					mensaje = mensaje + "El código del equipo no puede estar vacío.";
					operacion = "incorrecta";
				}else if(request.getParameter("cod_campeonato").equalsIgnoreCase("")){
					mensaje = mensaje + "El código del campeonato no puede estar vacío.";
					operacion = "incorrecta";
				}else if(operacion.equalsIgnoreCase("correcta")){
					cod_equipo=Integer.parseInt(request.getParameter("cod_equipo"));
					cod_campeonato=Integer.parseInt(request.getParameter("cod_campeonato"));
					
					Equipo_Campeonato altaEquipo_Campeonato = new Equipo_Campeonato(cod_equipo,cod_campeonato);
					controladorBD.altaEquipo_Campeonato(altaEquipo_Campeonato);
					mensaje="Participación de equipo en campeonato dada de alta con éxito.";
				}
			}
			
			//ALTA EQUIPO_PATROCINADOR
			if(request.getParameter("tipo").equalsIgnoreCase("altaequipo_patrocinador")){
				
				if(request.getParameter("cod_equipo").equalsIgnoreCase("")){
					mensaje = mensaje + "El código del equipo no puede estar vacío.";
					operacion = "incorrecta";
				}else if(request.getParameter("cod_patrocinador").equalsIgnoreCase("")){
					mensaje = mensaje + "El código del patrocinador no puede estar vacía.";
					operacion = "incorrecta";
				}else if(operacion.equalsIgnoreCase("correcta")){
					cod_equipo=Integer.parseInt(request.getParameter("cod_equipo"));
					cod_patrocinador=Integer.parseInt(request.getParameter("cod_patrocinador"));
					
					Equipo_Patrocinador altaEquipo_Patrocinador = new Equipo_Patrocinador(cod_equipo,cod_patrocinador);
					controladorBD.altaEquipo_Patrocinador(altaEquipo_Patrocinador);
					mensaje="Patrocinio a equipo dado de alta con éxito.";
				}
			}
			
			//BAJA JUGADOR
			if(request.getParameter("tipo").equalsIgnoreCase("bajajugador")){
				if(request.getParameter("cod_jugador").equalsIgnoreCase("")){
					mensaje=mensaje + "El codigo del jugador no puede estar vacio. ";
					operacion="incorrecta";
				}else if(operacion.equalsIgnoreCase("correcta")){
					cod_jugador=Integer.parseInt(request.getParameter("cod_jugador"));
					controladorBD.bajaJugador(cod_jugador);
					mensaje="Jugador dado de baja con éxito.";
				}
			}
			
			//BAJA SEDE
			if(request.getParameter("tipo").equalsIgnoreCase("bajasede")){
				if(request.getParameter("cod_sede").equalsIgnoreCase("")){
					mensaje=mensaje + "El codigo de la sede no puede estar vacio. ";
					operacion="incorrecta";
				}else if(operacion.equalsIgnoreCase("correcta")){
					cod_sede=Integer.parseInt(request.getParameter("cod_sede"));
					controladorBD.bajaSede(cod_sede);
					mensaje="Sede dada de baja con éxito.";
				}
			}
			
			//BAJA REGION
			if(request.getParameter("tipo").equalsIgnoreCase("bajaregion")){
				if(request.getParameter("cod_region").equalsIgnoreCase("")){
					mensaje=mensaje + "El codigo de la región no puede estar vacio. ";
					operacion="incorrecta";
				}else if(operacion.equalsIgnoreCase("correcta")){
					cod_region=Integer.parseInt(request.getParameter("cod_region"));
					controladorBD.bajaRegion(cod_region);
					mensaje="Region dada de baja con éxito.";
				}
			}
			
			//BAJA ENTRENADOR
			if(request.getParameter("tipo").equalsIgnoreCase("bajaentrenador")){
				if(request.getParameter("cod_entrenador").equalsIgnoreCase("")){
					mensaje=mensaje + "El codigo del entrenador no puede estar vacio. ";
					operacion="incorrecta";
				}else if(operacion.equalsIgnoreCase("correcta")){
					cod_entrenador=Integer.parseInt(request.getParameter("cod_entrenador"));
					controladorBD.bajaRegion(cod_entrenador);
					mensaje="Entrenador dado de baja con éxito.";
				}
			}
			
			//BAJA PATROCINADOR
			if(request.getParameter("tipo").equalsIgnoreCase("bajapatrocinador")){
				if(request.getParameter("cod_patrocinador").equalsIgnoreCase("")){
					mensaje=mensaje + "El codigo del patrocinador no puede estar vacio. ";
					operacion="incorrecta";
				}else if(operacion.equalsIgnoreCase("correcta")){
					cod_patrocinador=Integer.parseInt(request.getParameter("cod_patrocinador"));
					controladorBD.bajaPatrocinador(cod_patrocinador);
					mensaje="Patrocinador dado de baja con éxito.";
				}
			}
			
			//BAJA EQUIPO
			if(request.getParameter("tipo").equalsIgnoreCase("bajaequipo")){
				if(request.getParameter("cod_equipo").equalsIgnoreCase("")){
					mensaje=mensaje + "El codigo del equipo no puede estar vacio. ";
					operacion="incorrecta";
				}else if(operacion.equalsIgnoreCase("correcta")){
					cod_equipo=Integer.parseInt(request.getParameter("cod_equipo"));
					controladorBD.bajaEquipo(cod_equipo);
					mensaje="Equipo dado de baja con éxito.";
				}
			}
			
			//BAJA CAMPEONATO
			if(request.getParameter("tipo").equalsIgnoreCase("bajacampeonato")){
				if(request.getParameter("cod_campeonato").equalsIgnoreCase("")){
					mensaje=mensaje + "El codigo del campeonato no puede estar vacio. ";
					operacion="incorrecta";
				}else if(operacion.equalsIgnoreCase("correcta")){
					cod_campeonato=Integer.parseInt(request.getParameter("cod_campeonato"));
					controladorBD.bajaCampeonato(cod_campeonato);
					mensaje="Campeonato dado de baja con éxito.";
				}
			}
			
			//BAJA EQUIPO_CAMPEONATOS
			if(request.getParameter("tipo").equalsIgnoreCase("bajaequipo_campeonatos")){
				if(request.getParameter("cod_equipo").equalsIgnoreCase("")){
					mensaje=mensaje + "El codigo del equipo no puede estar vacio. ";
					operacion="incorrecta";
				}else if(operacion.equalsIgnoreCase("correcta")){
					cod_equipo=Integer.parseInt(request.getParameter("cod_equipo"));
					controladorBD.bajaEquipo_Campeonatos(cod_equipo);
					mensaje="Equipo dado de baja con éxito en todos los campeonatos.";
				}
			}
			
			//BAJA EQUIPO_CAMPEONATO
			if(request.getParameter("tipo").equalsIgnoreCase("bajaequipo_campeonato")){
				if(request.getParameter("cod_equipo").equalsIgnoreCase("")){
					mensaje=mensaje + "El codigo del equipo no puede estar vacio. ";
					operacion="incorrecta";
				}else if(request.getParameter("cod_campeonato").equalsIgnoreCase("")){
					mensaje=mensaje + "El codigo del campeonato no puede estar vacio. ";
					operacion="incorrecta";
				}else if(operacion.equalsIgnoreCase("correcta")){
					cod_equipo=Integer.parseInt(request.getParameter("cod_equipo"));
					cod_campeonato=Integer.parseInt(request.getParameter("cod_campeonato"));
					controladorBD.bajaEquipo_Campeonato(cod_equipo,cod_campeonato);
					mensaje="Equipo dado de baja con éxito en un campeonatos.";
				}
			}
			
			//BAJA EQUIPO_PATROCINADORES
			if(request.getParameter("tipo").equalsIgnoreCase("bajaequipo_patrocinadores")){
				if(request.getParameter("cod_equipo").equalsIgnoreCase("")){
					mensaje=mensaje + "El codigo del equipo no puede estar vacio. ";
					operacion="incorrecta";
				}else if(operacion.equalsIgnoreCase("correcta")){
					cod_equipo=Integer.parseInt(request.getParameter("cod_equipo"));
					controladorBD.bajaEquipo_Patrocinadores(cod_equipo);
					mensaje="Patrocinadores dados de baja con éxito del equipo.";
				}
			}
			
			//BAJA PATROCINADOR_EQUIPOS
			if(request.getParameter("tipo").equalsIgnoreCase("bajapatrocinador_equipos")){
				if(request.getParameter("cod_patrocinador").equalsIgnoreCase("")){
					mensaje=mensaje + "El codigo del patrocinador no puede estar vacio. ";
					operacion="incorrecta";
				}else if(operacion.equalsIgnoreCase("correcta")){
					cod_patrocinador=Integer.parseInt(request.getParameter("cod_patrocinador"));
					controladorBD.bajaPatrocinador_Equipos(cod_patrocinador);
					mensaje="Patrocinador dado de baja con éxito de todos los equipos.";
				}
			}
			
			//BAJA EQUIPO_PATROCINADOR
			if(request.getParameter("tipo").equalsIgnoreCase("bajapatrocinador_equipos")){
				if(request.getParameter("cod_equipo").equalsIgnoreCase("")){
					mensaje=mensaje + "El codigo del equipo no puede estar vacio. ";
					operacion="incorrecta";
				}else if(request.getParameter("cod_patrocinador").equalsIgnoreCase("")){
					mensaje=mensaje + "El codigo del patrocinador no puede estar vacio. ";
					operacion="incorrecta";
				}else if(operacion.equalsIgnoreCase("correcta")){
					cod_equipo=Integer.parseInt(request.getParameter("cod_equipo"));
					cod_patrocinador=Integer.parseInt(request.getParameter("cod_patrocinador"));
					controladorBD.bajaEquipo_Patrocinador(cod_equipo, cod_patrocinador);
					mensaje="Patrocinador dado de baja con éxito del equipo.";
				}
			}
			
			//MODIFICAR SEDE
			if(request.getParameter("tipo").equalsIgnoreCase("modificarsede")){
				cod_sede = controladorBD.calcularCodSede() + 1;
				
				if(request.getParameter("localizacion").equalsIgnoreCase("")){
					mensaje = mensaje + "La localización de la sede no puede estar vacía.";
					operacion = "incorrecta";
				}else if(operacion.equalsIgnoreCase("correcta")){
					localizacion=request.getParameter("localizacion");
					Sede modificarSede = new Sede(cod_sede,localizacion);
					controladorBD.modificarSede(modificarSede);
					mensaje="Sede modificada con éxito.";
				}
			}
			
			//MODIFICAR REGION
			if(request.getParameter("tipo").equalsIgnoreCase("modificarregion")){
				cod_region = controladorBD.calcularCodRegion() + 1;
				
				if(request.getParameter("nombreregion").equalsIgnoreCase("")){
					mensaje = mensaje + "El nombre de la región no puede estar vacío.";
					operacion = "incorrecta";
				}else if(request.getParameter("siglas").equalsIgnoreCase("")){
					mensaje = mensaje + "Las siglas de la región no pueden estar vacías.";
					operacion = "incorrecta";
				}else if(operacion.equalsIgnoreCase("correcta")){
					nombre=request.getParameter("nombre");
					siglas=request.getParameter("siglas");
					Region modificarRegion = new Region(cod_region,nombre,siglas);
					controladorBD.modificarRegion(modificarRegion);
					mensaje="Región modificada con éxito.";
				}
			}
			
			//MODIFICAR PATROCINADOR
			if(request.getParameter("tipo").equalsIgnoreCase("modificarpatrocinador")){
				cod_patrocinador = controladorBD.calcularCodPatrocinador() + 1;
				
				if(request.getParameter("nombrepatrocinador").equalsIgnoreCase("")){
					mensaje = mensaje + "El nombre del patrocinador no puede estar vacío.";
					operacion = "incorrecta";
				}else if(operacion.equalsIgnoreCase("correcta")){
					nombre=request.getParameter("nombrepatrocinador");
					Patrocinador modificarPatrocinador = new Patrocinador(cod_patrocinador,nombre);
					controladorBD.modificarPatrocinador(modificarPatrocinador);
					mensaje="Patrocinador modificado con éxito.";
				}
			}
			
			//MODIFICAR ENTRENADOR
			if(request.getParameter("tipo").equalsIgnoreCase("modificarentrenador")){
				cod_jugador = controladorBD.calcularCodJugador() + 1;
				
				if(request.getParameter("nombreentrenador").equalsIgnoreCase("")){
					mensaje = mensaje + "El nombre del entrenador no puede estar vacío.";
					operacion = "incorrecta";
				}else if(request.getParameter("apodoentrenador").equalsIgnoreCase("")){
					mensaje = mensaje + "El apodo del entrenador no puede estar vacío.";
					operacion = "incorrecta";
				}else if(request.getParameter("nacionalidadentrenador").equalsIgnoreCase("")){
					mensaje = mensaje + "La nacionalidad del entrenador no puede estar vacío.";
					operacion = "incorrecta";
				}else if(request.getParameter("fecha_nacimientoentrenador").equalsIgnoreCase("")){
					mensaje = mensaje + "La fecha de nacimiento del entrenador no puede estar vacío.";
					operacion = "incorrecta";
				}else if(request.getParameter("categoria").equalsIgnoreCase("")){
					mensaje = mensaje + "El categoria del entrenador no puede estar vacío.";
					operacion = "incorrecta";
				}else if(operacion.equalsIgnoreCase("correcta")){
					nombre=request.getParameter("nombreentrenador");
					apodo=request.getParameter("apodoentrenador");
					nacionalidad=request.getParameter("nacionalidadentrenador");
					fecha_nacimiento=request.getParameter("fecha_nacimientoentrenador");
					categoria=request.getParameter("categoria");
					cod_equipo=Integer.parseInt(request.getParameter("cod_jugador"));
					
					Entrenador modificarEntrenador = new Entrenador(cod_jugador,nombre,apodo,nacionalidad,fecha_nacimiento,categoria,cod_equipo);
					controladorBD.modificarEntrenador(modificarEntrenador);
					mensaje="Entrenador modificado con éxito.";
				}
			}
			
			//MODIFICAR EQUIPO
			if(request.getParameter("tipo").equalsIgnoreCase("modificarequipo")){
				cod_equipo = controladorBD.calcularCodEquipo() + 1;
				
				if(request.getParameter("nombreequipo").equalsIgnoreCase("")){
					mensaje = mensaje + "El nombre del equipo no puede estar vacío.";
					operacion = "incorrecta";
				}else if(request.getParameter("pais_fundacion").equalsIgnoreCase("")){
					mensaje = mensaje + "El pais de fundacion del equipo no puede estar vacío.";
					operacion = "incorrecta";
				}else if(request.getParameter("fecha_fundacion").equalsIgnoreCase("")){
					mensaje = mensaje + "La fecha de fundacion del equipo no puede estar vacío.";
					operacion = "incorrecta";
				}else if(request.getParameter("propietario").equalsIgnoreCase("")){
					mensaje = mensaje + "El propietario del equipo no puede estar vacío.";
					operacion = "incorrecta";
				}else if(request.getParameter("cod_sede").equalsIgnoreCase("")){
					mensaje = mensaje + "La sede del equipo no puede estar vacío.";
					operacion = "incorrecta";
				}else if(request.getParameter("cod_region").equalsIgnoreCase("")){
					mensaje = mensaje + "La region del equipo no puede estar vacío.";
					operacion = "incorrecta";
				}else if(operacion.equalsIgnoreCase("correcta")){
					nombre=request.getParameter("nombreequipo");
					pais_fundacion=request.getParameter("pais_fundacion");
					fecha_fundacion=request.getParameter("fecha_fundacion");
					propietario=request.getParameter("propietario");
					cod_sede=Integer.parseInt(request.getParameter("cod_sede"));
					cod_region=Integer.parseInt(request.getParameter("cod_region"));
					
					Equipo modificarEquipo = new Equipo(cod_equipo,nombre,pais_fundacion,fecha_fundacion,propietario,cod_sede,cod_region);
					controladorBD.modificarEquipo(modificarEquipo);
					mensaje="Equipo modificado con éxito.";
				}
			}
			
			//MODIFICAR CAMPEONATO
			if(request.getParameter("tipo").equalsIgnoreCase("modificarcampeonato")){
				cod_campeonato = controladorBD.calcularCodCampeonato() + 1;
				
				if(request.getParameter("nombrecampeonato").equalsIgnoreCase("")){
					mensaje = mensaje + "El nombre del campeonato no puede estar vacío.";
					operacion = "incorrecta";
				}else if(request.getParameter("fecha_inicio").equalsIgnoreCase("")){
					mensaje = mensaje + "La fecha de inicio de fundacion del campeonato no puede estar vacía.";
					operacion = "incorrecta";
				}else if(request.getParameter("fecha_fin").equalsIgnoreCase("")){
					mensaje = mensaje + "La fecha de fin del campeonato no puede estar vacía.";
					operacion = "incorrecta";
				}else if(request.getParameter("region").equalsIgnoreCase("")){
					mensaje = mensaje + "La region del campeonato no puede estar vacío.";
					operacion = "incorrecta";
				}else if(request.getParameter("cod_equipo").equalsIgnoreCase("")){
					mensaje = mensaje + "El equipo ganador del campeonato no puede estar vacío.";
					operacion = "incorrecta";
				}else if(operacion.equalsIgnoreCase("correcta")){
					nombre=request.getParameter("nombrecampeonato");
					fecha_inicio=request.getParameter("fecha_inicio");
					fecha_fin=request.getParameter("fecha_fin");
					region=request.getParameter("region");
					cod_equipo=Integer.parseInt(request.getParameter("cod_equipo"));
					
					Campeonato modificarCampeonato = new Campeonato(cod_campeonato,nombre,fecha_inicio,fecha_fin,region,cod_equipo);
					controladorBD.modificarCampeonato(modificarCampeonato);
					mensaje="Campeonato modificado con éxito.";
				}
			}
			
			//MODIFICAR JUGADOR
			if(request.getParameter("tipo").equalsIgnoreCase("modificarjugador")){
				cod_jugador = controladorBD.calcularCodJugador() + 1;
				
				if(request.getParameter("nombrejugador").equalsIgnoreCase("")){
					mensaje = mensaje + "El nombre del jugador no puede estar vacío.";
					operacion = "incorrecta";
				}else if(request.getParameter("apodojugador").equalsIgnoreCase("")){
					mensaje = mensaje + "El apodo del jugador no puede estar vacío.";
					operacion = "incorrecta";
				}else if(request.getParameter("nacionalidadjugador").equalsIgnoreCase("")){
					mensaje = mensaje + "La nacionalidad del jugador no puede estar vacío.";
					operacion = "incorrecta";
				}else if(request.getParameter("fecha_nacimientojugador").equalsIgnoreCase("")){
					mensaje = mensaje + "La fecha de nacimiento del jugador no puede estar vacío.";
					operacion = "incorrecta";
				}else if(request.getParameter("roljugador").equalsIgnoreCase("")){
					mensaje = mensaje + "El rol del jugador no puede estar vacío.";
					operacion = "incorrecta";
				}else if(operacion.equalsIgnoreCase("correcta")){
					nombre=request.getParameter("nombrejugador");
					apodo=request.getParameter("apodojugador");
					nacionalidad=request.getParameter("nacionalidadjugador");
					fecha_nacimiento=request.getParameter("fecha_nacimientojugador");
					rol=request.getParameter("roljugador");
					cod_equipo=Integer.parseInt(request.getParameter("cod_jugador"));
					
					Jugador modificarJugador = new Jugador(cod_jugador,nombre,apodo,nacionalidad,fecha_nacimiento,rol,cod_equipo);
					controladorBD.modificarJugador(modificarJugador);
					mensaje="Jugador modificado con éxito.";
				}
			}
			
			%>

					<!-- Logo -->
					<div style="display: flex; background-color: #343a40; border-bottom: 1px solid grey">
						<img class="center" src="images/header.png" width="12.5%">
					</div>
					<!-- Nav -->
						<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
				            <a class="navbar-brand" href="Index.jsp">Inicio</a>
				            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor02" aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
				              <span class="navbar-toggler-icon"></span>
				            </button>

				            <div class="collapse navbar-collapse" id="navbarColor02">
				              	<ul class="navbar-nav mr-auto">
					                <li class="nav-item dropdown">
								        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Campeonatos</a>
								        <div class="dropdown-menu bg-dark" aria-labelledby="navbarDropdown">
								          <a class="dropdown-item" href="Campeonatos.jsp?championships=Todos los campeonatos&region&anno">Todos</a>
								          <div class="dropdown-divider"></div>
								          <a class="dropdown-item" href="Campeonatos.jsp?championships=Worlds&region=International&anno">Worlds</a>
								          <a class="dropdown-item" href="Campeonatos.jsp?championships=League of Legends Champions Korea&region=Korea&anno">LCK</a>
								          <a class="dropdown-item" href="Campeonatos.jsp?championships=League of Legends European Championship&region=Europe&anno">LEC</a>
								          <a class="dropdown-item" href="Campeonatos.jsp?championships=League of Legends Pro League&region=China&anno">LPL</a>
								          <a class="dropdown-item" href="Campeonatos.jsp?championships=League of Legends Championship Series&region=North America&anno">LCS</a>
							        	</div>
							      	</li>
					                <li class="nav-item dropdown">
								        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Equipos</a>
								        <div class="dropdown-menu bg-dark" aria-labelledby="navbarDropdown">
								          <a class="dropdown-item" href="Equipos.jsp?region">Todos</a>
								          <div class="dropdown-divider"></div>
								          <a class="dropdown-item" href="Equipos.jsp?region=Europe">Europeos</a>
								          <a class="dropdown-item" href="Equipos.jsp?region=North America">Americanos</a>
								          <a class="dropdown-item" href="Equipos.jsp?region=Korea">Koreanos</a>
								          <a class="dropdown-item" href="Equipos.jsp?region=China">Chinos</a>
							        	</div>
							      	</li>
					                <li class="nav-item">
					                  <a class="nav-link" href="Jugadores.jsp?region">Jugadores</a>
					                </li>
					                <li class="nav-item">
					                  <a class="nav-link" href="Entrenadores.jsp?region">Entrenadores</a>
					                </li>
					               	<li class="nav-item">
					                  <a class="nav-link" href="Administrador.jsp">Administrador</a>
					                </li>
				              	</ul>
				              	<form class="form-inline my-2 my-lg-0">
					                <input class="form-control mr-sm-2" type="text" placeholder="Search">
					                <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
				              	</form>
				            </div>
				        </nav>

			<!-- Contenido -->
			<div class="container">
				<h3 style="padding: 1.5% 1% 1% 1%"><%=mensaje %></h3>
			</div>
			
			<!-- Footer -->
				<div id="footer" style="background-color: #343a40; border-top: 1px solid grey">
					<div class="container">
						<div class="row paddingFooter">
							<section class="col-sm-4 resonsiveFooter">
								<h5>Más visitado</h5>
								<ul class="footerList">
									<li><a href="">G2 Esports</a></li>
									<li><a href="">Worlds 2019</a></li>
									<li><a href="">LCK</a></li>
									<li><a href="">LEC Spring Playoffs 2020</a></li>
								</ul>
							</section>
							<section class="col-sm-4 resonsiveFooter">
								<h5>General</h5>
								<ul class="footerList">
									<li><a href="">Sobre nosotros</a></li>
									<li><a href="">Contacta con nosotros</a></li>
									<li><a href="">Términos de uso</a></li>
									<li><a href="">Política de privacidad</a></li>
									<li><a href="">Política de cookies</a></li>
								</ul>
							</section>
							<section class="col-sm-4 resonsiveFooter">
								<h5>Comunidad</h5>
								<ul class="footerList">
									<li><a href="">Soporte</a></li>
									<li><a href="">Ayuda</a></li>
									<li><a href="">Ayudanos a mejorar</a></li>
								</ul>
							</section>
						</div>
						<div class="row">
							<div class="col-12">
								<div id="alignsocial">
									<div>
										<ul class="socialContainer">
										<li class="center social"><a href="" title="Facebook"><svg class="icon" xmlns="http://www.w3.org/2000/svg" width="11" height="24" viewBox="0 0 11 24"><path d="M10.7 4L8.8 4C7.2 4 6.9 4.9 6.9 6L6.9 8.6 10.7 8.6 10.3 12.8 7.2 12.8 7.2 23.5 3.3 23.5 3.3 12.8 0 12.8 0 8.6 3.3 8.6 3.3 5.6C3.3 2.1 5.2 0 8.1 0 9.4 0 10.6 0.1 11 0.1L11 4 10.7 4Z"></path></svg></a></li>
										<li class="center social"><a href="" title="Twitter"><svg width="24" height="19" xmlns="http://www.w3.org/2000/svg"><path d="M20.957 4.543v.606c0 6.209-4.777 13.327-13.56 13.327-2.774 0-5.24-.758-7.397-2.12.462 0 .77.15 1.233.15 2.157 0 4.314-.756 6.01-1.968-2.004 0-3.853-1.363-4.47-3.332.309 0 .617.152.925.152.463 0 .463 0 1.079-.152C2.466 10.752.462 8.783.462 6.512c0 .454 1.695.454 2.466.606C1.695 6.209.925 4.846.925 3.18c0-.908.308-1.666.77-2.423 2.311 2.878 6.01 4.695 9.862 4.998-.154-.455-.154-.758-.154-1.06C11.403 2.12 13.56 0 16.18 0c1.387 0 2.62.454 3.544 1.514 1.079-.302 2.004-.605 2.928-1.211-.462 1.211-1.233 1.969-2.003 2.574a14.785 14.785 0 0 0 2.774-.757c-.77.909-1.541 1.817-2.466 2.423z" fill-rule="evenodd"></path></svg></a></li>
										<li class="center social"><a href="" title="Youtube"><svg width="24" height="17" xmlns="http://www.w3.org/2000/svg"><path d="M23.8 3.6s-.2-1.7-1-2.4c-.9-1-1.9-1-2.4-1C17 0 12 0 12 0S7 0 3.6.2c-.5.1-1.5.1-2.4 1-.7.7-1 2.4-1 2.4S0 5.5 0 7.5v1.8c0 1.9.2 3.9.2 3.9s.2 1.7 1 2.4c.9 1 2.1.9 2.6 1 1.9.2 8.2.2 8.2.2s5 0 8.4-.3c.5-.1 1.5-.1 2.4-1 .7-.7 1-2.4 1-2.4s.2-1.9.2-3.9V7.4c0-1.9-.2-3.8-.2-3.8zM9.5 11.5V4.8L16 8.2l-6.5 3.3z" fill-rule="evenodd"></path></svg></a></li>
										<li class="center social"><a href="" title="Instagram"><svg width="20" height="20" xmlns="http://www.w3.org/2000/svg"><path d="M17.510373 0H2.406639C1.078838 0 0 1.0788382 0 2.3236515v15.1867219c0 1.3278009 1.078838 2.406639 2.406639 2.406639h15.186722C18.921162 19.9170124 20 18.8381743 20 17.593361V2.3236515C19.917012 1.0788382 18.838174 0 17.510373 0zm-2.572614 2.4896266h1.659751c.497926 0 .829876.3319502.829876.8298755v1.659751c0 .4979253-.33195.8298755-.829876.8298755h-1.659751c-.497925 0-.829875-.3319502-.829875-.8298755v-1.659751c0-.4979253.33195-.8298755.829875-.8298755zM9.958506 6.1410788c2.074689 0 3.817428 1.7427386 3.817428 3.8174274s-1.742739 3.8174274-3.817428 3.8174274c-2.074689 0-3.817427-1.7427386-3.817427-3.8174274s1.742738-3.8174274 3.817427-3.8174274zm6.639004 11.2863071H3.319502c-.497925 0-.829875-.3319502-.829875-.8298755V8.2987552h1.659751c-.248963.9128631-.331951 1.9917012-.082988 2.9875519.497925 2.3236514 2.406639 4.1493775 4.73029 4.5643153 3.900415.746888 7.302905-2.1576763 7.302905-5.8921162 0-.5809128-.165975-1.1618257-.248963-1.659751h1.659751v8.2987552c-.082987.4979253-.414937.8298755-.912863.8298755z" fill-rule="evenodd"></path></svg></a></li>
										<li class="center social"><a href="" title="LinkedIn"><svg width="19" height="19" xmlns="http://www.w3.org/2000/svg"><path d="M3.859375 19h-3.5625V5.9375h3.5625V19zM2.078125 4.43175C.931 4.43175 0 3.493625 0 2.337S.931.24225 2.078125.24225 4.15625 1.180375 4.15625 2.337s-.929812 2.09475-2.078125 2.09475zM18.109375 19h-3.5625v-6.65475c0-3.9995-4.75-3.6966875-4.75 0V19h-3.5625V5.9375h3.5625v2.0959375c1.65775-3.070875 8.3125-3.2976875 8.3125 2.94025V19z" fill-rule="nonzero"></path></svg></a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<hr style="background-color: grey">
						<div class="row">
							<div class="col-12">
								<div style="display: flex;">
								<p id="credits" class="center">&copy; 2020 Riot Games, Inc. <br>Design: <a href="https://www.centronelson.org">Centro Nelson</a></p>
								</div>
							</div>
						</div>
					</div>
				</div>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>