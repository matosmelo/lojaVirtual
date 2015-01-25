<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/estiloCliente.css" />" />
		<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/cabecalho.css" />" />
		<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/estiloBody.css" />" />
		<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/estiloLoja.css" />" />
		<title>Bem vindo a loja</title>
	</head>
	
	<body>
		<div id="cabecalho">
			<span>Loja Virtual</span>
			
			<div id="carrinho"><a href="<c:url value="/carrinho"/>">Carrinho</a></div>
			
			<div id="minhaConta" ><a href="<c:url value="/minhaConta"/>">Minha conta</a></div>
		</div>
	
		<div id="loja">
			<c:forEach items="${produtoList}" var="produto">
				<div id="produtos">
					<div><img src="<c:url value="/produto/${produto.id}/imagem"/>" width="100" height="100"/></div>
			
					<div>
						${produto.nome}
						<fmt:formatNumber type="currency" value="${produto.preco}" />
					</div>
					
					<div>
						<!-- Adicionando o produto no carrinho de compras -->
						<form action="<c:url value="/carrinho"/>" method="POST">
							<input type="hidden" name="item.produto.id" value="${produto.id }" />
							<input size="1" class="qtde" name="item.quantidade" value="1" />

							<button type="submit">Comprar</button>
						</form>
					</div>
				</div>
			</c:forEach>
		</div>
	</body>
</html>