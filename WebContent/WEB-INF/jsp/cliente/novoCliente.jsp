<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/estiloCliente.css" />" />
		<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/cabecalho.css" />" />
		<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/estiloBody.css" />" />
		<title>Novo cliente</title>
	</head>
	
	<body>
		<div id="cabecalho">
			<span>Loja Virtual</span>
		</div>
		
		<form action="<c:url value="/clientes"/>" method="POST">
			<fieldset>
				<legend>Novo cliente</legend>
				<div>Nome:</div>
				<div><input id="nome" type="text" name="cliente.nome" /></div> 
				<div>Login:</div>
				<div><input id="login" type="text" name="cliente.login"  /></div>
				<div>Senha:</div>
				<div><input id="senha" type="password" name="cliente.senha" /></div>
				<div>E-mail:</div>
				<div><input id="email" type="text" name="cliente.email" /></div>
				<div>Endereço:</div>
				<div><input id="endereco" type="text" name="cliente.endereco" /></div>
				<div>CEP:</div>
				<div><input id="cep" type="text" name="cliente.cep" /></div>
				
				<button type="submit">Enviar</button>
				
				<a href="<c:url value="/loginCliente"/>">cancelar</a>
			</fieldset>
		</form>
	</body>
</html>