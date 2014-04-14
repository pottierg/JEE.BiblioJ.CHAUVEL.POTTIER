<%@ page import="jee.pottier.biblioj.Reservation" %>



<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'code', 'error')} required">
	<label for="code">
		<g:message code="reservation.code.label" default="Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="code" type="number" value="${reservationInstance.code}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'dateReservation', 'error')} required">
	<label for="dateReservation">
		<g:message code="reservation.dateReservation.label" default="Date Reservation" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateReservation" precision="day"  value="${reservationInstance?.dateReservation}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'livresReserves', 'error')} ">
	<label for="livresReserves">
		<g:message code="reservation.livresReserves.label" default="Livres Reserves" />
		
	</label>
	<g:select name="livresReserves" from="${jee.pottier.biblioj.Livre.list()}" multiple="multiple" optionKey="id" size="5" value="${reservationInstance?.livresReserves*.id}" class="many-to-many"/>
</div>

