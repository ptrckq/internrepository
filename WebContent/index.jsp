<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<p style="font-family: Verdana;">Busca Produto</p>
	<form action="ws/loja/produto/recupera" method="get">
		<input type="number" name="cod" required> <input type="submit">
	</form>

	<p>Insere Produto</p>
	<form action="ws/loja/produto/adiciona" method="post">
		<input type="text" name="nome">
		<input type="text"	name="preco">
		<input type="text" name="cod">
		<button type="submit" onclick="mostraAlerta()">Enviar</button>
	</form>

	<script>
		function mostraAlerta() {
			alert("Dados salvos");
		}
	</script>


</body>
</html>