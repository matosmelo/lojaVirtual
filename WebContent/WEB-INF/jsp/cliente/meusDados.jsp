<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/cabecalho.css" />" />
		<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/estiloBody.css" />" />
		<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/estiloMinhaConta.css" />" />
		<title>Dados de ${cliente.nome }</title>
	</head>
	
	<body>
	
		<div id="cabecalho">
			<span>Loja Virtual</span>
			
			<div id="minhaConta" ><a href="<c:url value="/loja"/>">Loja</a>
				<c:if test="${clienteWeb.logado}">
		    		Olá, ${cliente.nome }! 
		    			
		    		<a href="<c:url value="/logoutCliente"/>">Logout</a>
				</c:if>
			</div>
		</div>
			
		<fieldset>
			<legend>Meus dados</legend>
			<div>Nome: ${cliente.nome }</div>
			<div>Login: ${cliente.login }</div>
			<div>e-mail: ${cliente.email }</div>
			<div>senha: ${cliente.senha }</div>
			<div>Edereço: ${cliente.endereco }</div>
			<div>CEP: ${cliente.cep }</div>
			
			<a href="<c:url value="/minhaConta/meusDados/${cliente.login}"/>">Editar</a>
			
			<a href="<c:url value="/minhaConta"/>">Voltar</a>
		</fieldset>
	</body>
</html>