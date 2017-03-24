<!DOCTYPE html>
<html>
<body>

TimeIn: <input type="time" id="timeIn">
<br>
TimeOut: <input type="time" id="timeOut">

<p>Click the button to get the time of the time field.</p>

<button onclick="myFunction()">Try it</button>

<!--<p id="demo1"></p>
<p id="demo2"></p>
<p id="demo3"></p>-->
<p id="demo4"></p>

<script>
function myFunction() {
    var timeIn = document.getElementById("timeIn").value.split(":");
    var timeOut = document.getElementById("timeOut").value.split(":");
    if(timeIn[0]==null||timeIn[1]==null||timeOut[0]==null||timeOut[0]==null){
        document.getElementById("demo4").innerHTML = 0;
    }else{
        if(timeIn[0]==9&&timeIn[1]>0){
            var sumIn = (parseInt(timeIn[0]-9) * parseInt(60)) + parseInt(timeIn[1]) + parseInt(19*60);
        }else if(timeIn[0]>9){
            var sumIn = (parseInt(timeIn[0]-9) * parseInt(60)) + parseInt(timeIn[1]) + parseInt(19*60);
        }else{
            var sumIn = parseInt(19*60);
        }

        if(timeOut[0]>timeIn[0]){
            var sumOut = parseInt(timeOut[0]*60) + parseInt(timeOut[1]);
    //        var sumIn = parseInt(timeIn[0]*60) + parseInt(timeIn[1]);
            document.getElementById("demo4").innerHTML = (sumOut-sumIn)/60;
        }else{
            var sumOut = parseInt(timeOut[0]*60) + parseInt(timeOut[1]) + parseInt(24*60);
    //        var sumIn = parseInt(timeIn[0]*60) + parseInt(timeIn[1]);
            document.getElementById("demo4").innerHTML = (sumOut-sumIn)/60;
        }
    }
//    document.getElementById("demo").innerHTML = z;
}
</script>

</body>
</html>