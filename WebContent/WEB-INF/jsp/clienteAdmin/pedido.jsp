<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/cabecalho.css" />" />
		<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/estiloBody.css" />" />
		<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/estiloMinhaConta.css" />" />
	
	</head>

	<body>
		<div id="cabecalho">
			
			<span>Loja Virtual</span>

			<div id="usuario">
				<c:if test="${usuarioWeb.logado}">
	    			Olá, ${usuarioWeb.login }! 
	    		
	    			<a href="<c:url value="/logout"/>">Logout</a>
	    			
	    			<a href="<c:url value="/produto"/>">Produtos</a>
	    			
				</c:if>
			</div>
		</div>
		
		<fieldset>
			<legend>Pedidos</legend>
			
			<c:forEach items="${pedidoList }" var="pedido">
				<div>
					Ordem: ${pedido.id }  <a href='<c:url value="/cliente/detalheDoPedido/${pedido.id}" ></c:url>'>detalhe</a>
				</div>
			</c:forEach>	
			
			<a href="<c:url value="/clientes"/>"> Voltar</a>
		</fieldset>
	</body>

</html>