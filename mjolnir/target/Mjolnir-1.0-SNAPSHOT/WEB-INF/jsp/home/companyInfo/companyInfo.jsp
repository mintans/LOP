<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>

<html>
    <head>
        <title>Company Info</title>
        <script src="//cdn.ckeditor.com/4.6.1/full/ckeditor.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous"/>
        <link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.16/themes/base/jquery-ui.css" type="text/css" media="all">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous"/>
        <script src=https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
        <script src="<c:url value="/"/>js/home/companyInfo.js"></script>
        <script src="https://cdn.jsdelivr.net/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.min.js"></script>
        <script src="<c:url value="/"/>js/header.js"></script>
    </head>
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

    <body>

        <div class="container-fluid">

            <div class="row">
                <%@ include file="/WEB-INF/jsp/header.jsp" %>
            </div>
            <nav class="breadcrumb">
                <a class="breadcrumb-item" href="home">Mjolnir</a> / 
                <span class="breadcrumb-item active">Company Info</span>
            </nav>

            <div class="container" style="width: 100%">
                <div class="row">
                    <div class="col-md-2">
                        <div class="panel panel-default">
                            <!--<div class="panel-heading"></div>-->
                            <div class="panel-body">
                                <ul class="nav nav-pills nav-stacked">
                                    <li role="presentation"><a href="<c:url value="/main/home"/>">News Info</a></li>
                                    <li role="presentation" class="active"><a href="<c:url value="/main/companyInfo"/>">Company Info</a></li>
                                    <li role="presentation"><a href="<c:url value="/main/departmentInfo"/>">Department Info</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-10">
                        <!--Admin's permission-->                            
                        <c:if test="${userInfo.user.permission == 'ADMIN'}">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Company Info</h3>
                                </div>
                                <div class="panel-body">                                    
                                    <c:forEach var="CompanyInformationItem" items="${CompanyInformationList}">
                                        <div class="col-md-4">
                                            <div class="panel panel-default">
                                                <div class="thumbnail">
                                                    <c:url var="getPhoto" value="companyInfo/getPhoto/${CompanyInformationItem.img}" />
                                                    <img id="imagePreview" src="${getPhoto}" alt="Profile Photo" style="width:280px ;height:130px"/>
                                                </div>
                                                <p><b>&nbsp;&nbsp;&nbsp;&nbsp;Title : </b>
                                                    <a href="<c:url value="/"/>main/companyInfo/showdetails/${CompanyInformationItem.id}"> ${CompanyInformationItem.title}</a></p>
                                                <p><b>&nbsp;&nbsp;&nbsp;&nbsp;Company : </b>${CompanyInformationItem.date}</p>
                                                <p style="width: 250px;white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">
                                                    <b>&nbsp;&nbsp;&nbsp;&nbsp;Details : </b>${CompanyInformationItem.details}</p>
                                            </div>
                                        </div>
                                    </c:forEach>                                    
                                </div>  
                            </div>

                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h4 class="panel-title">All Company Info</h4>
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-9">
                                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">Add News</button>
                                        </div>

                                        <div class="col-md-3">
                                            <div class="input-group">
                                                <input type="text" class="form-control" placeholder="Search" onkeyup="allSearchFunction()" id="input">
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-search"></span>
                                                </span>
                                            </div>                                        
                                        </div>

                                        <div class="col-md-12">
                                            <br>
                                            <table class="table table-hover" style="table-layout:fixed;" id="allcompany">
                                                <tbody>
                                                    <c:forEach var="CompanyInformationItem2" items="${CompanyInformationAll}">
                                                        <tr>
                                                            <td align="center" style="width: 10%">${CompanyInformationItem2.date}</td>
                                                            <td align="center" style="width: 20%">${CompanyInformationItem2.title}</td>
                                                            <td style="width: 53%;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;">${CompanyInformationItem2.details}</td>
                                                            <td align="center" style="width: 17%">
                                                                <a href="<c:url value="/"/>main/companyInfo/showdetails/${CompanyInformationItem2.id}" class="btn btn-success"> Show</a>
                                                                <a href="<c:url value="/"/>main/companyInfo/delete/${CompanyInformationItem2.id}" class="btn btn-danger"> Delete</a>
                                                            </td>
                                                        </tr>
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
                                                        <h4 class="modal-title">Add News (Company)</h4>
                                                    </div>
                                                    <div class="modal-body">

                                                        <div class="form-group">
                                                            <label for="id" class="col-md-3 control-label">Insert an Image:</label>
                                                            <div class="row">
                                                                <div class="col-md-2">
                                                                    <div class="thumbnail">
                                                                        <c:url var="getPhoto" value="companyInfo/getPhoto/photoDefault1" />
                                                                        <img id="img1"src="${getPhoto}" alt="Profile Photo" style="width:100%"/>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-2">
                                                                    <div class="thumbnail">
                                                                        <c:url var="getPhoto" value="companyInfo/getPhoto/photoDefault2" />
                                                                        <img id="img2" src="${getPhoto}" alt="Profile Photo" style="width:100%"/>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-2">
                                                                    <div class="thumbnail">
                                                                        <c:url var="getPhoto" value="companyInfo/getPhoto/photoDefault3" />
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

                                                        <form action="companyInfo/addcompanyInfo" method="post" id="addnew">
                                                            <div class="form-group">
                                                                <div class="row">
                                                                    <div class="col-md-4">                                                                        
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon" id="basic-addon1">Title</span>
                                                                            <div>                                                                
                                                                                <input type="text" class="form-control" id="title" name="title" required="true">
                                                                                <input type="hidden" value="photoDefault1" id="img" name="img">
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-4">
                                                                        <div class="form-group">
                                                                            <select class="form-control" id="status" name="status">
                                                                                <option value="News">News</option>
                                                                                <option value="Conference">Conference</option>
                                                                                <option value="Event">Event</option>                                                                                    
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
                                                                <label for="message-text" class="control-label">Details :</label>
                                                                <textarea class="form-control" id="details" name="details"></textarea>
                                                            </div>

                                                            <div class="modal-footer">
                                                                <button type="submit" class="btn btn-primary" id="add">Add News</button>                                                                
                                                                <a href="<c:url value="/"/>main/companyInfo/clearTable/" class="btn btn-default">Cancel</a>
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
                        </c:if>
                        
                        <!--Employ's permission-->                            
                        <c:if test="${userInfo.user.permission == 'EMPLOYEE'}">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Company Info</h3>
                                </div>
                                <div class="panel-body">                                    
                                    <c:forEach var="CompanyInformationItem" items="${CompanyInformationList}">
                                        <div class="col-md-4">
                                            <div class="panel panel-default">
                                                <div class="thumbnail">
                                                    <c:url var="getPhoto" value="companyInfo/getPhoto/${CompanyInformationItem.img}" />
                                                    <img id="imagePreview" src="${getPhoto}" alt="Profile Photo" style="width:280px ;height:130px"/>
                                                </div>
                                                <p><b>&nbsp;&nbsp;&nbsp;&nbsp;Title : </b>
                                                    <a href="<c:url value="/"/>main/companyInfo/showdetails/${CompanyInformationItem.id}"> ${CompanyInformationItem.title}</a></p>
                                                <p><b>&nbsp;&nbsp;&nbsp;&nbsp;Company : </b>${CompanyInformationItem.date}</p>
                                                <p style="width: 250px;white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">
                                                    <b>&nbsp;&nbsp;&nbsp;&nbsp;Details : </b>${CompanyInformationItem.details}</p>
                                            </div>
                                        </div>
                                    </c:forEach>                                    
                                </div>  
                            </div>

                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h4 class="panel-title">All Company Info</h4>
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-9">                                            
                                        </div>

                                        <div class="col-md-3">
                                            <div class="input-group">
                                                <input type="text" class="form-control" placeholder="Search" onkeyup="allSearchFunction()" id="input">
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-search"></span>
                                                </span>
                                            </div>                                        
                                        </div>

                                        <div class="col-md-12">
                                            <br>
                                            <table class="table table-hover" style="table-layout:fixed;" id="allcompany">
                                                <tbody>
                                                    <c:forEach var="CompanyInformationItem2" items="${CompanyInformationAll}">
                                                        <tr>
                                                            <td align="center" style="width: 10%">${CompanyInformationItem2.date}</td>
                                                            <td align="center" style="width: 20%">${CompanyInformationItem2.title}</td>
                                                            <td style="width: 53%;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;">${CompanyInformationItem2.details}</td>
                                                            <td align="center" style="width: 17%">
                                                                <a href="<c:url value="/"/>main/companyInfo/showdetails/${CompanyInformationItem2.id}" class="btn btn-success"> Show</a>                                                                
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <br>
                                </div>
                            </div>
                        </c:if>
                    </div>                       
                </div>
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
                        url: 'companyInfo/upload',
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

    <script type="text/javascript">
        $(document).ready(function () {
            var now = new Date();
            var day = ("0" + now.getDate()).slice(-2);
            var month = ("0" + (now.getMonth() + 1)).slice(-2);
            var today = now.getFullYear() + "-" + (month) + "-" + (day);
            $('#date').val(today);
        });
    </script>

    <script type="text/javascript">
        $('#status').on('change', function () {
            var now = new Date();
            var day = ("0" + now.getDate()).slice(-2);
            var month = ("0" + (now.getMonth() + 1)).slice(-2);
            var today = now.getFullYear() + "-" + (month) + "-" + (day);


            if (this.value === 'Conference' || this.value === 'Event') {
                $('#date').attr('readonly', false);
                var today2 = new Date().toISOString().split('T')[0];
                $('#date').attr('min', today2);
            }
            if (this.value === 'News') {
                $('#date').attr('readonly', true);
                $('#date').val(today);
            }
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

</script>
</body>
</html>
