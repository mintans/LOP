<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous"/>
        <link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.16/themes/base/jquery-ui.css" type="text/css" media="all">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous"/>
        <script src=https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

        <!--FullCalendar Dependencies-->
        <link href="<c:url value="/"/>fullcalendar/fullcalendar.css" rel="stylesheet" />
        <link href="<c:url value="/"/>fullcalendar/fullcalendar.print.css" rel="stylesheet" media="print" />

        <!--jQuery-->        
        <script src="<c:url value="/"/>fullcalendar/jquery/jquery-ui.custom.min.js"></script>
        <script src="<c:url value="/"/>fullcalendar/moment.js"></script>

        <!--FullCalendar-->
        <script src="<c:url value="/"/>fullcalendar/fullcalendar.min.js"></script>

        <style type="text/css">
            body
            {                
                /*text-align: center;*/
                font-size: 14px;
                font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
            }
            #calendar
            {
                width: 1000px;                        
                margin: 0 auto;
            }
            .ac_checked_date{
                background-color:lightblue;
            }
        </style>

        <title>Calender</title>

    </head>
    <body onload="loadEven('${birthDayList}', '${durationList}', '${insuranceList}', '${eventList}', '${conferenceList}')">

        <input type="hidden" id="listBirthDay" value="${birthDayList}">
        <input type="hidden" id="listDuration" value="${durationList}">
        <input type="hidden" id="listInsurance" value="${insuranceList}">
        <input type="hidden" id="listEvent" value="${eventList}">
        <input type="hidden" id="listConference" value="${conferenceList}">

        <div class="container-fluid">            
            <div class="row">
                <%@ include file="/WEB-INF/jsp/header.jsp" %>               
            </div>           

            <div class="container" style="width: 100%">
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 class="panel-title">Events Calendar</h3>
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                    <div id="calendar"></div> 

                                    <!-- Modal -->
                                    <div class="modal fade" id="calendarModal" role="dialog" data-keyboard="false" data-backdrop="static">
                                        <div class="modal-dialog">
                                            <!-- Modal content-->
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" >&times;</button>
                                                    <h4 class="modal-title" id="modaldate"></h4>
                                                </div>
                                                <div class="modal-body">


                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <img src="<c:url value="/"/>view/template/img/birthday.png" alt="birthday" width="20" height="20"/> 
                                                    <label>BirthDay</label>
                                                    <div id="birthdayModel"></div>

                                                    <br>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <img src="<c:url value="/"/>view/template/img/event.png" alt="event" width="20" height="20"/>   
                                                    <label>Event</label>
                                                    <div id="eventModel"></div>

                                                    <br>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <img src="<c:url value="/"/>view/template/img/conference.png" alt="conference" width="20" height="20"/> 
                                                    <label>Conference</label>
                                                    <div id="conferenceModel"></div>

                                                    <br>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <img src="<c:url value="/"/>view/template/img/duration_evaluation.png" alt="evaluation" width="20" height="20"/> 
                                                    <label>Evaluation</label>
                                                    <div id="evaluationModel"></div>

                                                    <br>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <img src="<c:url value="/"/>view/template/img/insurance.png" alt="insurance" width="20" height="20"/>  
                                                    <label>Insurance</label>
                                                    <div id="insuranceModel"></div>

                                                    <br>
                                                    <div class="modal-footer">                                                        
                                                        <button type="button" class="btn btn-default" data-dismiss="modal" >Cancel</button>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>

                                    </div>                                   

                                    <br>
                                    <div class="row">
                                        <div class="col-md-4"></div>
                                        <div class="col-md-6">
                                            <div class="col-md-1">
                                                <img src="<c:url value="/"/>view/template/img/birthday.png" alt="birthday" width="20" height="20"/>                                            
                                            </div>
                                            <div class="col-md-2">
                                                <label>BirthDay</label>
                                            </div>
                                            <div class="col-md-1">
                                                <img src="<c:url value="/"/>view/template/img/conference.png" alt="conference" width="20" height="20"/>                                            
                                            </div>
                                            <div class="col-md-2">
                                                <label>Conference</label>
                                            </div>
                                            <div class="col-md-1">
                                                <img src="<c:url value="/"/>view/template/img/duration_evaluation.png" alt="evaluation" width="20" height="20"/>                                            
                                            </div>
                                            <div class="col-md-2">
                                                <label>Evaluation</label>
                                            </div>
                                        </div>
                                        <div class="col-md-2"></div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-4"></div>
                                        <div class="col-md-6">

                                            <div class="col-md-1">
                                                <img src="<c:url value="/"/>view/template/img/event.png" alt="event" width="20" height="20"/>                                            
                                            </div>
                                            <div class="col-md-2">
                                                <label style="margin-right: 20px">Event</label>
                                            </div>
                                            <div class="col-md-1">
                                                <img src="<c:url value="/"/>view/template/img/insurance.png" alt="insurance" width="20" height="20"/>                                            
                                            </div>
                                            <div class="col-md-2">
                                                <label>Insurance</label>
                                            </div>
                                        </div>
                                        <div class="col-md-2"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <script type="text/javascript">
                function loadEven(birthDayList, durationList, insuranceList, eventList, conferenceList) {
                   

                    var birthDaySplit = birthDayList.split(",");
                    var durationSplit = durationList.split(",");
                    var insuranceSplit = insuranceList.split(",");
                    var eventSplit = eventList.split(",");
                    var conferenceSplit = conferenceList.split(",");

                    var arrayBirthday = [];
                    for (var i = 0; i < birthDaySplit.length - 1; i++) {
                        var groupName1 = birthDaySplit[i].split("|");
                        arrayBirthday.push({birthday: groupName1[1], member: groupName1[0]});
                    }

                    var date = {};
                    for (var i = 0; i < arrayBirthday.length; i++) {
                        var groupName = arrayBirthday[i].birthday;
                        if (!date[groupName]) {
                            date[groupName] = [];
                        }
                        date[groupName].push(arrayBirthday[i].member);
                    }
                    arrayBirthday = [];
                    for (var groupName in date) {
                        arrayBirthday.push({birthday: groupName, member: date[groupName]});
                    }

                    //                duration

                    var arrayDuration = [];
                    for (var i = 0; i < durationSplit.length - 1; i++) {
                        var groupName2 = durationSplit[i].split("|");
                        arrayDuration.push({date: groupName2[1], member: groupName2[0]});
                    }

                    var dateDuration = {};
                    for (var i = 0; i < arrayDuration.length; i++) {
                        var groupName2 = arrayDuration[i].date;
                        if (!dateDuration[groupName2]) {
                            dateDuration[groupName2] = [];
                        }
                        dateDuration[groupName2].push(arrayDuration[i].member);
                    }
                    arrayDuration = [];
                    for (var groupName2 in dateDuration) {
                        arrayDuration.push({date: groupName2, member: dateDuration[groupName2]});
                    }

                    //                insurance

                    var arrayInsurance = [];
                    for (var i = 0; i < insuranceSplit.length - 1; i++) {
                        var groupName3 = insuranceSplit[i].split("|");
                        arrayInsurance.push({date: groupName3[1], member: groupName3[0]});
                    }

                    var dateInsurance = {};
                    for (var i = 0; i < arrayInsurance.length; i++) {
                        var groupName3 = arrayInsurance[i].date;
                        if (!dateInsurance[groupName3]) {
                            dateInsurance[groupName3] = [];
                        }
                        dateInsurance[groupName3].push(arrayInsurance[i].member);
                    }
                    arrayInsurance = [];
                    for (var groupName3 in dateInsurance) {
                        arrayInsurance.push({date: groupName3, member: dateInsurance[groupName3]});
                    }

                    //                event

                    var arrayEvent = [];
                    for (var i = 0; i < eventSplit.length - 1; i++) {
                        var groupName4 = eventSplit[i].split("|");
                        arrayEvent.push({date: groupName4[1], member: groupName4[0]});
                    }

                    var dateEvent = {};
                    for (var i = 0; i < arrayEvent.length; i++) {
                        var groupDate = arrayEvent[i].date;
                        if (!dateEvent[groupDate]) {
                            dateEvent[groupDate] = [];
                        }
                        dateEvent[groupDate].push(arrayEvent[i].member);
                    }
                    arrayEvent = [];
                    for (var groupDate in dateEvent) {
                        arrayEvent.push({date: groupDate, member: dateEvent[groupDate]});
                    }


                    //                conference

                    var arrayConference = [];
                    for (var i = 0; i < conferenceSplit.length - 1; i++) {
                        var groupName5 = conferenceSplit[i].split("|");
                        arrayConference.push({date: groupName5[1], member: groupName5[0]});
                    }

                    var dateConference = {};
                    for (var i = 0; i < arrayConference.length; i++) {
                        var groupName5 = arrayConference[i].date;
                        if (!dateConference[groupName5]) {
                            dateConference[groupName5] = [];
                        }
                        dateConference[groupName5].push(arrayConference[i].member);
                    }
                    arrayConference = [];
                    for (var groupName5 in dateConference) {
                        arrayConference.push({date: groupName5, member: dateConference[groupName5]});
                    }


                    $('#calendar').fullCalendar({
                        header: {
                            left: 'title',
                            right: 'today prev,next'
                        },
                        height: 600,
                        //                    defaultDate: '2017-02-13',

                        eventRender: function (event, element) {
                            if (event.icon) {
                                $(element).find('span:first').prepend('<img src="<c:url value="/"/>view/template/img/' + event.icon + '" />');
                            }
                        },
                        dayClick: function (date, jsEvent, view) {

                            var all_events = $('#calendar').fullCalendar('clientEvents');
                            $(this).addClass('ac_checked_date');
                            $('.fc-day').not($(this)).removeClass('ac_checked_date');

                            var indexDate = date.format();
                            var indexDateDate = new Date(indexDate);
                            var indexDateMonth = indexDateDate.getMonth();
                            var month = ["January", "February", "March", "April", "May", "June",
                                "July", "August", "September", "October", "November", "December"];
                            var indexDateChange = indexDateDate.getDate() + ' ' + month[indexDateMonth] + ' ' + indexDateDate.getFullYear();


                            $('#modaldate').html(indexDateChange);


                            var memberBirthday = '';
                            var memberConference = '';
                            var memberEvaluation = '';
                            var memberEvent = '';
                            var memberInsurance = '';
                            all_events.forEach(function (entry) {
                                if (entry.start.format() === date.format()) {
                                    $('#calendarModal').modal();

                                    if (entry.icon === 'birthday.png') {
                                        for (var i = 0; i < entry.member.length; i++) {
                                            memberBirthday = memberBirthday +
                                                    '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
                                                    + '<a href="<c:url value="/main/others"/>">' + entry.member[i] + '</a><br>';
                                        }
                                    }
                                    if (entry.icon === 'conference.png') {
                                        for (var i = 0; i < entry.member.length; i++) {
                                            memberConference = memberConference +
                                                    '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
                                                    + '<a href="<c:url value="/main/companyInfo"/>">' + entry.member[i] + '</a><br>';
                                        }
                                    }
                                    if (entry.icon === 'duration_evaluation.png') {

                                        for (var i = 0; i < entry.member.length; i++) {
                                            memberEvaluation = memberEvaluation +
                                                    '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
                                                    + '<a href="<c:url value="/main/others"/>">' + entry.member[i] + '</a><br>';
                                        }
                                    }
                                    if (entry.icon === 'event.png') {

                                        for (var i = 0; i < entry.member.length; i++) {
                                            memberEvent = memberEvent +
                                                    '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Title : '
                                                    + '<a href="<c:url value="/main/companyInfo"/>">' + entry.member[i] + '</a><br>';
                                        }
                                    }
                                    if (entry.icon === 'insurance.png') {
                                        for (var i = 0; i < entry.member.length; i++) {
                                            memberInsurance = memberInsurance +
                                                    '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
                                                    + '<a href="<c:url value="/main/others"/>">' + entry.member[i] + '</a><br>';
                                        }
                                    }
                                }
                            });
                            $('#birthdayModel').html(memberBirthday);
                            $('#conferenceModel').html(memberConference);
                            $('#evaluationModel').html(memberEvaluation);
                            $('#eventModel').html(memberEvent);
                            $('#insuranceModel').html(memberInsurance);

                        }

                    });

                    var myCalendar = $('#calendar');
                    myCalendar.fullCalendar();

                    for (var i = 0; i < arrayBirthday.length; i++) {

                        var birthDay = arrayBirthday[i].birthday;
                        var member = arrayBirthday[i].member;
                        var myEvent = {
                            start: birthDay,
                            member: member,
                            icon: "birthday.png"
                        };
                        myCalendar.fullCalendar('renderEvent', myEvent);
                    }

                    for (var i = 0; i < arrayDuration.length; i++) {

                        var durationDay = arrayDuration[i].date;
                        var member2 = arrayDuration[i].member;
                        var myEvent3 = {
                            start: durationDay,
                            member: member2,
                            icon: "duration_evaluation.png"
                        };
                        myCalendar.fullCalendar('renderEvent', myEvent3);
                    }

                    for (var i = 0; i < arrayInsurance.length; i++) {

                        var insuranceDay = arrayInsurance[i].date;
                        var member3 = arrayInsurance[i].member;
                        var myEvent4 = {
                            start: insuranceDay,
                            member: member3,
                            icon: "insurance.png"
                        };
                        myCalendar.fullCalendar('renderEvent', myEvent4);
                    }

                    for (var i = 0; i < arrayEvent.length; i++) {

                        var eventDay = arrayEvent[i].date;
                        var titleDetails = arrayEvent[i].member;
                        var myEvent5 = {
                            start: eventDay,
                            member: titleDetails,
                            icon: "event.png"
                        };
                        myCalendar.fullCalendar('renderEvent', myEvent5);
                    }

                    for (var i = 0; i < arrayConference.length; i++) {

                        var conferenceDay = arrayConference[i].date;
                        var member5 = arrayConference[i].member;

                        var myEvent6 = {
                            start: conferenceDay,
                            member: member5,
                            icon: "conference.png"
                        };
                        myCalendar.fullCalendar('renderEvent', myEvent6);
                    }


                }
            </script>

            <script>
                $(document).ready(function () {
                    $('#calendar').click(function () {
                        $('#calendar').fullCalendar('removeEvents');

                        var birthDaySplit = $("#listBirthDay").val().split(",");
                        var durationSplit = $("#listDuration").val().split(",");
                        var insuranceSplit = $("#listInsurance").val().split(",");
                        var eventSplit = $("#listEvent").val().split(",");
                        var conferenceSplit = $("#listConference").val().split(",");

                        var arrayBirthday = [];
                        for (var i = 0; i < birthDaySplit.length - 1; i++) {
                            var groupName1 = birthDaySplit[i].split("|");
                            arrayBirthday.push({birthday: groupName1[1], member: groupName1[0]});
                        }

                        var date = {};
                        for (var i = 0; i < arrayBirthday.length; i++) {
                            var groupName = arrayBirthday[i].birthday;
                            if (!date[groupName]) {
                                date[groupName] = [];
                            }
                            date[groupName].push(arrayBirthday[i].member);
                        }
                        arrayBirthday = [];
                        for (var groupName in date) {
                            arrayBirthday.push({birthday: groupName, member: date[groupName]});
                        }

                        //                duration

                        var arrayDuration = [];
                        for (var i = 0; i < durationSplit.length - 1; i++) {
                            var groupName2 = durationSplit[i].split("|");
                            arrayDuration.push({date: groupName2[1], member: groupName2[0]});
                        }

                        var dateDuration = {};
                        for (var i = 0; i < arrayDuration.length; i++) {
                            var groupName2 = arrayDuration[i].date;
                            if (!dateDuration[groupName2]) {
                                dateDuration[groupName2] = [];
                            }
                            dateDuration[groupName2].push(arrayDuration[i].member);
                        }
                        arrayDuration = [];
                        for (var groupName2 in dateDuration) {
                            arrayDuration.push({date: groupName2, member: dateDuration[groupName2]});
                        }

                        //                insurance

                        var arrayInsurance = [];
                        for (var i = 0; i < insuranceSplit.length - 1; i++) {
                            var groupName3 = insuranceSplit[i].split("|");
                            arrayInsurance.push({date: groupName3[1], member: groupName3[0]});
                        }

                        var dateInsurance = {};
                        for (var i = 0; i < arrayInsurance.length; i++) {
                            var groupName3 = arrayInsurance[i].date;
                            if (!dateInsurance[groupName3]) {
                                dateInsurance[groupName3] = [];
                            }
                            dateInsurance[groupName3].push(arrayInsurance[i].member);
                        }
                        arrayInsurance = [];
                        for (var groupName3 in dateInsurance) {
                            arrayInsurance.push({date: groupName3, member: dateInsurance[groupName3]});
                        }

                        //                event

                        var arrayEvent = [];
                        for (var i = 0; i < eventSplit.length - 1; i++) {
                            var groupName4 = eventSplit[i].split("|");
                            arrayEvent.push({date: groupName4[1], member: groupName4[0]});
                        }

                        var dateEvent = {};
                        for (var i = 0; i < arrayEvent.length; i++) {
                            var groupDate = arrayEvent[i].date;
                            if (!dateEvent[groupDate]) {
                                dateEvent[groupDate] = [];
                            }
                            dateEvent[groupDate].push(arrayEvent[i].member);
                        }
                        arrayEvent = [];
                        for (var groupDate in dateEvent) {
                            arrayEvent.push({date: groupDate, member: dateEvent[groupDate]});
                        }


                        //                conference

                        var arrayConference = [];
                        for (var i = 0; i < conferenceSplit.length - 1; i++) {
                            var groupName5 = conferenceSplit[i].split("|");
                            arrayConference.push({date: groupName5[1], member: groupName5[0]});
                        }

                        var dateConference = {};
                        for (var i = 0; i < arrayConference.length; i++) {
                            var groupName5 = arrayConference[i].date;
                            if (!dateConference[groupName5]) {
                                dateConference[groupName5] = [];
                            }
                            dateConference[groupName5].push(arrayConference[i].member);
                        }
                        arrayConference = [];
                        for (var groupName5 in dateConference) {
                            arrayConference.push({date: groupName5, member: dateConference[groupName5]});
                        }


                        $('#calendar').fullCalendar({
                            header: {
                                left: 'title',
                                right: 'today prev,next'
                            },
                            height: 600,
                            //                    defaultDate: '2017-02-13',

                            eventRender: function (event, element) {
                                if (event.icon) {
                                    $(element).find('span:first').prepend('<img src="<c:url value="/"/>view/template/img/' + event.icon + '" />');
                                }
                            },
                            dayClick: function (date, jsEvent, view) {

                                $(this).addClass('ac_checked_date');
                                $('.fc-day').not($(this)).removeClass('ac_checked_date');

                                var indexDate = date.format();
                                var indexDateDate = new Date(indexDate);
                                var indexDateMonth = indexDateDate.getMonth();
                                var month = ["January", "February", "March", "April", "May", "June",
                                    "July", "August", "September", "October", "November", "December"];
                                var indexDateChange = indexDateDate.getDate() + ' ' + month[indexDateMonth] + ' ' + indexDateDate.getFullYear();

                                $('#calendarModal').modal("show");
                                $('#modaldate').html(indexDateChange);

                                var all_events = $('#calendar').fullCalendar('clientEvents');
                                var memberBirthday = '';
                                var memberConference = '';
                                var memberEvaluation = '';
                                var memberEvent = '';
                                var memberInsurance = '';
                                all_events.forEach(function (entry) {
                                    if (entry.start.format() === date.format()) {

                                        if (entry.icon === 'birthday.png') {
                                            for (var i = 0; i < entry.member.length; i++) {
                                                memberBirthday = memberBirthday + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' + entry.member[i] + '<br>';
                                            }
                                        }
                                        if (entry.icon === 'conference.png') {
                                            for (var i = 0; i < entry.member.length; i++) {
                                                memberConference = memberConference + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' + entry.member[i] + '<br>';
                                            }
                                        }
                                        if (entry.icon === 'duration_evaluation.png') {

                                            for (var i = 0; i < entry.member.length; i++) {
                                                memberEvaluation = memberEvaluation + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' + entry.member[i] + '<br>';
                                            }
                                        }
                                        if (entry.icon === 'event.png') {

                                            for (var i = 0; i < entry.member.length; i++) {
                                                memberEvent = memberEvent + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Title : ' + entry.member[i] + '<br>';
                                            }
                                        }
                                        if (entry.icon === 'insurance.png') {
                                            for (var i = 0; i < entry.member.length; i++) {
                                                memberInsurance = memberInsurance + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' + entry.member[i] + '<br>';
                                            }
                                        }
                                    }
                                });
                                $('#birthdayModel').html(memberBirthday);
                                $('#conferenceModel').html(memberConference);
                                $('#evaluationModel').html(memberEvaluation);
                                $('#eventModel').html(memberEvent);
                                $('#insuranceModel').html(memberInsurance);

                            }

                        });

                        var myCalendar = $('#calendar');
                        myCalendar.fullCalendar();

                        for (var i = 0; i < arrayBirthday.length; i++) {

                            var birthDay = arrayBirthday[i].birthday;
                            var member = arrayBirthday[i].member;
                            var myEvent = {
                                start: birthDay,
                                member: member,
                                icon: "birthday.png"
                            };
                            myCalendar.fullCalendar('renderEvent', myEvent);
                        }

                        for (var i = 0; i < arrayDuration.length; i++) {

                            var durationDay = arrayDuration[i].date;
                            var member2 = arrayDuration[i].member;
                            var myEvent3 = {
                                start: durationDay,
                                member: member2,
                                icon: "duration_evaluation.png"
                            };
                            myCalendar.fullCalendar('renderEvent', myEvent3);
                        }

                        for (var i = 0; i < arrayInsurance.length; i++) {

                            var insuranceDay = arrayInsurance[i].date;
                            var member3 = arrayInsurance[i].member;
                            var myEvent4 = {
                                start: insuranceDay,
                                member: member3,
                                icon: "insurance.png"
                            };
                            myCalendar.fullCalendar('renderEvent', myEvent4);
                        }

                        for (var i = 0; i < arrayEvent.length; i++) {

                            var eventDay = arrayEvent[i].date;
                            var titleDetails = arrayEvent[i].member;
                            var myEvent5 = {
                                start: eventDay,
                                member: titleDetails,
                                icon: "event.png"
                            };
                            myCalendar.fullCalendar('renderEvent', myEvent5);
                        }

                        for (var i = 0; i < arrayConference.length; i++) {

                            var conferenceDay = arrayConference[i].date;
                            var member5 = arrayConference[i].member;

                            var myEvent6 = {
                                start: conferenceDay,
                                member: member5,
                                icon: "conference.png"
                            };
                            myCalendar.fullCalendar('renderEvent', myEvent6);
                        }

                    });
                });
            </script>

    </body>
</html>
