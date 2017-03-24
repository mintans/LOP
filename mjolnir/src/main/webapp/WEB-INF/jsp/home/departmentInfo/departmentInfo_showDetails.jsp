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
                <a class="breadcrumb-item" href="<c:url value="/main/departmentInfo"/>">Department Info</a> / 
                <span class="breadcrumb-item active">DepartmentInfo Details</span>
            </nav>

            <div class="container" style="width: 100%">
                <div class="row">
                    <div class="col-md-2">
                        <div class="panel panel-default">
                            <!--<div class="panel-heading"></div>-->
                            <div class="panel-body">
                                <ul class="nav nav-pills nav-stacked">
                                    <li role="presentation"><a href="<c:url value="/main/home"/>">News Info</a></li>
                                    <li role="presentation" ><a href="<c:url value="/main/companyInfo"/>">Company Info</a></li>
                                    <li role="presentation" class="active"><a href="<c:url value="/main/departmentInfo"/>">Department Info</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-10">

                        <!--Admin's permission-->                            
                        <c:if test="${userInfo.user.permission == 'MANAGER'}">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Department Info</h3>
                                </div>
                                <div class="panel-body">
                                    <c:set var="departmentId" value="0" scope="page"/>

                                    <c:forEach var="departmentsInformationItem" items="${departmentsInformationList}">                                        
                                        <c:if test="${departmentsInformationItem.id == departmentInfoID}">
                                            <c:set var="departmentId" value="${departmentsInformationItem.id}" scope="page"/>
                                            <div class="row">
                                                <div class="col-md-11">
                                                    <label>Posted ${departmentsInformationItem.date}</label>  
                                                </div>
                                                <div class="col-md-1">                                                    
                                                    <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#myModal" id="btnEdit"
                                                            data-id2 = "${departmentsInformationItem.id}"
                                                            data-title2 = "${departmentsInformationItem.title}"
                                                            data-status2 = "${departmentsInformationItem.status}"
                                                            data-img2 = "${departmentsInformationItem.img}"
                                                            data-date2 = "${departmentsInformationItem.date}"
                                                            data-details2 = "${departmentsInformationItem.details}"> Edit</button>                                                   
                                                </div>
                                            </div>
                                            <br>
                                            <div class="row">
                                                <div class="col-md-8 col-md-offset-2">
                                                    <div class="thumbnail">
                                                        <c:url var="getPhoto" value="/main/departmentInfo/getPhoto/${departmentsInformationItem.img}" />
                                                        <img id="imagePreview" src="${getPhoto}" alt="Profile Photo" style="width:620px ;height:330px"/>
                                                    </div>
                                                    <center>
                                                        <label>Title : ${departmentsInformationItem.title}</label>
                                                    </center>
                                                </div>
                                                <div class="col-md-10 col-md-offset-1">

                                                    <p>${departmentsInformationItem.details}</p> 
                                                    <center>
                                                        <a href="<c:url value="/"/>main/departmentInfo" class="btn btn-info">Back </a>
                                                    </center>
                                                </div>

                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>  
                            </div>
                        </div>
                    </c:if>


                </div>
            </div> 
        </div> 

        <!-- Modal -->
        <div class="modal fade" id="myModal" role="dialog" data-keyboard="false" data-backdrop="static">
            <div class="modal-dialog modal-lg">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Edit (Department)</h4>
                    </div>
                    <div class="modal-body">                    
                        <form action="<c:url value="/main/departmentInfo/editdepartmentInfo"/>" method="post" id="addnew">
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="input-group">
                                            <span class="input-group-addon" id="basic-addon1">Title</span>
                                            <div>                                                                
                                                <input type="text" class="form-control" id="title" name="title" >
                                                <input type="hidden" id="id" name="id">
                                                <input type="hidden" id="img" name="img">
                                                <input type="hidden" id="department" name="department">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <select class="form-control" id="status" name="status" readonly="true">
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
                                                <input type="date" class="form-control" id="date" name="date" readonly="true">
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
                                <center>
                                    <button type="submit" class="btn btn-success" id="edit">Save</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="<c:url value="/"/>main/departmentInfo/delete/${departmentId}" class="btn btn-danger"> Delete</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <button type="button" class="btn btn-default" data-dismiss="modal" onclick="javascript:window.location.reload()">Cancel</button>
                                </center>
                            </div>
                            <script>
                                CKEDITOR.replace('details');
                            </script>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script type="text/javascript">
            $('#myModal').on('show.bs.modal', function (modelbutton) {
                var button = $(modelbutton.relatedTarget);
                var id = button.data('id2');
                var title = button.data('title2');
                var status = button.data('status2');
                var img = button.data('img2');
                var date = button.data('date2');
                var details = button.data('details2');
                var detailsNew = '<p>' + details + '</p>\r\n';

                document.getElementById("id").value = id;
                document.getElementById("title").value = title;
                document.getElementById("status").value = status;
                document.getElementById("img").value = img;
                document.getElementById("date").value = date;
                CKEDITOR.instances['details'].setData(detailsNew);
            });
        </script>
        <script>
        $("#edit").click(function () {
            var messageLength = CKEDITOR.instances['details'].getData().replace(/<[^>]*>/gi, '').trim().length;
            var title = $('#title').val();
            if (!messageLength || !title) {
                alert('Please Enter All Box');
                $("#edit").stop();
                $("#edit").prop('disabled', true);
            }
        });
        $("#title").keyup(function () {
            var messageLength = CKEDITOR.instances['details'].getData().replace(/<[^>]*>/gi, '').trim().length;
            var title = $('#title').val();
            if (!messageLength || !title) {
                $("#edit").prop('disabled', true);
            } else {
                $("#edit").prop('disabled', false);
            }
        });

        CKEDITOR.instances['details'].on('change', function (e) {
            var messageLength = CKEDITOR.instances['details'].getData().replace(/<[^>]*>/gi, '').trim().length;
            var title = $('#title').val();
            if (!messageLength || !title) {
                $("#edit").prop('disabled', true);
            } else {
                $("#edit").prop('disabled', false);
            }
        });
    </script>
    </body>
</html>
