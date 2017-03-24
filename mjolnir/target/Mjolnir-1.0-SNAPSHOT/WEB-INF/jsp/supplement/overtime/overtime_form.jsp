<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous"/>
        <script src=https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
        <script src="<c:url value="/"/>js/app.js"></script>
        <script src="<c:url value="/"/>js/ot.js"></script>
        
        <c:if test="${action == 'save'}">
            <title>Add Over Time</title>
        </c:if>
        <c:if test="${action == 'update'}">
            <title>Update Over Time</title>
        </c:if>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <%@ include file="/WEB-INF/jsp/header.jsp" %>  
            </div>  
                <form:form class="form-horizontal" method="POST" action="${action}" commandName="overtimeForm">            
                <fieldset>
                    <%--<form:hidden class="form-control" path="id"/>--%>
                    <c:if test="${action == 'update'}">
                        <form:hidden class="form-control" path="id" value="${id}"/>
                    </c:if>
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Employee ID:</label>  
                        <div class="col-md-4">                                
                            <form:input class="form-control input-md" path="empId" value="${empId}" readonly="true"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Date:</label>  
                        <div class="col-md-4">                                
                            <form:input type="date" class="form-control input-md" id="fullDate" path="fullDate" onchange="dateSplit()" required="true"/>
                            <form:hidden class="form-control" id="dayName" path="dayName"/>
                            <form:hidden class="form-control" id="year" path="year"/>
                            <form:hidden class="form-control" id="month" path="month"/>
                            <form:hidden class="form-control" id="date" path="date"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Start:</label>  
                        <div class="col-md-4">
                            <form:input type="time" class="form-control input-md" id="timeIn" path="timeIn" onchange="timeCal()" required="true"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">End:</label>  
                        <div class="col-md-4">
                            <form:input type="time" class="form-control input-md" id="timeOut" path="timeOut" onchange="timeCal()" required="true"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Total:</label>  
                        <div class="col-md-4">
                            <form:input type="text" class="form-control input-md" id="total" path="total" readonly="true"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Description:</label>  
                        <div class="col-md-4">
                            <form:textarea class="form-control input-md" path="description" maxlength="100"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Remark:</label>  
                        <div class="col-md-4">
                            <form:textarea class="form-control input-md" path="remark" maxlength="30"/>
                        </div>
                    </div>
                        
                    <c:set var="check1" value="0"></c:set>
                    <c:forEach var="leaderItems" items="${leaderList}">
                        <c:if test="${leaderItems.leaderId == empId}">
                            <c:set var="check1" value="1"></c:set>
                        </c:if>
                    </c:forEach>

                    <c:if test="${check1 == 0}">
                        <form:hidden path="status" value="0"/>
                    </c:if>
                    <c:if test="${check1 == 1}">
                        <form:hidden path="status" value="1"/>
                        <form:hidden path="leader" value="true"/>
                    </c:if>
                    
                    <div class="form-group">
                        <label class="col-md-4 control-label"></label>
                        <div class="col-md-4">
                            <c:if test="${action == 'save'}">
                                <input type="submit" value="Save" class="btn btn-success">
                                <a href="<c:url value="/"/>main/overtime?empId=${empId}"class="btn btn-primary">back to over time page</a>
                            </c:if>
                            <c:if test="${action == 'update'}">
                                <input type="submit" value="Update" class="btn btn-success">
                                <a href="<c:url value="/"/>main/overtime?empId=${empId}"class="btn btn-primary">back to over time page</a>
                            </c:if>
                        </div>
                    </div>
                </fieldset>
            </form:form>
        </div>
    </body>
</html>
