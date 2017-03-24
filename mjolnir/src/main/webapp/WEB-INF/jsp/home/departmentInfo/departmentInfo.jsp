<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Department Info</title>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous"/>
        <script src=https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
        <script src="<c:url value="/"/>js/home/departmentInfo.js"></script>
        <script src="//cdn.ckeditor.com/4.6.1/full/ckeditor.js"></script> 
        <script src="https://cdn.jsdelivr.net/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.min.js"></script>
        <script src="<c:url value="/"/>js/user/department.js"></script>
        <style>
            .image-preview-input {
                position: relative;
                overflow: hidden;
                margin: 0px;    
                color: #333;
                background-color: #fff;
                border-color: #ccc;    
            }
            .image-preview-input input[type=file] {
                position: absolute;
                top: 0;
                right: 0;
                margin: 0;
                padding: 0;
                font-size: 20px;
                cursor: pointer;
                opacity: 0;
                filter: alpha(opacity=0);
            }
            .image-preview-input-title {
                margin-left:2px;
            }
            img{margin:10px;}
            .selected{
                box-shadow:0px 12px 22px 1px #333;
            }

        </style>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <%@ include file="/WEB-INF/jsp/header.jsp" %>
            </div>
            <nav class="breadcrumb">
                <a class="breadcrumb-item" href="home">Mjolnir</a> / 
                <span class="breadcrumb-item active">Department Info</span>
            </nav>

            <div class="container" style="width: 100%">
                <div class="row">
                    <div class="col-md-2">
                        <div class="panel panel-default">
                            <!--<div class="panel-heading"></div>-->
                            <div class="panel-body">
                                <ul class="nav nav-pills nav-stacked">
                                    <li role="presentation"><a href="<c:url value="/main/home"/>">News Info</a></li>
                                    <li role="presentation"><a href="<c:url value="/main/companyInfo"/>">Company Info</a></li>
                                    <li role="presentation"  class="active"><a href="<c:url value="/main/departmentInfo"/>">Department Info</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-10">

                        <!--Admin's permission-->                            
                        <c:if test="${userInfo.user.permission == 'ADMIN'}">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Departments</h3>
                                </div>
                                <div class="panel-body">
                                    <table class="table table-bordered" cellspacing="0" id="document">
                                        <c:set var="count" value="0" scope="page" />
                                        <thead>
                                            <tr class="bg-primary">
                                                <th><div align="center">No.</div></th>
                                                <th><div align="center">ID</div></th>
                                                <th><div align="center">Department</div></th>
                                                <th><div align="center">Manager</div></th>
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
                                                    <td align="center">${departmentItem.managerName}</td>                                                    
                                                    <td align="center">                                                                                                                  
                                                        <button onclick="show('${departmentItem.id}')" class="btn btn-success">Show </button>
                                                    </td>
                                                </tr>
                                            </c:forEach>                                    
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <!--Panel hidden Detail-->
                            <c:forEach var="departmentItem2" items="${departmentsList}">
                                <div id="${departmentItem2.id}" style="display: none">
                                    <div class="panel panel-primary">
                                        <div class="panel-heading">
                                            <h3 class="panel-title">Departments < ${departmentItem2.departmentName} > Info</h3>
                                        </div>
                                        <div class="panel-body">
                                            <c:set var="countDE" value="0" scope="page"/>
                                            <c:forEach var="DepartmentsInformationItem" items="${DepartmentsInformationList}" >
                                                <c:if test="${departmentItem2.departmentName == DepartmentsInformationItem.department && countDE != '3'}">


                                                    <div class="col-md-4">
                                                        <div class="panel panel-default">
                                                            <div class="thumbnail">
                                                                <c:url var="getPhoto" value="departmentInfo/getPhoto/${DepartmentsInformationItem.img}" />
                                                                <img id="imagePreview" src="${getPhoto}" alt="Profile Photo" style="width:280px ;height:130px"/>
                                                            </div>
                                                            <p><b>&nbsp;&nbsp;&nbsp;&nbsp;Title : </b>
                                                                <a href="<c:url value="/"/>main/showdetailsDepartment/${DepartmentsInformationItem.id}"> ${DepartmentsInformationItem.title}</a></p>
                                                            <p><b>&nbsp;&nbsp;&nbsp;&nbsp;Department : </b>${DepartmentsInformationItem.date}</p>
                                                            <p style="width: 250px;white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">
                                                                <b>&nbsp;&nbsp;&nbsp;&nbsp;Details : </b>${DepartmentsInformationItem.details}</p>
                                                        </div>
                                                    </div>
                                                    <c:set var="countDE" value="${countDE + 1}" scope="page"/>
                                                </c:if>
                                            </c:forEach>

                                        </div>
                                    </div>

                                    <div class="panel panel-primary">
                                        <div class="panel-heading">
                                            <h3 class="panel-title">All Departments < ${departmentItem2.departmentName} > Info</h3>
                                        </div>
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="col-md-9">                                                
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="input-group">
                                                        <input type="text" class="form-control" placeholder="Search" id="input"onkeyup="allSearchFunction()">
                                                        <span class="input-group-addon">
                                                            <span class="glyphicon glyphicon-search"></span>
                                                        </span>
                                                    </div> 
                                                </div>
                                                <div class="col-md-12">
                                                    <br>
                                                    <table class="table table-hover" style="table-layout:fixed;" id="alldepart">
                                                        <tbody>
                                                            <c:forEach var="DepartmentsInformationItem2" items="${DepartmentsInformationAll}">
                                                                <c:if test="${departmentItem2.departmentName == DepartmentsInformationItem2.department}">
                                                                    <tr>
                                                                        <td align="center" style="width: 10%">${DepartmentsInformationItem2.date}</td>
                                                                        <td align="center" style="width: 20%">${DepartmentsInformationItem2.title}</td>
                                                                        <td style="width: 53%;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;">${DepartmentsInformationItem2.details}</td>                                                                    
                                                                        <td align="center" style="width: 17%">
                                                                            <a href="<c:url value="/"/>main/showdetailsDepartment/${DepartmentsInformationItem2.id}" class="btn btn-success"> Show</a>
                                                                        </td>
                                                                    </tr>
                                                                </c:if>

                                                            </c:forEach>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <br>
                                        </div> 
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>

                        <!--Manager's permission-->                            
                        <c:if test="${userInfo.user.permission == 'MANAGER'}">
                            <c:forEach var="DepartmentsItem" items="${departmentsList}">
                                <c:if test="${userInfo.user.departmentName == DepartmentsItem.departmentName}">                                    
                                    <div class="panel panel-primary">
                                        <div class="panel-heading">
                                            <h3 class="panel-title">Department Info</h3>
                                        </div>
                                        <div class="panel-body">
                                            <c:set var="count3" value="0" scope="page"/>
                                            <c:forEach var="DepartmentsInformationItem" items="${DepartmentsInformationList}">
                                                <c:if test="${userInfo.user.departmentName == DepartmentsInformationItem.department && count3 != '3'}">
                                                    <div class="col-md-4">
                                                        <div class="panel panel-default">
                                                            <div class="thumbnail">
                                                                <c:url var="getPhoto" value="departmentInfo/getPhoto/${DepartmentsInformationItem.img}" />
                                                                <img id="imagePreview" src="${getPhoto}" alt="Profile Photo" style="width:280px ;height:130px"/>
                                                            </div>
                                                            <p><b>&nbsp;&nbsp;&nbsp;&nbsp;Title : </b>
                                                                <a href="<c:url value="/"/>main/departmentInfo/showdetails/${DepartmentsInformationItem.id}"> ${DepartmentsInformationItem.title}</a></p>
                                                            <p><b>&nbsp;&nbsp;&nbsp;&nbsp;Company : </b>${DepartmentsInformationItem.date}</p>
                                                            <p style="width: 250px;white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">
                                                                <b>&nbsp;&nbsp;&nbsp;&nbsp;Details : </b>${DepartmentsInformationItem.details}</p>
                                                        </div>
                                                    </div>
                                                    <c:set var="count3" value="${count3 + 1}" scope="page"/>
                                                </c:if>
                                            </c:forEach>

                                        </div>  
                                    </div>

                                    <div class="panel panel-primary">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">All Department Info</h4>
                                        </div>
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="col-md-9">
                                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">Add News</button>
                                                </div>

                                                <div class="col-md-3">
                                                    <div class="input-group">
                                                        <input type="text" class="form-control" placeholder="Search" onkeyup="searchFunction()">
                                                        <span class="input-group-addon">
                                                            <span class="glyphicon glyphicon-search"></span>
                                                        </span>
                                                    </div>                                        
                                                </div>

                                                <div class="col-md-12">
                                                    <br>
                                                    <table class="table table-hover" style="table-layout:fixed;">
                                                        <tbody>
                                                            <c:forEach var="DepartmentsInformationItem2" items="${DepartmentsInformationAll}">
                                                                <c:if test="${userInfo.user.departmentName == DepartmentsInformationItem2.department}">
                                                                    <tr>
                                                                        <td align="center" style="width: 10%">${DepartmentsInformationItem2.date}</td>
                                                                        <td align="center" style="width: 20%">${DepartmentsInformationItem2.title}</td>
                                                                        <td style="width: 53%;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;">${DepartmentsInformationItem2.details}</td>
                                                                        <td align="center" style="width: 17%">
                                                                            <a href="<c:url value="/"/>main/departmentInfo/showdetails/${DepartmentsInformationItem2.id}" class="btn btn-success"> Show</a>
                                                                            <a href="<c:url value="/"/>main/departmentInfo/delete/${DepartmentsInformationItem2.id}" class="btn btn-danger"> Delete</a>
                                                                        </td>
                                                                    </tr>
                                                                </c:if>
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>
                                                </div>


                                                <!-- Modal -->
                                                <div class="modal fade" id="myModal" role="dialog" data-keyboard="false" data-backdrop="static">
                                                    <div class="modal-dialog modal-lg">

                                                        <!-- Modal content-->
                                                        <div class="modal-content">
                                                            <div class="modal-header">                                                                
                                                                <h4 class="modal-title">Add News (Department)</h4>
                                                            </div>
                                                            <div class="modal-body">

                                                                <div class="form-group">
                                                                    <label for="id" class="col-md-3 control-label">Insert an Image:</label>
                                                                    <div class="row">
                                                                        <div class="col-md-2">
                                                                            <div class="thumbnail">
                                                                                <c:url var="getPhoto" value="departmentInfo/getPhoto/photoDefault1" />
                                                                                <img id="img1"src="${getPhoto}" alt="Profile Photo" style="width:100%"/>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-2">
                                                                            <div class="thumbnail">
                                                                                <c:url var="getPhoto" value="departmentInfo/getPhoto/photoDefault2" />
                                                                                <img id="img2" src="${getPhoto}" alt="Profile Photo" style="width:100%"/>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-2">
                                                                            <div class="thumbnail">
                                                                                <c:url var="getPhoto" value="departmentInfo/getPhoto/photoDefault3" />
                                                                                <img id="img3" src="${getPhoto}" alt="Profile Photo" style="width:100%" />
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>  

                                                                <form id="uploadform">
                                                                    <div class="form-group">
                                                                        <div class="row">
                                                                            <div class="col-md-12">                                                                       
                                                                                <div class="form-group">                                                                            
                                                                                    <label class="col-md-3 control-label">Form My Computer:</label>
                                                                                    <div class="col-md-6">
                                                                                        <div class="input-group image-preview">
                                                                                            <input type="text" class="form-control image-preview-filename" readonly="true">
                                                                                            <span class="input-group-btn">

                                                                                                <button type="button" class="btn btn-default image-preview-clear" style="display:none;">
                                                                                                    <span class="glyphicon glyphicon-remove"></span> Clear
                                                                                                </button>

                                                                                                <div class="btn btn-default image-preview-input">
                                                                                                    <span class="glyphicon glyphicon-folder-open"></span>
                                                                                                    <span class="image-preview-input-title">Browse</span>
                                                                                                    <input type="file" accept="image/png, image/jpeg, image/gif" name="file"/>
                                                                                                </div>
                                                                                            </span>
                                                                                        </div>
                                                                                    </div>
                                                                                    <button id="buttonUpload" class="btn btn-primary" >Upload</button>
                                                                                </div>                                                                         
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </form>

                                                                <form action="departmentInfo/addDepartmentInfo" method="post" id="addnew">
                                                                    <div class="form-group">
                                                                        <div class="row">
                                                                            <div class="col-md-4">
                                                                                <div class="input-group">
                                                                                    <span class="input-group-addon" id="basic-addon1">Title</span>
                                                                                    <div>                                                                
                                                                                        <input type="text" class="form-control" id="title" name="title">
                                                                                        <input type="hidden" value="photoDefault1" id="img" name="img">
                                                                                        <input type="hidden" id="department" name="department" value="${userInfo.user.departmentName}">

                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-md-4">
                                                                                <div class="form-group">
                                                                                    <select class="form-control" id="status" name="status">
                                                                                        <option>News</option>
                                                                                        <option>Conference</option>
                                                                                        <option>Event</option>                                                                                    
                                                                                    </select>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-md-4">
                                                                                <div class="input-group">
                                                                                    <span class="input-group-addon" id="basic-addon1">Date</span>
                                                                                    <div>                                                                
                                                                                        <input type="date" class="form-control" id="date" name="date">
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group">
                                                                        <label for="message-text" class="control-label">Details : </label>
                                                                        <textarea class="form-control" id="details" name="details"></textarea>
                                                                    </div>

                                                                    <div class="modal-footer">
                                                                        <button type="submit" class="btn btn-primary" id="add">Add News</button>                                                                
                                                                        <a href="<c:url value="/"/>main/departmentInfo/clearTable/" class="btn btn-default">Cancel</a>
                                                                    </div>
                                                                    <script>
                                                                        CKEDITOR.replace('details');
                                                                    </script>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <br>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </c:if>



                    <!--Employee's permission-->                            
                    <c:if test="${userInfo.user.permission == 'EMPLOYEE'}">  
                        <c:forEach var="departmentItem2" items="${departmentsList}">
                            <c:if test="${userInfo.user.departmentName == departmentItem2.departmentName}">
                                <div id="${departmentItem2.id}">
                                    <div class="panel panel-primary">
                                        <div class="panel-heading">
                                            <h3 class="panel-title">Departments < ${departmentItem2.departmentName} > Info</h3>
                                        </div>
                                        <div class="panel-body">
                                            <c:set var="countDE" value="0" scope="page"/>
                                            <c:forEach var="DepartmentsInformationItem" items="${DepartmentsInformationList}" >
                                                <c:if test="${departmentItem2.departmentName == DepartmentsInformationItem.department && countDE != '3'}">


                                                    <div class="col-md-4">
                                                        <div class="panel panel-default">
                                                            <div class="thumbnail">
                                                                <c:url var="getPhoto" value="departmentInfo/getPhoto/${DepartmentsInformationItem.img}" />
                                                                <img id="imagePreview" src="${getPhoto}" alt="Profile Photo" style="width:280px ;height:130px"/>
                                                            </div>
                                                            <p><b>&nbsp;&nbsp;&nbsp;&nbsp;Title : </b>
                                                                <a href="<c:url value="/"/>main/showdetailsDepartment/${DepartmentsInformationItem.id}"> ${DepartmentsInformationItem.title}</a></p>
                                                            <p><b>&nbsp;&nbsp;&nbsp;&nbsp;Department : </b>${DepartmentsInformationItem.date}</p>
                                                            <p style="width: 250px;white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">
                                                                <b>&nbsp;&nbsp;&nbsp;&nbsp;Details : </b>${DepartmentsInformationItem.details}</p>
                                                        </div>
                                                    </div>
                                                    <c:set var="countDE" value="${countDE + 1}" scope="page"/>
                                                </c:if>
                                            </c:forEach>

                                        </div>
                                    </div>

                                    <div class="panel panel-primary">
                                        <div class="panel-heading">
                                            <h3 class="panel-title">All Departments < ${departmentItem2.departmentName} > Info</h3>
                                        </div>
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="col-md-9">                                                
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="input-group">
                                                        <input type="text" class="form-control" placeholder="Search" id="input"onkeyup="allSearchFunction()">
                                                        <span class="input-group-addon">
                                                            <span class="glyphicon glyphicon-search"></span>
                                                        </span>
                                                    </div> 
                                                </div>
                                                <div class="col-md-12">
                                                    <br>
                                                    <table class="table table-hover" style="table-layout:fixed;" id="alldepart">
                                                        <tbody>
                                                            <c:forEach var="DepartmentsInformationItem2" items="${DepartmentsInformationAll}">
                                                                <c:if test="${departmentItem2.departmentName == DepartmentsInformationItem2.department}">
                                                                    <tr>
                                                                        <td align="center" style="width: 10%">${DepartmentsInformationItem2.date}</td>
                                                                        <td align="center" style="width: 20%">${DepartmentsInformationItem2.title}</td>
                                                                        <td style="width: 53%;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;">${DepartmentsInformationItem2.details}</td>                                                                    
                                                                        <td align="center" style="width: 17%">
                                                                            <a href="<c:url value="/"/>main/showdetailsDepartment/${DepartmentsInformationItem2.id}" class="btn btn-success"> Show</a>
                                                                        </td>
                                                                    </tr>
                                                                </c:if>

                                                            </c:forEach>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <br>
                                        </div> 
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </c:if>
                </div>
            </div>

        </div>   
        <script type="text/javascript">
            var isJpg = function (name) {
                return name.match(/jpg$/i);
            };

            var isPng = function (name) {
                return name.match(/png$/i);
            };

            $(document).ready(function () {
                var file = $('[name="file"]');

                $('#buttonUpload').click(function () {
                    var filename = $.trim(file.val());

                    if (!(isJpg(filename) || isPng(filename))) {
                        alert('Please browse a JPG/PNG file to upload ...');
                        return false;
                    } else {
                        $.ajax({
                            url: 'departmentInfo/upload',
                            type: 'POST',
                            data: new FormData(document.getElementById("uploadform")),
                            enctype: 'multipart/form-data',
                            processData: false,
                            contentType: false,
                            success: function () {
                                alert('Upload Success');
                                return false;
                            }
                        });
                        return false;
                    }
                });
            });
        </script>  
        <script type="text/javascript">
            $(document).on('click', '#close-preview', function () {
                $('.image-preview').popover('hide');
            });
            $(function () {
                var closebtn = $('<button/>', {
                    type: "button",
                    text: 'x',
                    id: 'close-preview',
                    style: 'font-size: initial;'
                });
                closebtn.attr("class", "close pull-right");


                $('.image-preview-clear').click(function () {
                    $('.image-preview').attr("data-content", "").popover('hide');
                    $('.image-preview-filename').val("");
                    $('.image-preview-clear').hide();
                    $('.image-preview-input input:file').val("");
                    $(".image-preview-input-title").text("Browse");
                });

                $(".image-preview-input input:file").change(function () {
                    var img = $('<img/>', {
                        id: 'dynamic',
                        width: 250,
                        height: 200
                    });
                    var file = this.files[0];
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        $(".image-preview-input-title").text("Change");
                        $(".image-preview-clear").show();
                        $(".image-preview-filename").val(file.name);
                    };
                    reader.readAsDataURL(file);
                });
            });
        </script>
        <script type="text/javascript">
            $('#img1').click(function () {
                $('#addnew').find('#img').attr('value', 'photoDefault1');
                $(this).addClass('selected');
                $('#img2').removeClass('selected');
                $('#img3').removeClass('selected');
            });
        </script>
        <script type="text/javascript">
            $('#img2').click(function () {
                $('#addnew').find('#img').attr('value', 'photoDefault2');
                $(this).addClass('selected');
                $('#img1').removeClass('selected');
                $('#img3').removeClass('selected');
            });
        </script>
        <script type="text/javascript">
            $('#img3').click(function () {
                $('#addnew').find('#img').attr('value', 'photoDefault3');
                $(this).addClass('selected');
                $('#img1').removeClass('selected');
                $('#img2').removeClass('selected');
            });
        </script>        
         <script>


        $("#add").click(function () {
            var messageLength = CKEDITOR.instances['details'].getData().replace(/<[^>]*>/gi, '').trim().length;
            var title = $('#title').val();
            if (!messageLength || !title) {
                alert('Please Enter All Box');
                $("#add").stop();
                $("#add").prop('disabled', true);
            }
        });
        $("#title").keyup(function () {
            var messageLength = CKEDITOR.instances['details'].getData().replace(/<[^>]*>/gi, '').trim().length;
            var title = $('#title').val();
            if (!messageLength || !title) {
                $("#add").prop('disabled', true);
            } else {
                $("#add").prop('disabled', false);
            }
        });

        CKEDITOR.instances['details'].on('change', function (e) {
            var messageLength = CKEDITOR.instances['details'].getData().replace(/<[^>]*>/gi, '').trim().length;
            var title = $('#title').val();
            if (!messageLength || !title) {
                $("#add").prop('disabled', true);
            } else {
                $("#add").prop('disabled', false);
            }
        });
    </script>
    </body>
</html>
