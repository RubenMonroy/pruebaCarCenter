<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="validacionesMecanicos.*"%>

<html>
<meta charset="ISO-8859-1">
<head>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
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
	</header>
	<hr >
	<jsp:include page="formularioMecanicos.html"></jsp:include>
	<%
		String nombre1 = request.getParameter("nombre1");
		String nombre2 = request.getParameter("nombre2");
		String apellido1 = request.getParameter("apellido1");
		String apellido2 = request.getParameter("apellido2");
		String tipoDocumento = request.getParameter("tipoDocumento");
		String numDocumento = request.getParameter("numDocumento");
		String numCelular = request.getParameter("numCelular");
		String email = request.getParameter("email");
		String direccion = request.getParameter("direccion");
		String estado = request.getParameter("estado");
		String horas =request.getParameter("horas");

		Class.forName("com.mysql.jdbc.Driver");
		
		try {

			Connection miConexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/bdmecanicos", "root","admin");
			Statement miStatement = miConexion.createStatement();

			String instruccionesSql = "INSERT INTO MECANICOS (primer_nombre,segundo_nombre,primer_apellido,segundo_apellido,tipo_Documento,documento,celular,email,direccion,estado,HorasMesAnt ) VALUES('"+ nombre1 + "','" + nombre2 + "','" + apellido1 + "','" + apellido2 + "','" + tipoDocumento	+ "','" + numDocumento + "','" + numCelular + "','" + email + "','" + direccion + "','" + estado + "','" + horas + "') ";
			miStatement.executeUpdate(instruccionesSql);
									
			boolean bandera = true;
			out.print("   * Datos Ingresados Correctamente " );
		}

		catch (Exception e) {
			out.print("      * Datos Obligatorios  ");
			boolean bandera = false;
			 
		}
	%>
	<hr>
	<footer>
		<div align="center" id="autor">
			Realizado por Ruben Monroy
			<%=new java.util.Date()%>
		</div><br>

	</footer>
</body>

</html>