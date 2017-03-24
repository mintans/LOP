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

        <script src="<c:url value="/"/>js/sortTable/jquery-latest.js" type="text/javascript"></script>
        <script src="<c:url value="/"/>js/sortTable/jquery.tablesorter.js" type="text/javascript"></script>
        <link href="<c:url value="/"/>js/sortTable/themes/blue/style.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript">
            $(function () {
                $("table").tablesorter({debug: true});
            });
        </script>

        <title>Document View</title>
    </head>
    <body>
        <div class="container-fluid">            
            <div class="row">
                <%@ include file="/WEB-INF/jsp/header.jsp" %>               
            </div>
            <nav class="breadcrumb">
                <c:forEach var="profileItem" items="${profileList}">
                    <c:if test="${profileid == profileItem.id}">
                        <a class="breadcrumb-item" href="<c:url value="/main/profile"/>">Profile</a> / 
                        <a class="breadcrumb-item" href="<c:url value="/"/>main/profile/viewTH/${profileItem.id}"/>${profileItem.id}</a> / 
                        <span class="breadcrumb-item active">document</span>
                    </c:if>
                </c:forEach>
            </nav>


            <div class="row">
                <div class="col-md-2">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <%@ include file="/WEB-INF/jsp/profile/sidebar.jsp" %>
                        </div>
                    </div>
                </div>
                <div class="col-md-10">
                    <div class="panel panel-primary">
                        <div class="panel-heading col-md-12">
                            <div class="col-md-12" align="left" style="margin-top: 5px; margin-bottom: 7px">
                                <h4 class="panel-title">Document</h4>
                            </div>
                        </div>
                        <div class="panel-body">
                            <c:forEach var="profileItem" items="${profileList}">
                                <c:if test="${profileid == profileItem.id}">
                                    <div class="row">
                                        <div class="col-md-offset-1 col-md-8">
                                            <br>
                                            <label>รหัสพนักงาน : ${profileItem.id}   
                                                <c:if test="${profileItem.title == 1}">นาย</c:if>
                                                <c:if test="${profileItem.title == 2}">นาง</c:if>
                                                <c:if test="${profileItem.title == 3}">นางสาว</c:if>
                                                ${profileItem.firstName}   ${profileItem.lastName}
                                            </label>
                                        </div>
                                    </div>
                                    <div class="row"><label></label></div>
                                    <div class="row">
                                        <div class="col-md-3">
                                            <label>หนังสือรับรองเงินเดือน : </label>
                                        </div>
                                        <div class="col-md-1">
                                            <input class="form-control" id="salaryCertificate" name="salaryCertificate" value="${salaryCertificate}" readonly="true" style="text-align: center">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-3">
                                            <label>หนังสือรับรองเป็นพนักงาน : </label>
                                        </div>
                                        <div class="col-md-1">
                                            <input class="form-control" id="staffCertificate" name="staffCertificate" value="${staffCertificate}" readonly="true" style="text-align: center">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-3">
                                            <label>หนังสือรับรองความประพฤติ : </label>
                                        </div>
                                        <div class="col-md-1">
                                            <input class="form-control" id="behaviorCertificate" name="behaviorCertificate" value="${behaviorCertificate}" readonly="true" style="text-align: center">
                                        </div>
                                    </div>
                                    <br>
                                    <c:if test="${empty profileList}">
                                        <p align="center">ยังไม่มีการเพิ่มข้อมูล</p>
                                    </c:if>
                                    <div style="height:291px;overflow:auto;">
                                        <table class="table table-bordered" id="documentionTable">
                                            <thead>
                                                <tr class="bg-primary">
                                                    <th><div align="center">No.</div></th>
                                                    <th><div align="center">Document</div></th>
                                                    <th><div align="center">Date</div></th>
                                                    <th><div align="center">Amount</div></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:set var="countNo" value="1" scope="page"/>
                                                <c:forEach var="documentionInfoList" items="${documentionInfoList}">
                                                    <tr>
                                                        <td align="center">${countNo}</td>
                                                        <td align="center">${documentionInfoList.requestedDocuments}</td>
                                                        <td align="center"></td>
                                                        <td align="center">${documentionInfoList.amount}</td>
                                                    </tr>
                                                <script language="JavaScript" type="text/JavaScript">
                                                    addEventListener("load", function () {
                                                    changeDateFunction("${documentionInfoList.date}","${countNo}");
                                                    }, true);
                                                </script>
                                                <c:set var="countNo" value="${countNo+1}" scope="page"/>
                                            </c:forEach>
                                            </tbody>
                                        </table>               
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
            <script>
                function changeDateFunction(date, row) {
                    var documentionDate = date;
                    var documentionDateDate = new Date(documentionDate);
                    var documentionDateMonth = documentionDateDate.getMonth();
                    var month = ["January", "February", "March", "April", "May", "June",
                        "July", "August", "September", "October", "November", "December"];

                    var documentionDateChange = documentionDateDate.getDate() + ' ' + month[documentionDateMonth] + ' ' + documentionDateDate.getFullYear();
                    document.getElementById("documentionTable").rows[parseInt(row)].cells[2].innerHTML = documentionDateChange;
                }
            </script>
    </body>
</html>
