<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">      
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous"/>
        
        <link rel="stylesheet" href="<c:url value="/"/>view/template/css/bootstrap-theme.min.css" />
        
        <script src=https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment.min.js"></script>
        <script src="<c:url value="/"/>js/app.js"></script>
        <script src="<c:url value="/"/>js/notice/notice_others.js"></script>
        <script src="<c:url value="/"/>js/header.js"></script>
        <style>
            a.disabled {
                pointer-events: none;
                cursor: default;
            }  
        </style>
        <title>Others</title>
    </head>
    <c:if test="${userInfo.user.permission == 'ADMIN'}">
        <body>
            <div class="container-fluid">            
                <div class="row">
                    <%@ include file="/WEB-INF/jsp/header.jsp" %>               
                </div>

                <nav class="breadcrumb">
                    <a class="breadcrumb-item" href="<c:url value="/main/notice"/>">Notice</a> / 
                    <span class="breadcrumb-item active">Others</span>
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
                                        <li role="presentation"><a href="<c:url value="/main/noticeDocument"/>">Document</a></li>
                                        <li role="presentation"  class="active"><a href="others">Others</a></li>  
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
                                                        <input type="text" class="form-control" placeholder="Search" id="othersinput"onkeyup="searchFunction()">
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
                                            <h4 class="panel-title">Birthday</h4>
                                        </div>
                                        <div class="panel-body">
                                            <div style="display: block; height: 250px;width:100%; overflow-y: scroll;">
                                                <table class="table table-bordered" cellspacing="0" id="birthdayTable">
                                                    <c:set var="count" value="0" scope="page" />
                                                    <thead>
                                                        <tr class="bg-primary">
                                                            <th><div align="center">No.</div></th>
                                                            <th><div align="center">Name</div></th>
                                                            <th><div align="center">Date</div></th>
                                                            <th><div align="center">Age</div></th>
                                                            <th><div align="center">Option</div></th>
                                                        </tr>
                                                    </thead>
                                                    <c:forEach var="birthDayItems" items="${birthDayList}">
                                                        <c:set var="count" value="${count + 1}" scope="page"/>
                                                        <tbody>
                                                            <tr>
                                                                <td align="center"><c:out value = "${count}"></c:out></td>
                                                                <td align="center">${birthDayItems.firstName} ${birthDayItems.lastName}</td>
                                                                <td align="center"></td>
                                                                <td align="center">${birthDayItems.age}</td>                                                                                                           
                                                                <td align="center">
                                                                    <a href="<c:url value="/"/>main/others/acceptBirthDay/${birthDayItems.id}" class="btn btn-danger">Done</a> 
                                                                </td>
                                                            </tr>
                                                        <script language="JavaScript" type="text/JavaScript">
                                                            addEventListener("load", function () {
                                                            changeBirthDayDateFunction("${birthDayItems.birth}","${count}");
                                                            }, true);
                                                        </script>
                                                        </tbody> 
                                                    </c:forEach>
                                                </table>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="panel panel-primary">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">Evaluation</h4>
                                        </div>
                                        <div class="panel-body">
                                            <table class="table table-bordered" cellspacing="0" id="evaluationTable">
                                                <c:set var="countEvaluation" value="0" scope="page" />
                                                <thead>
                                                    <tr class="bg-primary">
                                                        <th><div align="center">No.</div></th>
                                                        <th><div align="center">Type</div></th>
                                                        <th><div align="center">Name</div></th>
                                                        <th><div align="center">Date</div></th>
                                                        <th><div align="center">Position</div></th>
                                                        <th><div align="center">Department</div></th>
                                                        <th><div align="center">Option</div></th>
                                                    </tr>
                                                </thead>
                                                <c:forEach var="evaluationItems" items="${evaluationList}">
                                                    <c:set var="countEvaluation" value="${countEvaluation + 1}" scope="page"/>                                                                    
                                                    <tbody>
                                                        <tr>
                                                            <td align="center">${countEvaluation}</td>
                                                            <td align="center">${evaluationItems.value.type}</td>
                                                            <td align="center">${evaluationItems.value.name}</td>
                                                            <td align="center"></td>
                                                            <td align="center">${evaluationItems.value.position}</td>  
                                                            <td align="center">${evaluationItems.value.department}</td> 
                                                            <td align="center">
                                                                <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#myModal" data-id = "${evaluationItems.key}">Change</button>
                                                            </td>
                                                        </tr>
                                                    <script language="JavaScript" type="text/JavaScript">
                                                        addEventListener("load", function () {
                                                        changeEvaluationDateFunction("${evaluationItems.value.date}","${countEvaluation}");
                                                        }, true);
                                                    </script>
                                                    </tbody> 
                                                </c:forEach>
                                            </table>
                                        </div>
                                    </div>                                    

                                    <!-- Modal -->
                                    <div class="modal fade" id="myModal" role="dialog" data-keyboard="false" data-backdrop="static">
                                        <div class="modal-dialog">

                                            <!-- Modal content-->
                                            <div class="modal-content">
                                                <div class="form-horizontal">
                                                    <form method="POST" action="<c:url value="/main/employment/"/>change">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                            <h4 class="modal-title">Change Employment Type</h4>
                                                        </div>
                                                        <div class="modal-body">

                                                            <div class="form-group">
                                                                <label for="Action" class="col-md-3 control-label" align="right">Action : </label>
                                                                <div class="col-md-7">
                                                                    <select id="action" name="action" class="form-control input-md">
                                                                        <option value="เริ่มงาน">เริ่มงาน</option>
                                                                        <option value="เปลี่ยนสถานะ">เปลี่ยนสถานะ</option>
                                                                        <option value="บริษัทส่งศึกษาต่อ">บริษัทส่งศึกษาต่อ</option>
                                                                        <option value="ลาออก">ลาออก</option>
                                                                        <option value="เลิกจ้าง">เลิกจ้าง</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="Type" class="col-md-3 control-label" align="right">Type : </label>
                                                                <div class="col-md-7">
                                                                    <select id="type" name="type" class="form-control input-md">
                                                                        <c:forEach var="employmentTypeItem" items="${employmentTypeList}">  
                                                                            <option>${employmentTypeItem.employmentTypeName}</option> 
                                                                        </c:forEach>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="Dulation" class="col-md-3 control-label" align="right">Duration : </label>
                                                                <div class="col-md-7">
                                                                    <select id="dulation" name="dulation" class="form-control input-md">
                                                                        <option value="1">1</option>
                                                                        <option value="2">2</option>
                                                                        <option value="3">3</option>
                                                                        <option value="4">4</option>
                                                                        <option value="5">5</option>
                                                                        <option value="6">6</option>
                                                                        <option value=""></option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="Date" class="col-md-3 control-label" align="right">Date : </label>
                                                                <div class="col-md-7">
                                                                    <input type="date" class="form-control" id="date" name="date">
                                                                </div>
                                                            </div>
                                                            <input type="hidden" class="form-control" id="profileId" name="profileId">
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="submit" class="btn btn-warning">Change</button>
                                                            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="javascript:window.location.reload()">Cancel</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>

                                        </div>
                                    </div>    

                                    <div class="panel panel-primary">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">Insurance</h4>
                                        </div>
                                        <div class="panel-body">
                                            <table class="table table-bordered" cellspacing="0" id="insuranceTable">
                                                <c:set var="count3" value="0" scope="page"/>
                                                <thead>
                                                    <tr class="bg-primary">
                                                        <th><div align="center">No.</div></th>
                                                        <th><div align="center">Name</div></th>
                                                        <th><div align="center">Start Working Date</div></th>
                                                        <th><div align="center">Date of Anniversary 1 Year</div></th>
                                                        <th><div align="center">Option</div></th>
                                                    </tr>
                                                </thead>


                                                <c:forEach var="mapInsuranceNoticeItems" items="${mapInsuranceNotice}">                                                      

                                                    <c:set var="count3" value="${count3 + 1}" scope="page"/>
                                                    <tbody>
                                                        <tr>
                                                            <td align="center">${count3}</td>
                                                            <td align="center">${mapInsuranceNoticeItems.value.name}</td>
                                                            <td align="center">${mapInsuranceNoticeItems.value.startDate}</td>
                                                            <td align="center">${mapInsuranceNoticeItems.value.anniversaryDate}</td>                                                            
                                                            <td align="center">
                                                                <c:if test="${mapInsuranceNoticeItems.value.manage == true}">
                                                                    <a class="btn btn-success disabled">Panning</a>
                                                                    <a class="btn btn-danger" href="<c:url value="/"/>main/others/doneInsurance/${mapInsuranceNoticeItems.key}">Done</a>
                                                                </c:if>
                                                                <c:if test="${mapInsuranceNoticeItems.value.manage != true}">
                                                                    <a href="<c:url value="/"/>main/others/manageInsurance/${mapInsuranceNoticeItems.key}" class="btn btn-warning">Manage</a>
                                                                    <a class="btn btn-danger disabled" >Done</a>
                                                                </c:if>
                                                            </td>
                                                        </tr>   
                                                    <script language="JavaScript" type="text/JavaScript">
                                                        addEventListener("load", function () {
                                                        changeInsuranceDateFunction("${mapInsuranceNoticeItems.value.startDate}","${mapInsuranceNoticeItems.value.anniversaryDate}","${count3}");
                                                        }, true);
                                                    </script>                                                        
                                                    </tbody>

                                                </c:forEach>                                              

                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                </div>
                <script type="text/javascript">
                    $('#myModal').on('show.bs.modal', function (modelbutton) {
                        var button = $(modelbutton.relatedTarget);
                        var id = button.data('id');
                        document.getElementById("profileId").value = id;
                    });
                </script>
                <script type="text/javascript">
                    function changeInsuranceDateFunction(workdate, anniverDate, row) {
                        var InsuranceDate = workdate;
                        var InsuranceDateDate = new Date(InsuranceDate);
                        var birthdayDateMonth = InsuranceDateDate.getMonth();

                        var anniverDate = anniverDate;
                        var anniverDateDate = new Date(anniverDate);
                        var anniverDateMonth = anniverDateDate.getMonth();

                        var month = ["January", "February", "March", "April", "May", "June",
                            "July", "August", "September", "October", "November", "December"];

                        var insuranceDateChange = InsuranceDateDate.getDate() + ' ' + month[birthdayDateMonth] + ' ' + InsuranceDateDate.getFullYear();
                        var insuranceAnniverDateChange = anniverDateDate.getDate() + ' ' + month[anniverDateMonth] + ' ' + anniverDateDate.getFullYear();
                        document.getElementById("insuranceTable").rows[parseInt(row)].cells[2].innerHTML = insuranceDateChange;
                        document.getElementById("insuranceTable").rows[parseInt(row)].cells[3].innerHTML = insuranceAnniverDateChange;
                    }
                </script>
                }
            </script>
            <script>
                function changeBirthDayDateFunction(date, row) {
                    var birthdayDate = date;
                    var birthdayDateDate = new Date(birthdayDate);
                    var birthdayDateMonth = birthdayDateDate.getMonth();
                    var month = ["January", "February", "March", "April", "May", "June",
                        "July", "August", "September", "October", "November", "December"];

                    var birthdayDateChange = birthdayDateDate.getDate() + ' ' + month[birthdayDateMonth] + ' ' + birthdayDateDate.getFullYear();
                    document.getElementById("birthdayTable").rows[parseInt(row)].cells[2].innerHTML = birthdayDateChange;
                }
            </script>
            <script>
                function changeEvaluationDateFunction(date, row) {
                    var evaluationDate = date;
                    var evaluationDateDate = new Date(evaluationDate);
                    var evaluationDateMonth = evaluationDateDate.getMonth();
                    var month = ["January", "February", "March", "April", "May", "June",
                        "July", "August", "September", "October", "November", "December"];

                    var evaluationDateChange = evaluationDateDate.getDate() + ' ' + month[evaluationDateMonth] + ' ' + evaluationDateDate.getFullYear();
                    document.getElementById("evaluationTable").rows[parseInt(row)].cells[3].innerHTML = evaluationDateChange;
                }
            </script>

    </body>
</c:if>
</html>
