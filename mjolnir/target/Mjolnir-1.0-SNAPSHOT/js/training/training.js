function TrainingSearchFunction() {
    var input, filter, table, tr, td, i, td1;
    input = document.getElementById("trainingSearchInput");
    filter = input.value.toUpperCase();
    table = document.getElementById("trainingTable");
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

var en = "";
function show(obj) {
    GenarateDefaultSearchFunction(obj);
    var el = document.getElementById(obj);
    if (en !== "") {
        en.style.display = 'none';
    }
    el.style.display = 'block';
    en = el;
}

function allSearchFunction() {
    var input, filter, table, tr, td, i, td1;
    input = document.getElementById("availableSearchInput");
    filter = input.value.toUpperCase();
    table = document.getElementById("availableTable");
    tr = table.getElementsByTagName("tr");
    for (i = 1; i < tr.length; i++) {
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

function SearchTrainingDateFunction(monthId, yearId, id) {
    var inputMonth, inputYear, filterMonth, filterYear, table, tr, td, i, td1;
    inputMonth = document.getElementById(monthId);
    inputYear = document.getElementById(yearId);
    filterMonth = inputMonth.value.toUpperCase();
    filterYear = inputYear.value.toUpperCase();
    console.log(filterMonth + "|" + filterYear);
    table = document.getElementById("trainingMemberTable" + id);
    tr = table.getElementsByTagName("tr");
    for (i = 1; i < tr.length; i++) {
        var dateOnTable = $('#trainingMemberTable' + id).find('tr:eq(' + i + ') td:eq(3)').text();
        var dateSplit = dateOnTable.toString().split(" ");
        if (filterMonth === "MONTH" && filterYear === "YEAR") {
            tr[i].style.display = "";
        } else if (filterYear === "YEAR") {
            if (dateSplit[1].toUpperCase() === filterMonth) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
        } else if (filterMonth === "MONTH") {
            if (dateSplit[2].toUpperCase() === filterYear) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
        } else{
            if ((dateSplit[1].toUpperCase() === filterMonth) && (dateSplit[2].toUpperCase() === filterYear)) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
        }
    }
}


function GenarateDefaultSearchFunction(id) {
    var monthBox = $('#month' + id);
    monthBox.empty();
    monthBox.append('<option value="month" label="Month"/>');
    monthBox.append('<option value="January" label="January"/>');
    monthBox.append('<option value="February" label="February"/>');
    monthBox.append('<option value="March" label="March"/>');
    monthBox.append('<option value="April" label="April"/>');
    monthBox.append('<option value="May" label="May"/>');
    monthBox.append('<option value="June" label="June"/>');
    monthBox.append('<option value="July" label="July"/>');
    monthBox.append('<option value="August" label="August"/>');
    monthBox.append('<option value="September" label="September"/>');
    monthBox.append('<option value="October" label="October"/>');
    monthBox.append('<option value="November" label="November"/>');
    monthBox.append('<option value="December" label="December"/>');

    var yearBox = $('#year' + id);
    yearBox.empty();
    var myDate = new Date();
    var year = myDate.getFullYear();
    yearBox.append('<option selected value="year">Year</option>');
    for (var i = year - 5; i < year + 6; i++) {
        yearBox.append('<option value="' + i + '">' + i + '</option>');
    }
}

                                                                