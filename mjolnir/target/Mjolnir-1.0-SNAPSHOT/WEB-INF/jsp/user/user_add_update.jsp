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
        <script src="<c:url value="/"/>js/app.js"></script>
        <script type="text/javascript"
                src="http://tarruda.github.com/bootstrap-datetimepicker/assets/js/bootstrap-datetimepicker.min.js">
        </script>
        <script type="text/javascript"
                src="http://tarruda.github.com/bootstrap-datetimepicker/assets/js/bootstrap-datetimepicker.pt-BR.js">
        </script>
        <link rel="stylesheet" type="text/css" media="screen"
              href="http://tarruda.github.com/bootstrap-datetimepicker/assets/css/bootstrap-datetimepicker.min.css">
        <link rel="stylesheet" type="text/css" media="screen"
              href="<c:url value="/"/>css/datepicker.css">
        <script type="text/javascript" src="<c:url value="/"/>js/bootstrap-datepicker.js"></script>
        <!-- thai extension -->
        <script type="text/javascript" src="<c:url value="/"/>js/bootstrap-datepicker-thai.js"></script>
        <script type="text/javascript" src="<c:url value="/"/>js/locales/bootstrap-datepicker.th.js"></script>

        <c:if test="${action == 'save'}">
            <title>User save</title>
        </c:if>
        <c:if test="${action == 'update'}">
            <title>User update</title>
        </c:if>
    </head>
    <c:if test="${action == 'save'}">
        <body>
        </c:if>
        <c:if test="${action == 'update'}">
        <body>
        </c:if>    
        <div class="container-fluid">
            <div class="row">
                <%@ include file="/WEB-INF/jsp/header.jsp" %>  
            </div>  
            <nav class="breadcrumb">
                <a class="breadcrumb-item" href="<c:url value="/"/>main/user">User</a> / 
                <span class="breadcrumb-item active">User</span>
            </nav>

            <div class="container" style="width: 100%">
                <div class="row">
                    <div class="col-md-2">
                        <div class="panel panel-default">                          
                            <div class="panel-body">
                                <ul class="nav nav-pills nav-stacked">
                                    <li role="presentation" class="active"><a href="<c:url value="/"/>main/user">User</a></li>
                                    <li role="presentation"><a href="<c:url value="/"/>main/departments">Departments</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-10">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h4 class="panel-title">Users</h4>
                            </div>
                            <div class="panel-body">
                                <input type="hidden" id="finalId" value="${userList}">

                                <form class="form-horizontal" method="POST" action="${action}">            
                                    <fieldset>
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="textinput">ID:</label>  
                                            <div class="col-md-4">
                                                <c:if test="${action == 'save'}">
                                                    <input class="form-control input-md" id="id" name="id" readonly="true" value="Hello Users"/>                                                    
                                                </c:if>
                                                <c:if test="${action == 'update'}">
                                                    <input class="form-control input-md" id="id" name="id" readonly="true" value="${id}"/>
                                                </c:if>
                                            </div>
                                        </div>

                                        <c:if test="${action == 'save'}">
                                            <div class="form-group">
                                                <label class="col-md-4 control-label" for="textinput">Username:</label>  
                                                <div class="col-md-4">                                                   
                                                    <input class="form-control input-md" name="username" placeholder="Enter username" required="username"/>                                                                                                
                                                </div>
                                            </div>
                                        </c:if>
                                        <c:forEach var="userItem" items="${userList}">
                                            <c:if test="${action == 'update' && userItem.id == id}">
                                                <div class="form-group">
                                                    <label class="col-md-4 control-label" for="textinput">Username:</label>  
                                                    <div class="col-md-4">                                                   
                                                        <input class="form-control input-md" value="${userItem.username}" name="username" placeholder="Enter username" required="username"/>                          
                                                        <input type="hidden" value="${userItem.urlId}" name="urlId" readonly="true"/>
                                                        <input type="hidden" value="${userItem.checkPWD}" name="checkPWD" readonly="true"/>
                                                        <input type="hidden" value="${userItem.password}" name="password" readonly="true"/>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </c:forEach>

                                        <c:forEach var="userItem" items="${userList}">
                                            <c:if test="${action == 'update' && userItem.id == id}">
                                                <div class="form-group">                            
                                                    <div class="col-md-4 col-md-offset-4">
                                                        <a href="../../resetPassword/sendEmail/${userItem.urlId}" class="btn btn-danger" style="width: 100%">Reset Password</a>
                                                    </div>                                            
                                                </div> 
                                            </c:if>
                                        </c:forEach>
                                        <c:if test="${action == 'save'}">
                                            <div class="form-group">
                                                <label class="col-md-4 control-label" for="textinput">E-mail:</label>  
                                                <div class="col-md-4">
                                                    <input type="email" class="form-control input-md" name="email" placeholder="Enter email (example@entronica.co.th)"/>
                                                </div>
                                            </div>
                                        </c:if>
                                        <c:forEach var="userItem" items="${userList}">
                                            <c:if test="${action == 'update' && userItem.id == id}">
                                                <div class="form-group">
                                                    <label class="col-md-4 control-label" for="textinput">E-mail:</label>  
                                                    <div class="col-md-4">
                                                        <input type="email" class="form-control input-md" value="${userItem.email}" name="email" placeholder="Enter email (example@entronica.co.th)"/>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </c:forEach>

                                        <c:if test="${action == 'save'}">
                                            <div class="form-group">
                                                <label class="col-md-4 control-label" for="textinput">Permission:</label>  
                                                <div class="col-md-4">
                                                    <select class="form-control input-md" name="permission" required="permission">
                                                        <option value="" disabled selected>Permission</option>
                                                        <option>ADMIN</option>
                                                        <option>EMPLOYEE</option>
                                                        <option>MANAGER</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </c:if>
                                        <c:forEach var="userItem" items="${userList}">
                                            <c:if test="${action == 'update' && userItem.id == id}">
                                                <div class="form-group">
                                                    <label class="col-md-4 control-label" for="textinput">Permission:</label>  
                                                    <div class="col-md-4">
                                                        <select class="form-control input-md" name="permission">
                                                            <c:if test="${userItem.permission == 'ADMIN'}">
                                                                <option selected="ADMIN">ADMIN</option>
                                                                <option>EMPLOYEE</option>
                                                                <option>MANAGER</option>
                                                            </c:if>
                                                            <c:if test="${userItem.permission == 'EMPLOYEE'}">
                                                                <option>ADMIN</option>
                                                                <option selected="EMPLOYEE">EMPLOYEE</option>
                                                                <option>MANAGER</option>
                                                            </c:if>
                                                            <c:if test="${userItem.permission == 'MANAGER'}">
                                                                <option>ADMIN</option>
                                                                <option>EMPLOYEE</option>
                                                                <option selected="MANAGER">MANAGER</option>
                                                            </c:if>
                                                        </select>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </c:forEach>

                                        <c:if test="${action == 'save'}">
                                            <div class="form-group">
                                                <label class="col-md-4 control-label">Start Work Date :</label>  
                                                <div class="col-md-4">
                                                    <input type="date" name="startWorkDate" class="form-control input-md" style="width: 100%" required="startWorkDate">
                                                </div>
                                            </div>
                                        </c:if>
                                        <c:forEach var="userItem" items="${userList}">
                                            <c:if test="${action == 'update' && userItem.id == id}">
                                                <div class="form-group">
                                                    <label class="col-md-4 control-label">Start Work Date :</label>  
                                                    <div class="col-md-4">
                                                        <input type="date" name="startWorkDate" class="form-control input-md" style="width: 100%" value="${userItem.startWorkDate}" required="startWorkDate">
                                                    </div>
                                                </div>
                                            </c:if>
                                        </c:forEach>

                                        <c:if test="${action == 'save'}">
                                            <div class="form-group">
                                                <label class="col-md-4 control-label" for="textinput">Employment Type:</label>  
                                                <div class="col-md-4">
                                                    <select class="form-control input-md" name="employmentType" required="employmentType" id="employmentType" onchange="checkType()">                                                        
                                                        <option value="" disabled selected>Employment Type</option>
                                                        <c:forEach var="employmentTypeItem" items="${employmentTypeList}">  
                                                            <option  typeName="${employmentTypeItem.typeName}" value="${employmentTypeItem.employmentTypeName}">${employmentTypeItem.employmentTypeName}</option> 
                                                        </c:forEach>                                                    
                                                    </select>
                                                </div>
                                            </div>
                                        </c:if>

                                        <c:forEach var="userItem2" items="${userList}">
                                            <c:if test="${action == 'update' && userItem2.id == id}">
                                                <div class="form-group">
                                                    <label for="name" class="col-md-4 control-label" align = "right">Employment Type:</label>                                                    
                                                    <div class="col-md-4">                                                
                                                        <select class="form-control" name="employmentType" id="employmentType" required="employmentType" onchange="checkType()">                                                    
                                                            <c:forEach var="employmentTypeItem2" items="${employmentTypeList}">  
                                                                <c:if test="${employmentTypeItem2.employmentTypeName == employmentTypeUsed}">
                                                                    <option typeName="${employmentTypeItem2.typeName}" selected="${employmentTypeUsed}" value="${employmentTypeItem2.employmentTypeName}">${employmentTypeItem2.employmentTypeName}</option>
                                                                </c:if>
                                                                <c:if test="${employmentTypeItem2.employmentTypeName != employmentTypeUsed}">
                                                                    <option typeName="${employmentTypeItem2.typeName}" value="${employmentTypeItem2.employmentTypeName}">${employmentTypeItem2.employmentTypeName}</option> 
                                                                </c:if>
                                                            </c:forEach>                                                      
                                                        </select>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </c:forEach>

                                        <c:if test="${action == 'save'}">
                                            <div class="form-group">
                                                <label for="name" class="col-md-4 control-label" align = "right">Duration:</label>
                                                <div class="col-md-4">                                                
                                                    <select class="form-control" name="duration" required="duration" id="duration">  
                                                        <option value="" disabled selected>Duration</option>
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
                                        </c:if>

                                        <c:forEach var="userItem" items="${userList}">                                            
                                            <c:if test="${action == 'update' && userItem.id == id}">
                                                <div class="form-group">
                                                    <label for="name" class="col-md-4 control-label" align = "right">Duration:</label>
                                                    <div class="col-md-4">
                                                        <select class="form-control" name="duration" id="duration"> 
                                                            <c:forEach var="employmentItem" items="${employmentList}"> 
                                                                <c:if test="${employmentItem.profileId == id && employmentTypeUsed == employmentItem.type}">
                                                                    <c:if test="${employmentItem.dulation == '1'}">
                                                                        <option  selected="1"value="1">${employmentItem.dulation}</option>
                                                                        <option value="2">2</option> 
                                                                        <option value="3">3</option> 
                                                                        <option value="4">4</option> 
                                                                        <option value="5">5</option> 
                                                                        <option value="6">6</option>
                                                                        <option value=""></option>
                                                                    </c:if>
                                                                    <c:if test="${employmentItem.dulation == '2'}">                                                                        
                                                                        <option value="1">1</option> 
                                                                        <option selected="2" value="2">${employmentItem.dulation}</option>
                                                                        <option value="3">3</option> 
                                                                        <option value="4">4</option> 
                                                                        <option value="5">5</option> 
                                                                        <option value="6">6</option>
                                                                        <option value=""></option>
                                                                    </c:if>
                                                                    <c:if test="${employmentItem.dulation == '3'}">                                                                        
                                                                        <option value="1">1</option> 
                                                                        <option value="2">2</option>
                                                                        <option selected="3" value="3">${employmentItem.dulation}</option>
                                                                        <option value="4">4</option> 
                                                                        <option value="5">5</option> 
                                                                        <option value="6">6</option>
                                                                        <option value=""></option>
                                                                    </c:if>
                                                                    <c:if test="${employmentItem.dulation == '4'}">                                                                        
                                                                        <option value="1">1</option>
                                                                        <option value="2">2</option> 
                                                                        <option value="3">3</option>
                                                                        <option selected="4" value="4">${employmentItem.dulation}</option>
                                                                        <option value="5">5</option> 
                                                                        <option value="6">6</option>
                                                                        <option value=""></option>
                                                                    </c:if>
                                                                    <c:if test="${employmentItem.dulation == '5'}">                                                                        
                                                                        <option value="1">1</option> 
                                                                        <option value="2">2</option> 
                                                                        <option value="3">3</option> 
                                                                        <option value="4">4</option>
                                                                        <option selected="5" value="5">${employmentItem.dulation}</option>
                                                                        <option value="6">6</option>
                                                                        <option value=""></option>
                                                                    </c:if>
                                                                    <c:if test="${employmentItem.dulation == '6'}">                                                                        
                                                                        <option value="1">1</option>
                                                                        <option value="2">2</option> 
                                                                        <option value="3">3</option> 
                                                                        <option value="4">4</option> 
                                                                        <option value="5">5</option>  
                                                                        <option selected="6" value="5">${employmentItem.dulation}</option>
                                                                        <option value=""></option>
                                                                    </c:if>
                                                                    <c:if test="${employmentItem.dulation == ''}">
                                                                        <option value=""></option>
                                                                        <option value="1">1</option>
                                                                        <option value="2">2</option> 
                                                                        <option value="3">3</option> 
                                                                        <option value="4">4</option> 
                                                                        <option value="5">5</option> 
                                                                        <option value="6">6</option>                                                                        
                                                                    </c:if>
                                                                </c:if>
                                                            </c:forEach>  
                                                        </select>
                                                    </div>
                                                </div>
                                            </c:if>

                                        </c:forEach>

                                        <c:if test="${action == 'save'}">
                                            <div class="form-group">
                                                <label for="name" class="col-md-4 control-label" align = "right">Department:</label>
                                                <div class="col-md-4">                                                
                                                    <select class="form-control" name="departmentName" required="departmentName" id="departmentName">   
                                                        <option value="" disabled selected>Department</option>
                                                        <c:forEach var="departmentItem" items="${departmentsList}">  
                                                            <option value="${departmentItem.id}">${departmentItem.departmentName}</option> 
                                                        </c:forEach>                                                       
                                                    </select>
                                                </div>
                                            </div>
                                        </c:if>

                                        <c:forEach var="userItem" items="${userList}">
                                            <c:if test="${action == 'update' && userItem.id == id}">
                                                <div class="form-group">
                                                    <label for="name" class="col-md-4 control-label" align = "right">Department:</label>
                                                    <div class="col-md-4">                                                
                                                        <select class="form-control" name="departmentName">                                                    
                                                            <c:forEach var="departmentItem" items="${departmentsList}">  
                                                                <c:if test="${departmentItem.departmentName == departmentUsed}">
                                                                    <option value="${departmentItem.id}" selected="${departmentUsed}">${departmentItem.departmentName}</option>
                                                                </c:if>
                                                                <c:if test="${departmentItem.departmentName != departmentUsed}">
                                                                    <option value="${departmentItem.id}">${departmentItem.departmentName}</option> 
                                                                </c:if>
                                                            </c:forEach>                                                       
                                                        </select>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </c:forEach>

                                        <c:if test="${action == 'save'}">
                                            <div class="form-group">
                                                <label for="name" class="col-md-4 control-label" align = "right">Position:</label>
                                                <div class="col-md-4">                                                
                                                    <select class="form-control" name="position" required="position"> 
                                                        <option value="" disabled selected>Position</option>
                                                        <c:forEach var="positionItem" items="${positionList}">  
                                                            <option>${positionItem.position}</option> 
                                                        </c:forEach>                                                       
                                                    </select>
                                                </div>
                                            </div>
                                        </c:if>

                                        <c:forEach var="userItem" items="${userList}">
                                            <c:if test="${action == 'update' && userItem.id == id}">
                                                <div class="form-group">
                                                    <label for="name" class="col-md-4 control-label" align = "right">Position:</label>
                                                    <div class="col-md-4">                                                
                                                        <select class="form-control" name="position">                                                    
                                                            <c:forEach var="positionItem" items="${positionList}">  
                                                                <c:if test="${positionItem.position == positionUsed}">
                                                                    <option selected="${positionUsed}">${positionItem.position}</option>
                                                                </c:if>
                                                                <c:if test="${positionItem.position != positionUsed}">
                                                                    <option>${positionItem.position}</option> 
                                                                </c:if>
                                                            </c:forEach>                                                       
                                                        </select>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </c:forEach>

                                        <div class="form-group">
                                            <label class="col-md-4 control-label"></label>
                                            <div class="col-md-4">
                                                <c:if test="${action == 'save'}">
                                                    <input type="submit" value="Add" class="btn btn-success">
                                                    <a href="<c:url value="/"/>main/user" class="btn btn-primary">back to user page</a>
                                                </c:if>
                                                <c:if test="${action == 'update'}">
                                                    <input type="submit" value="Save" class="btn btn-success">
                                                    <a href="<c:url value="/"/>main/user"class="btn btn-primary">back to user page</a>
                                                </c:if>
                                            </div>
                                        </div>
                                    </fieldset>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <script type="text/javascript">
                function checkType() {
                    var employmentSelect = document.getElementById("employmentType");                    
                    var typeName = employmentSelect.options[employmentSelect.selectedIndex].getAttribute('typeName');
                    
                    if(typeName == "permanent"){
                        $('#duration').prop('required', false);
                        $('#duration').attr('disabled', true);
                        $('#duration').val("");
                    }else if(typeName == "duration"){
                        $('#duration').prop('required', true);
                        $('#duration').attr('disabled', false);  
                        $('#duration').val("");
                    }
                }
            </script>

            <script type="text/javascript">
                $('#departmentName').on('change', function () {
                    var date = new Date();
                    var year = date.getFullYear();
                    var subYear = year % 100;
                    var subDepart = '00';

                    var finalId = $('#finalId').val();

                    var departId = this.value;
                    subDepart = departId.substring(departId.length - 2, departId.length);

                    if (finalId === "") {
                        document.getElementById("id").value = subYear + '00000';
                    } else {
                        var yearId = finalId.substring(0, 2);
                        var num = finalId.substring(4);
 
                        if (subYear == yearId) {
                            var numId = parseInt(num) + 1;
                            var uid;
                            if (numId < 10) {
                                uid = yearId + subDepart + "00" + numId;
                            } else if (numId < 100) {
                                uid = yearId + subDepart + "0" + numId;
                            } else {
                                uid = yearId + subDepart + numId;
                            }
                            document.getElementById("id").value = uid;
                        } else {
                            var numId2 = 1;
                            var uid2;
                            if (numId2 < 10) {
                                uid2 = subYear + subDepart + "00" + numId2;
                            } else if (numId2 < 100) {
                                uid2 = subYear + subDepart + "0" + numId2;
                            } else {
                                uid2 = subYear + subDepart + numId2;
                            }
                            document.getElementById("id").value = uid2;
                        }
                    }
                });
            </script>
    </body>
</html>
