<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/cabecalho.css" />" />
		<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/estiloBody.css" />" />
		<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/estiloCarrinho.css" />" />
		<title>Compra realizada</title>
	</head>
	
	<body>
		<div id="cabecalho">
			<span>Loja Virtual</span>
			<div id="minhaConta" ><a href="<c:url value="/minhaConta"/>">Minha conta</a></div>
		</div>
		
		<fieldset>
			<table>
				<tr>
					<th>Nome</th>
					<th>Qnt</th>
					<th>Total</th>
				</tr>
			
				<c:forEach items="${carrinho.itens}" var="item">
					<tr>
						<td>${item.produto.nome }</td>
						<td align="right">${item.quantidade }</td>
						<td><fmt:formatNumber type="currency" value="${item.quantidade * item.produto.preco }" /></td>
					</tr>
				</c:forEach>
			
			</table>
			
			<div id = "pagamento"> Valor total: <fmt:formatNumber type="currency" value="${carrinho.total }" />
					
				<form action="<c:url value="/criaPedido/${clienteWeb.login}"/>" method="POST">
					<input id="valorPago" type="hidden" name="pedido.valorPago" value="${carrinho.total }">
					<input id="nome" type="hidden" name="cliente.nome" value="${cliente.nome }" /> 
				
					<c:forEach items="${carrinho.itens}" var="item" varStatus="s">
						<input id="produto" type="hidden" name="itemDoPedido[${s.index}].produto.id" value="${item.produto.id }">
						<input id="qntdade" type="hidden" name="itemDoPedido[${s.index}].qntdade" value="${item.quantidade}">
					</c:forEach>
			
					<button type="submit">Pagar</button>
				</form>
		
				<a href="<c:url value="/carrinho/cancelaPedido"/>">Limpar carrinho</a>
			</div>
		</fieldset>
	</body>
</html>