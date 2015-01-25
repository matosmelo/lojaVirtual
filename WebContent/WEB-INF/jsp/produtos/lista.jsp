<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/cabecalho.css" />" />
		<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/estiloBody.css" />" />
		<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/estiloProduto.css" />" />
		<title>Lista de Produtos</title>
	</head>
	
	<body>
		<div id="cabecalho">
			<span>Loja Virtual</span>
			
			<div id="usuario">
				<c:if test="${usuarioWeb.logado}">
	    			Olá, ${usuarioWeb.login }! 
	    		
	    			<a href="<c:url value="/logout"/>">Logout</a>
	    			<a href="<c:url value="/clientes"/>">clientes</a>
				</c:if>
			</div>
		</div>
		
		<fieldset>
			<table>
				<thead>
					<tr>
						<th>Nome</th>
						<th>Preço</th>
					</tr>
				</thead>
			
				<tbody>
					<c:forEach items="${produtoList}" var="produto">
						<tr>
							<td>${produto.nome }</td>
							<td><fmt:formatNumber type="currency" value="${produto.preco}" /></td>
							<td><img src="<c:url value="/produto/${produto.id}/imagem"/>" width="100" height="100"/></td>
							<td><a href="<c:url value="/produto/${produto.id}"/>">Editar</a></td>
						
							<td>
								<form action="<c:url value="/produto/${produto.id}"/>"	method="POST">
								
									<button name="_method" value="DELETE">Remover</button>
								</form>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		
			<a href="<c:url value="/produto/novo"/>">Novo Produto</a>
		</fieldset>
	</body>
</html>