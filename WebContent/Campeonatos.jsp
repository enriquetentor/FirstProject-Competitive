<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="Lol.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, user-scalable=1.0">
	<link rel="stylesheet" href="assets/bootstrap.css">
	<link rel="shortcut icon" href="images/trofeo.png">
	<title>Leaguepedia | Campeonatos</title>
</head>
<body>

<%
			//VARIABLES DE CONTROL
			String displayEquipos="todos";
			
			//VARIABLES
			BDController controladorBD = new BDController();
			String championshipsGiven=request.getParameter("championships");
			String regionGiven="";
			String annoGiven="";
			
			//RECOGIDA DE VARIABLES
			if(!request.getParameter("region").equalsIgnoreCase("")){
				regionGiven=request.getParameter("region");
				displayEquipos="region";
				if(!request.getParameter("anno").equalsIgnoreCase("")){
					annoGiven=request.getParameter("anno");
					displayEquipos="regionYaño";
				}
			}else if(!request.getParameter("anno").equalsIgnoreCase("")){
				annoGiven=request.getParameter("anno");
				displayEquipos="año";
			}
			%>

					<!-- Logo -->
					<div style="display: flex; background-color: #343a40; border-bottom: 1px solid grey">
						<img class="center imageHeader" src="images/header.png">
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
					               	
				              	</ul>
				              	<form class="form-inline my-2 my-lg-0">
					                <input class="form-control mr-sm-2" type="text" placeholder="Search">
					                <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
				              	</form>
				            </div>
				        </nav>

			<!-- Contenido -->
			
			<div class="container">
				<h3 style="padding: 1.5% 1% 1% 1%">
				<%if(regionGiven.equalsIgnoreCase("")){%>
				<%=championshipsGiven%>
				<%}else{ %>
				<%=regionGiven%>
				<%}%>
				</h3>
			</div>
			<hr style="margin: 0">
			<div class="table-wrapper">
				<table class="alt center" style="padding-bottom: 0;">
									<tbody>
										<tr>
											<td class="textCenter" width='60' colspan="2" style="background-color:#b6cfe5;padding: 5px 0px 5px 0px">League of Legends Major Region Overviews</td>
										</tr>
										<tr>
										  	<td class="textCenter" width='60' style="background-color:#b6cfe5; padding: 0 5px 0 5px">Major Tournaments</td>
										  	<td width='300' style="padding: 5px 15px 5px 15px;">
										  		<ul class="options">
										  			<%if(!regionGiven.equalsIgnoreCase("")){%>
										  			<li><a href="Campeonatos.jsp?championships=<%=championshipsGiven%>&region&anno">Todos</a></li>
										  			<%}else{ %>
										  			<li><a>Todos</a></li>
										  			<%} %>
										  			<%if(!regionGiven.equalsIgnoreCase("International")){%>
										  			<li><a href="Campeonatos.jsp?championships=<%=championshipsGiven%>&region=International&anno">International</a></li>
										  			<%}else{ %>
										  			<li><a>International</a></li>
										  			<%} %>
										  		<% for(int i=0; controladorBD.dameRegiones().size()>i; i++ ){
										  		Region region = controladorBD.dameRegiones().get(i);
										  		%>
										  			<%if(controladorBD.dameCampeonatosRegion(region.getNombre()).size()!=0){ %>
											  			<%if(!regionGiven.equalsIgnoreCase(region.getNombre())){%>
											  			<li><a href="Campeonatos.jsp?championships=<%=championshipsGiven%>&region=<%=region.getNombre()%>&anno"><%=region.getNombre() %></a></li>
											  			<%}else{ %>
											  			<li><a><%=region.getNombre() %></a></li>
											  			<%} %>
										  			<%} %>
												<%} %>
										  		</ul>
										  	</td>
										</tr>
									</tbody>
				</table>
				<table class="alt center" style="padding-top: 0;">
									<tbody>
										<tr>
											<td class="textCenter" width='60' colspan="2" style="background-color:#b6cfe5; padding: 5px 0px 5px 0px;">
											<%if(!regionGiven.equalsIgnoreCase("")){%>
											<%=regionGiven%>
											<%}else{ %>
											Todos
											<%} %>
											</td>
										</tr>
										<tr>
										  	<td class="textCenter" width='60' style="background-color:#b6cfe5; padding: 0 5px 0 5px;">Years</td>
										  	<td width='300' style="padding: 5px 15px 5px 15px;">
										  		<ul class="options">
										  			<%if(!annoGiven.equalsIgnoreCase("")){%>
										  			<li><a href="Campeonatos.jsp?championships=<%=championshipsGiven%>&region=<%=regionGiven%>&anno">Todos</a></li>
										  			<%}else{ %>
										  			<li><a>Todos</a></li>
										  			<%} %>
										  		<%if(!regionGiven.equalsIgnoreCase("")){ %>
										  			<% for(int i=0; controladorBD.dameAñosCampeonato(regionGiven).size()>i; i++ ){
										  			String AñosCampeonato = controladorBD.dameAñosCampeonato(regionGiven).get(i);%>
											  			<%if(!annoGiven.equalsIgnoreCase(AñosCampeonato)){%>
											  			<li><a href="Campeonatos.jsp?championships=<%=championshipsGiven%>&region=<%=regionGiven%>&anno=<%=AñosCampeonato%>"><%=AñosCampeonato%></a></li>
											  			<%}else{ %>
											  			<li><a><%=AñosCampeonato %></a></li>
											  			<%} %>
													<%} %>
												<%}else{ %>
													<% for(int i=0; controladorBD.dameAñosCampeonatos().size()>i; i++ ){
										  			String AñosCampeonato = controladorBD.dameAñosCampeonatos().get(i);%>
											  			<%if(!annoGiven.equalsIgnoreCase(AñosCampeonato)){%>
											  			<li><a href="Campeonatos.jsp?championships=<%=championshipsGiven%>&region&anno=<%=AñosCampeonato%>"><%=AñosCampeonato%></a></li>
											  			<%}else{ %>
											  			<li><a><%=AñosCampeonato %></a></li>
											  			<%} %>
													<%} %>
												<%} %>
										  		</ul>
										  	</td>
										</tr>
									</tbody>
				</table>
			</div>
			<hr width="90%" style="margin-top: 0; margin-bottom: 0;">
			<div class="table-wrapper">
			<table class="center thinner" style="margin-bottom: 5%; margin-top: 3%; border-collapse: collapse;">
									<thead>
										<tr>
											<th colspan="6"><h4 style="margin-bottom: 2%;">Visión general</h4></th>
										</tr>
										<tr>
											<th></th>
											<th>Nombre</th>
											<th>Inicio</th>
											<th>Final</th>
											<th>Región</th>
											<th>Ganador</th>
										</tr>
									</thead>
									<tbody>
									<%if (displayEquipos.equalsIgnoreCase("region")){%>
										<% for(int i=0; controladorBD.dameCampeonatosRegion(regionGiven).size()>i; i++ ){
										Campeonato campeonato = controladorBD.dameCampeonatosRegion(regionGiven).get(i);%>
										<tr>
											<td class="championshipsImageContainer"><img width="100%"; 
											<%if(campeonato.getNombre().contains("LEC")){ %>
											title="LoL European Championship"; alt="LoL European Championship" src="images/championships/LEC.png"
											<%}else if(campeonato.getNombre().contains("LCK")){ %>
											title="LoL Champions Korea"; alt="LoL Champions Korea" src="images/championships/LCK.png"
											<%}else if(campeonato.getNombre().contains("LCS")){ %>
											title="LoL Championship Series"; alt="LoL Championship Series" src="images/championships/LCS.png"
											<%}else if(campeonato.getNombre().contains("LPL")){ %>
											title="LoL Pro League"; alt="LoL Pro League" src="images/championships/LPL.png"
											<%}else{ %>
											title="<%=campeonato.getNombre() %>"; alt="<%=campeonato.getNombre() %>" src="images/championships/<%=campeonato.getNombre() %>.png"
											<%} %>
											></td>
											<td class="textCenter responsiveText"><a href="Campeonato.jsp?cod_campeonato=<%=campeonato.getCod_campeonato() %>"><%=campeonato.getNombre() %></a></td>
											<td class="textCenter responsiveText"><%=campeonato.getFecha_inicio() %></td>
											<td class="textCenter responsiveText"><%=campeonato.getFecha_fin() %></td>
											<td class="textCenter responsiveText"><%if(controladorBD.regionExiste(campeonato.getRegion())==true){%><div class="region-icon"><%=controladorBD.dameRegion(campeonato.getRegion()).getSiglas() %></div>&nbsp;<%}%><%=campeonato.getRegion() %></td>
											<td class="textCenter teamsImageContainer"><a href="Equipo.jsp?cod_equipo=<%=controladorBD.dameEquipo(campeonato.getCod_equipo()).getCod_equipo() %>"><img class="teamsImage1" width="100%"; title="<%=controladorBD.dameEquipo(campeonato.getCod_equipo()).getNombre() %>";alt="<%=controladorBD.dameEquipo(campeonato.getCod_equipo()).getNombre() %>" src="images/teams/<%=campeonato.getCod_equipo()%>.png"></a></td>
										</tr>
										<%} %>
									<%}else if(displayEquipos.equalsIgnoreCase("regionYaño")){%>
										<% for(int i=0; controladorBD.dameCampeonatosRegionAño(regionGiven,Integer.parseInt(annoGiven)).size()>i; i++ ){
										Campeonato campeonato = controladorBD.dameCampeonatosRegionAño(regionGiven,Integer.parseInt(annoGiven)).get(i);%>
										<tr>
											<td class="championshipsImageContainer"><img width="100%"; 
											<%if(campeonato.getNombre().contains("LEC")){ %>
											title="LoL European Championship"; alt="LoL European Championship" src="images/championships/LEC.png"
											<%}else if(campeonato.getNombre().contains("LCK")){ %>
											title="LoL Champions Korea"; alt="LoL Champions Korea" src="images/championships/LCK.png"
											<%}else if(campeonato.getNombre().contains("LCS")){ %>
											title="LoL Championship Series"; alt="LoL Championship Series" src="images/championships/LCS.png"
											<%}else if(campeonato.getNombre().contains("LPL")){ %>
											title="LoL Pro League"; alt="LoL Pro League" src="images/championships/LPL.png"
											<%}else{ %>
											title="<%=campeonato.getNombre() %>"; alt="<%=campeonato.getNombre() %>" src="images/championships/<%=campeonato.getNombre() %>.png"
											<%} %>
											></td>
											<td class="textCenter responsiveText"><a href="Campeonato.jsp?cod_campeonato=<%=campeonato.getCod_campeonato() %>"><%=campeonato.getNombre() %></a></td>
											<td class="textCenter responsiveText"><%=campeonato.getFecha_inicio() %></td>
											<td class="textCenter responsiveText"><%=campeonato.getFecha_fin() %></td>
											<td class="textCenter responsiveText"><%if(controladorBD.regionExiste(campeonato.getRegion())==true){%><div class="region-icon"><%=controladorBD.dameRegion(campeonato.getRegion()).getSiglas() %></div>&nbsp;<%}%><%=campeonato.getRegion() %></td>
											<td class="textCenter teamsImageContainer"><a href="Equipo.jsp?cod_equipo=<%=controladorBD.dameEquipo(campeonato.getCod_equipo()).getCod_equipo() %>"><img class="teamsImage1" width="100%"; title="<%=controladorBD.dameEquipo(campeonato.getCod_equipo()).getNombre() %>";alt="<%=controladorBD.dameEquipo(campeonato.getCod_equipo()).getNombre() %>" src="images/teams/<%=campeonato.getCod_equipo()%>.png"></a></td>
										</tr>
										<%} %>
										
									<%}else if(displayEquipos.equalsIgnoreCase("año")){ %>
										<% for(int i=0; controladorBD.dameCampeonatosAño(Integer.parseInt(annoGiven)).size()>i; i++ ){
										Campeonato campeonato = controladorBD.dameCampeonatosAño(Integer.parseInt(annoGiven)).get(i); %>
										<tr>
											<td class="championshipsImageContainer"><img width="100%"; 
											<%if(campeonato.getNombre().contains("LEC")){ %>
											title="LoL European Championship"; alt="LoL European Championship" src="images/championships/LEC.png"
											<%}else if(campeonato.getNombre().contains("LCK")){ %>
											title="LoL Champions Korea"; alt="LoL Champions Korea" src="images/championships/LCK.png"
											<%}else if(campeonato.getNombre().contains("LCS")){ %>
											title="LoL Championship Series"; alt="LoL Championship Series" src="images/championships/LCS.png"
											<%}else if(campeonato.getNombre().contains("LPL")){ %>
											title="LoL Pro League"; alt="LoL Pro League" src="images/championships/LPL.png"
											<%}else{ %>
											title="<%=campeonato.getNombre() %>"; alt="<%=campeonato.getNombre() %>" src="images/championships/<%=campeonato.getNombre() %>.png"
											<%} %>
											></td>
											<td class="textCenter responsiveText"><a href="Campeonato.jsp?cod_campeonato=<%=campeonato.getCod_campeonato() %>"><%=campeonato.getNombre() %></a></td>
											<td class="textCenter responsiveText"><%=campeonato.getFecha_inicio() %></td>
											<td class="textCenter responsiveText"><%=campeonato.getFecha_fin() %></td>
											<td class="textCenter responsiveText"><%if(controladorBD.regionExiste(campeonato.getRegion())==true){%><div class="region-icon"><%=controladorBD.dameRegion(campeonato.getRegion()).getSiglas() %></div>&nbsp;<%}%><%=campeonato.getRegion() %></td>
											<td class="textCenter teamsImageContainer"><a href="Equipo.jsp?cod_equipo=<%=controladorBD.dameEquipo(campeonato.getCod_equipo()).getCod_equipo() %>"><img class="teamsImage1" width="100%"; title="<%=controladorBD.dameEquipo(campeonato.getCod_equipo()).getNombre() %>";alt="<%=controladorBD.dameEquipo(campeonato.getCod_equipo()).getNombre() %>" src="images/teams/<%=campeonato.getCod_equipo()%>.png"></a></td>
										</tr>
										<%} %>
									<%}else{ %>
										<% for(int i=0; controladorBD.dameCampeonatos().size()>i; i++ ){
										Campeonato campeonato = controladorBD.dameCampeonatos().get(i); %>
										<tr>
											<td class="championshipsImageContainer"><img width="100%"; 
											<%if(campeonato.getNombre().contains("LEC")){ %>
											title="LoL European Championship"; alt="LoL European Championship" src="images/championships/LEC.png"
											<%}else if(campeonato.getNombre().contains("LCK")){ %>
											title="LoL Champions Korea"; alt="LoL Champions Korea" src="images/championships/LCK.png"
											<%}else if(campeonato.getNombre().contains("LCS")){ %>
											title="LoL Championship Series"; alt="LoL Championship Series" src="images/championships/LCS.png"
											<%}else if(campeonato.getNombre().contains("LPL")){ %>
											title="LoL Pro League"; alt="LoL Pro League" src="images/championships/LPL.png"
											<%}else{ %>
											title="<%=campeonato.getNombre() %>"; alt="<%=campeonato.getNombre() %>" src="images/championships/<%=campeonato.getNombre() %>.png"
											<%} %>
											></td>
											<td class="textCenter responsiveText"><a href="Campeonato.jsp?cod_campeonato=<%=campeonato.getCod_campeonato() %>"><%=campeonato.getNombre() %></a></td>
											<td class="textCenter responsiveText"><%=campeonato.getFecha_inicio() %></td>
											<td class="textCenter responsiveText"><%=campeonato.getFecha_fin() %></td>
											<td class="textCenter responsiveText"><%if(controladorBD.regionExiste(campeonato.getRegion())==true){%><div class="region-icon"><%=controladorBD.dameRegion(campeonato.getRegion()).getSiglas() %></div>&nbsp;<%}%><%=campeonato.getRegion() %></td>
											<td class="textCenter teamsImageContainer"><a href="Equipo.jsp?cod_equipo=<%=controladorBD.dameEquipo(campeonato.getCod_equipo()).getCod_equipo() %>"><img class="teamsImage1" width="100%"; title="<%=controladorBD.dameEquipo(campeonato.getCod_equipo()).getNombre() %>";alt="<%=controladorBD.dameEquipo(campeonato.getCod_equipo()).getNombre() %>" src="images/teams/<%=campeonato.getCod_equipo()%>.png"></a></td>
										</tr>
										<%} %>
									<%} %>
									
										
									</tbody>
								</table>
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