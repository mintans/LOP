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

                var month = ["January", "February", "March", "April", "May", "June",
                    "July", "August", "September", "October", "November", "December"];

                var startWorkingDateChange = startWorkingDate.getDate() + ' ' + month[startWorkingMonth] + ' ' + startWorkingDate.getFullYear();
                var birthDayDateChange = birthDayDate.getDate() + ' ' + month[birthDayMonth] + ' ' + birthDayDate.getFullYear();
                var cardnoExpirationDateChange = cardnoExpirationDate.getDate() + ' ' + month[cardnoExpirationMonth] + ' ' + cardnoExpirationDate.getFullYear();
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
                <span class="breadcrumb-item active">profile(english)</span>
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
                                <h4 class="panel-title">Profile (English)</h4>
                            </div>
                            <div class="col-md-10" align="right">
                                <a href="<c:url value="/"/>main/profile/editFormEN/${profileid}" class="btn btn-sm btn-warning">Edit</a>
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
                                        <label class="control-label col-md-12"><h4><p class="normal" align="left">&nbsp;&nbsp;&nbsp;Personal Information</p></h4></label>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="id" class="col-md-6 control-label">Employee ID</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${profileItem.id}" readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="startWorking" class="col-md-6 control-label">Start date</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" id="startWorking"  readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="titleName" class="col-md-6 control-label">Title</label>
                                            <div class="col-md-6">
                                                <c:if test="${profileItem.title == 1}">
                                                    <input type="text" class="form-control" value="Mr." readonly="true">
                                                </c:if>
                                                <c:if test="${profileItem.title == 2}">
                                                    <input type="text" class="form-control" value="Mrs." readonly="true">
                                                </c:if>
                                                <c:if test="${profileItem.title == 3}">
                                                    <input type="text" class="form-control" value="Miss" readonly="true">
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="firstName" class="col-md-6 control-label">Firstname</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${profileItem.firstNameEN}" readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="lastName" class="col-md-6 control-label">Lastname</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${profileItem.lastNameEN}" readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="nickName" class="col-md-6 control-label">Nick name</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${profileItem.nickNameEN}" readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="birthDay" class="col-md-6 control-label">Date of birth</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" id="birthDay" readonly="true">
                                            </div>
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label for="age" class="col-md-3 control-label">Age</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${profileItem.age}" readonly="true">
                                            </div>
                                            <label class="col-md-1 control-label">Yrs.</label>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="cardno" class="col-md-6 control-label">Identity card no.</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${profileItem.cardno}" readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="cardnoExpiration" class="col-md-6 control-label">Expiration date</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" id="cardnoExpiration" readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-6">
                                            <label for="height" class="col-md-9 control-label">Height</label>
                                            <div class="col-md-3">
                                                <input type="text" class="form-control" value="${profileItem.height}" readonly="true">
                                            </div>
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label for="weight" class="col-md-4 control-label">Weight</label>
                                            <div class="col-md-7">
                                                <input type="text" class="form-control" value="${profileItem.weight}" readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-6 abbreviatewidth">
                                            <label for="race" class="col-md-9 control-label">Race</label>
                                            <div class="col-md-3">
                                                <input type="text" class="form-control" value="${profileItem.raceEN}" readonly="true">
                                            </div>
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label for="nationality" class="col-md-4 control-label">Nationality</label>
                                            <div class="col-md-7">
                                                <input type="text" class="form-control" value="${profileItem.nationalityEN}" readonly="true">
                                            </div>
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label for="religion" class="col-md-4 control-label">Religion</label>
                                            <div class="col-md-7">
                                                <input type="text" class="form-control" value="${profileItem.religionEN}" readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="bankAccount" class="col-md-6 control-label">Bank Accout</label>
                                            <div class="col-md-6">
                                                <c:if test="${profileItem.bankAccount == 1}">
                                                    <input type="text" class="form-control" value="The Siam Commercial Bank" readonly="true">
                                                </c:if>
                                                <c:if test="${profileItem.bankAccount == 2}">
                                                    <input type="text" class="form-control" value="Krung Thai Bank" readonly="true">
                                                </c:if>
                                                <c:if test="${profileItem.bankAccount == 3}">
                                                    <input type="text" class="form-control" value="Bangkok Bank" readonly="true">
                                                </c:if>
                                                <c:if test="${profileItem.bankAccount == 4}">
                                                    <input type="text" class="form-control" value="Kasikorn Bank" readonly="true">
                                                </c:if>
                                                <c:if test="${profileItem.bankAccount == 5}">
                                                    <input type="text" class="form-control" value="Thai Military Bank" readonly="true">
                                                </c:if>
                                                <c:if test="${profileItem.bankAccount == 6}">
                                                    <input type="text" class="form-control" value="Bank of Ayudhya" readonly="true">
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="bankAccountNo" class="col-md-6 control-label">Accout Number</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${profileItem.bankAccountNo}" readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="control-label col-md-12"><h4><p class="normal" align="left">&nbsp;&nbsp;&nbsp;Contact Info</p></h4></label>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7" align="right">
                                            <label for="registeredAddress" class="col-md-6"><u>Permanent Address</u></label>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="houseNoRegistration" class="col-md-6 control-label">Address</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${profileItem.houseNoRegistration}" readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="roadRegistration" class="col-md-6 control-label">Road</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${profileItem.roadRegistrationEN}" readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="subDistrictRegistration" class="col-md-6 control-label">Sub-District</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${profileItem.subDistrictRegistrationEN}" readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="districtRegistration" class="col-md-6 control-label">District</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${profileItem.districtRegistrationEN}" readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="provinceRegistration" class="col-md-6 control-label">Province</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${provinceRegistrationEN}" readonly="true">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row col-md-offset-1">
                                            <div class="form-group col-md-7">
                                                <label for="postCodeRegistration" class="col-md-6 control-label">Post Code</label>
                                                <div class="col-md-6">
                                                    <input type="text" class="form-control" value="${profileItem.postCodeRegistration}" readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <br>
                                        <div class="form-group col-md-7" align="right">
                                            <label for="currentAddress" class="col-md-6"><u>Present address</u></label>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="houseNoCurrent" class="col-md-6 control-label">Address</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${profileItem.houseNoCurrent}" readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="roadCurrent" class="col-md-6 control-label">Road</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${profileItem.roadCurrentEN}" readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="subDistrictCurrent" class="col-md-6 control-label">Sub-District</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${profileItem.subDistrictCurrentEN}" readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="districtCurrent" class="col-md-6 control-label">District</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${profileItem.districtCurrentEN}" readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="provinceCurrent" class="col-md-6 control-label">Province</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${provinceCurrentEN}" readonly="true">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row col-md-offset-1">
                                            <div class="form-group col-md-7">
                                                <label for="postCodeCurrent" class="col-md-6 control-label">Post Code</label>
                                                <div class="col-md-6">
                                                    <input type="text" class="form-control" value="${profileItem.postCodeCurrent}" readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="tel" class="col-md-6 control-label" align="right">Telephone</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${profileItem.tel}" readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="mobile" class="col-md-6 control-label" align="right">Mobile</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${profileItem.mobile}" readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="Email" class="col-md-6 control-label" align="right">E-mail</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${profileItem.email}" readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="control-label col-md-12"><h4><p class="normal" align="left">&nbsp;&nbsp;&nbsp;Additional features</p></h4></label>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="habitationType" class="col-md-6 control-label" align="right">Type of home</label>
                                            <div class="col-md-6">
                                                <c:if test="${profileItem.habitationType == 1}">
                                                    <input type="text" class="form-control" value="Living with parent" readonly="true">
                                                </c:if>
                                                <c:if test="${profileItem.habitationType == 2}">
                                                    <input type="text" class="form-control" value="Own home" readonly="true">
                                                </c:if>
                                                <c:if test="${profileItem.habitationType == 3}">
                                                    <input type="text" class="form-control" value="Hired house" readonly="true">
                                                </c:if>
                                                <c:if test="${profileItem.habitationType == 4}">
                                                    <input type="text" class="form-control" value="Hiredflat/Hostel" readonly="true">
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="militaryStatus" class="col-md-6 control-label" align="right">Milatary status</label>
                                            <div class="col-md-6">
                                                <c:if test="${profileItem.militaryStatus == 1}">
                                                    <input type="text" class="form-control" value="Exempted" readonly="true">
                                                </c:if>
                                                <c:if test="${profileItem.militaryStatus == 2}">
                                                    <input type="text" class="form-control" value="Served" readonly="true">
                                                </c:if>
                                                <c:if test="${profileItem.militaryStatus == 3}">
                                                    <input type="text" class="form-control" value="Not yet served" readonly="true">
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="marital" class="col-md-6 control-label" align="right">Marital status</label>
                                            <div class="col-md-6">
                                                <c:if test="${profileItem.marital == 1}">
                                                    <input type="text" class="form-control" value="Single" readonly="true">
                                                </c:if>
                                                <c:if test="${profileItem.marital == 2}">
                                                    <input type="text" class="form-control" value="Married" readonly="true">
                                                </c:if>
                                                <c:if test="${profileItem.marital == 3}">
                                                    <input type="text" class="form-control" value="Widowed" readonly="true">
                                                </c:if>
                                                <c:if test="${profileItem.marital == 4}">
                                                    <input type="text" class="form-control" value="Separated" readonly="true">
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="car" class="col-md-6 control-label" align="right">Car</label>
                                            <div class="col-md-6">
                                                <c:if test="${profileItem.car == true}">
                                                    <label class="radio-inline"><input checked type="radio" name="car" disabled="disabled">Yes</label>
                                                    <label class="radio-inline"><input type="radio" name="car" disabled="disabled">No</label>
                                                    </c:if>
                                                    <c:if test="${profileItem.car == false}">
                                                    <label class="radio-inline"><input type="radio" name="car" disabled="disabled">Yes</label>
                                                    <label class="radio-inline"><input checked type="radio" name="car" disabled="disabled">No</label>
                                                    </c:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="carDrivingNo" class="col-md-6 control-label" align="right">Driving Licences No.</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${profileItem.carDrivingNo}" readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="motorcycle" class="col-md-6 control-label" align="right">Motorcycles</label>
                                            <div class="col-md-6">
                                                <c:if test="${profileItem.motorcycle == true}">
                                                    <label class="radio-inline"><input checked type="radio" name="motorcycle" disabled="disabled">Yes</label>
                                                    <label class="radio-inline"><input type="radio" name="motorcycle" disabled="disabled">No</label>
                                                    </c:if>
                                                    <c:if test="${profileItem.motorcycle == false}">
                                                    <label class="radio-inline"><input type="radio" name="motorcycle" disabled="disabled">Yes</label>
                                                    <label class="radio-inline"><input checked type="radio" name="motorcycle" disabled="disabled">No</label>
                                                    </c:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="motorcycleDrivingNo" class="col-md-6 control-label" align="right">Driving Licences No.</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${profileItem.motorcycleDrivingNo}" readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-10">
                                            <label for="workUpCountry" class="col-md-4 control-label" align="right">Work up country</label>
                                            <div class="col-md-8">
                                                <c:if test="${profileItem.workUpCountry == 1}">
                                                    <div class="col-md-7">
                                                        <label class="radio-inline"><input checked type="radio" name="workUpCountry" disabled="disabled">Yes</label>
                                                        <label class="radio-inline"><input type="radio" name="workUpCountry" disabled="disabled">No</label>
                                                        <label class="radio-inline"><input type="radio" name="workUpCountry" disabled="disabled">Others</label>
                                                    </div>
                                                    <div class="col-md-5">
                                                        <input type="text" class="form-control" value="${profileItem.workUpCountryMentionEN}" readonly="true">
                                                    </div>
                                                </c:if>
                                                <c:if test="${profileItem.workUpCountry == 2}">
                                                    <div class="col-md-7">
                                                        <label class="radio-inline"><input type="radio" name="workUpCountry" disabled="disabled">Yes</label>
                                                        <label class="radio-inline"><input checked type="radio" name="workUpCountry" disabled="disabled">No</label>
                                                        <label class="radio-inline"><input type="radio" name="workUpCountry" disabled="disabled">Others</label>
                                                    </div>
                                                    <div class="col-md-5">
                                                        <input type="text" class="form-control" value="${profileItem.workUpCountryMentionEN}" readonly="true">
                                                    </div>
                                                </c:if>
                                                <c:if test="${profileItem.workUpCountry == 3}">
                                                    <div class="col-md-7">
                                                        <label class="radio-inline"><input type="radio" name="workUpCountry" disabled="disabled">Yes</label>
                                                        <label class="radio-inline"><input type="radio" name="workUpCountry" disabled="disabled">No</label>
                                                        <label class="radio-inline"><input checked type="radio" name="workUpCountry" disabled="disabled">Others</label>
                                                    </div>
                                                    <div class="col-md-5">
                                                        <input type="text" class="form-control" value="${profileItem.workUpCountryMentionEN}" readonly="true">
                                                    </div>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-10">
                                            <label for="contagiousDisease" class="col-md-4 control-label" align="right">Have you ever been sick ?</label>
                                            <div class="col-md-8">
                                                <c:if test="${profileItem.contagiousDisease == true}">
                                                    <div class="col-md-7">
                                                        <label class="radio-inline"><input checked type="radio" name="contagiousDisease" disabled="disabled">Yes</label>
                                                        <label class="radio-inline"><input type="radio" name="contagiousDisease" disabled="disabled">No</label>
                                                        <label class="radio-inline control-label" align="right">Disease name</label>
                                                    </div>
                                                    <div class="col-md-5">
                                                        <input type="text" class="form-control" value="${profileItem.nameContagiousDiseaseEN}" readonly="true">
                                                    </div>
                                                </c:if>
                                                <c:if test="${profileItem.contagiousDisease == false}">
                                                    <div class="col-md-7">
                                                        <label class="radio-inline"><input type="radio" name="contagiousDisease" disabled="disabled">Yes</label>
                                                        <label class="radio-inline"><input checked type="radio" name="contagiousDisease" disabled="disabled">No</label>
                                                        <label class="radio-inline control-label">Disease name</label>
                                                    </div>
                                                    <div class="col-md-5">
                                                        <input type="text" class="form-control" value="${profileItem.nameContagiousDiseaseEN}" readonly="true">
                                                    </div>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="control-label col-md-12"><h4><p class="normal" align="left">&nbsp;&nbsp;&nbsp;Emergency contact</p></h4></label>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="personCaseEmergencyFirstname" class="col-md-6 control-label" align="right">Firstname</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${profileItem.personCaseEmergencyFirstnameEN}" readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="personCaseEmergencyLastname" class="col-md-6 control-label" align="right">Lastname</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${profileItem.personCaseEmergencyLastnameEN}" readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="relatedApplicant" class="col-md-6 control-label" align="right">Related to applicant as</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" value="${profileItem.relatedApplicantEN}" readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="personCaseEmergencyAddress" class="col-md-6 control-label" align="right">Address</label>
                                            <div class="col-md-6">
                                                <textarea style="overflow:auto;resize:none" rows="5" cols="5" class="form-control" id="message-text" readonly="true">${profileItem.relatedApplicantAddressEN}</textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-md-offset-1">
                                        <div class="form-group col-md-7">
                                            <label for="personCaseEmergencyPhone" class="col-md-6 control-label" align="right">Tel.</label>
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
