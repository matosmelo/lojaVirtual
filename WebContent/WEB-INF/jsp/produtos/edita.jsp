<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/cabecalho.css" />" />
		<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/estiloBody.css" />" />
		<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/estiloProduto.css" />" />
		<title>Editar Produto</title>
	</head>
	
	<body>
		<div id="cabecalho">
			<span>Loja Virtual</span>
			
			<div id="usuario">
				<c:if test="${usuarioWeb.logado}">
	    			Olá, ${usuarioWeb.login }! 
	    		
	    			<a href="<c:url value="/logout"/>">Logout</a>
				</c:if>
			</div>
		</div>
			
		<fieldset>
			<legend>Editar Produto</legend>
		
			<form action="<c:url value="/produto/${produto.id }"/>" method="POST" enctype="multipart/form-data">
				<input type="hidden" name="produto.id" value="${produto.id }" />
				Nome:<input id="nome" type="text" name="produto.nome" value="${produto.nome }" /> 
				Preço:<input id="preco" type="text" name="produto.preco" value="${produto.preco }" />
				<input type="file" name="imagem"/>
				
				<button type="submit" name="_method" value="PUT">Enviar</button>
			</form>
		
			<a href="<c:url value="/produto"/>">cancelar</a>
		</fieldset>
	</body>
</html>