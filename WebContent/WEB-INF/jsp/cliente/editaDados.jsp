<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/cabecalho.css" />" />
		<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/estiloBody.css" />" />
		<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/estiloMinhaConta.css" />" />
		<title>Editar dados</title>
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
			<legend>Editar dados</legend>
		
			<form action="<c:url value="/minhaConta/meusDados/${cliente.login }"/>" method="POST">
				<div>Nome:<input id="nome" type="text" name="cliente.nome" value="${cliente.nome }" /></div> 
				<div><input id="login" type="hidden" name="cliente.login" value="${cliente.login }" /></div>
				<div>Senha:<input id="senha" type="text" name="cliente.senha" value="${cliente.senha }"></div>
				<div>e-mail:<input id="email" type="text" name="cliente.email" value="${cliente.email }"></div>
				<div>Endereço:<input id="endereco" type="text" name="cliente.endereco" value="${cliente.endereco }"></div>
				<div>CEP:<input id="cep" type="text" name="cliente.cep" value="${cliente.cep }"></div>

				<a href="<c:url value="/minhaConta/meusDados"/>">cancelar</a>
		
				<button type="submit" name="_method" value="PUT">Enviar</button>
	
			</form>
		</fieldset>
	</body>
</html>