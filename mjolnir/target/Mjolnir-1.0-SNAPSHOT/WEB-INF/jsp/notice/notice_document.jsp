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
        <script src="<c:url value="/"/>js/notice/notice_document.js"></script>

        <script src="<c:url value="/"/>js/sortTable/jquery-latest.js" type="text/javascript"></script>
        <script src="<c:url value="/"/>js/sortTable/jquery.tablesorter.js" type="text/javascript"></script>
        <link href="<c:url value="/"/>js/sortTable/themes/blue/style.css" rel="stylesheet" type="text/css"/>

        <title>Document</title>


    </head>
    <c:if test="${userInfo.user.permission == 'ADMIN'}">
        <body onload="hide('${empId}')">
            <div class="container-fluid">            
                <div class="row">
                    <%@ include file="/WEB-INF/jsp/header.jsp" %>               
                </div>

                <nav class="breadcrumb">
                    <a class="breadcrumb-item" href="overtime">Notice</a> / 
                    <span class="breadcrumb-item active">Document</span>
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
                                        <li role="presentation"><a href="<c:url value="/main/notice/payment"/>">Payment</a></li>
                                        <li role="presentation" class="active"><a href="noticeDocument">Document</a></li>
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
                                                        <input type="text" class="form-control" placeholder="Search"  id="documentinput" onkeyup="searchFunction()">
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
                                            <h4 class="panel-title">Documents</h4>
                                        </div>
                                        <div class="panel-body">
                                            <table class="table table-bordered" cellspacing="0" id="document">
                                                <c:set var="count" value="0" scope="page" />
                                                <thead>
                                                    <tr class="bg-primary">
                                                        <th><div align="center">No.</div></th>
                                                        <th><div align="center">Name</div></th>
                                                        <th><div align="center">Date</div></th>
                                                        <th><div align="center">Document Required</div></th>
                                                        <th><div align="center">Objectivity</div></th>
                                                        <th><div align="center">Amount</div></th>
                                                        <th><div align="center">Option</div></th>
                                                    </tr>
                                                </thead>
                                                <c:forEach var="documentItems" items="${documentList}">
                                                    <c:forEach var="profileItems" items="${profileList}">
                                                        <c:if test="${profileItems.id == documentItems.userId}">
                                                            <c:set var="name" value="${profileItems.firstName} ${profileItems.lastName}"></c:set>
                                                        </c:if>
                                                    </c:forEach>
                                                    <c:if test="${documentItems.admin == false}">
                                                        <c:set var="count" value="${count + 1}" scope="page"/>
                                                        <tbody>
                                                            <tr>
                                                                <td align="center"><c:out value = "${count}"></c:out></td>
                                                                <td align="center">${name}</td>
                                                                <td align="center">${documentItems.date}</td>
                                                                <td align="center">${documentItems.requestedDocuments}</td>
                                                                <td align="center">${documentItems.objectivity}</td>
                                                                <td align="center">${documentItems.amount}</td>                                                      
                                                                <td align="center">
                                                                    <a href="<c:url value="/"/>main/noticeDocument/acceptDocument/${documentItems.id}" class="btn btn-success">Accept</a> 
                                                                </td>
                                                            </tr>
                                                        <script language="JavaScript" type="text/JavaScript">
                                                            addEventListener("load", function () {
                                                            changeDateFunction("${documentItems.date}","${count}");
                                                            }, true);
                                                        </script>  
                                                        </tbody> 
                                                    </c:if>
                                                </c:forEach>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </body>
        <script>
                function changeDateFunction(date, row) {
                    var documentDate = date;
                    var documentDateDate = new Date(documentDate);
                    var documentDateMonth = documentDateDate.getMonth();
                    var month = ["January", "February", "March", "April", "May", "June",
                        "July", "August", "September", "October", "November", "December"];

                    var documentDateChange = documentDateDate.getDate() + ' ' + month[documentDateMonth] + ' ' + documentDateDate.getFullYear();
                    document.getElementById("document").rows[parseInt(row)].cells[2].innerHTML = documentDateChange;
                }
            </script>
    </c:if>
</html>
