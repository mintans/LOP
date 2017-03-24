<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous"/>
        <script src=https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
        <script src="<c:url value="/"/>js/app.js"></script>
        <script src="<c:url value="/"/>js/benefits/benefits.js"></script>
        <script src="<c:url value="/"/>js/user/department.js"></script>        
        <title>Benefits</title>
    </head>
    <body>
        <div class="container-fluid">            
            <div class="row">
                <%@ include file="/WEB-INF/jsp/header.jsp" %>               
            </div>

            <nav class="breadcrumb">
                <span class="breadcrumb-item active">Benefits</span>
            </nav>

            <div class="container" style="width: 80%">
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h4 class="panel-title">Company Benefits</h4>
                            </div>
                            <c:set var="arrayBenefitId" value="" scope="page" />
                            <c:forEach var="benefitsListItem5" items="${benefitsList}">
                                <c:set var="arrayBenefitId" value="${arrayBenefitId}${benefitsListItem5.id}," scope="page" />
                            </c:forEach>

                            <c:set var="arrayEmploymentId" value="" scope="page" />
                            <c:forEach var="employmentTypeItem5" items="${employmentTypeList}">
                                <c:set var="arrayEmploymentId" value="${arrayEmploymentId}${employmentTypeItem5.id}," scope="page" />
                            </c:forEach>

                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-9">
                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" data-idnew="${arrayBenefitId}">Add Benefits</button>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="input-group">
                                            <input type="text" class="form-control" placeholder="Search" id="benefitsInput"onkeyup="BenefitsSearchFunction()">
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-search"></span>
                                            </span>
                                        </div> 
                                    </div>

                                    <!-- Modal -->
                                    <div class="modal fade" id="myModal" role="dialog" data-keyboard="false" data-backdrop="static">
                                        <div class="modal-dialog">

                                            <!-- Modal content-->
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                    <h4 class="modal-title">Add New Benefits</h4>
                                                </div>
                                                <div class="modal-body" >
                                                    <form class="form-horizontal" method="post" action="benefits/addBenefits">
                                                        <div class="form-group">
                                                            <label class="col-md-4 control-label" align = "right">Benefits :</label>
                                                            <div class="col-md-6">
                                                                <input type="text" class="form-control input-md" name ="BenefitsName" id ="benefitsName" placeholder="Benefits Name?" required="true">
                                                                <input type="hidden" name ="id" id ="id">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="message-text" class="col-md-4 control-label" align = "right">Description :</label>
                                                            <div class="col-md-6">
                                                                <textarea style="overflow:auto;resize:none" rows="5" cols="5" class="form-control" name ="description"  id ="description" placeholder="What about this department?" required="true"></textarea>
                                                            </div>
                                                        </div>

                                                        <div class="modal-footer">
                                                            <button type="submit" class="btn btn-primary">Add</button>
                                                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                                <br>
                                <div style="display: block; height: 250px; overflow-y: scroll;">
                                    <table class="table table-bordered" id="benefitsTable">
                                        <c:set var="count" value="0" scope="page" />
                                        <thead>
                                            <tr class="bg-primary">
                                                <th style="width: 5%"><div align="center">No.</div></th> 
                                                <th style="width: 20%"><div align="center">Benefits</div></th>
                                                <th style="width: 55%"><div align="center">Description</div></th>
                                                <th style="width: 20%"><div align="center">Option</div></th>

                                            </tr>
                                        </thead>
                                        <tbody>                                        
                                            <c:forEach var="benefitsItem" items="${benefitsList}">
                                                <c:set var="count" value="${count + 1}" scope="page"/>
                                                <tr>                                                
                                                    <td align="center"><c:out value = "${count}"></c:out></td>
                                                    <td align="center">${benefitsItem.benefitsName}</td>
                                                    <td>${benefitsItem.description}</td>                                                                                             
                                                    <td align="center">
                                                        <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#myModal" data-id="${benefitsItem.id}" data-benefitsname="${benefitsItem.benefitsName}" data-description="${benefitsItem.description}">Edit </button>
                                                        <a href="<c:url value="/"/>main/benefits/delete/${benefitsItem.id}" class="btn btn-danger" > Delete</a>
                                                    </td>
                                                </tr>
                                            </c:forEach>                                    
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h4 class="panel-title">Employment Type</h4>
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-9">
                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal2" data-idnew="${arrayEmploymentId}">Add Employment Type</button>
                                    </div>
                                    <div class="col-md-3">
                                    </div>
                                    <!-- Modal -->
                                    <div class="modal fade" id="myModal2" role="dialog" data-keyboard="false" data-backdrop="static">
                                        <div class="modal-dialog modal-md">

                                            <!-- Modal content-->
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                    <h4 class="modal-title">Add New Employment Type</h4>
                                                </div>
                                                <div class="modal-body">
                                                    <form class="form-horizontal" method="post" action="benefits/addEmploymentType">
                                                        <div class="form-group">
                                                            <label class="col-md-4 control-label" align = "right">Employment Type :</label>
                                                            <div class="col-md-6">
                                                                <input type="text" class="form-control input-md"  id="employ" name ="employmentTypeName" required="true">
                                                                <input type="hidden" name ="id" id ="id2">
                                                            </div>
                                                        </div>   
                                                        <div class="form-group">
                                                            <label class="col-md-4 control-label" align = "right">Type :</label>
                                                            <div class="col-md-6">
                                                                <label class="radio-inline">
                                                                    <input type="radio" name="typeName" id="radioPermanent" value="permanent" checked>Permanent</label>
                                                                <label class="radio-inline">
                                                                    <input type="radio" name="typeName" id="radioDuration" value="duration">Duration</label>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="submit" class="btn btn-primary">Add</button>
                                                            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="javascript:window.location.reload()" >Cancel</button>
                                                        </div>
                                                    </form>
                                                </div>                                                
                                            </div>
                                        </div>
                                    </div>

                                </div>

                                <br>
                                <center>
                                    <div style="display: block; height: 240px; overflow-y: scroll;">
                                        <table class="table table-bordered" id="employmentTypeTable">  
                                            <c:set var="count2" value="0" scope="page" />
                                            <thead>
                                                <tr class="bg-primary">
                                                    <th style="width: 5%"><div align="center">No.</div></th>
                                                    <th style="width: 50%"><div align="center">Employment Type</div></th>  
                                                    <th style="width: 22%"><div align="center">Type</div></th>  
                                                    <th style="width: 40%"><div align="center">Option</div></th>
                                                </tr>
                                            </thead>
                                            <tbody> 
                                                <c:forEach var="employmentTypeItem" items="${employmentTypeList}">
                                                    <c:set var="count2" value="${count2 + 1}" scope="page"/>                                            
                                                    <tr>                                                
                                                        <td align="center"><c:out value = "${count2}"></c:out></td>
                                                        <td align="center">${employmentTypeItem.employmentTypeName}</td>   
                                                        <td align="center">${employmentTypeItem.typeName}</td>
                                                        <td align="center">
                                                            <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#myModal2" data-id2="${employmentTypeItem.id}" data-employ="${employmentTypeItem.employmentTypeName}" data-type="${employmentTypeItem.typeName}"> Edit</button>
                                                            <button onclick="show('${employmentTypeItem.id}'),highlight_row(this)" class="btn btn-success">Show </button>                                                      
                                                            <a href="<c:url value="/"/>main/benefits/deleteEmploymentType/${employmentTypeItem.id}" class="btn btn-danger" > Delete</a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>                                    
                                            </tbody>
                                        </table>
                                    </div>
                                </center>                 
                            </div>
                        </div>

                        <!--Panel hidden Detail-->
                        <c:forEach var="employmentTypeItem2" items="${employmentTypeList}">                                    
                            <div class="panel panel-primary" id="${employmentTypeItem2.id}" style="display: none">                                             
                                <div class="panel-heading">
                                    <h4 class="panel-title"> Benefits : ${employmentTypeItem2.employmentTypeName}</h4>
                                </div>
                                <c:set var="arrayselectBenefit" value="" scope="page" />
                                <c:set var="arrayAllBenefit" value="" scope="page" />                                
                                <c:set var="countbenefits" value="${fn:length(employmentTypeItem2.benefits)}" scope="page"/>

                                <c:forEach var="benefitsListItem6" items="${benefitsList}">
                                    <c:set var="arrayAllBenefit" value="${arrayAllBenefit}${benefitsListItem6.id}|${benefitsListItem6.benefitsName}," scope="page" />
                                </c:forEach>                                

                                <c:if test="${employmentTypeItem2.benefits != null}">
                                    <c:forEach var="benefitsListItem7" items="${benefitsList}">
                                        <c:forEach var="i" begin="0" end="${countbenefits-1}">

                                            <c:if test="${employmentTypeItem2.benefits[i] == benefitsListItem7.id}">
                                                <c:set var="arrayselectBenefit" value="${arrayselectBenefit}${benefitsListItem7.id}|${benefitsListItem7.benefitsName}," scope="page"/>
                                            </c:if>

                                        </c:forEach>
                                    </c:forEach>
                                </c:if>  
                                <div class="panel-body">                                            
                                    <div class="row">
                                        <div class="col-md-12" align = "right">                                                    
                                            <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#myModal3"  data-employment="${employmentTypeItem2.employmentTypeName}" data-benefits="${arrayselectBenefit}" data-allbenefits="${arrayAllBenefit}">Edit</button>
                                        </div>
                                    </div>
                                    <br>
                                    <table class="table table-bordered" id="nameTable">
                                        <c:set var="count5" value="0" scope="page"/>  
                                        <thead>
                                            <tr class="bg-primary">
                                                <th><div align="center">No.</div></th>
                                                <th><div align="center">Benefits</div></th>
                                                <th><div align="center">Description</div></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:if test="${employmentTypeItem2.benefits != null}">
                                                <c:forEach var="benefitsListItem7" items="${benefitsList}">
                                                    <c:forEach var="j" begin="0" end="${countbenefits-1}">
                                                        <c:if test="${employmentTypeItem2.benefits[j] == benefitsListItem7.id}"> 
                                                            <c:set var="count5" value="${count5 + 1}" scope="page"/>  
                                                            <tr>                                                
                                                                <td align="center" style="width: 5%">${count5}</td>
                                                                <td align="center" style="width: 30%">${benefitsListItem7.benefitsName}</td>                                                                                                                                             
                                                                <td style="width: 65%">${benefitsListItem7.description}</td>  
                                                            </tr>
                                                        </c:if>
                                                    </c:forEach>
                                                </c:forEach>
                                            </c:if>
                                        </tbody>
                                    </table>
                                </div>                                                        
                            </div>
                        </c:forEach> 

                        <!-- Modal Employment Type-->
                        <div class="modal fade" id="myModal3" role="dialog" data-keyboard="false" data-backdrop="static" aria-hidden="true">
                            <div class="modal-dialog modal-lg">
                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Edit Benefits</h4>
                                    </div>
                                    <div class="modal-body">  
                                        <form method="post" action="benefits/changeEmployment">
                                            <div class="form-horizontal">
                                                <div class="form-group">
                                                    <label for="name" class="col-md-2 control-label" align = "right">จัดการสวัสดิการ:</label>
                                                    <div class="col-md-4">                                                                
                                                        <input type="text" class="form-control input-md" name="employmentTypeName" id="employment" readonly="true">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="row">
                                                    <div class="col-md-9">
                                                        <label for="name" class="control-label">Selected Benefits :</label> 
                                                    </div>
                                                    <div class="col-md-3">
                                                        <div class="input-group">
                                                            <input type="text" class="form-control" placeholder="Search"  id="select"onkeyup="selectSearchFunction()">
                                                            <span class="input-group-addon">
                                                                <span class="glyphicon glyphicon-search"></span>
                                                            </span>
                                                        </div>
                                                        <br>
                                                    </div>
                                                </div>
                                                <table class="table table-bordered" cellspacing="0" id="selectedTable" >                             
                                                </table>
                                            </div>
                                            <div class="form-group">
                                                <div class="row">
                                                    <div class="col-md-9">
                                                        <label for="name" class="control-label">All Benefits :</label>
                                                    </div>

                                                    <div class="col-md-3">
                                                        <div class="input-group">
                                                            <input type="text" class="form-control" placeholder="Search"  id="noselect"onkeyup="allSearchFunction()">
                                                            <span class="input-group-addon">
                                                                <span class="glyphicon glyphicon-search"></span>
                                                            </span>
                                                        </div> 
                                                        <br>
                                                    </div>
                                                </div>

                                                <table class="table table-bordered" cellspacing="0" id="availableTable">  
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
                </div>
            </div>
        </div>

        <script type="text/javascript">
            $('#selectedTable').on('click', 'input[type="checkbox"]', function () {
                var indexValue = $(this).closest('tr').index();
                var realNameIndex = ('tr:eq(' + indexValue + ') td:eq(1)');
                var realName = $('#selectedTable').find(realNameIndex).text();
                var rowCount = $('#availableTable tr').length;
                var valueId = $(this).val();
                var selectTable = document.getElementById("availableTable");
                var row = selectTable.insertRow(rowCount);
                row.style.cssText = 'text-align:center;';
                var cell0 = row.insertCell(0);
                var cell1 = row.insertCell(1);
                var cell2 = row.insertCell(2);

                cell0.innerHTML = rowCount;
                cell1.innerHTML = realName;
                cell2.innerHTML = "<td><input type='checkbox' name='noCheckList' value='" + valueId + "'/>\n\
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
                var realName = $('#availableTable').find(realNameIndex).text();
                var rowCount = $('#selectedTable tr').length;
                var valueId = $(this).val();
                var selectTable = document.getElementById("selectedTable");
                var row = selectTable.insertRow(rowCount);
                row.style.cssText = 'text-align:center;';
                var cell0 = row.insertCell(0);
                var cell1 = row.insertCell(1);
                var cell2 = row.insertCell(2);
                cell0.innerHTML = rowCount;
                cell1.innerHTML = realName;
                cell2.innerHTML = "<td><input type='checkbox' name='checkList' value='" + valueId + "'checked/></td>";

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
            $('#myModal3').on('show.bs.modal', function (modelbutton) {
                var button = $(modelbutton.relatedTarget);
                var employment = button.data('employment');
                var benefits = button.data('benefits');
                var allbenefits = button.data('allbenefits');
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

                cell0.innerHTML = "No";
                cell0.style.cssText = 'width:7%';
                cell1.innerHTML = "Benefits";
                cell1.style.cssText = 'width:55%';
                cell2.innerHTML = "Select";
                cell2.style.cssText = 'width:23%';

                var cell00 = row2.insertCell(0);
                var cell01 = row2.insertCell(1);
                var cell02 = row2.insertCell(2);

                cell00.innerHTML = "No";
                cell00.style.cssText = 'width:7%';
                cell01.innerHTML = "Benefits";
                cell01.style.cssText = 'width:55%';
                cell02.innerHTML = "Select";
                cell02.style.cssText = 'width:23%';

                var res = benefits.split(",");
                var res2 = allbenefits.split(",");

                var se = [];
                jQuery.grep(res2, function (el) {
                    if (jQuery.inArray(el, res) == -1)
                        se.push(el);
                });

                var noSelect = se.toString();

                var selectmemberindex = 1;
                for (var i = 0; i < res.length - 1; i++) {
                    var resDetail = res[i].split("|");

                    var row = selectTable.insertRow(selectmemberindex);
                    row.style.cssText = 'text-align:center;';
                    var cell0 = row.insertCell(0);
                    var cell1 = row.insertCell(1);
                    var cell2 = row.insertCell(2);

                    cell0.innerHTML = selectmemberindex;
                    cell1.innerHTML = resDetail[1];
                    cell2.innerHTML = "<td><input type='checkbox' name='checkList' value='" + resDetail[0] + "' checked/></td>";
                    selectmemberindex++;
                }

                var res2 = noSelect.split(",");
                var availablememberindex = 1;

                for (var i = 0; i < res2.length; i++) {
                    var resDetail = res2[i].split("|");
                    var row2 = availableTable.insertRow(availablememberindex);
                    row2.style.cssText = 'text-align:center;';
                    var cell00 = row2.insertCell(0);
                    var cell01 = row2.insertCell(1);
                    var cell02 = row2.insertCell(2);

                    cell00.innerHTML = availablememberindex;
                    cell01.innerHTML = resDetail[1];
                    cell02.innerHTML = "<td><input type='checkbox' name='noCheckList' value='" + resDetail[0] + "'/>\n\
                              <input type='hidden' name='noCheckList' value='" + resDetail[0] + "'></td>";
                    availablememberindex++;
                }
                document.getElementById("employment").value = employment;
            });
        </script>               


        <script type="text/javascript">
            $('#myModal').on('show.bs.modal', function (modelbutton) {
                var button = $(modelbutton.relatedTarget);
                var id = button.data('id');
                var idnew = button.data('idnew');
                var benefitsname = button.data('benefitsname');
                var description2 = button.data('description');

                if (benefitsname == null && description2 == null) {
                    if (idnew == "") {
                        id = "B001";
                        benefitsname = null;
                        description2 = null;
                    } else {
                        var res = idnew.split(",");
                        for (var i = 0; i < res.length - 1; i++) {
                            var idfinal = res[i];
                        }

                        var num = idfinal.substring(2);
                        var numid = parseInt(num) + 1;
                        var uid;
                        if (numid < 10) {
                            uid = "B00" + numid;
                        } else if (numid < 100) {
                            uid = "B0" + numid;
                        } else {
                            uid = "B" + numid;
                        }

                        id = uid;
                        benefitsname = null;
                        description2 = null;
                    }
                } else {
                    $(".modal-title").html("Edit Benefits");
                    $(".modal-footer").find('.btn-primary').html("Save");
                    $(".modal-footer").find('.btn-primary').attr('class', 'btn btn-success');
                }
                document.getElementById("id").value = id;
                document.getElementById("benefitsName").value = benefitsname;
                document.getElementById("description").value = description2;
            });
        </script>

        <script type="text/javascript">
            $('#myModal2').on('show.bs.modal', function (modelbutton) {
                var button = $(modelbutton.relatedTarget);
                var id = button.data('id2');
                var idnew = button.data('idnew');
                var employ = button.data('employ');
                var type = button.data('type');

                if (employ == null && id == null) {
                    if (idnew == "") {
                        id = "E001";
                        employ = null;
                    } else {
                        var res = idnew.split(",");
                        for (var i = 0; i < res.length - 1; i++) {
                            var idfinal = res[i];
                        }
                        var num = idfinal.substring(2);
                        var numid = parseInt(num) + 1;
                        var uid;
                        if (numid < 10) {
                            uid = "E00" + numid;
                        } else if (numid < 100) {
                            uid = "E0" + numid;
                        } else {
                            uid = "E" + numid;
                        }
                        id = uid;
                        employ = null;
                    }
                } else {
                    $(".modal-title").html("Edit Employment Type");
                    $(".modal-footer").find('.btn-primary').html("Save");
                    $(".modal-footer").find('.btn-primary').attr('class', 'btn btn-success');
                }
                document.getElementById("id2").value = id;
                document.getElementById("employ").value = employ;
//                document.getElementById("type").value = type;
                if (type == 'permanent') {
                    $("#radioPermanent").attr('checked', 'checked');
                } else if (type == 'duration') {
                    $("#radioDuration").attr('checked', 'checked');
                }


            });
        </script>
        <script type="text/javascript">
            window.onload = highlight_row('employmentTypeTable');
        </script>

    </body>
</html>
