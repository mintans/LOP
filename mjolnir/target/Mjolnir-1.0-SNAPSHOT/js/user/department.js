function DepartmentSearchFunction() {
    var input, filter, table, tr, td, i, td1;
    input = document.getElementById("departmentInput");
    filter = input.value.toUpperCase();
    table = document.getElementById("departmentTable");
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

function NameSearchFunction() {
    var input, filter, table, tr, td, i, td1;
    input = document.getElementById("NameInput");
    filter = input.value.toUpperCase();
    table = document.getElementById("nameTable");
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

function availableSearchFunction() {
    var input, filter, table, tr, td, i, td1;
    input = document.getElementById("available");
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

var en = "";
function show(obj) {
    var el = document.getElementById(obj);
    if (en !== "") {
        en.style.display = 'none';
    }
    el.style.display = 'block';
    en = el;


}

function highlight_row(ctrl) {
    var elements = document.getElementsByTagName('tr');
    for (var i = 0; i < elements.length; i++)
        elements[i].style.background = '';
    var parent = ctrl.parentNode.parentNode;
    parent.style.background = "#def1f6";
}
