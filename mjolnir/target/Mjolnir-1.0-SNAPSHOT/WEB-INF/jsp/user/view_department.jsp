<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous"/>
        <script src=https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
        <script src="<c:url value="/"/>js/user/department.js"></script>        
        <title>Departments</title>
    </head>
    <body>

        <div class="container-fluid">            
            <div class="row">
                <%@ include file="/WEB-INF/jsp/header.jsp" %>               
            </div>

            <nav class="breadcrumb">
                <a class="breadcrumb-item" href="<c:url value="/"/>main/user">User</a> / 
                <span class="breadcrumb-item active">Departments</span>
            </nav>

            <div class="container" style="width: 100%">
                <div class="row">
                    <div class="col-md-2">
                        <div class="panel panel-default"> 
                            <div class="panel-body">
                                <ul class="nav nav-pills nav-stacked">
                                    <li role="presentation" ><a href="<c:url value="/"/>main/user">User</a></li>
                                    <li role="presentation" class="active"><a href="<c:url value="/"/>main/departments">Departments</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-10">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h4 class="panel-title">Departments</h4>
                            </div>
                            <c:set var="arrayDepartId" value="" scope="page" />
                            <c:forEach var="departmentsItem5" items="${departmentsList}">
                                <c:set var="arrayDepartId" value="${arrayDepartId}${departmentsItem5.id}," scope="page" />
                            </c:forEach>

                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-9">
                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" data-idnew="${arrayDepartId}" >Add New Department</button>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="input-group">
                                            <input type="text" class="form-control" placeholder="Search By Department" id="departmentInput"onkeyup="DepartmentSearchFunction()">
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
                                                    <h4 class="modal-title">Add New Department</h4>
                                                </div>
                                                <div class="modal-body" >

                                                    <form class="form-horizontal" method="post" action="departments/addDepartment">
                                                        <div class="form-group">
                                                            <label for="id" class="col-md-4 control-label" align = "right">ID:</label>
                                                            <div class="col-md-6">
                                                                <input type="text" class="form-control input-md" id="id" name ="id" readonly="true">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="name" class="col-md-4 control-label" align = "right">Department Name:</label>
                                                            <div class="col-md-6">                                                                
                                                                <input type="text" class="form-control input-md" name="departmentName" id="departmentName" placeholder="Department Name?" required="true">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="manager" class="col-md-4 control-label" align = "right">Manager:</label>
                                                            <div class="col-md-6">
                                                                <select class="form-control" id="managerName"  name ="managerName" required="true">
                                                                    <c:forEach var="userItem" items="${userList}">
                                                                        <c:if test="${userItem.permission == 'MANAGER'}">
                                                                            <c:forEach var="profileList" items="${profileList}">
                                                                                <c:if test="${profileList.id == userItem.id}">
                                                                                    <option value="${profileList.firstName} ${profileList.lastName}">${profileList.firstName} ${profileList.lastName}</option>
                                                                                </c:if>
                                                                            </c:forEach>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <label for="text" class="col-md-4 control-label" align = "right">Description :</label>
                                                            <div class="col-md-6">
                                                                <textarea style="overflow:auto;resize:none" rows="5" cols="5" class="form-control" name ="description" id="description" placeholder="What about this department?" required="true"></textarea>
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
                                <table class="table table-bordered" id="departmentTable">
                                    <c:set var="count" value="0" scope="page" />

                                    <thead>
                                        <tr class="bg-primary">
                                            <th><div align="center">No.</div></th>
                                            <th><div align="center">ID</div></th>
                                            <th><div align="center">Department</div></th>
                                            <th><div align="center">Description</div></th>
                                            <th><div align="center">Manager</div></th>
                                            <th><div align="center">Member</div></th>
                                            <th><div align="center">Option</div></th>
                                        </tr>
                                    </thead>
                                    <tbody>                                        
                                        <c:forEach var="departmentItem" items="${departmentsList}">
                                            <c:set var="count" value="${count + 1}" scope="page"/>
                                            <tr>                                                
                                                <td align="center"><c:out value = "${count}"></c:out></td>
                                                <td align="center">${departmentItem.id}</td>
                                                <td align="center">${departmentItem.departmentName}</td>
                                                <td align="center">${departmentItem.description}</td>
                                                <td align="center">${departmentItem.managerName}</td>
                                                <td align="center">
                                                    <c:set var="countDepartment" value="0" scope="page" />
                                                    <c:forEach var="userItem" items="${userList}">                                                        
                                                        <c:if test="${userItem.departmentName == departmentItem.departmentName}">                                                           
                                                            <c:set var="countDepartment" value="${countDepartment + 1}" scope="page"/>  
                                                        </c:if>
                                                    </c:forEach>
                                                    <c:out value = "${countDepartment}"></c:out>
                                                    </td>
                                                    <td align="center">
                                                        <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#myModal" data-id="${departmentItem.id}" data-departname="${departmentItem.departmentName}" data-manager="${departmentItem.managerName}" data-description="${departmentItem.description}">Edit </button>                                                       
                                                    <button onclick="show('${departmentItem.id}'),highlight_row(this)" class="btn btn-success">Show </button>
                                                    <a href="<c:url value="/"/>main/departments/delete/${departmentItem.id}"class="btn btn-danger" > Delete</a></td>
                                            </tr>
                                        </c:forEach>                                    
                                    </tbody>
                                </table>


                                <!--Panel 2 Detail-->
                                <c:forEach var="departmentItem2" items="${departmentsList}">                                    
                                    <div class="panel panel-primary" id="${departmentItem2.id}" style="display: none">                                        
                                        <div class="panel-heading">
                                            <h4 class="panel-title">< ${departmentItem2.departmentName} > Members</h4>
                                        </div>
                                        <c:set var="arrayUser" value="" scope="page" />
                                        <c:forEach var="userItem5" items="${userList}">                                                
                                            <c:if test="${userItem5.departmentName == departmentItem2.departmentName}">
                                                <c:forEach var="profileItem5" items="${profileList}">                                                        
                                                    <c:if test="${userItem5.id == profileItem5.id}">
                                                        <c:forEach var="transferItem2" items="${transferList}">
                                                            <c:if test="${transferItem2.profileId == profileItem5.id}">
                                                                <c:set var="arrayUser" value="${arrayUser}${profileItem5.id}|${profileItem5.firstName}|${profileItem5.lastName}|${transferItem2.position}|true," scope="page" />                                                                          
                                                            </c:if>
                                                        </c:forEach>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>  
                                            <c:if test="${userItem5.departmentName == null}">
                                                <c:forEach var="profileItem5" items="${profileList}">                                                        
                                                    <c:if test="${userItem5.id == profileItem5.id}">
                                                        <c:forEach var="transferItem3" items="${transferList}">
                                                            <c:if test="${transferItem3.profileId == profileItem5.id}">
                                                                <c:set var="arrayUser" value="${arrayUser}${profileItem5.id}|${profileItem5.firstName}|${profileItem5.lastName}|${transferItem2.position}|false," scope="page" />                                                                          
                                                            </c:if>
                                                        </c:forEach>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>   
                                        </c:forEach> 

                                        <div class="panel-body">                                            
                                            <div class="row">
                                                <div class="col-md-9">                                                    
                                                    <button type="button" class="btn btn-primary"  data-toggle="modal" data-target="#myModal3" data-whatever="${departmentItem2.departmentName}" data-manager="${departmentItem2.managerName}" data-member="${arrayUser}">Add Member</button>
                                                </div>

                                                <div class="col-md-3">
                                                    <div class="input-group">
                                                        <input type="text" class="form-control" placeholder="Search By FirstName" id="NameInput"onkeyup="NameSearchFunction()">
                                                        <span class="input-group-addon">
                                                            <span class="glyphicon glyphicon-search"></span>
                                                        </span>
                                                    </div> 
                                                </div>
                                            </div>
                                            <br>
                                            <table class="table table-bordered" id="nameTable">
                                                <c:set var="count2" value="0" scope="page" />  

                                                <thead>
                                                    <tr class="bg-primary">
                                                        <th><div align="center">No.</div></th>
                                                        <th><div align="center">ID</div></th>
                                                        <th><div align="center">Title</div></th>
                                                        <th><div align="center">First Name</div></th>
                                                        <th><div align="center">Last Name</div></th>
                                                        <th><div align="center">Position</div></th>
                                                        <th><div align="center">Option</div></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="userItem2" items="${userList}">                                                
                                                        <c:if test="${userItem2.departmentName == departmentItem2.departmentName}">
                                                            <c:set var="count2" value="${count2 + 1}" scope="page" />
                                                            <c:forEach var="profileItem2" items="${profileList}">                                                        
                                                                <c:if test="${userItem2.id == profileItem2.id}"> 
                                                                    <c:forEach var="transferItem" items="${transferList}">
                                                                        <c:if test="${transferItem.profileId == profileItem2.id}">
                                                                            <tr>
                                                                                <td align="center"><c:out value = "${count2}"></c:out></td>
                                                                                <td align="center">${profileItem2.id}</td>
                                                                                <td align="center">${profileItem2.title}</td>
                                                                                <td align="center">${profileItem2.firstName}</td>
                                                                                <td align="center">${profileItem2.lastName}</td>                                                            
                                                                                <td align="center">${transferItem.position}</td>
                                                                                <td align="center">                                                    
                                                                                    <a href="<c:url value="/"/>main/user/deleteDepartMember/${userItem2.id}"class="btn btn-danger"> Delete</a></td>
                                                                            </tr>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </c:if>                                                                    
                                                            </c:forEach>
                                                        </c:if>   

                                                    </c:forEach> 

                                                </tbody>
                                            </table>
                                        </div>                                                        
                                    </div>                                     
                                </c:forEach>



                                <!-- Modal -->
                                <div class="modal fade" id="myModal3" role="dialog" data-keyboard="false" data-backdrop="static" aria-hidden="true">
                                    <div class="modal-dialog modal-lg">
                                        <!-- Modal content-->
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                <h4 class="modal-title">Add Member</h4>
                                            </div>
                                            <div class="modal-body">  
                                                <form method="post" action="user/changeDepartment">
                                                    <div class="form-horizontal">                                                           
                                                        <div class="form-group">                                                    
                                                            <label class="col-md-3 control-label">Department Name:</label>
                                                            <div class="col-md-4">                                       
                                                                <input type="text" class = "form-control input-md" name="departmentName" readonly="true" id="departName" >
                                                            </div>
                                                        </div>
                                                        <div class="form-group">                                                    
                                                            <label class="col-md-3 control-label">Manager :</label>
                                                            <div class="col-md-4">                                       
                                                                <input type="text" class = "form-control input-md" name="managerName" readonly="true" id="manager" >
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="name" class="control-label">Selected Members :</label>
                                                        <table class="table table-bordered" cellspacing="0" id="selectedTable" >                             
                                                        </table>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="row">
                                                            <div class="col-md-9">
                                                                <label for="name" class="control-label">Available Members :</label>
                                                            </div>

                                                            <div class="col-md-3">
                                                                <div class="input-group">
                                                                    <input type="text" class="form-control" placeholder="Search"  id="available"onkeyup="availableSearchFunction()">
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
            </div>
        </div>        
        <script type="text/javascript">
            $('#availableTable').on('click', 'input[type="checkbox"]', function () {
                var indexValue = $(this).closest('tr').index();
                var realNameIndex = ('tr:eq(' + indexValue + ') td:eq(1)');
                var realName = $('#availableTable').find(realNameIndex).text();

                var realPositionIndex = ('tr:eq(' + indexValue + ') td:eq(2)');
                var realPosition = $('#availableTable').find(realPositionIndex).text();

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
                cell2.innerHTML = realPosition;
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
            $('#selectedTable').on('click', 'input[type="checkbox"]', function () {
                var indexValue = $(this).closest('tr').index();

                var realNameIndex = ('tr:eq(' + indexValue + ') td:eq(1)');
                var realName = $('#selectedTable').find(realNameIndex).text();

                var realPositionIndex = ('tr:eq(' + indexValue + ') td:eq(2)');
                var realPosition = $('#selectedTable').find(realPositionIndex).text();

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
                cell2.innerHTML = realPosition;
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
            $('#myModal3').on('show.bs.modal', function (modelbutton) {
                var button = $(modelbutton.relatedTarget);
                var recipient = button.data('whatever');
                var recipientmanager = button.data('manager');
                var member = button.data('member');

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
                cell1.style.cssText = 'width:55%';
                cell2.innerHTML = "Position";
                cell2.style.cssText = 'width:23%';
                cell3.innerHTML = "Select";
                cell3.style.cssText = 'width:15%';

                var cell00 = row2.insertCell(0);
                var cell01 = row2.insertCell(1);
                var cell02 = row2.insertCell(2);
                var cell03 = row2.insertCell(3);

                cell00.innerHTML = "No";
                cell00.style.cssText = 'width:7%';
                cell01.innerHTML = "Name";
                cell01.style.cssText = 'width:55%';
                cell02.innerHTML = "Position";
                cell02.style.cssText = 'width:23%';
                cell03.innerHTML = "Select";
                cell03.style.cssText = 'width:15%';


                var res = member.split(",");
                var selectmemberindex = 1;
                var availablememberindex = 1;
                for (var i = 0; i < res.length - 1; i++) {
                    var resDetail = res[i].split("|");
                    var isselect = resDetail[4];
                    var istrue = 'true';

                    if (isselect === istrue) {
                        var row = selectTable.insertRow(selectmemberindex);
                        row.style.cssText = 'text-align:center;';
                        var cell0 = row.insertCell(0);
                        var cell1 = row.insertCell(1);
                        var cell2 = row.insertCell(2);
                        var cell3 = row.insertCell(3);

                        cell0.innerHTML = selectmemberindex;
                        cell1.innerHTML = resDetail[1] + " " + resDetail[2];
                        cell2.innerHTML = resDetail[3];
                        cell3.innerHTML = "<td><input type='checkbox' name='checkList' value='" + resDetail[0] + "' checked/></td>";
                        selectmemberindex++;
                    } else {
                        var row2 = availableTable.insertRow(availablememberindex);
                        row2.style.cssText = 'text-align:center;';
                        var cell00 = row2.insertCell(0);
                        var cell01 = row2.insertCell(1);
                        var cell02 = row2.insertCell(2);
                        var cell03 = row2.insertCell(3);

                        cell00.innerHTML = availablememberindex;
                        cell01.innerHTML = resDetail[1] + " " + resDetail[2];
                        cell02.innerHTML = resDetail[3];
                        cell03.innerHTML = "<td><input type='checkbox' name='noCheckList' value='" + resDetail[0] + "'/>\n\
                                            <input type='hidden' name='noCheckList' value='" + resDetail[0] + "'></td>";
                        availablememberindex++;
                    }
                }
                document.getElementById("departName").value = recipient;
                document.getElementById("manager").value = recipientmanager;
            });
        </script>
        <script type="text/javascript">
            $('#myModal').on('show.bs.modal', function (modelbutton) {
                var button = $(modelbutton.relatedTarget);
                var id = button.data('id');
                var idnew = button.data('idnew');
                var departname = button.data('departname');
                var manager = button.data('manager');
                var description2 = button.data('description');

                if (departname == null && manager == null && description2 == null) {
                    if (idnew == "") {
                        id = "D001";
                        departname = null;
                        manager = null;
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
                            uid = "D00" + numid;
                        } else if (numid < 100) {
                            uid = "D0" + numid;
                        } else {
                            uid = "D" + numid;
                        }

                        id = uid;
                        departname = null;
                        manager = null;
                        description2 = null;
                    }
                } else {
                    $(".modal-title").html("Edit Department");
                    $(".modal-footer").find('.btn-primary').html("Save");
                    $(".modal-footer").find('.btn-primary').attr('class', 'btn btn-success');
                }
                document.getElementById("id").value = id;
                document.getElementById("departmentName").value = departname;
                document.getElementById("managerName").value = manager;
                document.getElementById("description").value = description2;
            });
        </script>
    </body>
</html>