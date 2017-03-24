<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="<c:url value="/"/>view/template/css/bootstrap.min.css" />
        <link rel="stylesheet" href="<c:url value="/"/>view/template/css/bootstrap-theme.min.css" />
        <script src=https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js></script>
        <script src="<c:url value="/"/>view/template/js/bootstrap.min.js" ></script>

        <c:if test="${action == 'save'}">
            <title>WorkExperience ADD</title></c:if>
        <c:if test="${action == 'update'}">
            <title>WorkExperience Update</title></c:if>

            <SCRIPT lang="javascript">
                function addRow(tableID)
                {
                    var table = document.getElementById(tableID);

                    var rowCount = table.rows.length;
                    var row = table.insertRow(rowCount);
                    var counts = rowCount - 1;


                    var cell1 = row.insertCell(0);
                    var element1 = document.createElement("input");
                    element1.type = "checkbox";
                    element1.name = "chkbox[]";
                    cell1.setAttribute("align", "center");
                    cell1.appendChild(element1);

                    var cell2 = row.insertCell(1);
                    var company = document.createElement("input");
                    company.type = "text";
                    company.setAttribute("class", "form-control");
                    company.setAttribute("required", true);
                    company.name = "workingInfo[" + counts + "].company";
                    cell2.appendChild(company);

                    var cell3 = row.insertCell(2);
                    var from = document.createElement("input");
                    from.type = "text";
                    from.setAttribute("class", "form-control");
                    from.setAttribute("required", true);
                    from.name = "workingInfo[" + counts + "].from";
                    cell3.appendChild(from);

                    var cell4 = row.insertCell(3);
                    var to = document.createElement("input");
                    to.type = "text";
                    to.setAttribute("class", "form-control");
                    to.setAttribute("required", true);
                    to.name = "workingInfo[" + counts + "].to";
                    cell4.appendChild(to);

                    var cell5 = row.insertCell(4);
                    var position = document.createElement("input");
                    position.type = "text";
                    position.setAttribute("class", "form-control");
                    position.setAttribute("required", true);
                    position.name = "workingInfo[" + counts + "].position";
                    cell5.appendChild(position);

                    var cell6 = row.insertCell(5);
                    var jobDescription = document.createElement("input");
                    jobDescription.type = "text";
                    jobDescription.setAttribute("class", "form-control");
                    jobDescription.setAttribute("required", true);
                    jobDescription.name = "workingInfo[" + counts + "].jobDescription";
                    cell6.appendChild(jobDescription);

                    var cell7 = row.insertCell(6);
                    var salary = document.createElement("input");
                    salary.type = "text";
                    salary.setAttribute("class", "form-control");
                    salary.setAttribute("required", true);
                    salary.name = "workingInfo[" + counts + "].salary";
                    cell7.appendChild(salary);

                    var cell8 = row.insertCell(7);
                    var reasonsResignation = document.createElement("input");
                    reasonsResignation.type = "text";
                    reasonsResignation.setAttribute("class", "form-control");
                    reasonsResignation.setAttribute("required", true);
                    reasonsResignation.name = "workingInfo[" + counts + "].reasonsResignation";
                    cell8.appendChild(reasonsResignation);


                }
                function deleteRow(tableID) {
                    try {
                        var table = document.getElementById(tableID);
                        var rowCount = table.rows.length;

                        for (var i = 0; i < rowCount; i++) {
                            var row = table.rows[i];
                            var chkbox = row.cells[0].childNodes[0];
                            if (null != chkbox && true == chkbox.checked) {
                                table.deleteRow(i);
                                rowCount--;
                                i--;
                            }
                        }
                    } catch (e) {
                        alert(e);
                    }
                }
            </SCRIPT>
            <style>
                input.normal {
                    margin-top: -50px
                }
            </style>
        </head>
        <body>
            <div class="container-fluid">
                <div class="row">
                <%@ include file="/WEB-INF/jsp/header.jsp" %>  
            </div>

            <nav class="breadcrumb">
                <a class="breadcrumb-item" href="<c:url value="/main/profile"/>">Profile</a> / 
                <c:if test="${action == 'update'}">
                    <a class="breadcrumb-item" href="<c:url value="/"/>main/profile/viewTH/${id}"/>${id}</a> / 
                </c:if>
                <span class="breadcrumb-item active">work-experience-${action}</span>
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
                            <div class="col-md-12" align="left" style="margin-top: 5px;margin-bottom: 7px">
                                <h4 class="panel-title">Work-Experience ${action}</h4>
                            </div>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <label>

                                </label>
                            </div>
                            <div class="form-horizontal col-md-12">                        
                                <form:form  method="POST" action="${action}" commandName="workexperienceForm">
                                    <div class="row col-md-offset-1">
                                        <label>รหัสพนักงาน : ${workExperienceItem.id}   
                                            <c:if test="${workExperienceItem.title == 1}">นาย</c:if>
                                            <c:if test="${workExperienceItem.title == 2}">นาง</c:if>
                                            <c:if test="${workExperienceItem.title == 3}">นางสาว</c:if>
                                            ${workExperienceItem.firstName}   ${workExperienceItem.lastName}</label>
                                    </div>
                                    <c:if test="${action == 'save'}">
                                        <div class="row">
                                            <label>
                                                <form:input class="form-control" path="profileId" value="${workExperienceItem.id}" type="hidden"/>
                                            </label>
                                        </div>
                                    </c:if>
                                    <c:if test="${action == 'update'}">
                                        <div class="row">
                                            <label>
                                                <form:input class="form-control" path="id" value="" type="hidden"/>
                                            </label>
                                        </div>
                                        <div class="row">
                                            <label>
                                                <form:input class="form-control" path="profileId" value="" type="hidden"/>
                                            </label>
                                        </div>
                                    </c:if>
                                    <div class="row">
                                        <div class="form-group col-md-12">
                                            <c:forEach var="profileItem" items="${workList}">
                                                <c:if test="${id == profileItem.id}">
                                                    <table class="table table-bordered" id="addressesTable">
                                                        <thead>
                                                            <tr class="bg-primary">
                                                                <Th><div align="center">Action</div></Th>
                                                                <th><div align="center">Company</div></th>
                                                                <th style="width: 10%"><div align="center">From</div></th>
                                                                <th style="width: 10%"><div align="center">To</div></th>
                                                                <th><div align="center">Position</div></th>
                                                                <th><div align="center">Job description</div></th>
                                                                <th style="width: 10%"><div align="center">Salary</div></th>
                                                                <th><div align="center">Reasons of resignation</div></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>  
                                                            <c:forEach var="workinginfoItem2" items="${workExperienceItem.workExperiences.workingInfo}"
                                                                       varStatus="counter">
                                                                <c:if test="${workinginfoItem2.company != null}">
                                                                    <tr>
                                                                        <td align="center"><input type="checkbox" name="chk"/></td>
                                                                        <td><input type="text" class="form-control" name="workingInfo[${counter.index}].company" value="${workinginfoItem2.company}" required="true"/></td>
                                                                        <td><input type="text" class="form-control" name="workingInfo[${counter.index}].from" value="${workinginfoItem2.from}" required="true"/></td>
                                                                        <td><input type="text" class="form-control" name="workingInfo[${counter.index}].to" value="${workinginfoItem2.to}" required="true"/></td>
                                                                        <td><input type="text" class="form-control" name="workingInfo[${counter.index}].position" value="${workinginfoItem2.position}" required="true"/></td>
                                                                        <td><input type="text" class="form-control" name="workingInfo[${counter.index}].jobDescription" value="${workinginfoItem2.jobDescription}" required="true"/></td>
                                                                        <td><input type="text" class="form-control" name="workingInfo[${counter.index}].salary" value="${workinginfoItem2.salary}" required="true"/></td>
                                                                        <td><input type="text" class="form-control" name="workingInfo[${counter.index}].reasonsResignation" value="${workinginfoItem2.reasonsResignation}" required="true"/></td>
                                                                    </tr>
                                                                </c:if>
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>
                                                </c:if>
                                            </c:forEach>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-3 col-md-5" align="center">
                                        <input type="button" class="btn btn-warning btn-xs normal" value="Add" onclick="addRow('addressesTable')" /> 
                                        <input type="button" class="btn btn-danger btn-xs normal" value="Delete" onclick="deleteRow('addressesTable')" />
                                    </div>
                                    <br><br>
                                    <div class="row col-md-offset-1">
                                        <label class="col-md-4"></label>
                                        <div class="col-md-6">
                                            <input type="submit" value="Save" class="btn btn-success">
                                            <input type="reset" value="Cancel" class="btn btn-group btn-danger">
                                        </div>
                                    </div>
                                </form:form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="<c:url value="/"/>js/app.js"></script>
    </body>
</html>
