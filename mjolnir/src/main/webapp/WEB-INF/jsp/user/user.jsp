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
        <script src="<c:url value="/"/>js/user/user.js"></script>
        <title>User</title>
    </head>
    <body>
        <div class="container-fluid">            
            <div class="row">
                <%@ include file="/WEB-INF/jsp/header.jsp" %>               
            </div>

            <nav class="breadcrumb">
                <a class="breadcrumb-item" href="user">User</a> / 
                <span class="breadcrumb-item active">User</span>
            </nav>

            <div class="container" style="width: 100%">
                <div class="row">
                    <div class="col-md-2">
                        <div class="panel panel-default">
                            <!--<div class="panel-heading"></div>-->
                            <div class="panel-body">
                                <ul class="nav nav-pills nav-stacked">
                                    <li role="presentation" class="active"><a href="user">User</a></li>
                                    <li role="presentation"><a href="<c:url value="/"/>main/departments">Departments</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-10">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h4 class="panel-title">Users</h4>
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-7">
                                        <a href="<c:url value="/"/>main/user/addForm" class="btn btn-primary">Add New User</a>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <select class="form-control" id="select" onchange="groupFunction()" >                                                
                                                <option value="">ALL</option>
                                                <option value="ADMIN">ADMIN</option>
                                                <option value="MANAGER">MANAGER</option>
                                                <option value="EMPLOYEE">EMPLOYEE</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-3">

                                        <div class="input-group">
                                            <input type="text" class="form-control" placeholder="Search By UserName"  id="myInput"onkeyup="myFunction()">
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-search"></span>
                                            </span>
                                        </div> 

                                    </div>
                                </div>
                                <br>
                                <div style="display: block; height: 550px;width:100%; overflow-y: scroll;">
                                    <table class="table table-bordered" id="myTable" >
                                        <c:set var="count" value="0" scope="page" />
                                        <thead>
                                            <tr class="bg-primary">
                                                <th><div align="center">No.</div></th>
                                                <th><div align="center">ID</div></th>
                                                <th><div align="center">Username</div></th>
                                                <th><div align="center">Name</div></th>                                             
                                                <th><div align="center">E-mail</div></th>
                                                <th><div align="center">Department</div></th>
                                                <th><div align="center">Permission</div></th>
                                                <th><div align="center">Option</div></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="userItem" items="${userList}">
                                                <c:set var="count" value="${count + 1}" scope="page"/>
                                                <tr>
                                                    <td align="center" style="width: 3%"><c:out value = "${count}"></c:out></td>
                                                    <td align="center"style="width: 8%">${userItem.id}</td>
                                                    <td align="center" style="width: 10%">${userItem.username}</td>

                                                    <td align="center" style="width: 18%">
                                                        <c:forEach var="profileList" items="${profileList}">
                                                            <c:if test="${profileList.id == userItem.id}">                                                        
                                                                ${profileList.firstName} ${profileList.lastName}
                                                            </c:if>
                                                        </c:forEach></td>                                                  

                                                    <td align="center">${userItem.email}</td>
                                                    <td align="center" style="width: 20%">${userItem.departmentName}</td>
                                                    <td align="center" style="width: 10%">${userItem.permission}</td>
                                                    <td align="center" style="width: 15%">
                                                        <a href="<c:url value="/"/>main/user/editForm/${userItem.id}" class="btn btn-warning">Edit </a>
                                                        <a href="<c:url value="/"/>main/user/delete/${userItem.id}"class="btn btn-danger"> Delete</a></td>
                                                </tr>

                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
