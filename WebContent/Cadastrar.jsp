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

.space-between {
	justify-content: space-between;
}
.cabecalho {
	display: flex;
	flex-direction: row;
	justify-content: center;
	align-items: center

}



h1 {
	color: white;
	padding-left: 20px;
	padding-right: 20px;
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
      <a class="nav-item nav-link active" href="Cadastrar.jsp">Cadastrar <span class="sr-only">(current)</span></a>
      <a class="nav-item nav-link" href="Controller?acao=list&method=get">Listar Produtos</a>
    </div>
  </div>
</nav>
<br><br><br>
	<div class="container">
		<form action="Controller" method="POST">
			<input type="hidden" class="form-control" placeholder="Nome"
				name="acao" value="create">
			<div class="item" id="formGroupExampleInput">
				<p>Nome:</p>
				<input type="text" class="form-control" placeholder="Nome"
					name="nome" maxlength="30" required="required">
			</div>
			<div class="item" id="formGroupExampleInput">
				<p>Descrição:</p>
				<input type="text" class="form-control" placeholder="Descrição"
					name="descricao" required="required" maxlength="100">
			</div>
			<div class="item" id="formGroupExampleInput">
				<p>Valor:</p>
				<input type="text" class="form-control" placeholder="Valor"
					name="valor" required="required" >
			</div>
			<div class="item" id="formGroupExampleInput">
				<p>Quantidade:</p>
				<input type="text" class="form-control" placeholder="Quantidade"
					name="quantidade" required="required" >
			</div>
			<div class="item">
				<button type="submit" class="btn btn-success">Adicionar</button>

			</div>
		</form>
		
	</div>
	<br><br><br>
	<div class="cabecalho">
	<h3>${msg}</h3>
	</div>
</body>


</html>
