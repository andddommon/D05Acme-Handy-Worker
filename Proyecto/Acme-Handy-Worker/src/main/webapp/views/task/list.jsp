<%--
 * list.jsp
 *
 * Copyright (C) 2014 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 --%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<!-- Listing grid -->


<display:table pagesize="5" class="displaytag" keepStatus="true"
	name="tasks" requestURI="${requestURI}" id="row">
	
		<!-- Action links -->

	<security:authorize access="hasRole('CUSTOMER')">
		<display:column>
			<a href="task/customer/edit.do?taskId=${row.id}">
				<spring:message	code="task.edit" />
			</a>
		</display:column>		
	</security:authorize>
	
	
	
		<!-- Attributes -->

	<spring:message code="task.ticker" var="ticker" />
	<display:column property="ticker" title="${ticker}" sortable="true" />

	<spring:message code="task.description" var="description" />
	<display:column property="description" title="${description}" sortable="true" />
	
	<spring:message code="task.maximumPrice" var="maximumPrice" />
	<display:column property="maximumPrice" title="${maximumPrice}" sortable="true" />
	
	<spring:message code="task.startDate" var="startDate" />
	<display:column property="startDate" title="${startDate}" sortable="true" />
	
	<spring:message code="task.endDate" var="endDate" />
	<display:column property="endDate" title="${endDate}" sortable="true" />
	
	<spring:message code="task.address" var="address" />
	<display:column property="address" title="${address}" sortable="true" />
	
	<spring:message code="task.warranty" var="warranty" />
	
	<spring:message code="task.category" var="category" />
	<display:column property="category.name" title="${category}" sortable="true" />
	
	<display:column>
			<a href="warranty/customer/list.do?taskId=${row.id}">
				<spring:message	code="warranty.list" />
			</a>
	</display:column>
	



</display:table>

<!-- Action links -->

<security:authorize access="hasRole('ADMIN')">
	<div>
		<a href="task/customer/create.do"> <spring:message code="task.create" /></a>
	</div>
	
</security:authorize>
	