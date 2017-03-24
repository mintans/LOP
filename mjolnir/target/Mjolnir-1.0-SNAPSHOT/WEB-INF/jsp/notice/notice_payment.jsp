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
        <script src="<c:url value="/"/>js/notice/notice_payment.js"></script>

        <script src="<c:url value="/"/>js/sortTable/jquery-latest.js" type="text/javascript"></script>
        <script src="<c:url value="/"/>js/sortTable/jquery.tablesorter.js" type="text/javascript"></script>
        <link href="<c:url value="/"/>js/sortTable/themes/blue/style.css" rel="stylesheet" type="text/css"/>

        <title>Notice Payment</title>


    </head>
    <c:if test="${userInfo.user.permission == 'ADMIN'}">
        <body onload="hide('${empId}')">
            <div class="container-fluid">            
                <div class="row">
                    <%@ include file="/WEB-INF/jsp/header.jsp" %>               
                </div>

                <nav class="breadcrumb">
                    <a class="breadcrumb-item" href="<c:url value="/main/notice"/>">Notice</a> / 
                    <span class="breadcrumb-item active">Payment</span>
                </nav>

                <div class="container" style="width: 100%">
                    <div class="row">
                        <div class="col-md-2">
                            <div class="panel panel-default">
                                <!--<div class="panel-heading"></div>-->
                                <div class="panel-body">
                                    <ul class="nav nav-pills nav-stacked">
                                        <li role="presentation"><a href="<c:url value="/main/notice"/>">Overtime</a></li>
                                        <li role="presentation"><a href="<c:url value="/main/notice/leave"/>">Leave</a></li>
                                        <li role="presentation" class="active"><a href="payment">Payment</a></li>
                                        <li role="presentation"><a href="<c:url value="/main/noticeDocument"/>">Document</a></li>
                                        <li role="presentation"><a href="<c:url value="/main/others"/>">Others</a></li>  
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-10">
                            <div class="panel panel-default">
                                <!--<div class="panel-heading"></div>-->
                                <div class="panel-body">
                                    <div class="row">
                                        
                                            <table align="right">
                                                <tr>
                                                    <td width="230px">

                                                        <div class="input-group">
                                                            <input type="text" class="form-control" placeholder="Search" id="paymentinput"onkeyup="searchFunction()">
                                                            <span class="input-group-addon">
                                                                <span class="glyphicon glyphicon-search"></span>
                                                            </span>
                                                        </div> 

                                                    </td>
                                                    <td width="20px"></td>
                                                </tr>
                                            </table>
                                    </div>
                                    <br>
                                    <div class="panel panel-primary">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">Payment</h4>
                                        </div>
                                        <div class="panel-body">
                                            <c:set var="check2" value="0"></c:set>
                                            <c:forEach var="paymentItems1" items="${paymentList}">
                                                <c:if test="${paymentItems1.status == 1 || paymentItems1.status == 3}">
                                                    <c:set var="check2" value="1"></c:set>
                                                </c:if>
                                            </c:forEach>
                                            <c:if test="${check2 == 1}">
                                                
                                                <table class="table table-bordered" cellspacing="0" id="payment">
                                                    <thead>
                                                        <tr class="bg-primary">
                                                            <th><div align="center">Name</div></th>
                                                            <th><div align="center">Receipt No.</div></th>
                                                            <th><div align="center">Date</div></th>
                                                            <th><div align="center">Description</div></th>
                                                            <th><div align="center">Amount</div></th>
                                                            <th><div align="center">Option</div></th>
                                                        </tr>
                                                    </thead>

                                                    <c:forEach var="paymentItems" items="${paymentList}">
                                                        <c:forEach var="profileItems" items="${profileList}">
                                                            <c:if test="${profileItems.id == paymentItems.empId}">
                                                                <c:set var="name" value="${profileItems.firstName} ${profileItems.lastName}"></c:set>
                                                            </c:if>
                                                        </c:forEach>
                                                        <c:if test="${paymentItems.status == 1 || paymentItems.status == 3}">
                                                            <tbody>
                                                                <tr>
                                                                    <td align="center">${name}</td>
                                                                    <td align="center">${paymentItems.receiptNo}</td>
                                                                    <td align="center">${paymentItems.date}</td>
                                                                    <td align="center" style="word-wrap: break-word;">${paymentItems.description}</td>
                                                                    <td align="center" style="word-wrap: break-word;">${paymentItems.amount}</td>
                                                                    <c:if test="${paymentItems.status == 1}">
                                                                        <td align="center">
                                                                            <a href="<c:url value="/"/>main/adminAllowPayment/${paymentItems.id}" class="btn btn-success">Allow </a>
                                                                            <a href="<c:url value="/"/>main/RejectPayment/${paymentItems.id}"class="btn btn-danger">Not Allow</a></td>  
                                                                        </td>
                                                                    </c:if>
                                                                    <c:if test="${paymentItems.status == 3}">
                                                                        <td align="center">
                                                                            <a href="<c:url value="/"/>main/adminApprovePayment/${paymentItems.id}" class="btn btn-success">Accept</a>
                                                                        </td>
                                                                    </c:if>
                                                                </tr>
                                                            </tbody> 
                                                        </c:if>
                                                    </c:forEach>
                                                </table>
                                                <br><br>
                                            </c:if>


                                        </div>
                                    </div>


                                </div>
                            </div>
                        </div>
                    </div>
                </div>

        </body>
    </c:if>
</html>
