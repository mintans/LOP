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
        <script src="<c:url value="/"/>view/template/js/bootstrap.min.js" ></script>
        <script src="<c:url value="/"/>js/app.js"></script>
        <c:if test="${action == 'save'}">
            <title>Education ADD</title>
        </c:if>
        <c:if test="${action == 'update'}">
            <title>Education Update</title>
        </c:if>
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
                element1.required;
                cell1.appendChild(element1);

                var cell2 = row.insertCell(1);
                var educationLevel = document.createElement("select");
                var option = document.createElement("option");
                option.value = "";
                option.text = "Please Select";
                var option1 = document.createElement("option");
                option1.value = "High school";
                option1.text = "High school";
                var option2 = document.createElement("option");
                option2.value = "Vocational";
                option2.text = "Vocational";
                var option3 = document.createElement("option");
                option3.value = "Diploma";
                option3.text = "Diploma";
                var option4 = document.createElement("option");
                option4.value = "Bachelor degree";
                option4.text = "Bachelor degree";
                var option5 = document.createElement("option");
                option5.value = "Post-Graduate";
                option5.text = "Post-Graduate";
                var option6 = document.createElement("option");
                option6.value = "Others";
                option6.text = "Others";
                educationLevel.add(option);
                educationLevel.add(option1);
                educationLevel.add(option2);
                educationLevel.add(option3);
                educationLevel.add(option4);
                educationLevel.add(option5);
                educationLevel.add(option6);
                educationLevel.setAttribute("class", "form-control");
                educationLevel.setAttribute("required", true);
                educationLevel.name = "educationInfo[" + counts + "].educationLevel";
                educationLevel.required;
                cell2.appendChild(educationLevel);

                var cell3 = row.insertCell(2);
                var institution = document.createElement("input");
                institution.type = "text";
                institution.setAttribute("class", "form-control");
                institution.setAttribute("required", true);
                institution.name = "educationInfo[" + counts + "].institution";
                cell3.appendChild(institution);

                var cell4 = row.insertCell(3);
                var major = document.createElement("input");
                major.type = "text";
                major.setAttribute("class", "form-control");
                major.setAttribute("required", true);
                major.name = "educationInfo[" + counts + "].major";
                major.required;
                cell4.appendChild(major);

                var cell5 = row.insertCell(4);
                var from = document.createElement("input");
                from.type = "text";
                from.setAttribute("class", "form-control");
                from.setAttribute("required", true);
                from.name = "educationInfo[" + counts + "].from";
                from.required;
                cell5.appendChild(from);

                var cell6 = row.insertCell(5);
                var to = document.createElement("input");
                to.type = "text";
                to.setAttribute("class", "form-control");
                to.setAttribute("required", true);
                to.name = "educationInfo[" + counts + "].to";
                to.required;
                cell6.appendChild(to);

                var cell7 = row.insertCell(6);
                var gpa = document.createElement("input");
                gpa.type = "text";
                gpa.setAttribute("class", "form-control");
                gpa.setAttribute("required", true);
                gpa.name = "educationInfo[" + counts + "].gpa";
                gpa.required;
                cell7.appendChild(gpa);

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
                <span class="breadcrumb-item active">education-${action}</span>
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
                                <h4 class="panel-title">Education ${action}</h4>
                            </div>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <label>

                                </label>
                            </div>
                            <div class="form-horizontal col-md-12">
                                <form:form  method="POST" action="${action}" commandName="educationForm">
                                    <div class="row col-md-offset-1">
                                        <label>รหัสพนักงาน : ${educationItem.id}   
                                            <c:if test="${educationItem.title == 1}">นาย</c:if>
                                            <c:if test="${educationItem.title == 2}">นาง</c:if>
                                            <c:if test="${educationItem.title == 3}">นางสาว</c:if>
                                            ${educationItem.firstName}   ${educationItem.lastName}</label>
                                    </div>
                                    <c:if test="${action == 'save'}">
                                        <div class="row">
                                            <label>
                                                <form:input class="form-control" path="profileId" value="${educationItem.id}" type="hidden"/>
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
                                            <c:forEach var="profileItem" items="${profileList}">
                                                <c:if test="${id == profileItem.id}">
                                                    <table class="table table-bordered" id="addressesTable">
                                                        <thead>
                                                            <tr class="bg-primary">
                                                                <Th style="width: 10%"><div align="center">Action</div></Th>
                                                                <th style="width: 20%"><div align="center">Education level</div></th>
                                                                <th style="width: 20%"><div align="center">Institution</div></th>
                                                                <th style="width: 20%"><div align="center">Major</div></th>
                                                                <th style="width: 10%"><div align="center">From</div></th>
                                                                <th style="width: 10%"><div align="center">To</div></th>
                                                                <th style="width: 10%"><div align="center">GPA.</div></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>  
                                                            <c:forEach var="educationList2" items="${educationItem.education.educationInfo}"
                                                                       varStatus="counter">
                                                                <c:if test="${educationList2.institution != null}">
                                                                    <tr>
                                                                        <td align="center"><input type="checkbox" name="chk"/></td>
                                                                        <td><form:select class="form-control" name="educationInfo[${counter.index}].educationLevel" path="educationInfo[${counter.index}].educationLevel" required="true">
                                                                                <form:option value="" label="Please Select"/>
                                                                                <form:option value="High school" label="High school"/>
                                                                                <form:option value="Vocational" label="Vocational"/>
                                                                                <form:option value="Diploma" label="Diploma"/>
                                                                                <form:option value="Bachelor degree" label="Bachelor degree"/>
                                                                                <form:option value="Post-Graduate" label="Post-Graduate"/>
                                                                                <form:option value="Others" label="Others"/>
                                                                            </form:select></td>
                                                                        <td><input type="text" class="form-control" name="educationInfo[${counter.index}].institution" value="${educationList2.institution}" required="true"/></td>
                                                                        <td><input type="text" class="form-control" name="educationInfo[${counter.index}].major" value="${educationList2.major}" required="true"/></td>
                                                                        <td><input type="text" class="form-control" name="educationInfo[${counter.index}].from" value="${educationList2.from}" required="true"/></td>
                                                                        <td><input type="text" class="form-control" name="educationInfo[${counter.index}].to" value="${educationList2.to}" required="true"/></td>
                                                                        <td><input type="text" class="form-control" name="educationInfo[${counter.index}].gpa" value="${educationList2.gpa}" required="true"/></td>
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
    </div>
</body>
</html>
