<%@ page import="jee.pottier.biblioj.Livre" %>

<div class="fieldcontain">
	<label for="titre">
		<g:message code="livre.titre.label" default="Titre" />
	</label>
	<g:textField name="titre" value=""/>
</div>


<div class="fieldcontain">
	<label for="nom">
		<g:message code="livre.auteurs.label" default="Auteur" />
	</label>
	<g:textField name="nom" value=""/>
</div>

<div class="fieldcontain">
	<label for="type">
		<g:message code="livre.type.label" default="Type" />
	</label>
	<g:checkBox name="checkType" value="true" />
	<g:select id="type" name="type" from="${jee.pottier.biblioj.Type.list()}" optionKey="id" value="${livreInstance?.type?.id}" class="many-to-one"/>
</div>
