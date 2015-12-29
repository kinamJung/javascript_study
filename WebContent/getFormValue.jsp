<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<script type="text/javascript">


function getVals() {
	var elems = document.getElementById("picker").elements
	var elemArray = new Object()
	
	for( var i = 0 ; i < elems.length; i++){
		if( elems[i].type == "text" ){
			elemArray[ elems[i].id ] = elems[i].value
		}
	}
	
	checkVals(elemArray)
	return false;
}


function checkVals(elemArray) {
	var str = "";
	for(var key in elemArray){
		str = str + key + ","+elemArray[key] + " ";
	}
	console.log(str)
	document.getElementById("result").innerHTML = str;
}


</script>


</head>
<body>

<form id="picker" onsubmit="return getVals()">
<label>값1:</label> <input type="text" id="first"><br>
<label>값2</label> <input type="text" id="second"><br>
<label>값3:</label> <input type="text" id="third"><br>
<label>값4:</label> <input type="text" id="four"><br>
<input type="submit" >

</form>

<div id="result"></div>

</body>
</html>