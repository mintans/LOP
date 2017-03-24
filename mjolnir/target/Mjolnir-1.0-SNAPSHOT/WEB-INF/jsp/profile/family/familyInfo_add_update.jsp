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
            <title>Family ADD</title>
        </c:if>
        <c:if test="${action == 'update'}">
            <title>Family Update</title>
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
                cell1.appendChild(element1);

                var cell2 = row.insertCell(1);
                var name = document.createElement("input");
                name.type = "text";
                name.setAttribute("class", "form-control");
                name.setAttribute("required", true);
                name.name = "brethrenInfo[" + counts + "].name";
                cell2.appendChild(name);

                var cell3 = row.insertCell(2);
                var age = document.createElement("input");
                age.type = "text";
                age.setAttribute("class", "form-control");
                age.setAttribute("required", true);
                age.name = "brethrenInfo[" + counts + "].age";
                cell3.appendChild(age);

                var cell4 = row.insertCell(3);
                var occupation = document.createElement("input");
                occupation.type = "text";
                occupation.setAttribute("class", "form-control");
                occupation.setAttribute("required", true);
                occupation.name = "brethrenInfo[" + counts + "].occupation";
                cell4.appendChild(occupation);

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
                <span class="breadcrumb-item active">family-${action}</span>
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
                                <h4 class="panel-title">Family ${action}</h4>
                            </div>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <label>

                                </label>
                            </div>
                            <div class="form-horizontal col-md-12">
                                <form:form  method="POST" action="${action}" commandName="familyInfoForm">
                                    <div class="row col-md-offset-1">
                                        <label>รหัสพนักงาน : ${familyItem.id}   
                                            <c:if test="${familyItem.title == 1}">นาย</c:if>
                                            <c:if test="${familyItem.title == 2}">นาง</c:if>
                                            <c:if test="${familyItem.title == 3}">นางสาว</c:if>
                                            ${familyItem.firstName}   ${familyItem.lastName}</label>
                                    </div>
                                    <c:if test="${action == 'update'}">
                                        <div class="row">
                                            <label>
                                                <form:input class="form-control" path="id" value="" type="hidden"/>
                                            </label>
                                        </div>
                                    </c:if>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-8" align="right">
                                            <label for="FatherData" class="col-md-6"><u>Father</u></label>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-8">
                                            <label for="fatherFirstname" class="col-md-6 control-label">Firstname</label>
                                            <div class="col-md-6">
                                                <form:input class="form-control" path="fatherFirstname" required="fatherFirstname" value=""/>
                                            </div>                
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-8">
                                            <label for="fatherLastname" class="col-md-6 control-label">Lastname</label>
                                            <div class="col-md-6">
                                                <form:input class="form-control" path="fatherLastname" required="fatherLastname" value=""/>
                                            </div>                
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-8">
                                            <label for="fatherAge" class="col-md-6 control-label">Age</label>
                                            <div class="col-md-6">
                                                <form:input class="form-control" path="fatherAge" required="fatherAge" value=""/>
                                            </div>                
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-8">
                                            <label for="fatherOccupation" class="col-md-6 control-label">Occupation</label>
                                            <div class="col-md-6">
                                                <form:input class="form-control" path="fatherOccupation" required="fatherOccupation" value=""/>
                                            </div>                
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-8" align="right">
                                            <label for="MotherData" class="col-md-6"><u>Mother</u></label>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-8">
                                            <label for="motherFirstname" class="col-md-6 control-label">Firstname</label>
                                            <div class="col-md-6">
                                                <form:input class="form-control" path="motherFirstname" required="motherFirstname" value=""/>
                                            </div>                
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-8">
                                            <label for="motherLastname" class="col-md-6 control-label">Lastname</label>
                                            <div class="col-md-6">
                                                <form:input class="form-control" path="motherLastname" required="motherLastname" value=""/>
                                            </div>                
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-8">
                                            <label for="motherAge" class="col-md-6 control-label">Age</label>
                                            <div class="col-md-6">
                                                <form:input class="form-control" path="motherAge" required="motherAge" value=""/>
                                            </div>                
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-8">
                                            <label for="motherOccupation" class="col-md-6 control-label">Occupation</label>
                                            <div class="col-md-6">
                                                <form:input class="form-control" path="motherOccupation" required="motherOccupation" value=""/>
                                            </div>                
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-8" align="right">
                                            <label for="spouseData" class="col-md-6"><u>Wife/Husband</u></label>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-8">
                                            <label for="spouseFirstname" class="col-md-6 control-label">Firstname</label>
                                            <div class="col-md-6">
                                                <form:input class="form-control" path="spouseFirstname" required="spouseFirstname" value=""/>
                                            </div>                
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-8">
                                            <label for="spouseLastname" class="col-md-6 control-label">Lastname</label>
                                            <div class="col-md-6">
                                                <form:input class="form-control" path="spouseLastname" required="spouseLastname" value=""/>
                                            </div>                
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-8">
                                            <label for="spouseAge" class="col-md-6 control-label">Age</label>
                                            <div class="col-md-6">
                                                <form:input class="form-control" path="spouseAge" required="spouseAge" value=""/>
                                            </div>                
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-8">
                                            <label for="spouseOccupation" class="col-md-6 control-label">Occupation</label>
                                            <div class="col-md-6">
                                                <form:input class="form-control" path="spouseOccupation" required="spouseOccupation" value=""/>
                                            </div>                
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-8">
                                            <label for="numberChildren" class="col-md-6 control-label">No. of Children</label>
                                            <div class="col-md-6">
                                                <form:input class="form-control" path="numberChildren" required="numberChildren" value=""/>
                                            </div>                
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-8" align="right">
                                            <label for="spouseData" class="col-md-6"><u>Brethren</u></label>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-8">
                                            <label for="numberFamily" class="col-md-6 control-label">Number of Members</label>
                                            <div class="col-md-6">
                                                <form:input class="form-control" path="numberFamily" required="numberFamily" value=""/>
                                            </div>                
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-2">
                                        <div class="form-group col-md-5">
                                            <label for="numberBrother" class="col-md-8 control-label">Male</label>
                                            <div class="col-md-4">
                                                <form:input class="form-control" path="numberBrother" required="numberBrother" value=""/>
                                            </div>                
                                        </div>
                                        <div class="form-group col-md-5">
                                            <label for="numberSister" class="col-md-3 control-label">Female</label>
                                            <div class="col-md-4">
                                                <form:input class="form-control" path="numberSister" required="numberSister" value=""/>
                                            </div>                
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-2">
                                        <div class="form-group col-md-5">
                                            <label for="noFamily" class="col-md-8 control-label">Birth Order</label>
                                            <div class="col-md-4">
                                                <form:input class="form-control" path="noFamily" required="noFamily" value=""/>
                                            </div>                
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-2">
                                        <div class="form-group col-md-9">
                                            <c:forEach var="workexperienceItem" items="${workList}">
                                                <c:if test="${id == workexperienceItem.id}">
                                                    <table class="table table-bordered" id="addressesTable">
                                                        <thead>
                                                            <tr class="bg-primary">
                                                                <Th><div align="center">Action</div></Th>
                                                                <th><div align="center">Firstname-Lastname</div></th>
                                                                <th><div align="center">Age</div></th>
                                                                <th><div align="center">Occupation</div></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>  
                                                            <c:forEach var="workinginfoItem2" items="${workexperienceItem.familyinfo.brethrenInfo}"
                                                                       varStatus="counter">
                                                                <c:if test="${workinginfoItem2.name != null}">
                                                                    <tr>
                                                                        <td align="center"><input type="checkbox" name="chk"/></td>
                                                                        <td><input type="text" class="form-control" name="brethrenInfo[${counter.index}].name" value="${workinginfoItem2.name}" required="true"/></td>
                                                                        <td><input type="text" class="form-control" name="brethrenInfo[${counter.index}].age" value="${workinginfoItem2.age}" required="true"/></td>
                                                                        <td><input type="text" class="form-control" name="brethrenInfo[${counter.index}].occupation" value="${workinginfoItem2.occupation}" required="true"/></td>
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
                                    <c:if test="${action == 'save'}">
                                        <div class="row">
                                            <label>
                                                <form:input class="form-control" path="profileId" value="${familyItem.id}" type="hidden"/>
                                            </label>
                                        </div>
                                    </c:if>
                                    <c:if test="${action == 'update'}">
                                        <div class="row">
                                            <label>
                                                <form:input class="form-control" path="profileId" value="" type="hidden"/>
                                            </label>
                                        </div>
                                    </c:if>
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
