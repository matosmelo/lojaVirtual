<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/cabecalho.css" />" />
		<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/estiloBody.css" />" />
		<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/estiloMinhaConta.css" />" />
		<title>Detalhe dos pedidos</title>
	</head>

	<body>
		<div id="cabecalho">
		
		<span>Loja Virtual</span>
			<div id="minhaConta" ><a href="<c:url value="/loja"/>">Loja</a>
				<c:if test="${clienteWeb.logado}">
	    			Olá, ${clienteWeb.nome }! 
	    		
	    			<a href="<c:url value="/logoutCliente"/>">Logout</a>
				</c:if>
				
				<a href="<c:url value="/minhaConta"/>">Minha conta</a>
		
			</div>
		</div>
		
		<fieldset>
			<legend>Detalhes do pedido</legend>
			
			<table>
				<c:forEach items="${itemDoPedidoList }" var="itemDoPedido">
					<tr>
						<td><img src="<c:url value="/produto/${itemDoPedido.produto.id}/imagem"/>" width="100" height="100"/></td>
						<td>Produto: ${itemDoPedido.produto.nome}</td>
						<td>
						Valor:<fmt:formatNumber type="currency" value="${itemDoPedido.produto.preco}" />
						</td>
						<td>Quantidade: ${itemDoPedido.qntdade}</td>
						<td>Valor Total: <fmt:formatNumber type="currency" value="${itemDoPedido.qntdade * itemDoPedido.produto.preco}" /> </td>
					</tr>
				</c:forEach>
			</table>
				
			<a href="<c:url value="/minhaConta/meusPedidos/${clienteWeb.login }"/>">Voltar</a>
		</fieldset>
	</body>
</html>