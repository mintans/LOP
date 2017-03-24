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
        <script src="<c:url value="/"/>js/payment.js"></script>
        <script src="<c:url value="/"/>js/user/department.js"></script>  

        <script src="<c:url value="/"/>js/sortTable/jquery-latest.js" type="text/javascript"></script>
        <script src="<c:url value="/"/>js/sortTable/jquery.tablesorter.js" type="text/javascript"></script>
        <link href="<c:url value="/"/>js/sortTable/themes/blue/style.css" rel="stylesheet" type="text/css"/>

        <title>Payment</title>


    </head>
    <c:if test="${userInfo.user.permission == 'ADMIN'}">
        <body onload="hide('${empId}')">
            <div class="container-fluid">            
                <div class="row">
                    <%@ include file="/WEB-INF/jsp/header.jsp" %>               
                </div>

                <nav class="breadcrumb">
                    <a class="breadcrumb-item" href="<c:url value="/main/supplement/overtime"/>">Supplement</a> / 
                    <span class="breadcrumb-item active">Payment</span>
                </nav>


                <div class="row">
                    <div class="col-md-2">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <ul class="nav nav-pills nav-stacked">
                                    <li class="nav-main"><a href="<c:url value="/"/>main/supplement/overtime">OverTime</a></li>
                                    <li class="nav-main"><a href="<c:url value="/"/>main/supplement/leave">Leave</a></li>
                                    <li class="nav-main active"><a href="<c:url value="/"/>main/supplement/payment">Payment</a></li>
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
                                                <form>
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
                                                </form>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="input-group">
                                                    <input type="text" id="paymentSearch" class="form-control" placeholder="Search By Name" onkeyup="paymentSearchFunction()">
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
                                            <table class="table table-bordered" cellspacing="0" id="paymentTable">
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
                                                                        <a onclick="hide('${profileItem.id}'), highlight_row(this)"  class="btn btn-warning" data-toggle="collapse">Show</a>
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
                                                        <h5>Payment Detail : ${profileItem2.firstName} ${profileItem2.lastName}</h5>                                                    
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
                                                            <td width="50" align="center">Month:</td>
                                                            <td width="250px">
                                                                <select class="form-control input-md" id="month${profileItem2.id}" onchange="tableFilter('month${profileItem2.id}', 'data_payment${profileItem2.id}', 'year${profileItem2.id}')">
                                                                    <option value="January" label="January"/>
                                                                    <option value="February" label="February"/>
                                                                    <option value="March" label="March"/>
                                                                    <option value="April" label="April"/>
                                                                    <option value="May" label="May"/>
                                                                    <option value="June" label="June" />
                                                                    <option value="July" label="July"/>
                                                                    <option value="August" label="August" />
                                                                    <option value="September" label="September" />
                                                                    <option value="October" label="October" />
                                                                    <option value="November" label="November" />
                                                                    <option value="December" label="December" />
                                                                </select>
                                                            </td>
                                                            <td width="50" align="center">Year:</td>
                                                            <td width="150px">
                                                                <select class="form-control input-md" id="year${profileItem2.id}" onchange="tableFilter('month${profileItem2.id}', 'data_payment${profileItem2.id}', 'year${profileItem2.id}')">
                                                                    <c:forEach var="year" begin="2016" end="2200">
                                                                        <option value="${year}" label="${year}" /> 
                                                                    </c:forEach>
                                                                </select>    
                                                            </td>
                                                            <td width="20px"></td>
                                                        </tr>
                                                    </table>

                                                </div>

                                                <br>
                                                <table class="table table-bordered" id="data_payment${profileItem2.id}" cellspacing="0">
                                                    <thead>
                                                        <tr class="bg-primary">
                                                            <!--<th><div align="center">No.</div></th>-->
                                                            <th><div align="center">Receipt No.</div></th>
                                                            <th><div align="center">Date</div></th>
                                                            <th><div align="center">Description</div></th>
                                                            <th><div align="center">Amount</div></th>
                                                        </tr>
                                                    </thead>
                                                    <c:forEach var="paymentItems" items="${paymentList}">
                                                        <c:if test="${profileItem2.id == paymentItems.empId && paymentItems.status == 4}">
                                                            <tbody>
                                                                <tr>
                                                                    <!--<td align="center"></td>-->
                                                                    <td align="center">${paymentItems.receiptNo}</td>
                                                                    <td align="center">${paymentItems.date}</td>
                                                                    <td align="center" style="word-wrap: break-word;">${paymentItems.description}</td>
                                                                    <td align="center" style="word-wrap: break-word;">${paymentItems.amount}</td>
                                                                </tr>

                                                            </c:if>
                                                        </c:forEach>
                                                        <tr>
                                                            <td colspan="3" align="right" class="active"><label>Total:</label></td>
                                                            <td align="center"><label id="sum${profileItem2.id}"></label></td>
                                                        </tr>
                                                    </tbody>
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
                                                    <h3>Please add your profile before add payment.</h3>
                                                </center>
                                            </div>
                                        </div>
                                    </body>
                                </c:if>
                                <c:if test="${check == 1}">
                                    <body onload="hide('${userInfo.user.id}')">
                                        <div class="container-fluid">            
                                            <div class="row">
                                                <%@ include file="/WEB-INF/jsp/header.jsp" %>               
                                            </div>

                                            <nav class="breadcrumb">
                                                <a class="breadcrumb-item" href="<c:url value="/main/overtime"/>">Supplement</a> / 
                                                <span class="breadcrumb-item active">Payment</span>
                                            </nav>

                                            <c:forEach var="profileItem2" items="${profileList}">
                                                <div class="container panel-collapse collapse" id="${profileItem2.id}">
                                                    <div class="row">
                                                        <div class="col-md-2">
                                                            <div class="panel panel-default">
                                                                <div class="panel-body">
                                                                    <ul class="nav nav-pills nav-stacked">
                                                                        <li class="nav-main"><a href="<c:url value="/"/>main/overtime">OverTime</a></li>
                                                                        <li class="nav-main"><a href="<c:url value="/"/>main/leave">Leave</a></li>
                                                                        <li class="nav-main active"><a href="<c:url value="/"/>main/payment">Payment</a></li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-10">
                                                            <div class="panel panel-default">                                                            
                                                                <div class="panel-body">
                                                                    <div class="row">
                                                                        &nbsp;&nbsp;&nbsp;&nbsp;<a href="payment/addForm?empId=${profileItem2.id}" class="btn btn-primary" style="size:100;">Add Payment</a>
                                                                        <table align="right">
                                                                            <tr>
                                                                                <td width="50" align="center">Month:</td>
                                                                                <td width="250px">
                                                                                    <select class="form-control input-md" id="month${profileItem2.id}" onchange="tableFilter('month${profileItem2.id}', 'data_payment${profileItem2.id}', 'year${profileItem2.id}')">
                                                                                        <option value="January" label="January"/>
                                                                                        <option value="February" label="February"/>
                                                                                        <option value="March" label="March"/>
                                                                                        <option value="April" label="April"/>
                                                                                        <option value="May" label="May"/>
                                                                                        <option value="June" label="June" />
                                                                                        <option value="July" label="July"/>
                                                                                        <option value="August" label="August" />
                                                                                        <option value="September" label="September" />
                                                                                        <option value="October" label="October" />
                                                                                        <option value="November" label="November" />
                                                                                        <option value="December" label="December" />
                                                                                    </select>
                                                                                </td>
                                                                                <td width="50" align="center">Year:</td>
                                                                                <td width="150px">
                                                                                    <select class="form-control input-md" id="year${profileItem2.id}" onchange="tableFilter('month${profileItem2.id}', 'data_payment${profileItem2.id}', 'year${profileItem2.id}')">
                                                                                        <c:forEach var="year" begin="2016" end="2200">
                                                                                            <option value="${year}" label="${year}" /> 
                                                                                        </c:forEach>
                                                                                    </select>    
                                                                                </td>
                                                                                <td width="20px"></td>
                                                                            </tr>
                                                                        </table>

                                                                    </div>

                                                                    <br>
                                                                    <table class="table table-bordered" id="data_payment${profileItem2.id}" cellspacing="0">
                                                                        <thead>
                                                                            <tr class="active">
                                                                                <th><div align="center">Receipt No.</div></th>
                                                                                <th><div align="center">Date</div></th>
                                                                                <th><div align="center">Description</div></th>
                                                                                <th><div align="center">Amount</div></th>
                                                                                <th><div align="center">Option</div></th>
                                                                            </tr>
                                                                        </thead>
                                                                        <c:forEach var="paymentItems" items="${paymentList}">
                                                                            <c:if test="${profileItem2.id == paymentItems.empId}">
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td align="center">${paymentItems.receiptNo}</td>
                                                                                        <td align="center">${paymentItems.date}</td>
                                                                                        <td align="center" style="word-wrap: break-word;">${paymentItems.description}</td>
                                                                                        <td align="center" style="word-wrap: break-word;">${paymentItems.amount}</td>
                                                                                        <c:if test="${paymentItems.status > 0 && paymentItems.status < 4}">
                                                                                            <c:if test="${userInfo.user.permission == 'MANAGER'}">
                                                                                                <td align="center">
                                                                                                    <a href="<c:url value="/"/>main/payment/editForm/${paymentItems.id}?empId=${profileItem2.id}" class="btn btn-warning">Edit </a>
                                                                                                    <a href="<c:url value="/"/>main/payment/delete/${paymentItems.id}?empId=${profileItem2.id}"class="btn btn-danger"> Delete</a></td>  
                                                                                                </td>
                                                                                            </c:if>
                                                                                            <c:set var="checkLeader" value="0"></c:set>
                                                                                            <c:forEach var="leaderItems" items="${leaderList}">
                                                                                                <c:if test="${leaderItems.leaderId == userInfo.user.id}">
                                                                                                    <c:set var="checkLeader" value="1"></c:set>
                                                                                                </c:if>
                                                                                            </c:forEach>

                                                                                            <c:if test="${userInfo.user.permission == 'EMPLOYEE'}">
                                                                                                <c:if test="${checkLeader == 0|| checkLeader == 1 && paymentItems.status != 1}">
                                                                                                    <td align="center" bgcolor="#FDFBAC">Processing</td>
                                                                                                </c:if>

                                                                                                <c:if test="${checkLeader == 1 && paymentItems.status == 1}">
                                                                                                    <td align="center">
                                                                                                        <a href="<c:url value="/"/>main/payment/editForm/${paymentItems.id}?empId=${profileItem2.id}" class="btn btn-warning">Edit </a>
                                                                                                        <a href="<c:url value="/"/>main/payment/delete/${paymentItems.id}?empId=${profileItem2.id}"class="btn btn-danger"> Delete</a></td>  
                                                                                                    </td>
                                                                                                </c:if>
                                                                                            </c:if>
                                                                                        </c:if>
                                                                                        <c:if test="${paymentItems.status == 4}">
                                                                                            <td align="center" bgcolor="#ACFDBC">Approved</td>
                                                                                        </c:if>
                                                                                        <c:if test="${paymentItems.status == 5}">
                                                                                            <td align="center" bgcolor="#FDCBAC">Rejected</td>
                                                                                        </c:if>
                                                                                        <c:if test="${paymentItems.status == 0}">
                                                                                            <td align="center">
                                                                                                <a href="<c:url value="/"/>main/payment/editForm/${paymentItems.id}?empId=${profileItem2.id}" class="btn btn-warning">Edit </a>
                                                                                                <a href="<c:url value="/"/>main/payment/delete/${paymentItems.id}?empId=${profileItem2.id}"class="btn btn-danger"> Delete</a></td>  
                                                                                            </td>
                                                                                        </c:if>
                                                                                    </tr>

                                                                                </c:if>
                                                                            </c:forEach>
                                                                            <tr>
                                                                                <td colspan="3" align="right" class="active"><label>Total:</label></td>
                                                                                <td align="center"><label id="sum${profileItem2.id}"></label></td>
                                                                            </tr>
                                                                        </tbody>
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
