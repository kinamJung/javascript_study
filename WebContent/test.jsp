<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>배트맨 슈퍼맨을 피하라</title>

<style type="text/css">
#elem {
	width: 400px;
	height: 200px;
	border: 1px solid #000;
	left: 10px;
	top: 10px;
}

#picture,pictureBox{
	width: 80px;
	height: 50px;
	
}
</style>
</head>

<script type="text/javascript">




window.onload=function(){

	initCircle()
	
	
	makeBatman()
	
	document.getElementById("mouse").style.cursor = "none";
	document.addEventListener("mousemove", function () {
		var image = document.getElementById("mouse")
		var width = image.clientWidth
		var height = image.clientHeight
		showBatman(width,height)
	} , false)
	
	
	//setInterval(changeTheMove, 100)
	//setInterval(changeTheSuperMan, 30);
	/* setInterval(makeSuperman,1000)
	setInterval(move, 30); */
} 

//init circle
function initCircle(){
	
	var div = document.getElementById("svg")
		
	div.setAttribute("width", "400px")
	div.setAttribute("height", "200px")
		
		 
	var height = parseInt( comstyle("elem","height"))
	var width = parseInt(comstyle("elem","width"))
		
	var x = width / 2
	var y = height / 2
	var circleRedius = Math.min(width, height) / 2
	var circ = document.getElementById("circ")
		
	circ.setAttribute("r", circleRedius)
	circ.setAttribute("cx", x)
	circ.setAttribute("cy", y)
	
}

function comstyle(elemId, property){
	var elem=document.getElementById(elemId)
	var style;
	if(window.getComputedStyle){
		style = window.getComputedStyle(elem, null).getPropertyValue(property)
		
	}else if (elem.currentStyle) {
		style = elem.currentStyle[property];
	}
	return style;
}

//change the circle color
function changeTheCircleColor(){
	
	var color = randomColor()
	var circle = document.getElementById("circ");
	
	circle.setAttribute("fill", color)

	
}


function randomColor() {
	
	var r = randomVal(256).toString(16);
	if(r.length < 2){
		r = "0" + r
	}
	
	var g = randomVal(256).toString(16);
	if(g.length < 2){
		g = "0" + g
	}
	
	var b = randomVal(256).toString(16);
	if(b.length < 2){
		b = "0" + b
	}
	
	return "#" + r + g + b;
}


function randomVal(val){
	return Math.floor(Math.random() * val);  // floor(x) x보다 작은 정수중 가장 큰 정수
}

 
//move the circle
var inteval = 5 

var nowX = 10;
var nowY = 10
var direction = 1
var maxX = screen.width


function changeTheMove() {
	var div = document.getElementById("elem")
	div.style.position = "absolute";
	
	console.log(screen.left)
	
	if( (nowX + 400 + inteval) > maxX || (nowX +inteval) < 0 ){
		inteval = inteval * -1 
	}
	
	div.style.left = nowX  + "px";
	div.style.top = nowY   + "px";
	
	nowX = nowX + inteval

} 

var supermanRight = "image/right_superman.jpg"
var supermanLeft = "image/left_superman.jpg"
var supermanX = 0
var superman = supermanRight

function changeTheSuperMan(){

	var picture = document.getElementById("picture")
	picture.setAttribute("src",superman)

	var pictureBox = document.getElementById("pictureBox")
	pictureBox.style.position = "absolute";
	pictureBox.style.left = supermanX + "px";
	
	supermanX = supermanX + inteval
	if( supermanX + inteval + 80 > maxX ){
		superman = supermanLeft
		inteval = inteval * -1 
	} else if( supermanX + inteval < 0 ){
		superman = supermanRight		
		inteval = inteval * -1 
	}
	
}

function ImageElement(element , xPos) {
		
	this.element = element
	this.inteval = 30;
	this.pictureDirection = supermanRight
	this.nextXposition = xPos
	
}

var imageElement = [];
var maxSize = 80;
var nowSize = 0;

//create x position

function getXposition(){

	return  Math.floor(Math.random() *  screen.width );	
}

//create y postion
function getYposition() {
	return  Math.floor(Math.random() *  screen.height );
}


//make superman
function makeSuperman() {
	
	
	if(nowSize >= maxSize){
		return;
	}
	
	var xPosition = getXposition();
	var yPosition = getYposition();
	
	var img = document.createElement("img");
	img.style.position='fixed'
	img.style.left = xPosition + "px"
	img.style.top = yPosition + "px"

	img.setAttribute("src", superman);
	
	document.body.appendChild(img)
	
	imageElement[nowSize] = new ImageElement(img, xPosition) 
	nowSize = nowSize + 1;
	
	
}


//move Timer
function move(){
	
	
	for(i = 0 ; i < nowSize; i ++){
		
		var img = imageElement[i].element
		var space = imageElement[i].inteval
		var direction = imageElement[i].pictureDirection
		var nX_position = imageElement[i].nextXposition
		
		img.style.left = nX_position + "px";		
		nX_position = nX_position + space
		
		
		if( nX_position > maxX ){
			direction = supermanLeft
			space = space * -1 
		} else if( nX_position < 0 ){
			direction = supermanRight		
			space = space * -1 
		}
		
		
		img.setAttribute("src" , direction)
		
		imageElement[i].element = img
		imageElement[i].inteval = space
		imageElement[i].pictureDirection = direction
		imageElement[i].nextXposition = nX_position
	}
	
	
}

//mouse move
function showBatman(width, height) {
	
	
	var batman = document.getElementById("mouse")
	
	var mouseXpos = window.event.clientX
	var mouseYpos = window.event.clientY
	
	/* console.log("position: " + mouseXpos + " " + mouseYpos) */
	
	var xPosition = mouseXpos - width/2
	var yPosition = mouseYpos - height/2
	
	batman.style.position='fixed'
	batman.style.left = xPosition + "px"
	batman.style.top = yPosition + "px"
	
	batman.setAttribute("src" , "image/batman.png")
	
}

//make Batman
function makeBatman() {
	
	var xPosition = 10;
	var yPosition = 10;
	
	var img = document.createElement("img");
	img.style.position='fixed'
	img.style.left = xPosition + "px"
	img.style.top = yPosition + "px"

	img.setAttribute("src", "image/batman.png");
	img.setAttribute("id", "mouse");
	
	document.body.appendChild(img)
	
}



</script>

<body>

	<div id="elem" style="cursor: pointer;" onclick="changeTheCircleColor()" >

		<svg id="svg" xmls="http://www.w3.org/2000/svg" width="600"	height="600" version="1.1"> 
			<circle id="circ" width="10" height="10" r="10" fill="red" >
		</svg>

	</div>
	<div id="pictureBox">
		<img id="picture">	
	</div>
	<button onclick="makeSuperman();" value="">btn </button>

	

</body>

</html>