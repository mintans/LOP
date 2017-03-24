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
        <style>
            p.normal {
                border-bottom: 2px solid gray;
            }
        </style>
        <title>History View</title>
    </head>
    <body>
        <div class="container-fluid">            
            <div class="row">
                <%@ include file="/WEB-INF/jsp/header.jsp" %>               
            </div>
            <nav class="breadcrumb">
                <c:forEach var="profileItem" items="${profileList}">
                    <c:if test="${profileid == profileItem.id}">
                        <a class="breadcrumb-item" href="<c:url value="/main/profile"/>">Profile</a> / 
                        <a class="breadcrumb-item" href="<c:url value="/"/>main/profile/viewTH/${profileItem.id}"/>${profileItem.id}</a> / 
                        <span class="breadcrumb-item active">history</span>
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
                    <div class="panel panel-primary" >
                        <div class="panel-heading col-md-12">
                            <div class="col-md-2" align="left" style="margin-top: 5px;margin-bottom: 7px">
                                <h4 class="panel-title">History</h4>
                            </div>
                            <div class="col-md-10" align="right">
                                <input type="button" class="btn btn-sm btn-warning" id="btnPrint" onclick="PrintElem('panelHistory')" value="Print">
                            </div>
                        </div>
                        <div class="panel-body" id="panelHistory">
                            <c:forEach var="profileItem" items="${profileList}">
                                <c:if test="${profileid == profileItem.id}">
                                    <div class="row col-md-12">
                                        <div class="col-md-12">
                                            <br>
                                            <label>รหัสพนักงาน : ${profileItem.id}</label>
                                        </div>
                                    </div>
                                    <div class="row col-md-12">
                                        <div class="col-md-3">
                                            <br>
                                            <label>ชื่อ : <c:if test="${profileItem.title == 1}">นาย</c:if>
                                                <c:if test="${profileItem.title == 2}">นาง</c:if>
                                                <c:if test="${profileItem.title == 3}">นางสาว</c:if>
                                                ${profileItem.firstName}   ${profileItem.lastName}
                                            </label>
                                        </div>
                                        <div class="col-md-3">
                                            <br>
                                            <label>อายุ : ${profileItem.age} ปี</label>
                                        </div>
                                    </div>
                                    <div class="row col-md-12">
                                        <div class="col-md-6">
                                            <br>
                                            <script language="JavaScript" type="text/JavaScript">
                                                addEventListener("load", function () {
                                                changeDateFunction("${userItem.startWorkDate}","${countNo}");
                                                }, true);
                                            </script>
                                            <label id="startWorking"></label>
                                        </div>
                                    </div>
                                    <div class="row col-md-12">
                                        <div class="col-md-12">
                                            <br>
                                            <label>การว่าจ้าง : ${employmentType}</label>
                                        </div>
                                    </div>
                                    <div class="row col-md-12">
                                        <div class="col-md-12">
                                            <br>
                                            <label>แผนก : ${userItem.departmentName}</label>
                                        </div>
                                    </div>
                                    <div class="row col-md-12">
                                        <div class="col-md-12">
                                            <br>
                                            <label>ตำแหน่ง : ${position}</label>
                                        </div>
                                    </div>
                                    <div class="row col-md-12">
                                        <br>
                                        <label class="control-label col-md-12" style="margin-top: -20px"><h4><p class="normal" align="left"> </p></h4></label>
                                    </div>
                                    <div class="row col-md-12">
                                        <div class="col-md-7">
                                            <label>การศึกษา : 
                                                <c:forEach var="educationList" items="${educationList}">
                                                    <label>${educationList.major}</label><br/>
                                                    <span style="padding-left:73px"></span>
                                                </c:forEach>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="row col-md-12">
                                        <label class="control-label col-md-12" style="margin-top: -20px"><h4><p class="normal" align="left"> </p></h4></label>
                                    </div>
                                    <div class="row col-md-12">
                                        <div class="col-md-7">
                                            <label>การอบรม : 
                                                <c:forEach var="trainingRecordList" items="${trainingRecordList}">
                                                    <c:if test="${trainingRecordList.profileId == profileid}">
                                                        <label>${trainingRecordList.subject}</label><br/>
                                                        <span style="padding-left:72px"></span>
                                                    </c:if>
                                                </c:forEach></label>
                                        </div>
                                    </div>
                                    <div class="row col-md-12">
                                        <label class="control-label col-md-12" style="margin-top: -20px"><h4><p class="normal" align="left"> </p></h4></label>
                                    </div>
                                    <div class="row col-md-12">
                                        <div class="col-md-4">
                                            <label>การย้ายตำแหน่ง : 
                                                <c:forEach var="transferList" items="${transferList}">
                                                    <c:if test="${transferList.profileId == profileid}">
                                                        <label>${transferList.position}</label><br/>
                                                        <span style="padding-left:116px"></span>
                                                    </c:if>
                                                </c:forEach></label>
                                        </div>
                                        <div class="col-md-5">
                                            <c:set var="countNo" value="0" scope="page"/>
                                            <label>
                                                <c:forEach var="transferList" items="${transferList}">
                                                    <c:if test="${transferList.profileId == profileid}">
                                                        <script language="JavaScript" type="text/JavaScript">
                                                            addEventListener("load", function () {
                                                            calAgeTransfer("${transferList.date}", "${countNo}");
                                                            }, true);
                                                        </script>
                                                        <label id="ageTransfer[${countNo}]"></label><br/>
                                                    </c:if>
                                                    <c:set var="countNo" value="${countNo+1}" scope="page"/>
                                                </c:forEach></label>
                                        </div>
                                    </div>
                                    <div class="row col-md-12">
                                        <label class="control-label col-md-12" style="margin-top: -20px"><h4><p class="normal" align="left"> </p></h4></label>
                                    </div>

                                    <div class="row col-md-12">
                                        <div class="col-md-3">
                                            <label>การตักเตือน : 
                                                <c:forEach var="admonitionList" items="${admonitionList}">
                                                    <c:if test="${admonitionList.profileId == profileid}">
                                                        <label>${admonitionList.subject}</label><br/>
                                                        <span style="padding-left:89px"></span>
                                                    </c:if>
                                                </c:forEach></label>
                                        </div>
                                        <div class="col-md-5">
                                            <c:set var="countNo2" value="0" scope="page"/>
                                            <label>
                                                <c:forEach var="admonitionList" items="${admonitionList}">
                                                    <c:if test="${admonitionList.profileId == profileid}">
                                                        <script language="JavaScript" type="text/JavaScript">
                                                            addEventListener("load", function () {
                                                            changeWarningDateFunction("${admonitionList.warningDate}", "${countNo2}");
                                                            }, true);
                                                        </script>
                                                        <label id="warningDate[${countNo2}]"></label><br/>
                                                    </c:if>
                                                    <c:set var="countNo2" value="${countNo2+1}" scope="page"/>
                                                </c:forEach></label>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            function calAgeTransfer(date, count) {
                var tmp = date.split("-");
                var current = new Date();
                var current_mouth = current.getMonth() + 1;
                var current_year = current.getFullYear();
                var diff_year = current_year - tmp[0];
                var current_mouth = (diff_year * 12) + current_mouth;
                var diff_mouth = current_mouth - tmp[1];
                var id = "ageTransfer" + "[" + count + "]";
                diff_year = (diff_mouth / 12).toString();
                diff_year = diff_year.split(".");

                if (diff_mouth < 12) {
                    document.getElementById(id).innerHTML = diff_mouth + " เดือน";
                } else {
                    document.getElementById(id).innerHTML = diff_year[0] + " ปี " + (diff_mouth % 12) + " เดือน";
                }
            }
        </script>
        <script>
            function changeDateFunction(date, row) {
                var warningDate = date;
                var warningDateDate = new Date(warningDate);
                var warningDateMonth = warningDateDate.getMonth();
                var month = ["มกราคม", "กุมภาพันธ์", "มีนาคม", "เมษายน", "พฤษภาคม", "มิถุนายน",
                    "กรกฎาคม", "สิงหาคม", "กันยายน", "ตุลาคม", "พฤษจิกายน", "ธันวาคม"];

                var warningDateChange = warningDateDate.getDate() + ' ' + month[warningDateMonth] + ' ' + (warningDateDate.getFullYear() + 543);
                document.getElementById("startWorking").innerHTML = "วันที่เริ่มทำงาน : " + warningDateChange;
            }
        </script>
        <script>
            function changeWarningDateFunction(date, count) {
                var id = "warningDate" + "[" + count + "]";
                var warningDate = date;
                var warningDateDate = new Date(warningDate);
                var warningDateMonth = warningDateDate.getMonth();
                var month = ["มกราคม", "กุมภาพันธ์", "มีนาคม", "เมษายน", "พฤษภาคม", "มิถุนายน",
                    "กรกฎาคม", "สิงหาคม", "กันยายน", "ตุลาคม", "พฤษจิกายน", "ธันวาคม"];

                var warningDateChange = warningDateDate.getDate() + ' ' + month[warningDateMonth] + ' ' + (warningDateDate.getFullYear() + 543);
                document.getElementById(id).innerHTML = warningDateChange;
            }
        </script>
        <script type="text/javascript">
            function PrintElem(elem) {
                var mywindow = window.open('', 'PRINT', 'height=750,width=1366');


                mywindow.document.write('<html><head><title>' + document.title + '</title>');
                mywindow.document.write('</head><body >');
                mywindow.document.write(document.getElementById(elem).innerHTML);
                mywindow.document.write('</body></html>');

                mywindow.document.close(); // necessary for IE >= 10
                mywindow.focus(); // necessary for IE >= 10*/

                mywindow.print();
                mywindow.close();

                return true;
            }
        </script>


    </body>
</html>
