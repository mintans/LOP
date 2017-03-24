<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="<c:url value="/"/>view/template/css/bootstrap.min.css" />
        <link rel="stylesheet" href="<c:url value="/"/>view/template/css/bootstrap-theme.min.css" />
        <script src=https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js></script>
       <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.9.1/jquery.tablesorter.min.js"></script>

        <script src="<c:url value="/"/>view/template/js/bootstrap.min.js" ></script>
        <script src="<c:url value="/"/>js/app.js"></script>
        <!--<script src="<c:url value="/"/>js/ot.js"></script>-->

        <script src="<c:url value="/"/>js/sortTable/jquery-latest.js" type="text/javascript"></script>
        <script src="<c:url value="/"/>js/sortTable/jquery.tablesorter.js" type="text/javascript"></script>
        <link href="<c:url value="/"/>js/sortTable/themes/blue/style.css" rel="stylesheet" type="text/css"/>

        <title>Team</title>
        
        
    </head>
    <body onload="hide('${tId}')">
        <div class="container-fluid">            
            <div class="row">
                <%@ include file="/WEB-INF/jsp/header.jsp" %>               
            </div>
            <nav class="breadcrumb">
                <a class="breadcrumb-item" href="<c:url value="/"/>main/structure">Structure</a> / 
                <span class="breadcrumb-item active">Team</span>
            </nav>
                
                

            <div class="container" style="width: 100%">
                <div class="row">
                    <div class="col-md-2">
                        <div class="panel panel-default">
                            <!--<div class="panel-heading"></div>-->
                            <div class="panel-body">
                                <ul class="nav nav-pills nav-stacked">
                                    <li role="presentation"><a href="<c:url value="/"/>main/structure">Overview</a></li>
                                    <li role="presentation"><a href="<c:url value="/"/>main/group">Groups</a></li>
                                    <li role="presentation" class="active"><a href="/Mjolnir/main/team">Team</a></li>
                                    
                                </ul>
                            </div>
                        </div>
                    </div>
                        <div class="col-md-10">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h4 class="panel-title">Teams</h4>
                            </div>
                            <div class="panel-body">
                            <div class="row">
                                
                            </div>
                            <div align="right">
                                <a href="<c:url value="/"/>main/team/addForm" class="btn btn-primary">add new team</a>                                
                            </div>
                            <br>
                            <c:if test="${empty teamList}">
                                <h2><p align="center">Empty</h2>
                            </c:if>
                            
                            <table class="table table-bordered" cellspacing="0" id="myTable">

                                <thead>
                                    <tr class="active">
                                        <th><div align="center">ID</div></th>
                                        <th><div align="center">Title</div></th>
                                        <th><div align="center">Option</div></th>
                                    </tr>
                                </thead>
                                
                                <c:forEach var="teamItem" items="${teamList}">
                                <tbody>
                                    
                                        <tr>
                                            <td align="center" class="col-lg-2">${teamItem.id}</td>
                                            <td align="center">${teamItem.name}</td>
                                            <td align="center" class="col-lg-4">
                                                <!--<a href="#${teamItem.id}"  class="btn btn-warning" data-toggle="collapse">Show</a>-->
                                                <a onclick="hide('${teamItem.id}')"  class="btn btn-info" data-toggle="collapse">Show</a>
                                                <a href="<c:url value="/"/>main/team/editForm/${teamItem.id}" class="btn btn-warning">Edit </a>
                                                <a href="<c:url value="/"/>main/team/delete/${teamItem.id}"class="btn btn-danger"> Delete</a>
                                                
                                            </td>
                                        </tr>
                                    
                                </tbody>
                                </c:forEach>
                            </table>
                                            
                        </div>
                        </div>
                    </div>
                </div>
            </div>
            <br><br>
        </div>
            <script>
                 var en = "";
                function hide(obj) {
//                    alert(obj);
                    var el = document.getElementById(obj);
                        if(en !== ""){
                        en.style.display = 'none';
                        }
                        el.style.display = 'block';
                        en = el;
                }
            </script>
            <div class="container-fluid">
                <div class="container" style="width: 100%">
                <div class="row">
            <c:forEach var="teamItem2" items="${teamList}">
                    <div class="container panel-collapse collapse" id="${teamItem2.id}">
                    <div class="row">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                
                            </div>
                            <div class="panel-body">
                                <div align="right">
                                    <a href="<c:url value="/"/>main/team/addLeader?tId=${teamItem2.id}" class="btn btn-primary">add leader</a>                                
                                </div>
                                <br>
                                <table class="table table-bordered" id="leader${teamItem2.id}" cellspacing="0">
                                    <thead>
                                        <tr class="active">
                                            <th><div align="center" >ID</div></th>
                                            <th><div align="center" >Name</div></th>
                                            <th><div align="center">Lastname</div></th>                                            
                                            <th><div align="center" >Option</div></th>
                                        </tr>
                                    </thead>
                                    <c:forEach var="leaderItem" items="${leaderList}">
                                    <tbody>
                                        <c:if test="${teamItem2.id == leaderItem.teamId}">
                                            <tr>
                                                <td align="center" class="col-lg-2">${leaderItem.leaderId}</td>
                                                <c:forEach var="profileItem" items="${profileList}">
                                                    <c:if test="${profileItem.id == leaderItem.leaderId}">
                                                        <td align="center" class="col-md-4">${profileItem.firstName}</td>
                                                        <td align="center" class="col-md-4">${profileItem.lastName}</td>
                                                    </c:if>
                                                    
                                                </c:forEach>
                                                <td align="center" class="col-lg-3">
                                                    
                                                    <a href="<c:url value="/"/>main/team/leaderdelete/${leaderItem.leaderId}?tId=${teamItem2.id}"class="btn btn-danger"> Delete</a>
                                                </td>   
                                            </tr>
                                        </c:if>                                  
                                    </tbody>
                                    </c:forEach>
                                </table>

                            </div>
                            <div class="panel-body">
                                <div align="right">
                                    <a href="<c:url value="/"/>main/team/addMember?tId=${teamItem2.id}" class="btn btn-primary">add member</a>                                                               
                                </div>
                                <br>
                                <table class="table table-bordered" id="leader${teamItem2.id}" cellspacing="0">
                                    <thead>
                                        <tr class="active">
                                            <th><div align="center">ID</div></th>
                                            <th><div align="center">Name</div></th>
                                            <th><div align="center">Lastname</div></th>                                            
                                            <th><div align="center">Option</div></th>
                                        </tr>
                                    </thead>
                                    <c:forEach var="memberItem" items="${memberList}">
                                    <tbody>
                                        <c:if test="${teamItem2.id == memberItem.teamId}">
                                            <tr>
                                                <td align="center" class="col-lg-2">${memberItem.memberId}</td>
                                                <c:forEach var="profileItem" items="${profileList}">
                                                    <c:if test="${profileItem.id == memberItem.memberId}">
                                                        <td align="center" class="col-md-4">${profileItem.firstName}</td>
                                                        <td align="center" class="col-md-4">${profileItem.lastName}</td>
                                                    </c:if>
                                                </c:forEach>

                                                <td align="center" class="col-lg-3">
                                                    
                                                    <a href="<c:url value="/"/>main/team/memberdelete/${memberItem.memberId}?tId=${teamItem2.id}"class="btn btn-danger"> Delete</a>
                                                </td>
                                            </tr>
                                        </c:if>                                  
                                    </tbody>
                                    </c:forEach>
                                </table>

                            </div>
                        </div>
                    </div>
                </div>
                </c:forEach>
            
    </body>
</html>
