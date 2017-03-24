//ot form
function timeCal() {
    var timeIn = document.getElementById("timeIn").value.split(":");
    var timeOut = document.getElementById("timeOut").value.split(":");
    if (timeIn[0] == null || timeIn[1] == null || timeOut[0] == null || timeOut[1] == null) {
        document.getElementById("total").value = 0;
    } else {
        if (timeIn[0] == 9 && timeIn[1] > 0) {
            var hourIn = parseInt(timeIn[0] - 9) + 19;
            var minIn = timeIn[1];
        } else if (timeIn[0] > 9) {
            var hourIn = parseInt(timeIn[0] - 9) + 19;
            var minIn = timeIn[1];
        } else {
            var hourIn = 19;
            var minIn = timeIn[1];
        }

        var hourOut = timeOut[0];
        var minOut = timeOut[1];

        if (minOut < minIn) {
            minOut = parseInt(minOut) + 60;
            hourOut = hourOut - 1;
            var sumMin = minOut - minIn;
        } else {
            var sumMin = minOut - minIn;
        }
        if (hourOut < 19 && hourOut >= 9) {
            var sumHour = 0;
            sumMin = 0;
        } else {
            if (hourOut < timeIn[0]) {
                hourOut = parseInt(hourOut) + 24;
                var sumHour = hourOut - hourIn;
            } else {
                var sumHour = hourOut - hourIn;
            }
        }
        if (sumHour > 8) {
            document.getElementById("total").value = (sumHour - 2) + "." + sumMin;
        } else if (sumHour > 6) {
            document.getElementById("total").value = (sumHour - 1) + "." + sumMin;
        } else if (sumHour < 0) {
            document.getElementById("total").value = 0;
        }
        if (sumMin < 10) {
            document.getElementById("total").value = sumHour + ".0" + sumMin;
        } else {
            document.getElementById("total").value = sumHour + "." + sumMin;
        }
    }
//    document.getElementById("demo").innerHTML = z;
}
function dateSplit() {
    var fullDate = document.getElementById("fullDate").value.split("-");
    var month = "";
    switch (fullDate[1]) {
        case "01":
            month = "January";
            break;
        case "02":
            month = "February";
            break;
        case "03":
            month = "March";
            break;
        case "04":
            month = "April";
            break;
        case "05":
            month = "May";
            break;
        case "06":
            month = "June";
            break;
        case "07":
            month = "July";
            break;
        case "08":
            month = "August";
            break;
        case "09":
            month = "September";
            break;
        case "10":
            month = "October";
            break;
        case "11":
            month = "November";
            break;
        case "12":
            month = "December";
            break;
    }
    var d = new Date(document.getElementById("fullDate").value);
    var dayName = d.toString().split(' ')[0];
    document.getElementById("dayName").value = dayName;
    document.getElementById("date").value = fullDate[2];
    document.getElementById("month").value = month;
    document.getElementById("year").value = fullDate[0];
}

//ot view
var en = "";
function hide(obj) {
//    alert(obj);
    var el = document.getElementById(obj);
    if (en !== "") {
        en.style.display = 'none';
    }
    el.style.display = 'block';
    en = el;

    var year, month;
    var today = new Date();
    //month
    var m = today.getMonth();
    month = monthName(m);
    document.getElementById("month" + obj).value = month;
    //year
    year = today.getFullYear();
    document.getElementById("year" + obj).value = year;
//                    alert(month);
    tableFilter("month" + obj, "data_ot" + obj, "year" + obj);
}

function monthName(num) {
    var month = "";
    switch (num) {
        case 0:
            month = "January";
            break;
        case 1:
            month = "February";
            break;
        case 2:
            month = "March";
            break;
        case 3:
            month = "April";
            break;
        case 4:
            month = "May";
            break;
        case 5:
            month = "June";
            break;
        case 6:
            month = "July";
            break;
        case 7:
            month = "August";
            break;
        case 8:
            month = "September";
            break;
        case 9:
            month = "October";
            break;
        case 10:
            month = "November";
            break;
        case 11:
            month = "December";
            break;
    }
    return month;
}

function otSearchFunction() {
    var input, filter, table, tr, td, i, td1;
    input = document.getElementById("otSearch");
    filter = input.value.toUpperCase();
    table = document.getElementById("overTime");
    tr = table.getElementsByTagName("tr");
    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[2];
        td1 = tr[i].getElementsByTagName("td")[3];
        if (td || td1) {
            if (td.innerHTML.toUpperCase().indexOf(filter) > -1 || td1.innerHTML.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
        }
    }
}

function tableFilter(month, tableName, year) {
    var input1, input2, filter1, filter2, table, tr, i, td1, sum = 0;
    var id = year.substring(4), total, hour = 0, min = 0;
    //month
    input1 = document.getElementById(month);
    filter1 = input1.value.toUpperCase();
    //year
    input2 = document.getElementById(year);
    filter2 = input2.value.toUpperCase();
//                    alert(filter2);
    table = document.getElementById(tableName);
    tr = table.getElementsByTagName("tr");

    for (i = 1; i < tr.length - 1; i++) {
        td1 = tr[i].getElementsByTagName("td")[0];
        if (td1) {
            if (td1.innerHTML.toUpperCase().indexOf(filter2) > -1 && td1.innerHTML.toUpperCase().indexOf(filter1) > -1) {
                tr[i].style.display = "";
                total = table.rows[i].cells[3].innerHTML.toString().split(".");
                hour += parseInt(total[0]);
                min += parseInt(total[1]);
            } else {
                tr[i].style.display = "none";
            }
        }
    }
    if (hour !== 0 || min !== 0) {
        var min1 = parseInt(min / 60);
        var min2 = min % 60;
        hour += min1;
        if (min2 < 10) {
            sum = hour + ".0" + min2;
        } else {
            sum = hour + "." + min2;
        }
    }
    document.getElementById("sum" + id).innerHTML = sum;
}

function printDiv(divId) {
    var content = document.getElementById(divId).innerHTML;
    var mywindow = window.open();

    mywindow.document.write('<html><head><title></title>');
    mywindow.document.write('</head><body>');
    mywindow.document.write(content);
    mywindow.document.write('</body></html>');

    mywindow.document.close();
    mywindow.focus();
    mywindow.print();
    mywindow.close();
    return true;
}
function groupFunction() {
    var input, filter, table, tr, td, i;
    input = document.getElementById("select");
    filter = input.value.toUpperCase();
    table = document.getElementById("overTime");
    tr = table.getElementsByTagName("tr");
    for (i = 0; i < tr.length; i++) {
      td = tr[i].getElementsByTagName("td")[5];   
      if (td) {
        if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
          tr[i].style.display = "";
        } 
        else {
          tr[i].style.display = "none";
        }
      }
    }
  }
