//leave form 
function Today() {
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth() + 1; //January is 0!
    var yyyy = today.getFullYear();
    var month = "";

    switch (mm - 1) {
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
//                    alert(month);
    document.getElementById("fullDate").value = dd + "/" + mm + "/" + yyyy;
    document.getElementById("date2").value = dd + " " + month + " " + yyyy;
    document.getElementById("to").min = document.getElementById("from").value;

}
function totalday() {
    document.getElementById("to").min = document.getElementById("from").value;
    var form = document.getElementById("from").value.split("-");
    var to = document.getElementById("to").value.split("-");

    var d1, m1, y1, d2, m2, y2;
    d1 = form[2];
    m1 = form[1];
    y1 = form[0];
    d2 = to[2];
    m2 = to[1];
    y2 = to[0];
    var oneDay = 24 * 60 * 60 * 1000; // hours*minutes*seconds*milliseconds
    var firstDate = new Date(y1, m1, d1);
    var secondDate = new Date(y2, m2, d2);
    var dfirst = new Date(document.getElementById("from").value);
    var dayName1 = dfirst.getDay();
    var count = 0;
    var diffDays = Math.round(Math.abs((firstDate.getTime() - secondDate.getTime()) / (oneDay)));
//                    alert(dayName);
    if (form[0] === "" || to[0] === "") {
        document.getElementById("total").value = 0;
    } else {
        for (var i = 0; i < diffDays; i++) {
            if (dayName1 === 6) {
                dayName1 = 0;
                count++;
//                                alert("0 or 6 :" + count);
            } else if (dayName1 === 0) {
                count++;
//                                alert("0 or 6 :" + count);
                dayName1 += 1;
            } else {
//                                alert(dayName1);
                dayName1 += 1;
            }
        }
        if (m1 < m2) {
//                            alert("ข้ามเดือน");
            document.getElementById("total").value = (diffDays - count);
        } else {

//                            alert("เดือนเดียวกัน");
            document.getElementById("total").value = (diffDays - count) + 1;
        }
    }
}

function dateSplit1() {
    var from = document.getElementById("from").value.split("-");
    var month = "";
    switch (from[1]) {
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
    document.getElementById("from2").value = from[2] + " " + month + " " + from[0];
}

function dateSplit2() {
    var to = document.getElementById("to").value.split("-");
    var month = "";
    switch (to[1]) {
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
    document.getElementById("to2").value = to[2] + " " + month + " " + to[0];
}

//leave view
var en = "";
function hide(obj, sw) {
    var el = document.getElementById(obj);
    if (en !== "") {
        en.style.display = 'none';
    }
    el.style.display = 'block';
    en = el;

    var year;
    var today = new Date();
    //year
    year = today.getFullYear();
    document.getElementById("year" + obj).value = year;
    tableFilter("leave" + obj, "year" + obj, sw);
}

function leaveSearchFunction() {
    var input, filter, table, tr, td, i, td1;
    input = document.getElementById("leaveSearch");
    filter = input.value.toUpperCase();
    table = document.getElementById("leaveTable");
    tr = table.getElementsByTagName("tr");
    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[3];
        td1 = tr[i].getElementsByTagName("td")[4];
        if (td || td1) {
            if (td.innerHTML.toUpperCase().indexOf(filter) > -1 || td1.innerHTML.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
        }
    }
}

function calAge(sw) {
    var d3 = new Date();
    var d;
    var d = sw.split(" ");
    var month;
    switch (d[1]) {
        case "Jan":
            month = 0;
            break;
        case "Feb":
            month = 1;
            break;
        case "Mar":
            month = 2;
            break;
        case "Apr":
            month = 3;
            break;
        case "May":
            month = 4;
            break;
        case "Jun":
            month = 5;
            break;
        case "Jul":
            month = 6;
            break;
        case "Aug":
            month = 7;
            break;
        case "Sep":
            month = 8;
            break;
        case "Oct":
            month = 9;
            break;
        case "Nov":
            month = 10;
            break;
        case "Dec":
            month = 11;
            break;
    }
    d3.setDate(d[2]);
    d3.setMonth(month);
    d3.setFullYear(d[5]);
    var d2 = new Date();
    var diff = d2.getTime() - d3.getTime();
    var age = Math.floor(diff / (1000 * 60 * 60 * 24 * 365.25));
    return age;
}

function tableFilter(tableName, year, date) {
//                    alert(date);
    var input2, filter2, table, tr, i, td1;
    var tdTotal, tdType, totalPersonal = 7, totalVacation, totalsick = 30,totalord = 15,totalmat = 60;
    var totalPersonal2 = 0, totalVacation2 = 0, totalsick2 = 0, totalord2 = 0,totalmat2 = 0;
    var id = year.substring(4);
    var age = calAge(date);
//                    alert(age);
    if (age >= 4) {
        totalVacation = 10;
    } else if (age >= 3) {
        totalVacation = 9;
    } else if (age >= 2) {
        totalVacation = 8;
    } else if (age >= 1) {
        totalVacation = 7;
    } else {
        totalVacation = 6;
    }

    var per2, vac2, sick2, ord2, mat2;
    per2 = "p2" + id;
    vac2 = "v2" + id;
    sick2 = "s2" + id;
    ord2 = "o2" + id;
    mat2 = "m2" + id;
    document.getElementById(per2).innerHTML = totalPersonal + " days/year";
    document.getElementById(vac2).innerHTML = totalVacation + " days/year";
    document.getElementById(sick2).innerHTML = totalsick + " days/year";
    document.getElementById(ord2).innerHTML = "1 Time (" + totalord + "days)";
    document.getElementById(mat2).innerHTML = "1 Time (" + totalmat + "days)";

    //year
    input2 = document.getElementById(year);
    filter2 = input2.value.toUpperCase();
//                    alert();
    table = document.getElementById(tableName);
    tr = table.getElementsByTagName("tr");

    if (filter2 === "NONE") {
        for (i = 0; i < tr.length; i++) {
            tr[i].style.display = "";
        }
    } else {
        for (i = 0; i < tr.length; i++) {
            td1 = tr[i].getElementsByTagName("td")[0];
            tdTotal = tr[i].cells[3].innerHTML;
            tdType = table.rows[i].cells[4].innerHTML;
            if (td1) {
                if (td1.innerHTML.toUpperCase().indexOf(filter2) > -1) {
                    tr[i].style.display = "";
                    if (tdType === "personal") {
//                                        alert(tdTotal);
                        totalPersonal -= tdTotal;
                        totalPersonal2 += parseInt(tdTotal);
                    } else if (tdType === "vacation") {
                        totalVacation -= tdTotal;
                        totalVacation2 += parseInt(tdTotal);
                    } else {
                        totalsick -= tdTotal;
                        totalsick2 += parseInt(tdTotal);
                    }
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    }
    var per3, vac3, sick3,ord3,mat3;
    per3 = "p3" + id;
    vac3 = "v3" + id;
    sick3 = "s3" + id;
    ord3 = "o3" + id;
    mat3 = "m3" + id;
    document.getElementById(per3).innerHTML = totalPersonal2;
    document.getElementById(vac3).innerHTML = totalVacation2;
    document.getElementById(sick3).innerHTML = totalsick2;
    document.getElementById(ord3).innerHTML = totalord2;
    document.getElementById(mat3).innerHTML = totalmat2;

    var per, vac, sick, ord, mat;
    per = "p" + id;
    vac = "v" + id;
    sick = "s" + id;
    ord = "o" + id;
    mat = "m" + id;
    document.getElementById(per).innerHTML = totalPersonal;
    document.getElementById(vac).innerHTML = totalVacation;
    document.getElementById(sick).innerHTML = totalsick;
    document.getElementById(ord).innerHTML = 1;
    document.getElementById(mat).innerHTML = 1;
}
function dateSplit() {
    var today = new Date();
//                var dd = today.getDate();
//                var mm = today.getMonth()+1; //January is 0!
    var yyyy = today.getFullYear();

    return yyyy;
}

function groupFunction() {
    var input, filter, table, tr, td, i;
    input = document.getElementById("select");
    filter = input.value.toUpperCase();
    table = document.getElementById("leaveTable");
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

