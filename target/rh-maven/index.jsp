<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<fieldset><legend><p style="font-family: Verdana;">Busca Produto</p></legend>
	<form action="ws/loja/produto/recupera" method="get">
		<label>Código de Barras: </label><input type="number" name="cod" required> <input type="submit">
	</form>
	</fieldset>
	
		</br>
		
	<fieldset><legend><p style="font-family: Verdana;">Insere Produto</p></legend>
	<form action="ws/loja/produto/adiciona" method="post">
		<label>Nome do Produto: </label><input type="text" name="nome" required>
		<label>Preço do Produto: </label><input type="number" name="preco" required>
		<label>Codigo de Barras: </label><input type="number" name="cod" required>
		<button type="submit" onclick="mostraAlerta()">Enviar</button>
	</form>
	</fieldset>

	<script>
		function mostraAlerta() {
			alert("Dados salvos");
		}
	</script>


</body>
</html>