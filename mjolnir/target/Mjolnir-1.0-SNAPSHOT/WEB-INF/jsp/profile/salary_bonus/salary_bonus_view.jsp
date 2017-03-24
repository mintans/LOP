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

        <title>Salary&Bonus View</title>
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
                        <span class="breadcrumb-item active">salary&bonus</span>
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
                    <!--------------------------------Salary------------------------->
                    <div class="panel panel-primary">
                        <div class="panel-heading col-md-12">
                            <div class="col-md-12" align="left" style="margin-top: 5px;margin-bottom: 7px">
                                <h4 class="panel-title">Salary</h4>
                            </div>
                        </div>
                        <div class="panel-body">
                            <c:forEach var="profileItem" items="${profileList}">
                                <c:if test="${profileid == profileItem.id}">
                                    <div class="row">
                                        <div class="col-md-offset-1 col-md-8">
                                            <br>
                                            <label>รหัสพนักงาน : ${profileItem1.id}   
                                                <c:if test="${profileItem1.title == 1}">นาย</c:if>
                                                <c:if test="${profileItem1.title == 2}">นาง</c:if>
                                                <c:if test="${profileItem1.title == 3}">นางสาว</c:if>
                                                ${profileItem1.firstName}   ${profileItem1.lastName}
                                            </label>
                                        </div>
                                        <div class="col-md-3" align="right">
                                            <br>
                                            <c:if test="${userInfo.user.permission == 'ADMIN'}">
                                                <button type="button" class="btn btn-primary" id="addSalary" data-toggle="modal" data-target="#salaryModal">Add Salary</button>
                                            </c:if>
                                        </div>

                                        <!-- Modal -->
                                        <div class="modal fade" id="salaryModal" role="dialog" data-keyboard="false" data-backdrop="static">
                                            <div class="modal-dialog">

                                                <!-- Modal content-->
                                                <div class="modal-content">
                                                    <div class="form-horizontal">
                                                        <form method="POST" action="<c:url value="/main/salary_bonus/"/>salarySave">
                                                            <div class="modal-header">
                                                                <button type="button" class="close" onclick="javascript:window.location.reload()" data-dismiss="modal">&times;</button>
                                                                <h4 class="modal-title">Add Salary</h4>
                                                            </div>
                                                            <div class="modal-body">
                                                                <div class="form-group">
                                                                    <label for="Date" class="col-md-3 control-label" align="right">Date : </label>
                                                                    <div class="col-md-7">
                                                                        <input type="date" class="form-control" id="date" name="date" required="true">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="Position" class="col-md-3 control-label" align="right">Position : </label>
                                                                    <div class="col-md-7">
                                                                        <input type="text" class="form-control" id="position" name="position" value="${userPosition}" readonly="true">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="Salary" class="col-md-3 control-label" align="right">Salary : </label>
                                                                    <div class="col-md-7">
                                                                        <input type="text" class="form-control" id="salary" name="salary" required="true">
                                                                    </div>
                                                                </div>

                                                                <input type="hidden" class="form-control" id="profileId" name="profileId" value="${profileItem1.id}">

                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="submit" class="btn btn-primary">Add</button>
                                                                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="javascript:window.location.reload()">Cancel</button>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <br>
                                    <c:if test="${empty profileList}">
                                        <p align="center">ยังไม่มีการเพิ่มข้อมูล</p>
                                    </c:if>
                                    <div style="height:291px;overflow:auto;">
                                        <table id="salaryTable" class="table table-bordered">
                                            <thead>
                                                <tr class="bg-primary">
                                                    <th style="width: 10%"><div align="center">No.</div></th>
                                                    <th style="width: 15%"><div align="center">Date</div></th>
                                                    <th style="width: 25%"><div align="center">Position</div></th>
                                                    <th><div align="center">Salary</div></th>
                                                        <c:if test="${userInfo.user.permission == 'ADMIN'}">
                                                        <th style="width: 25%"><div align="center">Option</div></th>
                                                        </c:if>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:set var="countNo" value="1" scope="page"/>
                                                <c:forEach var="salaryList" items="${salaryList}">
                                                    <c:if test="${salaryList.profileId == profileid}">
                                                        <tr>
                                                            <td align="center">${countNo}</td>
                                                            <td align="center"></td>
                                                            <td align="center">${salaryList.position}</td>
                                                            <td align="center">${salaryList.salary}</td>
                                                            <c:if test="${userInfo.user.permission == 'ADMIN'}">
                                                                <td align="center">
                                                                    <button type="button" class="btn btn-warning" id="sararyEdit" 
                                                                            data-toggle="modal" data-target="#salaryModal"
                                                                            data-index="${countNo}"
                                                                            data-id="${salaryList.id}"
                                                                            data-date="${salaryList.date}"
                                                                            data-position="${salaryList.position}"
                                                                            data-salary="${salaryList.salary}"
                                                                            >Edit</button>
                                                                    <a href="<c:url value="/"/>main/salary_bonus/salaryDelete/${salaryList.id}"class="btn btn-danger"> Delete</a>
                                                                </td>
                                                            </c:if>
                                                        </tr>
                                                    <script language="JavaScript" type="text/JavaScript">
                                                        addEventListener("load", function () {
                                                        salaryChangeDateFunction("${salaryList.date}","${countNo}");
                                                        }, true);
                                                    </script>
                                                    <c:set var="countNo" value="${countNo+1}" scope="page"/>
                                                </c:if>
                                            </c:forEach>
                                            </tbody>
                                        </table>               
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                    <!--------------------------------Salary------------------------->

                    <!--------------------------------Bonus------------------------->
                    <div class="panel panel-primary">
                        <div class="panel-heading col-md-12">
                            <div class="col-md-12" align="left" style="margin-top: 5px;margin-bottom: 7px">
                                <h4 class="panel-title">Bonus</h4>
                            </div>
                        </div>
                        <div class="panel-body">
                            <c:forEach var="profileItem" items="${profileList}">
                                <c:if test="${profileid == profileItem.id}">
                                    <div class="row">
                                        <div class="col-md-offset-1 col-md-8">
                                            <br>
                                            <label>รหัสพนักงาน : ${profileItem1.id}   
                                                <c:if test="${profileItem1.title == 1}">นาย</c:if>
                                                <c:if test="${profileItem1.title == 2}">นาง</c:if>
                                                <c:if test="${profileItem1.title == 3}">นางสาว</c:if>
                                                ${profileItem1.firstName}   ${profileItem1.lastName}
                                            </label>
                                        </div>
                                        <div class="col-md-3" align="right">
                                            <br>
                                            <c:if test="${userInfo.user.permission == 'ADMIN'}">
                                                <button type="button" class="btn btn-primary" id="addBonus" data-toggle="modal" data-target="#bonusModal">Add Bonus</button>
                                            </c:if>
                                        </div>

                                        <!-- Modal -->
                                        <div class="modal fade" id="bonusModal" role="dialog" data-keyboard="false" data-backdrop="static">
                                            <div class="modal-dialog">

                                                <!-- Modal content-->
                                                <div class="modal-content">
                                                    <div class="form-horizontal">
                                                        <form method="POST" action="<c:url value="/main/salary_bonus/"/>bonusSave">
                                                            <div class="modal-header">
                                                                <button type="button" class="close" onclick="javascript:window.location.reload()" data-dismiss="modal">&times;</button>
                                                                <h4 class="modal-title">Add Bonus</h4>
                                                            </div>
                                                            <div class="modal-body">
                                                                <div class="form-group">
                                                                    <label for="Date" class="col-md-3 control-label" align="right">Date : </label>
                                                                    <div class="col-md-7">
                                                                        <input type="date" class="form-control" id="date" name="date" required="true">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="Position" class="col-md-3 control-label" align="right">Position : </label>
                                                                    <div class="col-md-7">
                                                                        <input type="text" class="form-control" id="position" name="position" value="${userPosition}" readonly="true">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="Percentage(%)" class="col-md-3 control-label" align="right">Percentage(%) : </label>
                                                                    <div class="col-md-7">
                                                                        <input type="text" class="form-control" id="percentage" name="Percentage" onkeyup="calBonus('${salaryMoney}')" required="true">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="Bonus(Bath)" class="col-md-3 control-label" align="right">Bonus(Bath): : </label>
                                                                    <div class="col-md-7">
                                                                        <input type="text" class="form-control" id="bonus" name="bonus" readonly="true">
                                                                    </div>
                                                                </div>
                                                                <input type="hidden" class="form-control" id="profileId" name="profileId" value="${profileItem1.id}">

                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="submit" class="btn btn-primary">Add</button>
                                                                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="javascript:window.location.reload()">Cancel</button>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <br>
                                    <c:if test="${empty profileList}">
                                        <p align="center">ยังไม่มีการเพิ่มข้อมูล</p>
                                    </c:if>
                                    <div style="height:291px;overflow:auto;">
                                        <table id="bonusTable" class="table table-bordered">
                                            <thead>
                                                <tr class="bg-primary">
                                                    <th style="width: 10%"><div align="center">No.</div></th>
                                                    <th style="width: 15%"><div align="center">Date</div></th>
                                                    <th style="width: 25%"><div align="center">Position</div></th>
                                                    <th><div align="center">Percentage(%)</div></th>
                                                    <th><div align="center">Bonus(Bath)</div></th>
                                                        <c:if test="${userInfo.user.permission == 'ADMIN'}">
                                                        <th style="width: 25%"><div align="center">Option</div></th>
                                                        </c:if>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:set var="countNo2" value="1" scope="page"/>
                                                <c:forEach var="bonusList" items="${bonusList}">
                                                    <c:if test="${bonusList.profileId == profileid}">
                                                        <tr>
                                                            <td align="center">${countNo2}</td>
                                                            <td align="center"></td>
                                                            <td align="center">${bonusList.position}</td>
                                                            <td align="center">${bonusList.percentage}</td>
                                                            <td align="center">${bonusList.bonus}</td>
                                                            <c:if test="${userInfo.user.permission == 'ADMIN'}">
                                                                <td align="center">
                                                                    <button type="button" class="btn btn-warning" id="bonusEdit" 
                                                                            data-toggle="modal" data-target="#bonusModal"
                                                                            data-index="${countNo2}"
                                                                            data-id="${bonusList.id}"
                                                                            data-date="${bonusList.date}"
                                                                            data-position="${bonusList.position}"
                                                                            data-percentage="${bonusList.percentage}"
                                                                            data-bonus="${bonusList.bonus}"
                                                                            >Edit</button>
                                                                    <a href="<c:url value="/"/>main/salary_bonus/bonusDelete/${bonusList.id}"class="btn btn-danger"> Delete</a>
                                                                </td>
                                                            </c:if>
                                                        </tr>
                                                    <script language="JavaScript" type="text/JavaScript">
                                                        addEventListener("load", function () {
                                                        bonusChangeDateFunction("${bonusList.date}","${countNo2}");
                                                        }, true);
                                                    </script>
                                                    <c:set var="countNo2" value="${countNo2+1}" scope="page"/>
                                                </c:if>
                                            </c:forEach>
                                            </tbody>
                                        </table>               
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                    <!--------------------------------Bonus------------------------->
                </div>
            </div>
            <script>
                function calBonus(salary) {
                    var salary = salary;
                    var input = document.getElementById("percentage");
                    var percentage = input.value.toUpperCase();
                    var bonus = salary * percentage;
                    $("#bonusModal .modal-body #bonus").val(bonus);
                }
            </script>
            <script>
                function salaryChangeDateFunction(date, row) {
                    var salaryDate = date;
                    var salaryDateDate = new Date(salaryDate);
                    var salaryDateMonth = salaryDateDate.getMonth();
                    var month = ["January", "February", "March", "April", "May", "June",
                        "July", "August", "September", "October", "November", "December"];

                    var salaryDateChange = salaryDateDate.getDate() + ' ' + month[salaryDateMonth] + ' ' + salaryDateDate.getFullYear();
                    document.getElementById("salaryTable").rows[parseInt(row)].cells[1].innerHTML = salaryDateChange;
                }
            </script>
            <script>
                function bonusChangeDateFunction(date, row) {
                    var bonusDate = date;
                    var bonusDateDate = new Date(bonusDate);
                    var bonusDateMonth = bonusDateDate.getMonth();
                    var month = ["January", "February", "March", "April", "May", "June",
                        "July", "August", "September", "October", "November", "December"];

                    var bonusDateChange = bonusDateDate.getDate() + ' ' + month[bonusDateMonth] + ' ' + bonusDateDate.getFullYear();
                    document.getElementById("bonusTable").rows[parseInt(row)].cells[1].innerHTML = bonusDateChange;
                }
            </script>
            <script type="text/javascript">
                $('#salaryTable').find('#sararyEdit').click(function () {
                    $(".modal-title").html("Edit Salary");
                    $(".modal-footer").find('.btn-primary').html("Save");
                    $(".modal-footer").find('.btn-primary').attr('class', 'btn btn-success');
                    $('<input>').attr({
                        type: 'hidden',
                        class: 'form-control',
                        id: 'id',
                        name: 'id'
                    }).appendTo('.modal-body');
                    var salaryId = $(this).attr('data-id');
                    var salaryDate = $(this).attr('data-date');
                    var salaryPosition = $(this).attr('data-position');
                    var salarySalary = $(this).attr('data-salary');
                    $(".modal-body #id").val(salaryId);
                    $(".modal-body #date").val(salaryDate);
                    $(".modal-body #position").val(salaryPosition);
                    $(".modal-body #salary").val(salarySalary);
                });
            </script>
            <script type="text/javascript">
                $('#bonusTable').find('#bonusEdit').click(function () {
                    $(".modal-title").html("Edit Salary");
                    $(".modal-footer").find('.btn-primary').html("Save");
                    $(".modal-footer").find('.btn-primary').attr('class', 'btn btn-success');
                    $('<input>').attr({
                        type: 'hidden',
                        class: 'form-control',
                        id: 'id',
                        name: 'id'
                    }).appendTo('.modal-body');
                    var bonusId = $(this).attr('data-id');
                    var bonusDate = $(this).attr('data-date');
                    var bonusPosition = $(this).attr('data-position');
                    var bonusPercentage = $(this).attr('data-percentage');
                    var bonusBonus = $(this).attr('data-bonus');
                    $(".modal-body #id").val(bonusId);
                    $(".modal-body #date").val(bonusDate);
                    $(".modal-body #position").val(bonusPosition);
                    $(".modal-body #percentage").val(bonusPercentage);
                    $(".modal-body #bonus").val(bonusBonus);
                });
            </script>
            <script type="text/javascript">
                $('#addSalary').click(function () {
                    var now = new Date();
                    var d = now.getDate();
                    var m = now.getMonth() + 1;
                    var y = now.getFullYear();
                    if (m < 10) {
                        m = "0" + m;
                    }
                    if (d < 10) {
                        d = "0" + d;
                    }
                    var today = y + '-' + m + '-' + d;
                    $("#salaryModal .modal-body #date").val(today);
                });
            </script>
            <script type="text/javascript">
                $('#addBonus').click(function () {
                    var now = new Date();
                    var d = now.getDate();
                    var m = now.getMonth() + 1;
                    var y = now.getFullYear();
                    if (m < 10) {
                        m = "0" + m;
                    }
                    if (d < 10) {
                        d = "0" + d;
                    }
                    var today = y + '-' + m + '-' + d;
                    $("#bonusModal .modal-body #date").val(today);
                });
            </script>
    </body>
</html>
