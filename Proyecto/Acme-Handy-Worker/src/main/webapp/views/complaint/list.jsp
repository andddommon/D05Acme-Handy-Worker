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
	name="complaint" id="row">
	
		<!-- Action links -->

	
		<display:column>
			<a href="complaint/customer.do?complaintId=${row.id}">
				<spring:message	code="complaint.edit" />
			</a>
		</display:column>		

	
		<!-- Attributes -->

	<spring:message code="complaint.ticker" var="ticker" />
	<display:column property="ticker" title="${ticker}" sortable="true" />

	<spring:message code="complaint.moment" var="moment" />
	<display:column property="moment" title="${moment}" sortable="true" />
	
	<spring:message code="complaint.description" var="description" />
	<display:column property="description" title="${description}" sortable="true" />
	
	<spring:message code="complaint.attachment" var="attachment" />
	<display:column property="attachment" title="${attachment}" sortable="true" />
	
	
	<input type="submit" name="delete"
			value="<spring:message code="complaint.delete" />"
			onclick="return confirm('<spring:message code="complaint.confirm.delete" />')" />&nbsp;
	

</display:table>


	