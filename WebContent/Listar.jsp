<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">

<meta charset="ISO-8859-1">
<title>Listar Carro</title>

<style type="text/css">
body {
	background: #22142b;
}

p {
	color: white;
	font-size: 20x;
}

.container {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center
}

.cabecalho {
	display: flex;
	flex-direction: row;
	justify-content: center;
	align-items: center
	
}

h1 {
	color: white;
}

h2 {
	color: white;
}

td {
	text-align: center;
	vertical-align: middle;
}

a {
	color: white;
	text-decoration: none;
}

a:link {
	color: white;
	text-decoration: none;
}

a:hover {
	color: #e7dfdd;
	text-decoration: none;
}
</style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
    <div class="navbar-nav">
      <a class="nav-item nav-link active" href="Cadastrar.jsp">Pagina de Cadastro <span class="sr-only">(current)</span></a>
      <a class="nav-item nav-link" href="Controller?acao=list&method=get">Listagem de produtos</a>
    </div>
  </div>
</nav>
<br><br><br>
	


	<div class="container">

		<div class="input-group w-25 p-3">
			<form method="get" action="Controller">
				 <input type="hidden"
					name="acao" value="filter"> 
					<input type="text"
					class="form-control rounded" placeholder="Pesquisar"
					aria-label="Search" aria-describedby="search-addon" name="pesquisar"/>
				<button type="submit" class="btn btn-outline-primary">Pesquisar</button>
			</form>
		</div>

		<table border="1">
			<tr>
				<td><p>Codigo</p></td>
				<td><p>Nome</p></td>
				<td><p>Descricao</p></td>
				<td><p>Valor</p></td>
				<td><p>Quantidade</p></td>
				<td><p>Ações</p></td>

			</tr>
			<c:forEach items="${listaProduto}" var="produtos">
				<tr>
					<td><p>${produtos.getCod()}</p></td>
					<td><p>${produtos.getNome()}</p></td>
					<td><p>${produtos.getDescricao()}</p></td>
					<td><p>${produtos.getValor()}</p></td>
					<td><p>${produtos.getQuantidade()}</p></td>
					<td><a href="Controller?acao=delete&id=${produtos.getCod()}"
						class="btn  btn-danger btn-sm" onclick="myFunction()">Excluir</a>
						<a href="Controller?acao=filter&pesquisar=${produtos.getCod()}"
						class="btn  btn-primary btn-sm">Editar</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>

</body>
<script>
	function myFunction() {
		confirm("Deseja deletar?");
	}
</script>
</html>