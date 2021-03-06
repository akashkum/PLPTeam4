<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Welcome</title>
		<style type="text/css">
			#left {
				float:left;
				width:27%;
				height: 25em;
				margin:1px .2em 1px 1px;
			
			}
			#right {
				float:right;
				width:27%;
				height: 25em;
				margin:1px .2em 1px 1px;
				border: 2px solid green;
			
			}
		</style>
		<script src="/PLP_UniversityAddmissionSystem_Team4/jsLib/jquery-1.12.3.js" type="text/javascript"></script>
		<script src="/PLP_UniversityAddmissionSystem_Team4/jsLib/MyJsLib.js" type="text/javascript"></script>
	</head>
	<body>
		<jsp:include page="Header.jsp">
			<jsp:param value="${loginId}" name="loginId"/>
		</jsp:include>
		
		<center>	
			<br><br>
			<div id="left">
		<a href="applicantSheduledProgramlist.do">Scheduled Programs</a> <br><br>
		<a href="applicantShowStatusPage.do">Check Status</a><br><br>
		</div>
	<c:if test="${scheduledProgramList ne null}">
		<table width="700" align="center" border="1" bgcolor="#CCCCCC">
			<tr>
				<th>Scheduled Program Id</th>
				<th>Program Name</th>
				<th>Location</th>
				<th>Start Date</th>
				<th>End Date</th>
				<th>Session Per Week</th>
				<th>Apply Online</th>
			</tr>
			<c:forEach var="sch" items="${scheduledProgramList}">
				<tr>
					<td>${sch.scheduledProgramId}</td>
					<td>${sch.programName}</td>
					<td>${sch.location}</td>
					<td>${sch.startDate}</td>
					<td>${sch.endDate}</td>
					<td>${sch.sessionPerWeek}</td>
					<td><a href="getApplicantRegisterationPage.do?schId=${sch.scheduledProgramId}">Apply Online</a></td>
				</tr>
			</c:forEach>
		</table>
		</c:if>
		<c:if test="${statusFlag ne null }">
			<form action="applicantShowStatus.do">
		Enter Application Id : <input type="text" name="applicationId" required><br>
		<input type="submit" value="Get Status">
	</form><br><br>
	<c:if test="${applicant ne null}">
		<table border="1">
			<tr>
				<th>Status</th>
				<td>${applicant.status}</td>
			</tr>
		<c:if test="${applicant.status eq 'accepted'}">
			<tr>
				<th>Date Of Interview</th>
				<td>${applicant.dateOfInterview}</td>
			</tr>		
		</c:if>
		</table>
	</c:if>
	</c:if>
	<c:if test="${applyFlag ne null}">
	<c:if test="${appId ne 0}">
			<h3>You are successfully registered. Your Application Id is ${appId}</h3>
			</c:if>
			<c:if test="${appId eq 0}">
			<sf:form modelAttribute="applicant" action="applicantRegister.do" method="post" >
				<table align="center" border="1">
				
				<tr>
						<td>Program Id :</td>
						<td> <sf:input path="scheduledProgramId" type="text" value="${scheduledId}" readonly="true"/></td>
					</tr>
				
					<tr>
						<td>Enter Full Name :</td>
						<td> <sf:input path="fullName" type="text" required="true" placeholder="e.g.Vipul Gupta"/>
						<sf:errors path="fullName" name="error"></sf:errors></td>
					</tr>
					
					<tr>
						<td>Enter Date Of Birth: </td>
						<td><sf:input path="dateOfBirth" type="text" required="true" />
						<sf:errors path="dateOfBirth" name="error"></sf:errors></td>
					</tr>
					
					<tr>
						<td>Enter Highest Qualification: </td>
						<td><sf:input path="highestQualification" type="text" required="true" placeholder="e.g. B.Tech"/>
						<sf:errors path="highestQualification" name="error"></sf:errors></td>
					</tr>
					<tr>
						<td>Enter Marks Obtained: </td>
						<td><sf:input path="marksObtained" type="text" required="true" placeholder="e.g. 98"/>
						<sf:errors path="marksObtained" name="error"></sf:errors></td>
					</tr>
					<tr>
						<td>Enter Goals: </td>
						<td><sf:input path="goals" type="text" required="true" placeholder="e.g. CEO"/>
						<sf:errors path="goals" name="error"></sf:errors></td>
					</tr>
					
					<tr>
						<td>Enter EmailId:</td>
						<td> <sf:input path="emailId" type="text" required="true" placeholder="e.g. abc@some.some"/>
						<sf:errors path="emailId" name="error"></sf:errors></td>
					
					</tr>
					<tr>
						<td><input  type="reset" value="Reset" /></td>
						<td><input  type="submit" value="Register" /></td>
					</tr>
				</table>
			</sf:form>
			</c:if>
	</c:if>
		</center>
	</body>
</html>