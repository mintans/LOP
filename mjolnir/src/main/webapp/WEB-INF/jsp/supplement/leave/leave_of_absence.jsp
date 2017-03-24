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
        <script src="<c:url value="/"/>js/leave.js"></script>
        <script src="<c:url value="/"/>js/user/department.js"></script>  

        <script src="<c:url value="/"/>js/sortTable/jquery-latest.js" type="text/javascript"></script>
        <script src="<c:url value="/"/>js/sortTable/jquery.tablesorter.js" type="text/javascript"></script>
        <link href="<c:url value="/"/>js/sortTable/themes/blue/style.css" rel="stylesheet" type="text/css"/>

        <title>Leave Of Absence</title>
    </head>
    <c:if test="${userInfo.user.permission == 'ADMIN'}">
        <body onload="hide('${empId}', '${start}')">
            <div class="container-fluid">            
                <div class="row">
                    <%@ include file="/WEB-INF/jsp/header.jsp" %>               
                </div>

                <nav class="breadcrumb">
                    <a class="breadcrumb-item" href="<c:url value="/main/supplement/overtime"/>">Supplement</a> / 
                    <span class="breadcrumb-item active">Leave</span>
                </nav>

                <div class="row">
                    <div class="col-md-2">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <ul class="nav nav-pills nav-stacked">
                                    <li class="nav-main"><a href="<c:url value="/"/>main/supplement/overtime">OverTime</a></li>
                                    <li class="nav-main active"><a href="<c:url value="/"/>main/supplement/leave">Leave</a></li>
                                    <li class="nav-main"><a href="<c:url value="/"/>main/supplement/payment">Payment</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-10">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="panel panel-primary">
                                    <div class="panel-heading">
                                        <div align="left">
                                            <h4 class="panel-title">Member</h4>
                                        </div>
                                    </div>
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-md-offset-6 col-md-3">

                                                <table align="right">
                                                    <td width="80" align="center">Position : </td>
                                                    <td width="150">
                                                        <select name="position" class="form-control input-md" id="select" onchange="groupFunction()">
                                                            <option value="">All</option>
                                                            <c:forEach var="positionItem" items="${positionList}">  
                                                                <option value="${positionItem.position}">${positionItem.position}</option> 
                                                            </c:forEach>
                                                        </select>
                                                    </td>
                                                </table>

                                            </div>
                                            <div class="col-md-3">                                               

                                                <div class="input-group">
                                                    <input type="text" class="form-control" placeholder="Search By Name"  id="leaveSearch" onkeyup="leaveSearchFunction()">
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-search"></span>
                                                    </span>
                                                </div>

                                            </div>
                                        </div>
                                        <br>
                                        <c:if test="${empty profileList}">
                                            <p align="center">empty</p>
                                        </c:if>
                                        <div style="display: block; height: 250px;width:100%; overflow-y: scroll;">
                                            <table class="table table-bordered" cellspacing="0" id="leaveTable">
                                                <c:set var="count" value="0" scope="page" />
                                                <thead>
                                                    <tr class="bg-primary">
                                                        <th><div align="center">No.</div></th>
                                                        <th><div align="center">ID</div></th>
                                                        <th><div align="center">Title</div></th>
                                                        <th><div align="center">First Name</div></th>
                                                        <th><div align="center">Last Name</div></th>
                                                        <th><div align="center">Position</div></th>
                                                        <th><div align="center">Option</div></th>
                                                    </tr>
                                                </thead>

                                                <c:forEach var="profileItem" items="${profileList}">
                                                    <c:forEach var="transferItem" items="${transferList}">                                                            
                                                        <c:if test="${profileItem.id == transferItem.profileId}">
                                                            <c:set var="count" value="${count + 1}" scope="page"/>
                                                            <tbody>
                                                                <tr>
                                                                    <td align="center"><c:out value = "${count}"/></td>
                                                                    <td align="center">${profileItem.id}</td>
                                                                    <c:if test="${profileItem.title == 1}">
                                                                        <td align="center">นาย</td>
                                                                    </c:if>
                                                                    <c:if test="${profileItem.title == 2}">
                                                                        <td align="center">นาง</td>
                                                                    </c:if>
                                                                    <c:if test="${profileItem.title == 3}">
                                                                        <td align="center">นางสาว</td>
                                                                    </c:if>
                                                                    <td align="center">${profileItem.firstName}</td>
                                                                    <td align="center">${profileItem.lastName}</td>
                                                                    <td align="center">${transferItem.position}</td>
                                                                    <td align="center">                                                            
                                                                        <a onclick="hide('${profileItem.id}', '${profileItem.startWorking}'), highlight_row(this)"  class="btn btn-warning" data-toggle="collapse">Show</a>

                                                                    </td>
                                                                </tr>

                                                            </tbody>
                                                        </c:if>
                                                    </c:forEach>
                                                </c:forEach>
                                            </table>                                                
                                        </div>
                                    </div>
                                </div>
                                <br><br>
                                <c:forEach var="profileItem2" items="${profileList}">
                                    <div class="panel-collapse collapse" id="${profileItem2.id}">
                                        <div class="panel panel-primary">
                                            <div class="panel-heading">
                                                <div class="row">
                                                    <div class="col-md-11">                                                    
                                                        <h5>Leave Detail : ${profileItem2.firstName} ${profileItem2.lastName}</h5>                                                    
                                                    </div>
                                                    <div class="col-md-1">                                                    
                                                        <a href="#" class="btn btn-warning">Print</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="panel-body">
                                                <div class="row">
                                                    <table align="right">
                                                        <tr>
                                                            <td width="50" align="center">Year:</td>
                                                            <td width="150px">
                                                                <select class="form-control input-md" id="year${profileItem2.id}" onchange="tableFilter('leave${profileItem2.id}', 'year${profileItem2.id}', '${profileItem2.startWorking}')" >
                                                                    <c:forEach var="year" begin="2016" end="2200">
                                                                        <option value="${year}" label="${year}" /> 
                                                                    </c:forEach>
                                                                </select>    
                                                            </td>
                                                            <td width="20px"></td>
                                                        </tr>
                                                    </table>

                                                </div>
                                                <div class="container " style="margin: auto; width: 50%;padding: 10px;">
                                                    <div align="center" class="panel panel-default">
                                                        <div class="panel-body">
                                                            <table border="1" class="table table-bordered">
                                                                <thead>
                                                                    <tr class="active">
                                                                        <th><div align="center">Type</div></th>
                                                                        <th><div align="center">Total</div></th>
                                                                        <th><div align="center">Used</div></th>
                                                                        <th><div align="center">Balance</div></th>
                                                                    </tr>
                                                                <thead>
                                                                <tbody>    
                                                                    <tr>
                                                                        <td class="active"><b>Personal </b></td>
                                                                        <td>
                                                                            <div align="center"><b id="p2${profileItem2.id}"></b></div> 
                                                                        </td>
                                                                        <td>
                                                                            <div align="center"><b id="p3${profileItem2.id}"></b></div>
                                                                        </td>
                                                                        <td>
                                                                            <div align="center"><b id="p${profileItem2.id}"> </b></div> 
                                                                        </td>
                                                                    </tr>
                                                                    <tr>                                                
                                                                        <td class="active"><b>Vacation </b></td>
                                                                        <td>
                                                                            <div align="center"><b id="v2${profileItem2.id}"></b></div> 
                                                                        </td>
                                                                        <td>
                                                                            <div align="center"><b id="v3${profileItem2.id}"></b></div>
                                                                        </td>
                                                                        <td>
                                                                            <div align="center"><b id="v${profileItem2.id}"></b></div> 
                                                                        </td>                                                
                                                                    </tr>
                                                                    <tr>                                                
                                                                        <td class="active"><b>Sick </b></td>
                                                                        <td>
                                                                            <div align="center"><b id="s2${profileItem2.id}"></b></div> 
                                                                        </td>
                                                                        <td>
                                                                            <div align="center"><b id="s3${profileItem2.id}"></b></div>
                                                                        </td>
                                                                        <td>
                                                                            <div align="center"><b id="s${profileItem2.id}"></b></div> 
                                                                        </td>
                                                                    </tr>

                                                                    <tr>                                                
                                                                        <td class="active"><b>Ordination </b></td>
                                                                        <td>
                                                                            <div align="center"><b id="o2${profileItem2.id}"></b></div> 
                                                                        </td>
                                                                        <td>
                                                                            <div align="center"><b id="o3${profileItem2.id}"></b></div>
                                                                        </td>
                                                                        <td>
                                                                            <div align="center"><b id="o${profileItem2.id}"></b></div> 
                                                                        </td>
                                                                    </tr>

                                                                    <tr>                                                
                                                                        <td class="active"><b>Maternity </b></td>
                                                                        <td>
                                                                            <div align="center"><b id="m2${profileItem2.id}"></b></div> 
                                                                        </td>
                                                                        <td>
                                                                            <div align="center"><b id="m3${profileItem2.id}"></b></div>
                                                                        </td>
                                                                        <td>
                                                                            <div align="center"><b id="m${profileItem2.id}"></b></div> 
                                                                        </td>
                                                                    </tr>

                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>

                                                <table class="table table-bordered" id="leave${profileItem2.id}" cellspacing="0">

                                                    <thead>
                                                        <tr class="bg-primary">
                                                            <!--<th><div align="center">No.</div></th>-->
                                                            <th><div align="center">Date</div></th>
                                                            <th><div align="center">Start Date</div></th>
                                                            <th><div align="center">End Date</div></th>
                                                            <th><div align="center">Total</div></th>
                                                            <th><div align="center">On Leave</div></th>
                                                            <th><div align="center">Description</div></th>
                                                        </tr>
                                                    </thead>
                                                    <c:forEach var="LeaveItems" items="${leaveList}">
                                                        <c:if test="${profileItem2.id == LeaveItems.empId && LeaveItems.status == 3}">
                                                            <tbody>
                                                                <tr>
                                                                    <!--<td align="center"></td>-->
                                                                    <td align="center">${LeaveItems.date2}</td>
                                                                    <td align="center">${LeaveItems.from2}</td>
                                                                    <td align="center">${LeaveItems.to2}</td>
                                                                    <td align="center">${LeaveItems.total}</td>
                                                                    <td align="center">${LeaveItems.type}</td>
                                                                    <td align="center" style="word-wrap: break-word;"> ${LeaveItems.description}</td>
                                                                </tr>
                                                            </tbody>
                                                        </c:if>
                                                    </c:forEach>
                                                </table>
                                            </div>
                                        </div>
                                    </div>


                                </c:forEach> 
                                </body>
                            </c:if>



                            <c:if test="${userInfo.user.permission == 'EMPLOYEE' || userInfo.user.permission == 'MANAGER'}">
                                <c:set var="check" value="0"></c:set>
                                <c:forEach var="profileItems" items="${profileList}">
                                    <c:if test="${profileItems.id == userInfo.user.id}">
                                        <c:set var="check" value="1"></c:set>
                                        <c:set var="startWorking" value="${profileItems.startWorking}"></c:set>
                                    </c:if>
                                </c:forEach>
                                <c:if test="${check == 0}">
                                    <body>
                                        <div class="container-fluid">            
                                            <div class="row">
                                                <%@ include file="/WEB-INF/jsp/header.jsp" %>               
                                            </div>
                                            <div class="container">
                                                <center>
                                                    <br><br><br>
                                                    <h3>Please add your profile before add leave.</h3>
                                                </center>
                                            </div>
                                        </div>
                                    </body>
                                </c:if>
                                <c:if test="${check == 1}">
                                    <body onload="hide('${userInfo.user.id}', '${startWorking}')">
                                        <div class="container-fluid">            
                                            <div class="row">
                                                <%@ include file="/WEB-INF/jsp/header.jsp" %>               
                                            </div>

                                            <nav class="breadcrumb">
                                                <a class="breadcrumb-item" href="<c:url value="/main/overtime"/>">Supplement</a> / 
                                                <span class="breadcrumb-item active">Leave</span>
                                            </nav>

                                            <c:forEach var="profileItem2" items="${profileList}">
                                                <div class="container panel-collapse collapse" id="${profileItem2.id}">
                                                    <div class="row">
                                                        <div class="col-md-2">
                                                            <div class="panel panel-default">
                                                                <div class="panel-body">
                                                                    <ul class="nav nav-pills nav-stacked">
                                                                        <li class="nav-main"><a href="<c:url value="/"/>main/overtime">OverTime</a></li>
                                                                        <li class="nav-main active"><a href="<c:url value="/"/>main/leave">Leave</a></li>
                                                                        <li class="nav-main"><a href="<c:url value="/"/>main/payment">Payment</a></li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-10">
                                                            <div class="panel panel-default">                                                            
                                                                <div class="panel-body">
                                                                    <div class="row">
                                                                        &nbsp;&nbsp;&nbsp;&nbsp;<a href="leave/addForm?empId=${profileItem2.id}&start=${profileItem2.startWorking}" class="btn btn-primary" style="size:100;">Add Leave</a>
                                                                        <table align="right">
                                                                            <tr>
                                                                                <td width="50" align="center">Year:</td>
                                                                                <td width="150px">
                                                                                    <select class="form-control input-md" id="year${profileItem2.id}" onchange="tableFilter('leave${profileItem2.id}', 'year${profileItem2.id}', '${profileItem2.startWorking}')" >
                                                                                        <c:forEach var="year" begin="2016" end="2200">
                                                                                            <option value="${year}" label="${year}" /> 
                                                                                        </c:forEach>
                                                                                    </select>    
                                                                                </td>
                                                                                <td width="20px"></td>
                                                                            </tr>
                                                                        </table>

                                                                    </div>
                                                                    <div class="container " style="margin: auto; width: 50%;padding: 10px;">
                                                                        <div align="center" class="panel panel-default">
                                                                            <div class="panel-body">
                                                                                <table border="1" class="table table-bordered">
                                                                                    <thead>
                                                                                        <tr class="active">
                                                                                            <th><div align="center">Type</div></th>
                                                                                            <th><div align="center">Total</div></th>
                                                                                            <th><div align="center">Used</div></th>
                                                                                            <th><div align="center">Balance</div></th>
                                                                                        </tr>
                                                                                    <thead>
                                                                                    <tbody>    
                                                                                        <tr>
                                                                                            <td class="active"><b>Personal </b></td>
                                                                                            <td>
                                                                                                <div align="center"><b id="p2${profileItem2.id}"></b></div> 
                                                                                            </td>
                                                                                            <td>
                                                                                                <div align="center"><b id="p3${profileItem2.id}"></b></div>
                                                                                            </td>
                                                                                            <td>
                                                                                                <div align="center"><b id="p${profileItem2.id}"> </b></div> 
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>                                                
                                                                                            <td class="active"><b>Vacation </b></td>
                                                                                            <td>
                                                                                                <div align="center"><b id="v2${profileItem2.id}"></b></div> 
                                                                                            </td>
                                                                                            <td>
                                                                                                <div align="center"><b id="v3${profileItem2.id}"></b></div>
                                                                                            </td>
                                                                                            <td>
                                                                                                <div align="center"><b id="v${profileItem2.id}"></b></div> 
                                                                                            </td>                                                
                                                                                        </tr>
                                                                                        <tr>                                                
                                                                                            <td class="active"><b>Sick </b></td>
                                                                                            <td>
                                                                                                <div align="center"><b id="s2${profileItem2.id}"></b></div> 
                                                                                            </td>
                                                                                            <td>
                                                                                                <div align="center"><b id="s3${profileItem2.id}"></b></div>
                                                                                            </td>
                                                                                            <td>
                                                                                                <div align="center"><b id="s${profileItem2.id}"></b></div> 
                                                                                            </td>

                                                                                        </tr>
                                                                                    </tbody>
                                                                                </table>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <table class="table table-bordered" id="leave${profileItem2.id}" cellspacing="0">

                                                                        <thead>
                                                                            <tr class="active">
                                                                                <th><div align="center">Date</div></th>
                                                                                <th><div align="center">Start Date</div></th>
                                                                                <th><div align="center">End Date</div></th>
                                                                                <th><div align="center">Total</div></th>
                                                                                <th><div align="center">On Leave</div></th>
                                                                                <th><div align="center">Description</div></th>
                                                                                <th><div align="center">Option</div></th>
                                                                            </tr>
                                                                        </thead>
                                                                        <c:forEach var="LeaveItems" items="${leaveList}">
                                                                            <c:if test="${profileItem2.id == LeaveItems.empId}">
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td align="center">${LeaveItems.date2}</td>
                                                                                        <td align="center">${LeaveItems.from2}</td>
                                                                                        <td align="center">${LeaveItems.to2}</td>
                                                                                        <td align="center">${LeaveItems.total}</td>
                                                                                        <td align="center">${LeaveItems.type}</td>
                                                                                        <td align="center" style="word-wrap: break-word;"> ${LeaveItems.description}</td>
                                                                                        <c:if test="${LeaveItems.status > 0 && LeaveItems.status < 3}">
                                                                                            <c:if test="${userInfo.user.permission == 'MANAGER'}">
                                                                                                <td align="center">
                                                                                                    <a href="<c:url value="/"/>main/leave/editForm/${LeaveItems.id}?empId=${profileItem2.id}&start=${profileItem2.startWorking}" class="btn btn-warning">Edit </a>
                                                                                                    <a href="<c:url value="/"/>main/leave/delete/${LeaveItems.id}?empId=${profileItem2.id}&start=${profileItem2.startWorking}" class="btn btn-danger"> Delete</a></td>  
                                                                                                </td>
                                                                                            </c:if>
                                                                                            <c:set var="checkLeader" value="0"></c:set>
                                                                                            <c:forEach var="leaderItems" items="${leaderList}">
                                                                                                <c:if test="${leaderItems.leaderId == userInfo.user.id}">
                                                                                                    <c:set var="checkLeader" value="1"></c:set>
                                                                                                </c:if>
                                                                                            </c:forEach>

                                                                                            <c:if test="${userInfo.user.permission == 'EMPLOYEE'}">
                                                                                                <c:if test="${checkLeader == 0 || checkLeader == 1 && LeaveItems.status != 1}">
                                                                                                    <td align="center" bgcolor="#FDFBAC">Processing</td>
                                                                                                </c:if>

                                                                                                <c:if test="${checkLeader == 1 && LeaveItems.status == 1}">
                                                                                                    <td align="center">
                                                                                                        <a href="<c:url value="/"/>main/leave/editForm/${LeaveItems.id}?empId=${profileItem2.id}&start=${profileItem2.startWorking}" class="btn btn-warning">Edit </a>
                                                                                                        <a href="<c:url value="/"/>main/leave/delete/${LeaveItems.id}?empId=${profileItem2.id}&start=${profileItem2.startWorking}" class="btn btn-danger"> Delete</a></td>  
                                                                                                    </td>
                                                                                                </c:if>
                                                                                            </c:if>
                                                                                        </c:if>
                                                                                        <c:if test="${LeaveItems.status == 3}">
                                                                                            <td align="center" bgcolor="#ACFDBC">Approved</td>
                                                                                        </c:if>
                                                                                        <c:if test="${LeaveItems.status == 4}">
                                                                                            <td align="center" bgcolor="#FDCBAC">Rejected</td>
                                                                                        </c:if>
                                                                                        <c:if test="${LeaveItems.status == 0}">
                                                                                            <td align="center">
                                                                                                <a href="<c:url value="/"/>main/leave/editForm/${LeaveItems.id}?empId=${profileItem2.id}&start=${profileItem2.startWorking}" class="btn btn-warning">Edit </a>
                                                                                                <a href="<c:url value="/"/>main/leave/delete/${LeaveItems.id}?empId=${profileItem2.id}&start=${profileItem2.startWorking}" class="btn btn-danger"> Delete</a></td>  
                                                                                            </td>
                                                                                        </c:if>
                                                                                    </tr>
                                                                                </tbody>
                                                                            </c:if>
                                                                        </c:forEach>
                                                                    </table>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach> 
                                        </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </body>
        </c:if>
    </c:if>
</html>
