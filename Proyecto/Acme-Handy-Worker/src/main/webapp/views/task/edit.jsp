<%--
 * edit.jsp
 *
 * Copyright (C) 2013 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 --%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<form:form action="${requestURI}" modelAttribute="task">
	<form:hidden path="id"/>
	<form:hidden path="version"/>
	<form:hidden path="moment"/>
	<form:hidden path="assigned"/>
	<form:hidden path="customer"/>
	<form:hidden path="applications"/>
	

	
	
<table style="border: medium solid blue; border-collapse: collapse;">
	
	<tr>
	<td>
	<br />
	<br>
	<form:label path="ticker" >
	<spring:message code="task.ticker"/>
	</form:label>
	

	<form:input path="ticker"/>

	<form:errors cssClass="error" path="ticker" />
	<br /><br />
	
	</td>
	<td>
	<br />
	<br>
	
	<form:label path="description">
		<spring:message code="task.description" />:
	</form:label>
	<form:textarea path="description" />
	<form:errors cssClass="error" path="description" />
	<br /><br />
	
	</td>
	</tr>
	
	<tr>
	<td>
		
	<form:label path="address">
		<spring:message code="task.address" />:
	</form:label>
	<form:textarea path="address" />
	<form:errors cssClass="error" path="address" />
	<br /><br />
	
	</td>
	
		<td>
		
	<form:label path="maximumPrice">
		<spring:message code="task.maximumPrice" />
	</form:label>
	<form:input path="maximumPrice" />
	<form:errors cssClass="error" path="maximumPrice" /><br />
	
	</td>
	
	</tr>
	
	<tr>
	<td>
	<form:label path="startDate">
		<spring:message code="task.startDate" />
	</form:label>
	<form:input path="startDate"/>  
	<form:errors cssClass="error" path="maximumPrice" /><br />
	</td>
	
	
	<td>
	<form:label path="endDate">
		<spring:message code="task.endDate" />
	</form:label>
	<form:input path="endDate"/>  
	<form:errors cssClass="error" path="endDate" /><br />  
	
	</td>
	
		
	</tr>


		<tr>
	<td>
	<form:label path="category">
		<spring:message code="task.category" />
	</form:label>
	<form:select path="category" items="${categories}" itemLabel="name" itemValue="id" /> 
	</td>
	
	
	<td>
	<form:label path="warranty">
		<spring:message code="task.warranty" />
	</form:label>
	<form:select path="warranty" items="${warranties}" itemLabel="title" itemValue="id" />
	
	</td>
	
		
	</tr>
	

	
</table>

	
	<input type="submit" name="save"
		   value="<spring:message code="task.save"/>" />
	&nbsp;	
	<input type="button" name="cancel" 
		   value="<spring:message code="task.cancel"/>" 
		   onclick="javascript: window.location.replace('welcome.do');" />
		   
		   	<jstl:if test="${task.id != 0}">
	&nbsp;
	<input type="submit" name="delete"
			value="<spring:message code="task.delete" />"
			onclick="return confirm('<spring:message code="task.confirm.delete" />')" />&nbsp;
	</jstl:if>
	<br />
</form:form>