<%@ page import="jee.pottier.biblioj.Auteur" %>



<div class="fieldcontain ${hasErrors(bean: auteurInstance, field: 'nom', 'error')} required">
	<label for="nom">
		<g:message code="auteur.nom.label" default="Nom" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nom" required="" value="${auteurInstance?.nom}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: auteurInstance, field: 'prenom', 'error')} required">
	<label for="prenom">
		<g:message code="auteur.prenom.label" default="Prenom" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="prenom" required="" value="${auteurInstance?.prenom}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: auteurInstance, field: 'livresEdites', 'error')} ">
	<label for="livresEdites">
		<g:message code="auteur.livresEdites.label" default="Livres Edites" />
		
	</label>
	<g:select name="livresEdites" from="${jee.pottier.biblioj.Livre.list()}" multiple="multiple" optionKey="id" size="5" value="${auteurInstance?.livresEdites*.id}" class="many-to-many"/>
</div>

