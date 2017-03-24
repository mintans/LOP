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
        <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.9.1/jquery.tablesorter.min.js"></script>

        <script src="<c:url value="/"/>view/template/js/bootstrap.min.js" ></script>
        <script src="<c:url value="/"/>js/app.js"></script>

        <script src="<c:url value="/"/>js/sortTable/jquery-latest.js" type="text/javascript"></script>
        <script src="<c:url value="/"/>js/sortTable/jquery.tablesorter.js" type="text/javascript"></script>
        <link href="<c:url value="/"/>js/sortTable/themes/blue/style.css" rel="stylesheet" type="text/css"/>

        <script type="text/javascript">
            $(function () {
                $("table").tablesorter({debug: true});
            });
        </script>
        <script>
            function autoID(pList) {
                if (pList === "") {
                    document.getElementById("id").value = "P001";
                } else {
                    var num = pList.substring(2);
                    var numid = parseInt(num) + 1;
                    var pid;
                    if (numid < 10) {
                        pid = "P00" + numid;
                    } else if (numid < 100) {
                        pid = "P0" + numid;
                    } else {
                        pid = "P" + numid;
                    }
                    document.getElementById("id").value = pid;
                }
            }
        </script>

        <title>Position</title>
    </head>
    <body onload="autoID('${positionId}')">
        <div class="container-fluid">            
            <div class="row">
                <%@ include file="/WEB-INF/jsp/header.jsp" %>               
            </div>
            <nav class="breadcrumb">
                <span class="breadcrumb-item active">Position</span> /
            </nav>

            <div class="container" style="width: 70%">
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-primary">
                            <div class="panel-heading col-md-12">
                                <div class="col-md-12" align="left">
                                    <h4 class="panel-title">Position</h4>
                                </div>
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <label>

                                        </label>
                                    </div>
                                    <div class="col-md-9">
                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">Add Position</button>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="input-group">
                                            <input type="text" class="form-control" placeholder="Search" id="positionInput"onkeyup="PositionSearchFunction()">
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
                                                <div class="form-horizontal">
                                                    <form method="POST" action="<c:url value="/main/position/"/>save">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" onclick="javascript:window.location.reload()" data-dismiss="modal">&times;</button>
                                                            <h4 class="modal-title">Add Position</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="form-group">
                                                                <label for="positionId" class="col-md-3 control-label" align="right">ID : </label>
                                                                <div class="col-md-7">
                                                                    <input type="text" class="form-control" id="id" name="id" readonly="true" required="true">
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="Position" class="col-md-3 control-label" align="right">Position : </label>
                                                                <div class="col-md-7">
                                                                    <input type="text" class="form-control" id="position" name="position" required="true">
                                                                </div>
                                                            </div>

                                                            <div class="form-group">
                                                                <label for="Description" class="col-md-3 control-label" align="right">Description :</label>
                                                                <div class="col-md-7">
                                                                    <textarea style="overflow:auto;resize:none" rows="5" cols="5" class="form-control" id="description" name="description" required="true"></textarea>
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
                                <div style="height:342px;overflow:auto;">
                                    <table id="positionTable" class="table table-bordered">
                                        <thead>
                                            <tr class="bg-primary">
                                                <th><div align="center">No.</div></th>
                                                <th><div align="center">ID</div></th>
                                                <th><div align="center">Position</div></th>
                                                <th><div align="center">Description</div></th>
                                                <th><div align="center">Option</div></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:set var="countNo" value="1" scope="page"/>
                                            <c:forEach var="positionList" items="${positionList}">
                                                <tr>
                                                    <td align="center">${countNo}</td>
                                                    <td align="center">${positionList.id}</td>
                                                    <td align="center">${positionList.position}</td>
                                                    <td align="center">${positionList.description}</td>
                                                    <td align="center">
                                                        <button type="button" class="btn btn-warning" id="btnEdit" 
                                                                data-toggle="modal" data-target="#myModal"
                                                                data-index="${countNo}"
                                                                data-id="${positionList.id}"
                                                                data-position="${positionList.position}"
                                                                data-description="${positionList.description}"
                                                                >Edit</button>
                                                        <button type="button" class="btn btn-danger" onclick="confirmDelete('${positionList.id}')">Delete</button>
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
            </div>
            <script type="text/javascript">
                $('#positionTable').find('#btnEdit').click(function () {
                    $(".modal-title").html("Edit Position");
                    $(".modal-footer").find('.btn-primary').html("Save");
                    $(".modal-footer").find('.btn-primary').attr('class', 'btn btn-success')
                    var positionItemId = $(this).attr('data-id');
                    var positionItemPosition = $(this).attr('data-position');
                    var positionItemDescription = $(this).attr('data-description');
                    $(".modal-body #id").val(positionItemId);
                    $(".modal-body #position").val(positionItemPosition);
                    $(".modal-body #description").val(positionItemDescription);
                });
            </script>
            <script type="text/javascript">
                function PositionSearchFunction() {
                    var input, filter, table, tr, td, i, td1;
                    input = document.getElementById("positionInput");
                    filter = input.value.toUpperCase();
                    table = document.getElementById("positionTable");
                    tr = table.getElementsByTagName("tr");
                    for (i = 0; i < tr.length; i++) {
                        td = tr[i].getElementsByTagName("td")[1];
                        td1 = tr[i].getElementsByTagName("td")[2];
                        if (td || td1) {
                            if (td.innerHTML.toUpperCase().indexOf(filter) > -1 || td1.innerHTML.toUpperCase().indexOf(filter) > -1) {
                                tr[i].style.display = "";
                            } else {
                                tr[i].style.display = "none";
                            }
                        }
                    }
                }
            </script>

            <script type="text/javascript">
                function confirmDelete(positionId) {
                    if (window.confirm('Are you sure you want to delete?')) {
                        document.location = '<c:url value="/"/>main/position/delete/' + positionId;
                    } else
                    {
                        document.location.reload();
                    }
                }
            </script>
    </body>
</html>
