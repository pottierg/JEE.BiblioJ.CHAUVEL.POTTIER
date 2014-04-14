<%@ page import="jee.pottier.biblioj.Livre" %>



<div class="fieldcontain ${hasErrors(bean: livreInstance, field: 'titre', 'error')} required">
	<label for="titre">
		<g:message code="livre.titre.label" default="Titre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="titre" required="" value="${livreInstance?.titre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: livreInstance, field: 'nbEx', 'error')} required">
	<label for="nbEx">
		<g:message code="livre.nbEx.label" default="Nb Ex" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="nbEx" type="number" value="${livreInstance.nbEx}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: livreInstance, field: 'nbExDispos', 'error')} required">
	<label for="nbExDispos">
		<g:message code="livre.nbExDispos.label" default="Nb Ex Dispos" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="nbExDispos" type="number" value="${livreInstance.nbExDispos}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: livreInstance, field: 'auteurs', 'error')} ">
	<label for="auteurs">
		<g:message code="livre.auteurs.label" default="Auteurs" />
		
	</label>
	
</div>

<div class="fieldcontain ${hasErrors(bean: livreInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="livre.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="type" name="type.id" from="${jee.pottier.biblioj.Type.list()}" optionKey="id" required="" value="${livreInstance?.type?.id}" class="many-to-one"/>
</div>

