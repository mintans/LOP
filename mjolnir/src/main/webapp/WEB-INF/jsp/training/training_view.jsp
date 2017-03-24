<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
        <script src="<c:url value="/"/>js/user/department.js"></script>    
        <script src="<c:url value="/"/>js/training/training.js"></script>
        <script type="text/javascript">
            $(function () {
                $("table").tablesorter({debug: true});
            });
        </script>
        <script>
            function autoID(tList) {
                if (tList === "") {
                    document.getElementById("subjectId").value = "TN001";
                } else {
                    var num = tList.substring(2);
                    var numid = parseInt(num) + 1;
                    var tid;
                    if (numid < 10) {
                        tid = "TN00" + numid;
                    } else if (numid < 100) {
                        tid = "TN0" + numid;
                    } else {
                        tid = "TN" + numid;
                    }
                    document.getElementById("subjectId").value = tid;
                }
            }
        </script>

        <title>Training</title>
    </head>
    <body onload="autoID('${trainingId}')">
        <div class="container-fluid">            
            <div class="row">
                <%@ include file="/WEB-INF/jsp/header.jsp" %>               
            </div>
            <nav class="breadcrumb">
                <!--                <a class="breadcrumb-item" href="<c:url value="/main/profile"/>">Profile</a> / -->
                <span class="breadcrumb-item active">Training</span> /
            </nav>
            <div class="container">

                <div class="row">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div align="left">
                                <h4 class="panel-title">Training</h4>
                            </div>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-9">
                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">Add New Subject</button>
                                    <button type="button" class="btn btn-primary" id="sendEmailBtn" data-allMemberSendEmail="${arrayAllMember}" data-toggle="modal" data-target="#sendEmailModal" style="margin-left: 20px">Send Email</button>
                                </div>
                                <div class="col-md-3">
                                    <form>
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="trainingSearchInput" placeholder="Search" onkeyup="TrainingSearchFunction()">
                                            <div class="input-group-btn">
                                                <button class="btn btn-primary" type="submit">
                                                    <i class="glyphicon glyphicon-search"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>


                                <!-- Modal -->
                                <div class="modal fade" id="myModal" role="dialog" data-keyboard="false" data-backdrop="static">
                                    <div class="modal-dialog">

                                        <!-- Modal content-->
                                        <div class="modal-content">
                                            <div class="form-horizontal">
                                                <form method="POST" action="<c:url value="/main/training/"/>save">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" onclick="javascript:window.location.reload()" data-dismiss="modal">&times;</button>
                                                        <h4 class="modal-title">Add Subject</h4>
                                                    </div>
                                                    <div class="modal-body">

                                                        <div class="form-group">
                                                            <label for="id" class="col-md-3 control-label" align="right">ID : </label>
                                                            <div class="col-md-7">
                                                                <input type="text" class="form-control" id="subjectId" name="id" readonly="true">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="name" class="col-md-3 control-label" align="right">Subject : </label>
                                                            <div class="col-md-7">
                                                                <input type="text" class="form-control" id="subject" name="subject" required="subject">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="name" class="col-md-3 control-label" align="right">Trainer : </label>
                                                            <div class="col-md-7">
                                                                <input type="text" class="form-control" id="trainer" name="trainer" required="trainer">
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <label for="message-text" class="col-md-3 control-label" align="right">Description :</label>
                                                            <div class="col-md-7">
                                                                <textarea style="overflow:auto;resize:none" rows="5" cols="5" class="form-control" id="description" name="description" required="description" placeholder="What about this subject?"></textarea>
                                                            </div>
                                                        </div>

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
                            <div style="height:290px;overflow:auto;">
                                <table id="trainingTable" class="table table-bordered">
                                    <thead>
                                        <tr class="bg-primary">
                                            <th style="width: 7%"><div align="center">No.</div></th>
                                            <th style="width: 10%"><div align="center">ID</div></th>
                                            <th style="width: 15%"><div align="center">Subject</div></th>
                                            <th style="width: 20%"><div align="center">Trainer</div></th>
                                            <th style="width: 23%"><div align="center">Description</div></th>
                                            <th style="width: 25%"><div align="center">Option</div></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:set var="countNo" value="1" scope="page"/>
                                        <c:forEach var="trainingList" items="${trainingList}">
                                            <tr>
                                                <td align="center">${countNo}</td>
                                                <td align="center">${trainingList.id}</td>
                                                <td align="center">${trainingList.subject}</td>
                                                <td align="center">${trainingList.trainer}</td>
                                                <td align="center">${trainingList.description}</td>
                                                <td align="center">
                                                    <button type="button" class="btn btn-warning" id="btnEdit" 
                                                            data-toggle="modal" data-target="#myModal"
                                                            onclick="editModal('${countNo}')"
                                                            >Edit</button>
                                                    <button onclick="show('${trainingList.id}', highlight_row(this))" class="btn btn-success">Trainees </button>                                                      
                                                    <button type="button" class="btn btn-danger" onclick="confirmDelete('${trainingList.id}')">Delete</button>
                                                </td>
                                            </tr>
                                            <c:set var="countNo" value="${countNo+1}" scope="page"/>
                                        </c:forEach>
                                    </tbody>
                                </table>          
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <c:forEach var="trainingList" items="${trainingList}">
                <c:set var="arrayselectMember" value="" scope="page" /> 

                <c:if test="${trainingList.trainingInfo != null}">
                    <c:forEach var="trainingInfo" items="${trainingList.trainingInfo}">
                        <c:set var="arrayselectMember" value="${arrayselectMember}${trainingInfo.id}|${trainingInfo.name}|${trainingInfo.position}|${trainingInfo.date}," scope="page"/>
                    </c:forEach>
                </c:if>  
                <div class="container">                                 
                    <div class="row">
                        <div class="panel panel-primary" id="${trainingList.id}" style="display: none">
                            <div class="panel-heading">
                                <div align="left">
                                    <h4>Trainees : ${trainingList.subject}</h4>
                                </div>
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-8">
                                        <button type="button" class="btn btn-primary" id="addMember" data-id="${trainingList.id}" data-subject="${trainingList.subject}" data-selectMember="${arrayselectMember}" data-allMember="${arrayAllMember}" data-toggle="modal" data-target="#myModal2">Add Trainee</button>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="row">
                                            <table>
                                                <tr>
                                                    <td width="50" align="center">Month:</td>
                                                    <td width="250px">
                                                        <select class="form-control input-md" id="month${trainingList.id}" onchange="SearchTrainingDateFunction('month${trainingList.id}', 'year${trainingList.id}', '${trainingList.id}')">
                                                        </select>
                                                    </td>
                                                    <td width="50" align="center">Year:</td>
                                                    <td width="150px">
                                                        <select class="form-control input-md" id="year${trainingList.id}" onchange="SearchTrainingDateFunction('month${trainingList.id}', 'year${trainingList.id}', '${trainingList.id}')">
                                                        </select>    
                                                    </td>
                                                    <td width="20px"></td>
                                                </tr>
                                            </table>

                                        </div>
                                    </div>
                                </div>

                                <br>
                                <c:if test="${empty profileList}">
                                    <p align="center">ยังไม่มีการเพิ่มข้อมูล</p>
                                </c:if>
                                <div style="height:290px;overflow:auto;">
                                    <table id="trainingMemberTable${trainingList.id}" class="table table-bordered">
                                        <thead>
                                            <tr class="bg-primary">
                                                <th><div align="center">No.</div></th>
                                                <th><div align="center">Name</div></th>
                                                <th><div align="center">Position</div></th>
                                                <th><div align="center">Date</div></th>
                                                <th><div align="center">Option</div></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:set var="countNo1" value="1" scope="page"/>
                                            <c:forEach var="trainingInfoList" items="${trainingList.trainingInfo}">
                                                <tr>
                                                    <td align="center">${countNo1}</td>
                                                    <td align="center">${trainingInfoList.name}</td>
                                                    <td align="center">${trainingInfoList.position}</td>
                                                    <td align="center">${trainingInfoList.date}</td>
                                                    <td align="center">
                                                        <a href="<c:url value="/"/>main/training/deleteMember/${trainingList.id}&${trainingInfoList.id}&${trainingInfoList.date}" class="btn btn-danger" > Delete</a>
                                                    </td>
                                                </tr>
                                                <c:set var="countNo1" value="${countNo1+1}" scope="page"/>
                                            </c:forEach>
                                        </tbody>
                                    </table>         
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>

            <!-- Modal -->
            <div class="modal fade" id="myModal2" role="dialog" data-keyboard="false" data-backdrop="static">
                <div class="modal-dialog modal-lg">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Add Trainee</h4>
                        </div>
                        <div class="modal-body">
                            <form method="POST" action="<c:url value="/main/training/"/>addMember">
                                <div class="form-horizontal">
                                    <input type="hidden" class="form-control" id="id" name="id" readonly="true">
                                    <div class="form-group">
                                        <label for="name" class="col-md-2 control-label">Subject : </label>
                                        <div class="col-md-4">
                                            <input type="text" class="form-control" id="subject" name="subject" readonly="true">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="name" class="col-md-2 control-label">Date : </label>
                                        <div class="col-md-4">
                                            <input type="date" class="form-control" id="date" name="date">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="name" class="control-label">Selected Members :</label>
                                    <table class="table table-bordered" cellspacing="0" id="selectedTable">
                                        <thead>
                                            <tr class="active">
                                                <th><div align="center">No.</div></th>
                                                <th><div align="center">Name</div></th>
                                                <th><div align="center">Position</div></th>
                                                <th><div align="center">Select</div></th>

                                            </tr>
                                        </thead>
                                    </table>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-9">
                                            <label for="name" class="control-label">Available Members :</label>
                                        </div>

                                        <div class="col-md-3">
                                            <div class="input-group">
                                                <input type="text" placeholder="Search" id="availableSearchInput" onkeyup="allSearchFunction()" class="form-control">
                                                <div class="input-group-btn">
                                                    <button class="btn btn-primary" type="button">
                                                        <i class="glyphicon glyphicon-search"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <table class="table table-bordered" cellspacing="0" id="availableTable">
                                        <thead>
                                            <tr class="active">
                                                <th><div align="center">No.</div></th>
                                                <th><div align="center">Name</div></th>
                                                <th><div align="center">Position</div></th>
                                                <th><div align="center">Select</div></th>

                                            </tr>
                                        </thead>
                                    </table>
                                </div>

                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-primary">Submit</button>
                                    <button type="button" class="btn btn-default" data-dismiss="modal" >Cancel</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Send-Email Modal -->
            <div class="modal fade" id="sendEmailModal" role="dialog" data-keyboard="false" data-backdrop="static">
                <div class="modal-dialog modal-lg">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Send Email</h4>
                        </div>
                        <div class="modal-body">
                            <form method="POST" action="<c:url value="/main/training/"/>sendEmail">
                                <div class="form-horizontal">
                                    <input type="hidden" class="form-control" id="id" name="id" readonly="true">
                                    <div class="form-group">
                                        <label for="name" class="col-md-2 control-label">Subject : </label>
                                        <div class="col-md-4">
                                            <select id="subject" name="subject" class="form-control input-md" required="true">
                                                <option value="">Please Select</option>
                                                <c:forEach var="trainingList" items="${trainingList}">
                                                    <option value="${trainingList.subject}">${trainingList.subject}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="startDate" class="col-md-2 control-label">Start Date : </label>
                                        <div class="col-md-4">
                                            <input type="date" class="form-control" id="startDate" name="startDate" required="true">
                                        </div>
                                        <label for="startTime" class="col-md-1 control-label">Time : </label>
                                        <div class="col-md-2">
                                            <input type="time" class="form-control" id="startTime" name="startTime" required="true">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="endDate" class="col-md-2 control-label">End Date : </label>
                                        <div class="col-md-4">
                                            <input type="date" class="form-control" id="endDate" name="endDate" required="true">
                                        </div>
                                        <label for="endTime" class="col-md-1 control-label">Time : </label>
                                        <div class="col-md-2">
                                            <input type="time" class="form-control" id="endTime" name="endTime" required="true">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="location" class="col-md-2 control-label">Location : </label>
                                        <div class="col-md-4">
                                            <input type="text" class="form-control" id="location" name="location" required="true">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="description" class="col-md-2 control-label">Description : </label>
                                        <div class="col-md-4">
                                            <textarea style="overflow:auto;resize:none" rows="4" cols="4" class="form-control" id="descriptionSendEmail" name="descriptionSendEmail"  required="true"></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="name" class="control-label">Selected Members :</label>
                                    <table class="table table-bordered" cellspacing="0" id="selectedSendEmailTable">
                                        <thead>
                                            <tr class="active">
                                                <th><div align="center">No.</div></th>
                                                <th><div align="center">Name</div></th>
                                                <th><div align="center">Position</div></th>
                                                <th><div align="center">Select</div></th>

                                            </tr>
                                        </thead>
                                    </table>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-9">
                                            <label for="name" class="control-label">Available Members :</label>
                                        </div>

                                        <div class="col-md-3">
                                            <div class="input-group">
                                                <input type="text" placeholder="Search" id="availableSearchInput" onkeyup="allSearchFunction()" class="form-control">
                                                <div class="input-group-btn">
                                                    <button class="btn btn-primary" type="button">
                                                        <i class="glyphicon glyphicon-search"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <table class="table table-bordered" cellspacing="0" id="availableSendEmailTable">
                                        <thead>
                                            <tr class="active">
                                                <th><div align="center">No.</div></th>
                                                <th><div align="center">Name</div></th>
                                                <th><div align="center">Position</div></th>
                                                <th><div align="center">Select</div></th>

                                            </tr>
                                        </thead>
                                    </table>
                                </div>

                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-primary">Submit</button>
                                    <button type="button" class="btn btn-default" data-dismiss="modal" >Cancel</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <script>
            function editModal(row) {
                $(".modal-title").html("Edit Subject");
                $(".modal-footer").find('.btn-primary').html("Save");
                $(".modal-footer").find('.btn-primary').attr('class', 'btn btn-success');
                var trainingId = $('#trainingTable').find('tr:eq(' + row + ') td:eq(1)').text();
                var trainingSubject = $('#trainingTable').find('tr:eq(' + row + ') td:eq(2)').text();
                var trainingTrainer = $('#trainingTable').find('tr:eq(' + row + ') td:eq(3)').text();
                var trainingDescription = $('#trainingTable').find('tr:eq(' + row + ') td:eq(4)').text();
                $("#myModal .modal-body #subjectId").val(trainingId);
                $("#myModal .modal-body #subject").val(trainingSubject);
                $("#myModal .modal-body #trainer").val(trainingTrainer);
                $("#myModal .modal-body #description").val(trainingDescription);
            }
        </script>

        <script type="text/javascript">
            $('#selectedTable').on('click', 'input[type="checkbox"]', function () {
                var indexValue = $(this).closest('tr').index();
                var realNameIndex = ('tr:eq(' + indexValue + ') td:eq(1)');
                var positionIndex = ('tr:eq(' + indexValue + ') td:eq(2)');
                var realName = $('#selectedTable').find(realNameIndex).text();
                var position = $('#selectedTable').find(positionIndex).text();
                var rowCount = $('#availableTable tr').length;
                var valueId = $(this).val();
                var selectTable = document.getElementById("availableTable");
                var row = selectTable.insertRow(rowCount);
                row.style.cssText = 'text-align:center;';
                var cell0 = row.insertCell(0);
                var cell1 = row.insertCell(1);
                var cell2 = row.insertCell(2);
                var cell3 = row.insertCell(3);

                cell0.innerHTML = rowCount;
                cell1.innerHTML = realName;
                cell2.innerHTML = position;
                cell3.innerHTML = "<td><input type='checkbox' name='noCheckList' value='" + valueId + "'/>\n\
                                        <input type='hidden' name='noCheckList' value='" + valueId + "'></td>";

                var availableTable = document.getElementById("selectedTable");
                availableTable.deleteRow(indexValue);

                for (var i = 0; i < availableTable.rows.length; i++) {
                    if (i === 0) {
                        document.getElementById("selectedTable").rows[i].cells[0].innerHTML = "No";
                    } else {
                        document.getElementById("selectedTable").rows[i].cells[0].innerHTML = i;
                    }
                }
            });
        </script>

        <script type="text/javascript">
            $('#availableTable').on('click', 'input[type="checkbox"]', function () {
                var indexValue = $(this).closest('tr').index();
                var realNameIndex = ('tr:eq(' + indexValue + ') td:eq(1)');
                var positionIndex = ('tr:eq(' + indexValue + ') td:eq(2)');
                var realName = $('#availableTable').find(realNameIndex).text();
                var position = $('#availableTable').find(positionIndex).text();
                var rowCount = $('#selectedTable tr').length;
                var valueId = $(this).val();
                var selectTable = document.getElementById("selectedTable");
                var row = selectTable.insertRow(rowCount);
                row.style.cssText = 'text-align:center;';
                var cell0 = row.insertCell(0);
                var cell1 = row.insertCell(1);
                var cell2 = row.insertCell(2);
                var cell3 = row.insertCell(3);
                cell0.innerHTML = rowCount;
                cell1.innerHTML = realName;
                cell2.innerHTML = position;
                cell3.innerHTML = "<td><input type='checkbox' name='checkList' value='" + valueId + "'checked/></td>";

                var availableTable = document.getElementById("availableTable");
                availableTable.deleteRow(indexValue);

                for (var i = 0; i < availableTable.rows.length; i++) {
                    if (i === 0) {
                        document.getElementById("availableTable").rows[i].cells[0].innerHTML = "No";
                    } else {
                        document.getElementById("availableTable").rows[i].cells[0].innerHTML = i;
                    }
                }
            });
        </script>

        <script type="text/javascript">
            $('.panel-body').find('#addMember').click(function () {
                var trainingSubject = $(this).attr('data-subject');
                var trainingId = $(this).attr('data-id');
                var selectMember = $(this).attr('data-selectMember');
                var allMember = $(this).attr('data-allMember');
                var selectTable = document.getElementById("selectedTable");
                var availableTable = document.getElementById("availableTable");
                $(".modal-body #subject").val(trainingSubject);
                $(".modal-body #id").val(trainingId);
                $(".modal-body #date").attr({'data-id': trainingId, 'data-subject': trainingSubject, 'data-selectMember': selectMember, 'data-allMember': allMember});

                while (selectTable.rows.length > 0) {
                    selectTable.deleteRow(0);
                }
                while (availableTable.rows.length > 0) {
                    availableTable.deleteRow(0);
                }

                var row = selectTable.insertRow(0);
                row.style.cssText = 'text-align:center; background-color: #337ab7;color: #ffffff;font-weight: bold;';
                var row2 = availableTable.insertRow(0);
                row2.style.cssText = 'text-align:center; background-color: #337ab7;color: #ffffff;font-weight: bold;';
                var cell0 = row.insertCell(0);
                var cell1 = row.insertCell(1);
                var cell2 = row.insertCell(2);
                var cell3 = row.insertCell(3);

                cell0.innerHTML = "No";
                cell0.style.cssText = 'width:7%';
                cell1.innerHTML = "Name";
                cell1.style.cssText = 'width:40%';
                cell2.innerHTML = "Position";
                cell2.style.cssText = 'width:25%';
                cell3.innerHTML = "Select";
                cell3.style.cssText = 'width:23%';

                var cell00 = row2.insertCell(0);
                var cell01 = row2.insertCell(1);
                var cell02 = row2.insertCell(2);
                var cell03 = row2.insertCell(3);

                cell00.innerHTML = "No";
                cell00.style.cssText = 'width:7%';
                cell01.innerHTML = "Name";
                cell01.style.cssText = 'width:40%';
                cell02.innerHTML = "Position";
                cell02.style.cssText = 'width:25%';
                cell03.innerHTML = "Select";
                cell03.style.cssText = 'width:23%';

            });

        </script>

        <script type="text/javascript">
            $('.modal-body').find('#date').change(function (e) {
                var trainingSubject = $(this).attr('data-subject');
                var trainingId = $(this).attr('data-id');
                var selectMember = $(this).attr('data-selectMember');
                var allMember = $(this).attr('data-allMember');
                var trainingDate = e.target.value;
                var selectTable = document.getElementById("selectedTable");
                var availableTable = document.getElementById("availableTable");
                while (selectTable.rows.length > 0) {
                    selectTable.deleteRow(0);
                }
                while (availableTable.rows.length > 0) {
                    availableTable.deleteRow(0);
                }

                var row = selectTable.insertRow(0);
                row.style.cssText = 'text-align:center; background-color: #337ab7;color: #ffffff;font-weight: bold;';
                var row2 = availableTable.insertRow(0);
                row2.style.cssText = 'text-align:center; background-color: #337ab7;color: #ffffff;font-weight: bold;';
                var cell0 = row.insertCell(0);
                var cell1 = row.insertCell(1);
                var cell2 = row.insertCell(2);
                var cell3 = row.insertCell(3);

                cell0.innerHTML = "No";
                cell0.style.cssText = 'width:7%';
                cell1.innerHTML = "Name";
                cell1.style.cssText = 'width:40%';
                cell2.innerHTML = "Position";
                cell2.style.cssText = 'width:25%';
                cell3.innerHTML = "Select";
                cell3.style.cssText = 'width:23%';

                var cell00 = row2.insertCell(0);
                var cell01 = row2.insertCell(1);
                var cell02 = row2.insertCell(2);
                var cell03 = row2.insertCell(3);

                cell00.innerHTML = "No";
                cell00.style.cssText = 'width:7%';
                cell01.innerHTML = "Name";
                cell01.style.cssText = 'width:40%';
                cell02.innerHTML = "Position";
                cell02.style.cssText = 'width:25%';
                cell03.innerHTML = "Select";
                cell03.style.cssText = 'width:23%';


                var splitSelectMember = selectMember.split(",");
                var splitAllMember = allMember.split(",");

                var se = [];
                var resCutDate = [];
                var findString;
                var selectMemberWithoutDate = [];

                jQuery.grep(splitAllMember, function (el) {
                    if (jQuery.inArray(el + "|" + changeDateFunction(trainingDate), splitSelectMember) == -1)
                        se.push(el);
                });

                var noSelect = se.toString();
                var selectmemberindex = 1;
                for (var i = 0; i < splitSelectMember.length - 1; i++) {
                    var resDetail = splitSelectMember[i].split("|");
                    if (changeDateFunction(trainingDate) == resDetail[3]) {
                        var row = selectTable.insertRow(selectmemberindex);
                        row.style.cssText = 'text-align:center;';
                        var cell0 = row.insertCell(0);
                        var cell1 = row.insertCell(1);
                        var cell2 = row.insertCell(2);
                        var cell3 = row.insertCell(3);

                        cell0.innerHTML = selectmemberindex;
                        cell1.innerHTML = resDetail[1];
                        cell2.innerHTML = resDetail[2];
                        cell3.innerHTML = "<td><input type='checkbox' name='checkList' value='" + resDetail[0] + "' checked/></td>";
                        selectmemberindex++;
                    }

                }

                var splitAllMember = noSelect.split(",");
                var availablememberindex = 1;

                for (var i = 0; i < splitAllMember.length - 1; i++) {
                    var resDetail = splitAllMember[i].split("|");
                    var row2 = availableTable.insertRow(availablememberindex);
                    row2.style.cssText = 'text-align:center;';
                    var cell00 = row2.insertCell(0);
                    var cell01 = row2.insertCell(1);
                    var cell02 = row2.insertCell(2);
                    var cell03 = row2.insertCell(3);

                    cell00.innerHTML = availablememberindex;
                    cell01.innerHTML = resDetail[1];
                    cell02.innerHTML = resDetail[2];
                    cell03.innerHTML = "<td><input type='checkbox' name='noCheckList' value='" + resDetail[0] + "'/>\n\
                              <input type='hidden' name='noCheckList' value='" + resDetail[0] + "'></td>";
                    availablememberindex++;
                }
            });
        </script>


        <script type="text/javascript">
            $('.panel-body').find('#sendEmailBtn').click(function () {
                var allMemberSendEmail = $(this).attr('data-allMemberSendEmail');
                var selectedSendEmailTable = document.getElementById("selectedSendEmailTable");
                var availableSendEmailTable = document.getElementById("availableSendEmailTable");
                while (selectedSendEmailTable.rows.length > 0) {
                    selectedSendEmailTable.deleteRow(0);
                }
                while (availableSendEmailTable.rows.length > 0) {
                    availableSendEmailTable.deleteRow(0);
                }

                var row = selectedSendEmailTable.insertRow(0);
                row.style.cssText = 'text-align:center; background-color: #337ab7;color: #ffffff;font-weight: bold;';
                var row2 = availableSendEmailTable.insertRow(0);
                row2.style.cssText = 'text-align:center; background-color: #337ab7;color: #ffffff;font-weight: bold;';
                var cell0 = row.insertCell(0);
                var cell1 = row.insertCell(1);
                var cell2 = row.insertCell(2);
                var cell3 = row.insertCell(3);

                cell0.innerHTML = "No";
                cell0.style.cssText = 'width:7%';
                cell1.innerHTML = "Name";
                cell1.style.cssText = 'width:40%';
                cell2.innerHTML = "Position";
                cell2.style.cssText = 'width:25%';
                cell3.innerHTML = "Select";
                cell3.style.cssText = 'width:23%';

                var cell00 = row2.insertCell(0);
                var cell01 = row2.insertCell(1);
                var cell02 = row2.insertCell(2);
                var cell03 = row2.insertCell(3);

                cell00.innerHTML = "No";
                cell00.style.cssText = 'width:7%';
                cell01.innerHTML = "Name";
                cell01.style.cssText = 'width:40%';
                cell02.innerHTML = "Position";
                cell02.style.cssText = 'width:25%';
                cell03.innerHTML = "Select";
                cell03.style.cssText = 'width:23%';


                var splitAllMember = allMemberSendEmail.split(",");

                var availablememberindex = 1;

                for (var i = 0; i < splitAllMember.length - 1; i++) {
                    var resDetail = splitAllMember[i].split("|");
                    var row2 = availableSendEmailTable.insertRow(availablememberindex);
                    row2.style.cssText = 'text-align:center;';
                    var cell00 = row2.insertCell(0);
                    var cell01 = row2.insertCell(1);
                    var cell02 = row2.insertCell(2);
                    var cell03 = row2.insertCell(3);

                    cell00.innerHTML = availablememberindex;
                    cell01.innerHTML = resDetail[1];
                    cell02.innerHTML = resDetail[2];
                    cell03.innerHTML = "<td><input type='checkbox' name='noCheckSendEmailList' value='" + resDetail[0] + "'/>\n\
                              <input type='hidden' name='noCheckSendEmailList' value='" + resDetail[0] + "'></td>";
                    availablememberindex++;
                }

            });

        </script>

        <script type="text/javascript">
            $('#selectedSendEmailTable').on('click', 'input[type="checkbox"]', function () {
                var indexValue = $(this).closest('tr').index();
                var realNameIndex = ('tr:eq(' + indexValue + ') td:eq(1)');
                var positionIndex = ('tr:eq(' + indexValue + ') td:eq(2)');
                var realName = $('#selectedSendEmailTable').find(realNameIndex).text();
                var position = $('#selectedSendEmailTable').find(positionIndex).text();
                var rowCount = $('#availableSendEmailTable tr').length;
                var valueId = $(this).val();
                var selectTable = document.getElementById("availableSendEmailTable");
                var row = selectTable.insertRow(rowCount);
                row.style.cssText = 'text-align:center;';
                var cell0 = row.insertCell(0);
                var cell1 = row.insertCell(1);
                var cell2 = row.insertCell(2);
                var cell3 = row.insertCell(3);

                cell0.innerHTML = rowCount;
                cell1.innerHTML = realName;
                cell2.innerHTML = position;
                cell3.innerHTML = "<td><input type='checkbox' name='noCheckSendEmailList' value='" + valueId + "'/>\n\
                                        <input type='hidden' name='noCheckSendEmailList' value='" + valueId + "'></td>";

                var availableTable = document.getElementById("selectedSendEmailTable");
                availableTable.deleteRow(indexValue);

                for (var i = 0; i < availableTable.rows.length; i++) {
                    if (i === 0) {
                        document.getElementById("selectedSendEmailTable").rows[i].cells[0].innerHTML = "No";
                    } else {
                        document.getElementById("selectedSendEmailTable").rows[i].cells[0].innerHTML = i;
                    }
                }
            });
        </script>

        <script type="text/javascript">
            $('#availableSendEmailTable').on('click', 'input[type="checkbox"]', function () {
                var indexValue = $(this).closest('tr').index();
                var realNameIndex = ('tr:eq(' + indexValue + ') td:eq(1)');
                var positionIndex = ('tr:eq(' + indexValue + ') td:eq(2)');
                var realName = $('#availableSendEmailTable').find(realNameIndex).text();
                var position = $('#availableSendEmailTable').find(positionIndex).text();
                var rowCount = $('#selectedSendEmailTable tr').length;
                var valueId = $(this).val();
                var selectTable = document.getElementById("selectedSendEmailTable");
                var row = selectTable.insertRow(rowCount);
                row.style.cssText = 'text-align:center;';
                var cell0 = row.insertCell(0);
                var cell1 = row.insertCell(1);
                var cell2 = row.insertCell(2);
                var cell3 = row.insertCell(3);
                cell0.innerHTML = rowCount;
                cell1.innerHTML = realName;
                cell2.innerHTML = position;
                cell3.innerHTML = "<td><input type='checkbox' name='checkSendEmailList' value='" + valueId + "'checked/></td>";

                var availableTable = document.getElementById("availableSendEmailTable");
                availableTable.deleteRow(indexValue);

                for (var i = 0; i < availableTable.rows.length; i++) {
                    if (i === 0) {
                        document.getElementById("availableSendEmailTable").rows[i].cells[0].innerHTML = "No";
                    } else {
                        document.getElementById("availableSendEmailTable").rows[i].cells[0].innerHTML = i;
                    }
                }
            });
        </script>

        <script>
            function changeDateFunction(date) {
                var selectMemberDate = date;
                var selectMemberDateDate = new Date(selectMemberDate);
                var selectMemberDateMonth = selectMemberDateDate.getMonth();
                var month = ["January", "February", "March", "April", "May", "June",
                    "July", "August", "September", "October", "November", "December"];
                var day = selectMemberDateDate.getDate().toString().length == 1 ? "0" + selectMemberDateDate.getDate() : selectMemberDateDate.getDate();
                var selectMemberDateChange = day + ' ' + month[selectMemberDateMonth] + ' ' + selectMemberDateDate.getFullYear();
                return selectMemberDateChange;
            }
        </script>

        <script type="text/javascript">
            $('#startDate').on('change', function (date) {
                var startDate = date.target.value;
                var today2 = new Date(startDate).toISOString().split('T')[0];
                $('#endDate').attr('min', today2);
            });
        </script>

        <script type="text/javascript">
            function confirmDelete(trainingId) {
                if (window.confirm('Are you sure you want to delete?')) {
                    document.location = '<c:url value="/"/>main/training/delete/' + trainingId;
                } else
                {
                    document.location.reload();
                }
            }
        </script>
    </body>
</html>
