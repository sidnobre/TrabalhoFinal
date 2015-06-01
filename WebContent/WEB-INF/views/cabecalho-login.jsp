<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap.css" />" />
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/menu.css" />" />
<script type="text/javascript" src="<c:url value="/resources/js/bootstrap.js" />"></script>   
<script type="text/javascript" src="<c:url value="/resources/js/jquery-2.1.4.js" />"></script>
		<!--Cabeçalho da pagina -->
	
	<div class="container">
	<div class="well">
		<table>
			<tr height="100">
				<td width="50"></td>
				<td width="600">
				
					<img height="100" src="<c:url value="/resources/img/logo.png" />">
					
				</td><td align="right" width="1000">
					<!-- Fomulario Login -->
					 <form action="efetuaLogin" method="post">
				
							<div class="input-group" align="right">
								<input type="text" name="login"  class="input-medium" placeholder="Login" aria-describedby="sizing-addon1"/>
								<input type="password" name="senha" class="input-medium" placeholder="Senha" aria-describedby="sizing-addon1"/>
							</div>
							<div class="input-group">
								<input type="submit" value="Entrar" class="btn"/>	
								<font size="2">Não tem conta? <a href="cadastrarLeitor">Cadastre-se</a></font>		 
							</div>
					</form>
				</td>
				<td width="50"></td>
			</tr>
		</table>
			<!-- Menu NAVBAR -->
			<div id="nav" class="container">
				<ul class="nav nav-pills" >
						<li class="active"><a href="home">Home</a></li>
						<li class="active"><a href="classificado">Classificados</a></li>
                        <li class="dropdown">
                            <a href="#" class="active" class="dropdown-toggle"  data-toggle="dropdown">
                            Seções
                            <b class="caret"></b>
                            </a>                            
                            <ul class="dropdown-menu">
                                <c:forEach items="${secoes}" var="secao">
									<li class="active" ><a href="secao?idsecao=${secao.id}">${secao.titulo}</a></li>
								</c:forEach>
                            </ul>
                        </li>
                    
				</ul>
			</div>
		</div>
		</div>