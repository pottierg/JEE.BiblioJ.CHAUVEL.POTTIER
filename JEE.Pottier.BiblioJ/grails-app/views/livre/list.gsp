
<%@ page import="jee.pottier.biblioj.Livre" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'livre.label', default: 'Livre')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-livre" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="Ajouter" args="[entityName]" /></g:link></li>
				<li><g:link action="rechercheLivres"><g:message code="Recherche" /></g:link></li>
			</ul>
		</div>
		<div id="list-livre" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			<form name="ajout" action="list" method="get">
				
				<table>
					<thead>
						<tr>
						
							<g:sortableColumn property="titre" title="${message(code: 'livre.titre.label', default: 'Titre')}" />
						
							<g:sortableColumn property="nbEx" title="${message(code: 'livre.nbEx.label', default: 'Nb Ex')}" />
						
							<g:sortableColumn property="nbExDispos" title="${message(code: 'livre.nbExDispos.label', default: 'Nb Ex Dispos')}" />
						
							<th><g:message code="livre.type.label" default="Type" /></th>
							
							<th></th>
						
						</tr>
					</thead>
					<tbody>
					<g:each in="${livreInstanceList}" status="i" var="livreInstance">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						
							<td><g:link action="show" id="${livreInstance.id}">${fieldValue(bean: livreInstance, field: "titre")}</g:link></td>
						
							<td>${fieldValue(bean: livreInstance, field: "nbEx")}</td>
						
							<td>${fieldValue(bean: livreInstance, field: "nbExDispos")}</td>
						
							<td>${fieldValue(bean: livreInstance, field: "type")}</td>
							
							<td>
								<g:if test="${livreInstance.nbExDispos > 0 && !session.panier.contains(livreInstance.id)}">
									<button name="idLivre" type="submit" value="${livreInstance.id}">Ajouter</button>
								</g:if>
							</td>
						
						</tr>
					</g:each>
					</tbody>
				</table>
			</form>
			<div class="pagination">
				<g:paginate total="${livreInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
