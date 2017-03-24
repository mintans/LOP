<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="<c:url value="/"/>view/template/css/bootstrap.min.css" />
        <link rel="stylesheet" href="<c:url value="/"/>view/template/css/bootstrap-theme.min.css" />
        <script src=https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js></script>
        <script src="<c:url value="/"/>view/template/js/bootstrap.min.js" ></script>
        <script src="<c:url value="/"/>js/app.js"></script>
        <title>Information view</title>
    </head>
    <body onload="myFunction()">
        <div class="container-fluid">
            <div class="row">
                <%@ include file="/WEB-INF/jsp/header.jsp" %>
            </div>
            <nav class="breadcrumb">
                <c:forEach var="profileItem" items="${profileList}">
                    <c:if test="${profileid == profileItem.id}">
                        <a class="breadcrumb-item" href="<c:url value="/main/profile"/>">Profile</a> / 
                        <a class="breadcrumb-item" href="<c:url value="/"/>main/profile/viewTH/${profileItem.id}"/>${profileItem.id}</a> / 
                        <span class="breadcrumb-item active">information</span>
                    </c:if>
                </c:forEach>
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
                                <h4 class="panel-title">Information</h4>
                            </div>
                        </div>
                        <div class="panel-body">
                            <c:forEach var="profileItem" items="${profileList}">
                                <c:if test="${profileid == profileItem.id}">
                                    <div class="row">
                                        <label>

                                        </label>
                                    </div>
                                    <div class="form-horizontal col-md-12">
                                        <form>
                                            <div class="row">
                                                <div class="form-group col-md-5">
                                                    <label for="id" class="col-md-5 control-label" align="right">รหัสพนักงาน : </label>
                                                    <div class="col-md-7">
                                                        <input type="text" class="form-control" value="${profileItem.id}" readonly="true">
                                                    </div>
                                                </div>
                                                <div class="form-group col-md-5">
                                                    <label for="status" class="col-md-5 control-label" align="right">สถานะ : </label>
                                                    <div class="col-md-7">
                                                        <input type="text" class="form-control" value="${employmentStatus}" readonly="true">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="form-group col-md-5">
                                                    <label for="firstName" class="col-md-5 control-label" align="right">ชื่อ : </label>
                                                    <div class="col-md-7">
                                                        <input type="text" class="form-control" value="${profileItem.firstName}" readonly="true">
                                                    </div>
                                                </div>
                                                <div class="form-group col-md-5">
                                                    <label for="lastName" class="col-md-5 control-label" align="right">นามสกุล : </label>
                                                    <div class="col-md-7">
                                                        <input type="text" class="form-control" value="${profileItem.lastName}" readonly="true">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="form-group col-md-5">
                                                    <label for="nickName" class="col-md-5 control-label" align="right">ชื่อเล่น : </label>
                                                    <div class="col-md-7">
                                                        <input type="text" class="form-control" value="${profileItem.nickName}" readonly="true">
                                                    </div>
                                                </div>
                                                <div class="form-group col-md-5">
                                                    <label for="Age" class="col-md-5 control-label" align="right">อายุ : </label>
                                                    <div class="col-md-3">
                                                        <input type="text" class="form-control" value="${profileItem.age}" readonly="true">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="form-group col-md-5">
                                                    <label for="Phone" class="col-md-5 control-label" align="right">โทรศัพท์มือถือ : </label>
                                                    <div class="col-md-7">
                                                        <input type="text" class="form-control" value="${profileItem.mobile}" readonly="true">
                                                    </div>
                                                </div>
                                                <div class="form-group col-md-5">
                                                    <label for="Email" class="col-md-5 control-label" align="right">Email : </label>
                                                    <div class="col-md-7">
                                                        <input type="text" class="form-control" value="${profileItem.email}" readonly="true">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="form-group col-md-5">
                                                    <label for="personCaseEmergencyFirstname" class="col-md-5 control-label" align="right">บุคคลที่ติดต่อได้ : </label>
                                                    <div class="col-md-7">
                                                        <input type="text" class="form-control" value="${profileItem.personCaseEmergencyFirstname}" readonly="true">
                                                    </div>
                                                </div>
                                                <div class="form-group col-md-5">
                                                    <label for="personCaseEmergencyLastname" class="col-md-5 control-label" align="right">นามสกุล : </label>
                                                    <div class="col-md-7">
                                                        <input type="text" class="form-control" value="${profileItem.personCaseEmergencyLastname}" readonly="true">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="form-group col-md-5">
                                                    <label for="personCaseEmergencyPhone" class="col-md-5 control-label" align="right">โทรศัพท์มือถือ : </label>
                                                    <div class="col-md-7">
                                                        <input type="text" class="form-control" value="${profileItem.relatedApplicantTel}" readonly="true">
                                                    </div>
                                                </div>
                                                <div class="form-group col-md-5">
                                                    <label for="relatedApplicant" class="col-md-5 control-label" align="right">ความสัมพันธ์ : </label>
                                                    <div class="col-md-7">
                                                        <input type="text" class="form-control" value="${profileItem.relatedApplicant}" readonly="true">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="form-group col-md-5">
                                                    <label for="startWorking" class="col-md-5 control-label" align="right">วันที่เริ่มทำงาน : </label>
                                                    <div class="col-md-7">
                                                        <input type="text" class="form-control" id="startWorking" readonly="true">
                                                    </div>
                                                </div>
                                                <div class="form-group col-md-5">
                                                    <label for="ageOfWork" class="col-md-5 control-label" align="right">อายุงาน : </label>
                                                    <div class="col-md-3">
                                                        <input type="text" class="form-control" id="ageWork" readonly="true">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="form-group col-md-5">
                                                    <label for="employment" class="col-md-5 control-label" align="right">การว่าจ้าง : </label>
                                                    <div class="col-md-7">
                                                        <input type="text" class="form-control" value="${employmentType}" readonly="true">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="form-group col-md-5">
                                                    <label for="department" class="col-md-5 control-label" align="right">แผนก : </label>
                                                    <div class="col-md-7">
                                                        <input type="text" class="form-control" value="${userItem.departmentName}" readonly="true">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="form-group col-md-5">
                                                    <label for="position" class="col-md-5 control-label" align="right">ตำแหน่ง : </label>
                                                    <div class="col-md-7">
                                                        <input type="text" class="form-control" value="${position}" readonly="true">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="form-group col-md-5">
                                                    <label for="education" class="col-md-5 control-label" align="right">การศึกษา :</label>
                                                    <div class="col-md-7">
                                                        <input type="text" class="form-control" value="${educationMajor}" readonly="true">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="form-group col-md-5">
                                                    <label for="training" class="col-md-5 control-label" align="right">การอบรม :</label>
                                                    <div class="col-md-7">
                                                        <textarea style="overflow:auto;resize:none" rows="5" cols="5" class="form-control" value=""placeholder="What about this subject?" readonly="true"><c:forEach var="trainingRecordList" items="${trainingRecordList}"><c:if test="${profileid == trainingRecordList.profileId}">${trainingRecordList.subject}&#13;</c:if></c:forEach></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="form-group col-md-5">
                                                    <label for="caution" class="col-md-5 control-label" align="right">เงินเดือน :</label>
                                                    <div class="col-md-7">
                                                        <input type="text" class="form-control" value="${salary}" readonly="true">
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            function myFunction() {
                var startWorking = "${startWorkDate}";
                var startWorkingDate = new Date(startWorking);
                var startWorkingMonth = startWorkingDate.getMonth();

                var month = ["มกราคม", "กุมภาพันธ์", "มีนาคม", "เมษายน", "พฤษภาคม", "มิถุนายน",
                    "กรกฎาคม", "สิงหาคม", "กันยายน", "ตุลาคม", "พฤษจิกายน", "ธันวาคม"];

                var startWorkingDateChange = startWorkingDate.getDate() + ' ' + month[startWorkingMonth] + ' ' + (startWorkingDate.getFullYear()+543);
                document.getElementById("startWorking").value = startWorkingDateChange;

                var tmp = startWorking.split("-");
                var current = new Date();
                var current_year = current.getFullYear();
                document.getElementById("ageWork").value = current_year - tmp[0];
            }
        </script>
    </body>
</html>
