<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="layout" content="main"/>
<title>R&eacutesultats</title>
</head>
<body>
  <div class="body">
  	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			<li><g:link class="create" action="create"><g:message code="Ajouter" args="[entityName]" /></g:link></li>
			<li><g:link action="rechercheLivres"><g:message code="Recherche" /></g:link></li>
		</ul>
	</div>
  	<table>
		<thead>
			<tr>
			
				<g:sortableColumn property="titre" title="${message(code: 'livre.titre.label', default: 'Titre')}" />
			
				<g:sortableColumn property="nbEx" title="${message(code: 'livre.nbEx.label', default: 'Nb Ex')}" />
			
				<g:sortableColumn property="nbExDispos" title="${message(code: 'livre.nbExDispos.label', default: 'Nb Ex Dispos')}" />
			
				<th><g:message code="livre.type.label" default="Type" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${livreInstanceList}" status="i" var="livreInstance">
			<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
			
				<td><g:link action="show" id="${livreInstance.id}">${fieldValue(bean: livreInstance, field: "titre")}</g:link></td>
			
				<td>${fieldValue(bean: livreInstance, field: "nbEx")}</td>
			
				<td>${fieldValue(bean: livreInstance, field: "nbExDispos")}</td>
			
				<td>${fieldValue(bean: livreInstance, field: "type")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
  </div>
</body>
</html>