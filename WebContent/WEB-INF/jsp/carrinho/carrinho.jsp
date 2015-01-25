<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/cabecalho.css" />" />
		<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/estiloBody.css" />" />
		<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/estiloCarrinho.css" />" />
		<title>Carrinho</title>
	</head>
	
	<body>
		<div id="cabecalho">
			<span>Loja Virtual</span>
			<div id="carrinho"><a href="<c:url value="/carrinho"/>">Carrinho</a></div>
			<div id="minhaConta" ><a href="<c:url value="/minhaConta"/>">Minha conta</a></div>
		</div>
		
		<fieldset>
			<legend>Carrinho de compras</legend> 
	
			<table>
				<tr>
					<th>Produto</th>
					<th>Nome</th>
					<th>Preço</th>
					<th>Quantidade</th>
					<th>Total</th>
				</tr>

				<c:forEach items="${carrinho.itens}" var="item" varStatus="s">
					<tr>
						<td><img src="<c:url value="/produto/${item.produto.id}/imagem"/>" width="100" height="100"/></td>
						<td>${item.produto.nome }</td>
						<td><fmt:formatNumber type="currency" value="${item.produto.preco }" /></td>
						<td align="right">${item.quantidade }</td>
						<td><fmt:formatNumber type="currency" value="${item.quantidade * item.produto.preco }" /></td>
						<td>
							<form action="<c:url value="/carrinho/${s.index}"/>" method="POST">
								<button class="link" name="_method" value="DELETE">Remover</button>
							</form>
						</td>
					</tr>
				</c:forEach>
			</table>

			<div id="concluirCompra">
	
				<form action="<c:url value="/carrinho/pagamento/${clienteWeb.login}"/>">
					Valor total:<fmt:formatNumber type="currency" value="${carrinho.total }" />
					<button type="submit" >Concluir compra</button>
				</form>

				<a href="<c:url value="/loja"/>">Continuar comprando</a>
			</div>
		</fieldset>
	</body>
</html>