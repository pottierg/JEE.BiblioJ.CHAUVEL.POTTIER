<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="layout" content="main"/>
<title>Recherche de livres</title>
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
  	<g:form action="resultatsRecherche" >
		<fieldset class="formRecherche">
			<g:render template="formRecherche"/>
		</fieldset>
		<fieldset class="buttons">
			<g:submitButton name="Recherche" class="resultatsRecherche" value="Rechercher" />
		</fieldset>
	</g:form>
  </div>
</body>
</html>