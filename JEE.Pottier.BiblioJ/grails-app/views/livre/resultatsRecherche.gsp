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
	
	
	
	<form name="ajout" action="resultatsRecherche" method="get">
	  	<table>
			<thead>
				<tr>
				
					<g:sortableColumn property="titre" title="${message(code: 'livre.titre.label', default: 'Titre')}" />
				
					<g:sortableColumn property="nbExDispos" title="${message(code: 'livre.nbExDispos.label', default: 'Nb Ex Dispos')}" />
				
					<th><g:message code="livre.type.label" default="Type" /></th>
					
					<th></th>
				
				</tr>
			</thead>
			<tbody>
				<g:set var="minbound" value="${(pagination.offset > livreInstanceTotal? livreInstanceTotal : pagination.offset)}" />
				<g:set var="maxbound" value="${(pagination.offset + pagination.max > livreInstanceTotal? livreInstanceTotal : pagination.offset + pagination.max)}" />
				<g:each in="${livreInstanceList.subList(minbound, maxbound)}" status="i" var="livreInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${livreInstance.id}">${fieldValue(bean: livreInstance, field: "titre")}</g:link></td>
					
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
	<g:if test="${livreInstanceTotal > 5}">
	<div class="pagination">
		<g:paginate total="${livreInstanceTotal}" next="Suivant" prev="Precedent" controller="livre"
            action="resultatsRecherche" max="5" maxsteps="5" offset="${pagination.offset}" />
	</div>
	</g:if>
  </div>
</body>
</html>