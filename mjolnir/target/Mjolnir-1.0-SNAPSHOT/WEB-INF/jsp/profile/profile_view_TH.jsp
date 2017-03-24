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
        <title>Profile view</title>
        <script src="http://www.datejs.com/build/date.js" type="text/javascript"></script>
        <script>
            function myFunction() {
                var startWorking = "${startWorkDate}";
                var startWorkingDate = new Date(startWorking);
                var startWorkingMonth = startWorkingDate.getMonth();

                var birthDay = "${profileItem.birth}";
                var birthDayDate = new Date(birthDay);
                var birthDayMonth = birthDayDate.getMonth();

                var cardnoExpiration = "${profileItem.cardnoExpiration}";
                var cardnoExpirationDate = new Date(cardnoExpiration);
                var cardnoExpirationMonth = cardnoExpirationDate.getMonth();

                var month = ["มกราคม", "กุมภาพันธ์", "มีนาคม", "เมษายน", "พฤษภาคม", "มิถุนายน",
                    "กรกฎาคม", "สิงหาคม", "กันยายน", "ตุลาคม", "พฤษจิกายน", "ธันวาคม"];

                var startWorkingDateChange = startWorkingDate.getDate() + ' ' + month[startWorkingMonth] + ' ' + (startWorkingDate.getFullYear()+543);
                var birthDayDateChange = birthDayDate.getDate() + ' ' + month[birthDayMonth] + ' ' + (birthDayDate.getFullYear()+543);
                var cardnoExpirationDateChange = cardnoExpirationDate.getDate() + ' ' + month[cardnoExpirationMonth] + ' ' + (cardnoExpirationDate.getFullYear()+543);
                document.getElementById("startWorking").value = startWorkingDateChange;
                document.getElementById("birthDay").value = birthDayDateChange;
                document.getElementById("cardnoExpiration").value = cardnoExpirationDateChange;
            }
        </script>
        <style>
            p.normal {
                border-bottom: 2px solid gray;
            }
        </style>
    </head>
    <body onload="myFunction()">
        <div class="container-fluid">
            <div class="row">
                <%@ include file="/WEB-INF/jsp/header.jsp" %>
            </div>

            <nav class="breadcrumb">
                <a class="breadcrumb-item" href="<c:url value="/main/profile"/>">Profile</a> / 
                <a class="breadcrumb-item" href="<c:url value="/"/>main/profile/viewTH/${profileid}"/>${profileid}</a> / 
                <span class="breadcrumb-item active">profile(thai)</span>
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
                            <div class="col-md-2" align="left" style="margin-top: 5px">
                                <h4 class="panel-title">Profile (Thai)</h4>
                            </div>
                            <div class="col-md-10" align="right">
                                <a href="<c:url value="/"/>main/profile/editFormTH/${profileid}" class="btn btn-sm btn-warning">Edit</a>
                            </div>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <label>

                                </label>
                            </div>
                            <div class="form-horizontal col-md-12">
                                <form>
                                    <div class="row">
                                        <label class="control-label col-md-12"><h4><p class="normal" align="left">&nbsp;&nbsp;&nbsp;ข้อมูลบุคคล</p></h4></label>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="id" class="col-md-6 control-label">รหัสพนักงาน</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${profileItem.id}" readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="startWorking" class="col-md-6 control-label">วันเริ่มทำงาน</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" id="startWorking"  readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="titleName" class="col-md-6 control-label">คำนำหน้า</label>
                                            <div class="col-md-6">
                                                <c:if test="${profileItem.title == 1}">
                                                    <input type="text" class="form-control" value="นาย" readonly="true">
                                                </c:if>
                                                <c:if test="${profileItem.title == 2}">
                                                    <input type="text" class="form-control" value="นาง" readonly="true">
                                                </c:if>
                                                <c:if test="${profileItem.title == 3}">
                                                    <input type="text" class="form-control" value="นางสาว" readonly="true">
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="firstName" class="col-md-6 control-label">ชื่อ</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${profileItem.firstName}" readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="lastName" class="col-md-6 control-label">นามสกุล</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${profileItem.lastName}" readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="nickName" class="col-md-6 control-label">ชื่อเล่น</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${profileItem.nickName}" readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="birthDay" class="col-md-6 control-label">วัน/เดือน/ปีเกิด</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" id="birthDay" readonly="true">
                                            </div>
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label for="age" class="col-md-3 control-label">อายุ</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${profileItem.age}" readonly="true">
                                            </div>
                                            <label class="col-md-1 control-label">ปี</label>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="cardno" class="col-md-6 control-label">บัตรประชาชนเลขที่</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${profileItem.cardno}" readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="cardnoExpiration" class="col-md-6 control-label">วันบัตรหมดอายุ</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" id="cardnoExpiration" readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-6" >
                                            <label for="height" class="col-md-9 control-label">ส่วนสูง</label>
                                            <div class="col-md-3">
                                                <input type="text" class="form-control" value="${profileItem.height}" readonly="true">
                                            </div>
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label for="weight" class="col-md-4 control-label">น้ำหนัก</label>
                                            <div class="col-md-7">
                                                <input type="text" class="form-control" value="${profileItem.weight}" readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-6">
                                            <label for="race" class="col-md-9 control-label">เชื้อชาติ</label>
                                            <div class="col-md-3">
                                                <input type="text" class="form-control" value="${profileItem.race}" readonly="true">
                                            </div>
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label for="nationality" class="col-md-4 control-label">สัญชาติ</label>
                                            <div class="col-md-7">
                                                <input type="text" class="form-control" value="${profileItem.nationality}" readonly="true">
                                            </div>
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label for="religion" class="col-md-4 control-label">ศาสนา</label>
                                            <div class="col-md-7">
                                                <input type="text" class="form-control" value="${profileItem.religion}" readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="bankAccount" class="col-md-6 control-label">บัญชีธนาคาร</label>
                                            <div class="col-md-6">
                                                <c:if test="${profileItem.bankAccount == 1}">
                                                    <input type="text" class="form-control" value="ธนาคารไทยพาณิชย์" readonly="true">
                                                </c:if>
                                                <c:if test="${profileItem.bankAccount == 2}">
                                                    <input type="text" class="form-control" value="ธนาคารกรุงไทย" readonly="true">
                                                </c:if>
                                                <c:if test="${profileItem.bankAccount == 3}">
                                                    <input type="text" class="form-control" value="ธนาคารกรุงเทพ" readonly="true">
                                                </c:if>
                                                <c:if test="${profileItem.bankAccount == 4}">
                                                    <input type="text" class="form-control" value="ธนาคารกสิกร" readonly="true">
                                                </c:if>
                                                <c:if test="${profileItem.bankAccount == 5}">
                                                    <input type="text" class="form-control" value="ธนาคารทหารไทย" readonly="true">
                                                </c:if>
                                                <c:if test="${profileItem.bankAccount == 6}">
                                                    <input type="text" class="form-control" value="ธนาคารกรุงศรีอยุธยา" readonly="true">
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="bankAccountNo" class="col-md-6 control-label">เลขที่บัญชี</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${profileItem.bankAccountNo}" readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="control-label col-md-12"><h4><p class="normal" align="left">&nbsp;&nbsp;&nbsp;ข้อมูลติดต่อ</p></h4></label>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7" align="right">
                                            <label for="registeredAddress" class="col-md-6"><u>ที่อยู่ตามทะเบียนบ้าน</u></label>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="houseNoRegistration" class="col-md-6 control-label">บ้านเลขที่</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${profileItem.houseNoRegistration}" readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="roadRegistration" class="col-md-6 control-label">ถนน</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${profileItem.roadRegistration}" readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="subDistrictRegistration" class="col-md-6 control-label">ตำบล/แขวง</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${profileItem.subDistrictRegistration}" readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="districtRegistration" class="col-md-6 control-label">อำเภอ/เขต</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${profileItem.districtRegistration}" readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="provinceRegistration" class="col-md-6 control-label">จังหวัด</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${provinceRegistrationTH}" readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="postCodeRegistration" class="col-md-6 control-label">รหัสไปรษณีย์</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${profileItem.postCodeRegistration}" readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <br>
                                        <div class="form-group col-md-7" align="right">
                                            <label for="currentAddress" class="col-md-6"><u>ที่อยู่ปัจจุบัน</u></label>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="houseNoCurrent" class="col-md-6 control-label">บ้านเลขที่</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${profileItem.houseNoCurrent}" readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="roadCurrent" class="col-md-6 control-label">ถนน</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${profileItem.roadCurrent}" readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="subDistrictCurrent" class="col-md-6 control-label">ตำบล/แขวง</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${profileItem.subDistrictCurrent}" readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="districtCurrent" class="col-md-6 control-label">อำเภอ/เขต</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${profileItem.districtCurrent}" readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="provinceCurrent" class="col-md-6 control-label">จังหวัด</label>
                                            <div class="col-md-6">
                                               <input type="text" class="form-control" value="${provinceCurrentTH}" readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="postCodeCurrent" class="col-md-6 control-label">รหัสไปรษณีย์</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${profileItem.postCodeCurrent}" readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="tel" class="col-md-6 control-label" align="right">โทรศัพท์</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${profileItem.tel}" readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="mobile" class="col-md-6 control-label" align="right">มือถือ</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${profileItem.mobile}" readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="Email" class="col-md-6 control-label" align="right">อีเมล์</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${profileItem.email}" readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="control-label col-md-12"><h4><p class="normal" align="left">&nbsp;&nbsp;&nbsp;คุณสมบัติเพิ่มเติม</p></h4></label>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="habitationType" class="col-md-6 control-label" align="right">ประเภทที่พัก</label>
                                            <div class="col-md-6">
                                                <c:if test="${profileItem.habitationType == 1}">
                                                    <input type="text" class="form-control" value="อาศัยกับครอบครัว" readonly="true">
                                                </c:if>
                                                <c:if test="${profileItem.habitationType == 2}">
                                                    <input type="text" class="form-control" value="บ้านตัวเอง" readonly="true">
                                                </c:if>
                                                <c:if test="${profileItem.habitationType == 3}">
                                                    <input type="text" class="form-control" value="บ้านเช่า" readonly="true">
                                                </c:if>
                                                <c:if test="${profileItem.habitationType == 4}">
                                                    <input type="text" class="form-control" value="หอพัก" readonly="true">
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="militaryStatus" class="col-md-6 control-label" align="right">สภาวะทางทหาร</label>
                                            <div class="col-md-6">
                                                <c:if test="${profileItem.militaryStatus == 1}">
                                                    <input type="text" class="form-control" value="ได้รับการยกเว้น" readonly="true">
                                                </c:if>
                                                <c:if test="${profileItem.militaryStatus == 2}">
                                                    <input type="text" class="form-control" value="ปลดเป็นทหารกองหนุน" readonly="true">
                                                </c:if>
                                                <c:if test="${profileItem.militaryStatus == 3}">
                                                    <input type="text" class="form-control" value="ยังไม่ได้รับการเกณฑ์" readonly="true">
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="marital" class="col-md-6 control-label" align="right">สถานะสมรส</label>
                                            <div class="col-md-6">
                                                <c:if test="${profileItem.marital == 1}">
                                                    <input type="text" class="form-control" value="โสด" readonly="true">
                                                </c:if>
                                                <c:if test="${profileItem.marital == 2}">
                                                    <input type="text" class="form-control" value="แต่งงานแล้ว" readonly="true">
                                                </c:if>
                                                <c:if test="${profileItem.marital == 3}">
                                                    <input type="text" class="form-control" value="หม้าย" readonly="true">
                                                </c:if>
                                                <c:if test="${profileItem.marital == 4}">
                                                    <input type="text" class="form-control" value="แยกกัน" readonly="true">
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="car" class="col-md-6 control-label" align="right">รถยนต์ส่วนตัว</label>
                                            <div class="col-md-6">
                                                <c:if test="${profileItem.car == true}">
                                                    <label class="radio-inline"><input checked type="radio" name="car" disabled="disabled">มี</label>
                                                    <label class="radio-inline"><input type="radio" name="car" disabled="disabled">ไม่มี</label>
                                                    </c:if>
                                                    <c:if test="${profileItem.car == false}">
                                                    <label class="radio-inline"><input type="radio" name="car" disabled="disabled">มี</label>
                                                    <label class="radio-inline"><input checked type="radio" name="car" disabled="disabled">ไม่มี</label>
                                                    </c:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="carDrivingNo" class="col-md-6 control-label" align="right">ใบขับขี่เลขที่</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${profileItem.carDrivingNo}" readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="motorcycle" class="col-md-6 control-label" align="right">รถจักรยานยนต์ส่วนตัว</label>
                                            <div class="col-md-6">
                                                <c:if test="${profileItem.motorcycle == true}">
                                                    <label class="radio-inline"><input checked type="radio" name="motorcycle" disabled="disabled">มี</label>
                                                    <label class="radio-inline"><input type="radio" name="motorcycle" disabled="disabled">ไม่มี</label>
                                                    </c:if>
                                                    <c:if test="${profileItem.motorcycle == false}">
                                                    <label class="radio-inline"><input type="radio" name="motorcycle" disabled="disabled">มี</label>
                                                    <label class="radio-inline"><input checked type="radio" name="motorcycle" disabled="disabled">ไม่มี</label>
                                                    </c:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="motorcycleDrivingNo" class="col-md-6 control-label" align="right">ใบขับขี่เลขที่</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${profileItem.motorcycleDrivingNo}" readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-10">
                                            <label for="workUpCountry" class="col-md-4 control-label" align="right">ปฏิบัติงานต่างจังหวัด</label>
                                            <div class="col-md-8">
                                                <c:if test="${profileItem.workUpCountry == 1}">
                                                    <div class="col-md-7">
                                                        <label class="radio-inline"><input checked type="radio" name="workUpCountry" disabled="disabled">ได้</label>
                                                        <label class="radio-inline"><input type="radio" name="workUpCountry" disabled="disabled">ไม่ได้</label>
                                                        <label class="radio-inline"><input type="radio" name="workUpCountry" disabled="disabled">อื่นๆ ระบุ</label>
                                                    </div>
                                                    <div class="col-md-5">
                                                        <input type="text" class="form-control" value="${profileItem.workUpCountryMention}" readonly="true">
                                                    </div>
                                                </c:if>
                                                <c:if test="${profileItem.workUpCountry == 2}">
                                                    <div class="col-md-7">
                                                        <label class="radio-inline"><input type="radio" name="workUpCountry" disabled="disabled">ได้</label>
                                                        <label class="radio-inline"><input checked type="radio" name="workUpCountry" disabled="disabled">ไม่ได้</label>
                                                        <label class="radio-inline"><input type="radio" name="workUpCountry" disabled="disabled">อื่นๆ ระบุ</label>
                                                    </div>
                                                    <div class="col-md-5">
                                                        <input type="text" class="form-control" value="${profileItem.workUpCountryMention}" readonly="true">
                                                    </div>
                                                </c:if>
                                                <c:if test="${profileItem.workUpCountry == 3}">
                                                    <div class="col-md-7">
                                                        <label class="radio-inline"><input type="radio" name="workUpCountry" disabled="disabled">ได้</label>
                                                        <label class="radio-inline"><input type="radio" name="workUpCountry" disabled="disabled">ไม่ได้</label>
                                                        <label class="radio-inline"><input checked type="radio" name="workUpCountry" disabled="disabled">อื่นๆ ระบุ</label>
                                                    </div>
                                                    <div class="col-md-5">
                                                        <input type="text" class="form-control" value="${profileItem.workUpCountryMention}" readonly="true">
                                                    </div>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-10">
                                            <label for="contagiousDisease" class="col-md-4 control-label" align="right">เคยป่วยหรือเป็นโรคร้ายแรง</label>
                                            <div class="col-md-8">
                                                <c:if test="${profileItem.contagiousDisease == true}">
                                                    <div class="col-md-7">
                                                        <label class="radio-inline"><input checked type="radio" name="contagiousDisease" disabled="disabled">เคย</label>
                                                        <label class="radio-inline"><input type="radio" name="contagiousDisease" disabled="disabled">ไม่เคย</label>
                                                        <label class="radio-inline control-label" align="right">ชื่อโรคที่เป็น</label>
                                                    </div>
                                                    <div class="col-md-5">
                                                        <input type="text" class="form-control" value="${profileItem.nameContagiousDisease}" readonly="true">
                                                    </div>
                                                </c:if>
                                                <c:if test="${profileItem.contagiousDisease == false}">
                                                    <div class="col-md-7">
                                                        <label class="radio-inline"><input type="radio" name="contagiousDisease" disabled="disabled">เคย</label>
                                                        <label class="radio-inline"><input checked type="radio" name="contagiousDisease" disabled="disabled">ไม่เคย</label>
                                                        <label class="radio-inline control-label" align="right">ชื่อโรคที่เป็น</label>
                                                    </div>
                                                    <div class="col-md-5">
                                                        <input type="text" class="form-control" value="${profileItem.nameContagiousDisease}" readonly="true">
                                                    </div>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="control-label col-md-12"><h4><p class="normal" align="left">&nbsp;&nbsp;&nbsp;กรณีฉุกเฉินบุคคลที่ติดต่อได้</p></h4></label>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="personCaseEmergencyFirstname" class="col-md-6 control-label" align="right">ชื่อ</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${profileItem.personCaseEmergencyFirstname}" readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="personCaseEmergencyLastname" class="col-md-6 control-label" align="right">นามสกุล</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${profileItem.personCaseEmergencyLastname}" readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="relatedApplicant" class="col-md-6 control-label" align="right">เกี่ยวข้องกับผู้สมัคร</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${profileItem.relatedApplicant}" readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="personCaseEmergencyAddress" class="col-md-6 control-label" align="right">ที่อยู่</label>
                                            <div class="col-md-6">
                                                <textarea style="overflow:auto;resize:none" rows="5" cols="5" class="form-control" id="message-text" readonly="true">${profileItem.relatedApplicantAddress}</textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="personCaseEmergencyPhone" class="col-md-6 control-label" align="right">โทร</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${profileItem.relatedApplicantTel}" readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>                   
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
