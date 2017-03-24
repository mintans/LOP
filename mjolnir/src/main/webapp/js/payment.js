//payment form
function dateSplit(){
    var fullDate = document.getElementById("fullDate").value.split("-");
    var month = "";
    switch (fullDate[1]) {
        case "01":  month = "January";
                 break;
        case "02":  month = "February";
                 break;
        case "03":  month = "March";
                 break;
        case "04":  month = "April";
                 break;
        case "05":  month = "May";
                 break;
        case "06":  month = "June";
                 break;
        case "07":  month = "July";
                 break;
        case "08":  month = "August";
                 break;
        case "09":  month = "September";
                 break;
        case "10": month = "October";
                 break;
        case "11": month = "November";
                 break;
        case "12": month = "December";
                 break;
    }
    document.getElementById("date").value = fullDate[2] + " " + month + " " + fullDate[0];
}

// payment view
var en = "";
function hide(obj) {
    var el = document.getElementById(obj);
        if(en !== ""){
        en.style.display = 'none';
        }
        el.style.display = 'block';
        en = el;

    var year, month;
    var today = new Date();
    //month
    var m = today.getMonth();
    month = monthName(m);
    document.getElementById("month"+obj).value = month;
    //year
    year = today.getFullYear();
    document.getElementById("year"+obj).value = year;
//                    alert(month);
    tableFilter("month"+obj,"data_payment"+obj,"year"+obj);
}
function monthName(num){
    var month = "";
    switch (num) {
        case 0:  month = "January";
                 break;
        case 1:  month = "February";
                 break;
        case 2:  month = "March";
                 break;
        case 3:  month = "April";
                 break;
        case 4:  month = "May";
                 break;
        case 5:  month = "June";
                 break;
        case 6:  month = "July";
                 break;
        case 7:  month = "August";
                 break;
        case 8:  month = "September";
                 break;
        case 9: month = "October";
                 break;
        case 10: month = "November";
                 break;
        case 11: month = "December";
                 break;
    }
    return month;
}

function paymentSearchFunction() {
    var input, filter, table, tr, td, i, td1;
    input = document.getElementById("paymentSearch");
    filter = input.value.toUpperCase();
    table = document.getElementById("paymentTable");
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

function tableFilter(month,tableName,year) {
    var input1, input2, filter1 ,filter2 , table, tr, i, td1,sum = 0;
    var id = year.substring(4);
    //month
    input1 = document.getElementById(month);
    filter1 = input1.value.toUpperCase();
    //year
    input2 = document.getElementById(year);
    filter2 = input2.value.toUpperCase();
//                    alert(filter2);
    table = document.getElementById(tableName);
    tr = table.getElementsByTagName("tr");

    for (i = 1; i < tr.length-1; i++) {
    td1 = tr[i].getElementsByTagName("td")[1];
        if (td1) {
            if (td1.innerHTML.toUpperCase().indexOf(filter2) > -1 && td1.innerHTML.toUpperCase().indexOf(filter1) > -1) {
                tr[i].style.display = "";
                sum += parseInt(table.rows[i].cells[3].innerHTML);
                document.getElementById("sum"+id).innerHTML = sum;
            }else {
                tr[i].style.display = "none";
                document.getElementById("sum"+id).innerHTML = sum;
            }
        }
    }
}

function groupFunction() {
    var input, filter, table, tr, td, i;
    input = document.getElementById("select");
    filter = input.value.toUpperCase();
    table = document.getElementById("paymentTable");
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

