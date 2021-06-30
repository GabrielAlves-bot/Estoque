<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<meta charset="ISO-8859-1">

<title>Formulario Carro</title>
<style type="text/css">
body {
	background: #22142b;
}

p {
	color: white;
	font-size: 20x;
}

.container {
	width: 70vh;
	height: 60vh;
	display: flex;
	flex-direction: row;
	justify-content: center;
	align-items: center
}

.item {
	margin: 5px;
	text-align: center;
	font-size: 1.5em;
}

.form-control {
	width: 400px;
}

.cabecalho {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center
}

h1 {
	color: white;
}

h2 {
	color: white;
}

h3 {
	color: white;
	display: flex;
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
      <a class="nav-item nav-link active" href="Cadastrar.jsp">Pagina De Cadastro <span class="sr-only">(current)</span></a>
      <a class="nav-item nav-link" href="Controller?acao=list&method=get">Listagem de Produtos</a>
    </div>
  </div>
</nav>
<br><br><br>

	<div class="container">
		<form action="Controller" method="POST">
			<input type="hidden" name="acao" value="update"> <input
				type="hidden" name="cod" value="${produto.getCod()}">
			<div class="item" id="formGroupExampleInput">
				<p>Nome:</p>
				<input type="text" class="form-control" placeholder="Nome"
					name="nome" value="${produto.getNome()}" maxlength="30"
					required="required">
			</div>
			<div class="item" id="formGroupExampleInput">
				<p>Descrição:</p>
				<input type="text" class="form-control" placeholder="Descrição"
					name="descricao" value="${produto.getDescricao()} "
					required="required" maxlength="100">
			</div>
			<div class="item" id="formGroupExampleInput">
				<p>Valor:</p>
				<input type="text" class="form-control" placeholder="Valor"
					name="valor" value="${produto.getValor()}" required="required">
			</div>
			<div class="item" id="formGroupExampleInput">
				<p>Quantidade:</p>
				<input type="text" class="form-control" placeholder="Quantidade"
					name="quantidade" value="${produto.getQuantidade()} " required="required">
			</div>
			<div class="item space">

				<button class="btn  btn-primary btn" type="submit">Alterar</button>
				<a href="Controller?acao=delete&id=${produto.getCod()}"
					class="btn  btn-danger btn">Excluir</a>
			</div>
		</form>

	</div>

</body>
</html>
