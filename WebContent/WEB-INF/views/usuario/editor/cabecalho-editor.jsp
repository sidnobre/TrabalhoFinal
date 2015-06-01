<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

		<!--Cabeçalho da pagina -->
	<div class="container">
	<div class="well">
		<table>
			<tr height="50">
				<td width="100"></td>
				<td width="600">
				
					<img height="100" src="<c:url value="/resources/img/logo.png" />">
					
				</td><td align="right" width="1000">
					<!-- Bem vindo e Logout -->
					 <font size="2pp">
						Bem vindo, <b>${usuarioLogado.nome}${jornalistaLogado.nome}${editorLogado.nome}</b>
					</font>
				</td>
				<td width="50"></td>
			</tr>
		</table>

		<!-- Menu NAVBAR -->
		<div id="nav" class="container" >
		<ul class="nav nav-pills" >
				<li class="active"><a href="home">Home</a></li>
				<li class="active"><a href="cadastro_jornalista">Cadastrar Jornalista</a></li>
				<li class="active"><a href="cadastro_classificado">Cadastrar Classificado</a></li>
				<li class="active"><a href="cadastro_secao">Cadastrar Secao</a></li>
				<li class="active"><a href="../logout">Sair</a></li>
					
		</ul>
		</div>
	</div>
	</div>
