<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>

<link href="css/estilos.css" rel="stylesheet" type="text/css">
</head>

<body>

	<header>
		<br>
		<div class="title" align="center" id="title">
			<h1><strong>Car Center App</strong></h1>
		</div>
	</header><hr >
	
	<div class="progress">
		<div class="progress-bar" role="progressbar" style="width: 15%"
			aria-valuenow="15" aria-valuemin="0" aria-valuemax="100"></div>
		<div class="progress-bar bg-success" role="progressbar"
			style="width: 30%" aria-valuenow="30" aria-valuemin="0"
			aria-valuemax="100"></div>
		<div class="progress-bar bg-info" role="progressbar"
			style="width: 20%" aria-valuenow="20" aria-valuemin="0"
			aria-valuemax="100"></div>
	</div>
	<br>
	
	<div class="asigacionMecanicos" align="center">
		<h4>Asigación mecánicos</h4>
		<div class="tabla">
			<table cellpadding="0" cellspacing="0" width="450" boder="1"> 
				<tr>
				<td>#</td><hr >
				<td>Mecánico</td>
				<td>Número Idetificación</td>
				<td>Horas</td>
				</tr>
				<%
				Class.forName("com.mysql.jdbc.Driver");
				Connection miConexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/bdmecanicos", "root","admin");
				Statement s = miConexion.createStatement();
				ResultSet data = s.executeQuery("SELECT * FROM MECANICOS order by HorasMesAnt asc");
				int contador=1;	
				
				while(data.next()){
				%>
				
				<tr><%	if(data.getString(10).equals("1") && contador <= 10){ %>
							<td><%out.print(contador);%></td>				
							<td><%out.print(data.getString(1)+" "+data.getString(3));%></td>
							<td><%out.print(data.getInt(6));%></td>
							<td><%out.print(data.getInt(11));%></td>
						<% contador += 1;%></tr>
					<%
					}
				} %>
			</table>
		</div>
		<br>
		<div>
				<button type="button" class="btn btn-danger"
				onclick="location.href='app.jsp'">Atrás</button>
		</div><br>
	</div>
	<footer><br>
		<div align="center" id="autor">
			Realizado por Ruben Monroy <%=new java.util.Date()%>
		</div><br>
	</footer>
</body>
</html>