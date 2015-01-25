<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/estiloCliente.css" />" />
		<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/cabecalho.css" />" />
		<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/estiloBody.css" />" />
		<title>Loja Virtual</title>
	</head>
	
	<body>
		<div id="cabecalho">
			<span>Loja Virtual</span>
		</div>
		
		<form action="<c:url value="/loginCliente"/>" method="POST">
			<fieldset>
				<div>Login:</div>
				<div><input id="login" type="text" name="cliente.login" /></div>
				<div>Senha</div>
				<div><input id="senha" type="password" name="cliente.senha" /></div>	
				<button type="submit">Login</button>	
				
				<a href="<c:url value="/cliente"/>">novo cliente</a>
			</fieldset>
		</form>
	</body>
</html>