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
            <title>Team save</title>
        </c:if>
        <c:if test="${action == 'update'}">
            <title>Team update</title>
        </c:if>
    </head>
    <c:if test="${action == 'save'}">
    <body onload="autoID('${teamList}')">
        <!--<body>-->
    </c:if>
    <c:if test="${action == 'update'}">
    <body>
    </c:if>    
        <script>
            function autoID(uList) {
//                alert(uList);
                if(uList === ""){
                    document.getElementById("id").value = "T001";
                }else{
                    var num = uList.substring(1);
                    var numid = parseInt(num)+1;
                    var uid;
                    if(numid < 10){
                        uid = "T00" + numid;
                    }else if(numid < 100){
                        uid = "T0" + numid;
                    }else{
                        uid = "T" + numid;
                    }
                    document.getElementById("id").value = uid;
                }
//                alert(uid);
                
//                document.getElementById("id").value = n; 
            }
        </script>
        <div class="container-fluid">
            <div class="row">
                <%@ include file="/WEB-INF/jsp/header.jsp" %>  
            </div>  
                <form:form class="form-horizontal" method="POST" action="${action}" commandName="teamForm">            
                <fieldset>
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">ID:</label>  
                        <div class="col-md-4">
                            <c:if test="${action == 'save'}">
                                <form:input class="form-control input-md" path="id" readonly="true"/>
                            </c:if>
                            <c:if test="${action == 'update'}">
                                <form:hidden class="form-control" path="id"/>
                                <a class="form-control input-md">${id}</a>                                
                            </c:if>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Name:</label>  
                        <div class="col-md-4">                                
                            <form:input class="form-control input-md" path="name" placeholder="Enter Team Name" required="username"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Manager :</label>  
                        <div class="col-md-4">
                            <form:select class="form-control input-md" path="manager" required="true">
                                <%--<form:option value="" label="null value" />--%>
                                <c:forEach var="pItem" items="${proList}">
                                    <c:set  var="ch"  value="0"/>
                                    <c:forEach  var="userItem" items="${userList}">
                                        <c:if test="${userItem.permission == 'MANAGER'}">
                                            <c:if test="${userItem.id == pItem.id}">
                                                <c:set  var="ch"  value="1"/>
                                            </c:if>
                                        </c:if>
                                    </c:forEach>
                                    <c:if test="${ch == 1}">
                                        <form:option value="${pItem.id}" label="${pItem.firstName} ${pItem.lastName}" />
                                    </c:if>                                    
                                </c:forEach>
                            </form:select>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="col-md-4 control-label"></label>
                        <div class="col-md-4">
                            <c:if test="${action == 'save'}">
                                <input type="submit" value="Save" class="btn btn-success">
                                <a href="<c:url value="/"/>main/team" class="btn btn-primary">back to team page</a>
                            </c:if>
                            <c:if test="${action == 'update'}">
                                <input type="submit" value="Update" class="btn btn-success">
                                <a href="<c:url value="/"/>main/team"class="btn btn-primary">back to team page</a>
                            </c:if>
                        </div>
                    </div>
                </fieldset>
            </form:form>
        </div>
    </body>
</html>
