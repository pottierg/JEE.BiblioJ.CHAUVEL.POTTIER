<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="layout" content="main"/>
<title>Reservation</title>
</head>
<body>
  <div class="body">
  	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
		</ul>
	</div>
	
	<g:if test="${session.message != null}">
		<g:if test="${session.message != ""}">
			${session.message}
		</g:if>
	</g:if>
	
	<g:if test="${reserve != null}">
	<g:if test="${!reserve.isEmpty()}">
		<table>
			<thead>
				<tr>
				
					<g:sortableColumn property="titre" title="${message(code: 'livre.titre.label', default: 'Titre')}" />
				
					<th><g:message code="livre.type.label" default="Type" /></th>
				
				</tr>
			</thead>
			<tbody>
				<g:each in="${reserve}" status="i" var="livreInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${livreInstance.id}">${fieldValue(bean: livreInstance, field: "titre")}</g:link></td>
					
						<td>${fieldValue(bean: livreInstance, field: "type")}</td>
					
					</tr>
				</g:each>
			</tbody>
		</table>
	</g:if>
	</g:if>
	
	<g:if test="${indisponible != null}">
	<g:if test="${!indisponible.isEmpty()}">
		<table>
			<thead>
				<tr>
				
					<g:sortableColumn property="titre" title="${message(code: 'livre.titre.label', default: 'Titre')}" />
					
					<th><g:message code="livre.type.label" default="Type" /></th>
				
				</tr>
			</thead>
			<tbody>
				<g:each in="${indisponible}" status="i" var="livreInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${livreInstance.id}">${fieldValue(bean: livreInstance, field: "titre")}</g:link></td>
					
						<td>${fieldValue(bean: livreInstance, field: "type")}</td>
					
					</tr>
				</g:each>
			</tbody>
		</table>
		<p>
		Ces livres ne sont plus disponibles. Voulez-vous valider la commande avec les livres disponibles ou annuler?<br>
		${link(action:'confirmerReservation', controller:'reservation') { 'Valider' }}<br>
		${link(action:'annulerReservation', controller:'reservation') { 'Annuler' }}<br>
		</p>
	</g:if>
	<g:else>
		<p>La r&eacuteservation a &eacutet&eacute enregistr&eacutee.<br>
		Votre code est : ${session.reservation.code}<br>
		La date limite de retrait est : ${session.dateLimite}<br></p>
	</g:else>
	</g:if>
	
  </div>
</body>
</html>