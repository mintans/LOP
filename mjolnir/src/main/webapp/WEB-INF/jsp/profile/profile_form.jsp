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
        <script src="<c:url value="/"/>js/profile/profile.js"></script>
        <script src="<c:url value="/"/>js/sortTable/jquery-latest.js" type="text/javascript"></script>
        <script src="<c:url value="/"/>js/sortTable/jquery.tablesorter.js" type="text/javascript"></script>
        <link href="<c:url value="/"/>js/sortTable/themes/blue/style.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript">
            $(function () {
                $("table").tablesorter({debug: true});
            });
        </script>

        <title>Profile</title>
    </head>
    <body>
        <div class="container-fluid">            
            <div class="row">
                <%@ include file="/WEB-INF/jsp/header.jsp" %>               
            </div>
            <nav class="breadcrumb">
<!--                <a class="breadcrumb-item" href="<c:url value="/main/profile"/>">Profile</a> / -->
                <span class="breadcrumb-item active">Profile</span> /
            </nav>


            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading col-md-12">
                            <div class="col-md-2" align="left">
                                <h4 class="panel-title">Profile</h4>
                            </div>
                        </div>
                        <div class="row"></div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-2">
                                    <form>
                                        <table align="right"  style="width: 100%">
                                            <td>
                                                <select id="sortBy" name="sortBy" class="form-control input-md" onchange="SortByOption()">
                                                    <option selected="Sort By" value="tableNo">Sort By</option>
                                                    <option value="tableId">ID</option>
                                                    <option value="tableStartWork">Start Date</option>
                                                    <option value="tableFName">Name</option>
                                                    <option value="reverseTableStartWork">New Employee</option>
                                                    <option value="tableOption">Empty Profile</option>
                                                </select>
                                            </td>
                                        </table>
                                    </form>
                                </div>
                                <div class="col-md-offset-3 col-md-2">
                                    <form>
                                        <table align="right"  style="width: 100%">
                                            <td>
                                                <select id="employment" name="employment" class="form-control input-md" onchange="SearchByEmployment()">
                                                    <option value="Employment">Employment</option>
                                                    <c:forEach var="employmentTypeList" items="${employmentTypeList}">
                                                        <option value="${employmentTypeList.employmentTypeName}">${employmentTypeList.employmentTypeName}</option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                        </table>
                                    </form>
                                </div>
                                <div class="col-md-2">
                                    <form>
                                        <c:set var="employmentStatusArray" value="" scope="page"/>
                                        <c:forEach var="userItem" items="${userList}">
                                            <c:set var="employmentStatus" value=""></c:set>
                                            <c:forEach var="employmentList" items="${employmentList}">
                                                <c:if test="${employmentList.profileId == userItem.id}">
                                                    <c:set var="employmentStatus" value="${employmentList.profileId}|${employmentList.action}," scope="page"></c:set>
                                                </c:if>
                                            </c:forEach>
                                            <c:set var="employmentStatusArray" value="${employmentStatusArray}${employmentStatus}" scope="page"></c:set>
                                        </c:forEach>
                                        <table align="right" style="width: 100%">
                                            <td>
                                                <select id="status" name="status" class="form-control input-md" onchange="SearchByStatus('${employmentStatusArray}')">
                                                    <option selected="Status">Status</option>
                                                    <option value="เริ่มงาน">เริ่มงาน</option>
                                                    <option value="เปลี่ยนสถานะ">เปลี่ยนสถานะ</option>
                                                    <option value="บริษัทส่งศึกษาต่อ">บริษัทส่งศึกษาต่อ</option>
                                                    <option value="ลาออก">ลาออก</option>
                                                    <option value="เลิกจ้าง">เลิกจ้าง</option>
                                                </select>
                                            </td>
                                        </table>
                                    </form>
                                </div>
                                <div class="col-md-3">
                                    <form>
                                        <div class="input-group">
                                            <input type="text" class="form-control" placeholder="Search" id="searchInput" onkeyup="ProfileSearchFunction()">
                                            <div class="input-group-btn">
                                                <button class="btn btn-primary" type="submit">
                                                    <i class="glyphicon glyphicon-search"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <br>
                            <c:if test="${empty profileList}">
                                <p align="center">ยังไม่มีการเพิ่มข้อมูล</p>
                            </c:if>
                            <div style="height:542px;overflow:auto;">
                                <table id="profileTable" class="table sort-table table-bordered">
                                    <thead>
                                        <tr class="bg-primary">
                                            <th id="tableNo"><div align="center">No.</div></th>
                                            <th id="tableId"><div align="center">ID</div></th>
                                            <th><div align="center">Title</div></th>
                                            <th id="tableFName"><div align="center">First Name</div></th>
                                            <th><div align="center">Last Name</div></th>
                                            <th><div align="center">Position</div></th>
                                            <th><div align="center">EmpType</div></th>
                                            <th><div align="center">E-mail</div></th>
                                            <th id="tableOption"><div align="center">Option</div></th>
                                            <th id="tableStartWork" hidden="true"><div align="center">StartWorkDate</div></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:set var="countNo" value="1" scope="page"/>
                                        <c:forEach var="userItem" items="${userList}">
                                            <tr>
                                                <td align="center">${countNo}</td>
                                                <td align="center">${userItem.id}</td>
                                                <td align="center">
                                                    <c:forEach var="profileList" items="${profileList}">
                                                        <c:if test="${profileList.id == userItem.id}">
                                                            <c:if test="${profileList.title == 1}">นาย</c:if>
                                                            <c:if test="${profileList.title == 2}">นาง</c:if>
                                                            <c:if test="${profileList.title == 3}">นางสาว</c:if>
                                                        </c:if>

                                                    </c:forEach></td>
                                                <td align="center">
                                                    <c:forEach var="profileList" items="${profileList}">
                                                        <c:if test="${profileList.id == userItem.id}">
                                                            ${profileList.firstName}
                                                        </c:if>
                                                    </c:forEach></td>
                                                <td align="center">
                                                    <c:forEach var="profileList" items="${profileList}">
                                                        <c:if test="${profileList.id == userItem.id}">
                                                            ${profileList.lastName}
                                                        </c:if>
                                                    </c:forEach></td>
                                                <td align="center">
                                                    <c:set var="position" value=""></c:set>
                                                    <c:forEach var="transferList" items="${transferList}">
                                                        <c:if test="${transferList.profileId == userItem.id}">
                                                            <c:set var="position" value="${transferList.position}" scope="page"></c:set>
                                                        </c:if>
                                                    </c:forEach>
                                                    ${position}</td>
                                                <td align="center">
                                                    <c:set var="employmentType" value=""></c:set>
                                                    <c:forEach var="employmentList" items="${employmentList}">
                                                        <c:if test="${employmentList.profileId == userItem.id}">
                                                            <c:set var="employmentType" value="${employmentList.type}" scope="page"></c:set>
                                                        </c:if>
                                                    </c:forEach>
                                                    ${employmentType}</td>
                                                <td align="center">${userItem.email}</td>
                                                <td align="center">
                                                    <c:set var="ck" value="0"></c:set>
                                                    <c:forEach var="profileList" items="${profileList}">
                                                        <c:if test="${profileList.id == userItem.id}">
                                                            <c:set var="ck" value="1"></c:set>
                                                        </c:if>

                                                    </c:forEach>

                                                    <c:if test="${ck != 1}">
                                                        <a href="<c:url value="/"/>main/profile/addFormTH?uId=${userItem.id}" class="btn btn-primary">add profile</a>                                                      
                                                    </c:if>
                                                    <c:if test="${ck == 1}" >
                                                        <a href="<c:url value="/"/>main/information/view/${userItem.id}"class="btn btn-info">Detail</a>        
                                                        <button type="button" class="btn btn-danger" onclick="confirmDelete('${userItem.id}')">Delete</button>
                                                    </c:if>
                                                </td>
                                                <td align="center" hidden="true">${userItem.startWorkDate}</td>
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
            function confirmDelete(profileId) {
                if (window.confirm('Are you sure you want to delete?')){
                    document.location = '<c:url value="/"/>main/profile/delete/' + profileId;
                } else
                {
                    document.location.reload();
                }
            }
        </script>
    </body>
</html>
