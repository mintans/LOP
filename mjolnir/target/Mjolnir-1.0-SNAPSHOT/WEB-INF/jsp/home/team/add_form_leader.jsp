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
        <c:if test="${action == 'save'}">
            <title>Leader save</title>
        </c:if>
        <c:if test="${action == 'update'}">
            <title>Leader update</title>
        </c:if>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <%@ include file="/WEB-INF/jsp/header.jsp" %>  
            </div>  
                <form:form class="form-horizontal" method="POST" action="${action}" commandName="leaderForm">            
                <fieldset>
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Team ID:</label>  
                        <div class="col-md-4">
                            <c:if test="${action == 'saveleader'}">
                                <form:input class="form-control input-md" path="teamId" value="${tId}" readonly="true"/>                                    
                            </c:if>
                            <c:if test="${action == 'update'}">
                                <form:hidden class="form-control" path="teamId"/>
                                <a class="form-control input-md">${id}</a>                                
                            </c:if>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Leader ID:</label>  
                        <div class="col-md-4">   
                            
                            <form:select class="form-control input-md" path="leaderId" required="true">
                                
                                <c:forEach var="pItem" items="${proList}">
                                    <c:set  var="ch"  value="0"/>
                                    <c:forEach  var="leaderItem" items="${leaderList}">
                                        <c:if test="${pItem.id == leaderItem.leaderId }">
                                            <c:set var="ch" value="1"/>
                                        </c:if>
                                    </c:forEach>
                                    <c:forEach  var="memberItem" items="${memberList}">
                                        <c:if test="${pItem.id == memberItem.memberId}">
                                            <c:set var="ch" value="1"/>
                                        </c:if>
                                    </c:forEach>
                                    <c:forEach  var="userItem" items="${userList}">
                                        <c:if test="${userItem.permission == 'MANAGER'}">
                                            <c:if test="${userItem.id == pItem.id}">
                                                <c:set  var="ch"  value="1"/>
                                            </c:if>
                                        </c:if>
                                    </c:forEach>
                                    <c:if test="${ch == 0}">
                                        <form:option value="${pItem.id}" label="${pItem.firstName} ${pItem.lastName}" />
                                    </c:if>
                                    <%--<form:option value="${pItem.id}" label="${pItem.firstName} ${pItem.lastName}" />--%> 
                                </c:forEach>
                            </form:select>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="col-md-4 control-label"></label>
                        <div class="col-md-4">
                            <c:if test="${action == 'saveleader'}">
                                <input type="submit" value="Save" class="btn btn-success">
                                <a href="<c:url value="/"/>main/team?tId=${tId}" class="btn btn-primary">back to team page</a>
                            </c:if>
                            <c:if test="${action == 'update'}">
                                <input type="submit" value="Update" class="btn btn-success">
                                <a href="<c:url value="/"/>main/team?tId=${tId}"class="btn btn-primary">back to team page</a>
                            </c:if>
                        </div>
                    </div>
                </fieldset>
            </form:form>
        </div>
    </body>
</html>
