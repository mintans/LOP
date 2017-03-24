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
        <script src="<c:url value="/"/>js/leave.js"></script>
        <c:if test="${action == 'save'}">
            <title>Add Over Time</title>
        </c:if>
        <c:if test="${action == 'update'}">
            <title>Update Over Time</title>
        </c:if>
    </head>
    <body onload="Today()">
        <div class="container-fluid">
            <div class="row">
                <%@ include file="/WEB-INF/jsp/header.jsp" %>  
            </div>  
                <form:form class="form-horizontal" method="POST" action="${action}" commandName="leaveForm">            
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
                            <form:input type="text" class="form-control input-md" id="fullDate" path="date" readonly="true"/>
                            <form:hidden class="form-control" id="date2" path="date2"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Start Date:</label>  
                        <div class="col-md-4">
                            <form:input type="date" class="form-control input-md" id="from" path="from" onchange="totalday();dateSplit1();" required="from"/>
                            <form:hidden class="form-control" id="from2" path="from2"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">End Date:</label>  
                        <div class="col-md-4">
                            <form:input type="date" class="form-control input-md" id="to" path="to" onchange="totalday();dateSplit2();" required="to"/>
                            <form:hidden class="form-control" id="to2" path="to2"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Total:</label>  
                        <div class="col-md-4">
                            <c:if test="${action == 'update'}">
                                <form:input type="text" class="form-control input-md" id="total" path="total" readonly="true"/>
                            </c:if>
                            <c:if test="${action == 'save'}">
                                <form:input type="text" class="form-control input-md" id="total" path="total" readonly="true" value="0"/>
                            </c:if>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">On Leave</label>  
                        <div class="col-md-4">
                            <form:select class="form-control input-md" id="type" path="type">
                                <form:option value="Sick" label="Sick"/>
                                <form:option value="Personal" label="Personal"/>
                                <form:option value="Vacation" label="Vacation"/>
                            </form:select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Description:</label>  
                        <div class="col-md-4">
                            <form:textarea class="form-control input-md" path="description" maxlength="50"/>
                        </div>
                    </div>
                    
                    <c:if test="${userInfo.user.permission == 'EMPLOYEE'}">
                        <c:set var="check1" value="0"></c:set>
                        <c:forEach var="leaderItems1" items="${leaderList}">
                            <c:if test="${leaderItems1.leaderId == empId}">
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
                    </c:if>
                    <c:if test="${userInfo.user.permission == 'MANAGER'}">
                        <form:hidden path="status" value="2"/>
                        <form:hidden path="leader" value="true"/>
                        <form:hidden path="manager" value="true"/>
                    </c:if>
                   
                    <div class="form-group">
                        <label class="col-md-4 control-label"></label>
                        <div class="col-md-4">
                            <c:if test="${action == 'save'}">
                                <input type="submit" value="Save" class="btn btn-success">
                                <a href="<c:url value="/"/>main/leave?empId=${empId}&start=${start}" class="btn btn-primary">back to leave page</a>
                            </c:if>
                            <c:if test="${action == 'update'}">
                                <input type="submit" value="Update" class="btn btn-success">
                                <a href="<c:url value="/"/>main/leave?empId=${empId}&start=${start}"class="btn btn-primary">back to leave page</a>
                            </c:if>
                        </div>
                    </div>
                </fieldset>
            </form:form>
        </div>
    </body>
</html>
