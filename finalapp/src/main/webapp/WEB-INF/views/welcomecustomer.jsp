<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ page isELIgnored="false" %> 

<head>
<script type="text/javascript">

function addingaddress()
{
	var name=document.address.name.value;
	var mobile=document.address.mobile.value;
	var pincode=document.address.pincode.value;
	var address=document.address.address.value;
	var city=document.address.city.value;
	var state=document.address.state.value;
	
	if(name=="")
	{
	alert("Please enter Username : ");
	document.address.name.focus();
	return false;
	}
  
if(!isNaN(name))
	{
	alert("Username should contains characters only");
	document.address.name.select();
	return false;
	}
if(mobile=="")
{
alert("Please Enter your mobile number ");
document.address.mobile.focus();
return false;
}

if(isNaN(mobile))
{
alert("Please enter valid mobile number");
document.address.mobile.focus();
return false;
}	
if(pincode=="")
{
alert("Please Enter your pincode ");
document.address.pincode.focus();
return false;
}

if(isNaN(pincode))
{
	alert("Pincode should contain numbers only");
	document.address.pincode.focus();
return false;
}	
if(address=="")
{
alert("Please enter your address : ");
document.address.address.focus();
return false;
}
if(city=="")
{
alert("Please enter your city : ");
document.address.city.focus();
return false;
}

if(!isNaN(city))
{
alert("City name should contains characters only");
document.address.city.select();
return false;
}
if(state=="")
{
alert("Please Enter your state ");
document.address.state.focus();
return false;
}
	
}

</script>
</head>


 <body bgcolor=DACBC9>
<br>
<table align=center border=0 width=80%>
<tr align="center">
<td><h2><form action=reqsearchproducts><input type=text name="search" placeholder="search products here"><input type=submit value="search"></form></h2></td>
<td><h3><a href="reqviewcart">View Cart</a></h3></td>
<td><h3><a href="reqordersform">My orders</a></h3></td>
<td><h3><a href="reqcustomerloginform">Logout</a></h3></td></tr>

</table><br><br>

<!--  <a href="reqeditcustomerdetails">Account settings</a><br>-->

</h2>
</center>
<c:if test="${msg=='viewproductslist' || msg=='success'}">
<center>
<body bgcolor=#86D55C>
<table border=2 width=80%>
<tr bgcolor=pink align="center">
<td>Pid</td><td>Ctype</td><td>FileName</td><td>Pname</td><td>PPrice</td><td>Pqty</td><td>Product info</td><td>Image</td><td colspan=2 align=center>Actions</td></tr>
<c:forEach items="${products}" var="p">   
<c:forEach items="${filenames}" var="f">   
<c:if test="${p.getFilename()==f.getName()}">

<tr align="center"><td>${p.getPid()}</td><td>${p.getCtype()}</td><td>${p.getFilename()}</td><td>${p.getPname()}</td><td>${p.getPprice()}</td><td>${p.getPqty()}</td><td>${p.getProductinfo()}</td><td><img src=${filepath}/${f.getName()} height=100 width=100></td><td><a href=reqdeleteproduct?pid=${p.getPid()}>Delete Product</a></td><td><a href=reqeditproduct?pid=${p.getPid()}>Edit Product</a></td></tr>
</c:if>

</c:forEach>
</c:forEach>


</table>
</c:if>


<c:if test="${msg=='searchproducts' || msg=='search'}">

<center>
<body bgcolor=#86D55C>
<h3><a href=reqsorting?value=lh>Low to high</a></h3>
<h3><a href=reqsorting?value=hl>High to low</a></h3>
<table border=1 width=80%>
<tr bgcolor=pink align="center">
<td>Pname</td><td>PPrice</td><td>Productinfo</td><td>Image</td><td colspan=2 align=center>Actions</td></tr>
<c:forEach items="${products}" var="p">   
<c:forEach items="${filenames}" var="f">   
<c:if test="${p.getFilename()==f.getName()}">

<tr align="center"><td>${p.getPname()}</td><td>${p.getPprice()}</td><td>${p.getProductinfo()}</td><td><img src=${filepath}/${f.getName()} height=100 width=100></td><td><a href=reqviewproductbyid?pid=${p.getPid()}>Add to cart</a></td><td><a href=reqbuyproduct?pid=${p.getPid()}>Buy now</a></td></tr>

</c:if>

</c:forEach>
</c:forEach>


</table>
</c:if>



<c:if test="${msg=='viewbyid' || msg=='success'}">
<br><center>
<body bgcolor=#86D55C>
<form action="reqaddtocart2">
<table border=0 width=70%>
<tr bgcolor=pink align="center">
<!--  <td>Pname</td><td>PPrice</td><td>Pqty</td><td>Productinfo</td><td>Image</td><td colspan=2 align=center>Actions</td></tr>-->
<c:forEach items="${products}" var="p">   
<c:forEach items="${filenames}" var="f">   
<c:if test="${p.getFilename()==f.getName()}">
<tr align=center ><td rowspan="6"><img src=${filepath}/${f.getName()} height=300 width=300></td></tr>

<tr align=center><td>Product name:${p.getPname()}</td>
<tr align=center><td>Price:${p.getPprice()}</td>

<tr align=center><td>Quantity:<select name="pqty">
<option>1</option>
<option>2</option>
<option>3</option>
<option>4</option>
<option>5</option>

<tr align=center><td>Product info:${p.getProductinfo()}</td></tr>
<tr align=center><td><input type=submit value=Add> </td></tr>
<input type=hidden value="${p.getPid() }" name="pid">
<input type=hidden value="${p.getFilename() }" name="filename">
</c:if>
</c:forEach>
</c:forEach>
</table></form>
</c:if>

<c:if test="${msg=='buyproduct'}">
<center>
<body bgcolor=#86D55C>
<form action="reqbuy">
<table border=1 width=80%>
<tr bgcolor=pink align="center">
<td>Pname</td><td>PPrice</td><td>Pqty</td><td>Productinfo</td><td>Image</td><td colspan=2 align=center>Actions</td></tr>
<c:forEach items="${products}" var="p">   
<c:forEach items="${filenames}" var="f">   
<c:if test="${p.getFilename()==f.getName()}">
<td><input type=text value="${p.getPname()}" name="pname"></td><td><input type="text" value="${p.getPprice()}" name="pprice"></td>

<td><select name="pqty">
<option>1</option>
<option>2</option>
<option>3</option>
<option>4</option>
<option>5</option>
<input type=hidden value="${p.getPid() }" name="pid">
<input type=hidden value="${p.getFilename() }" name="filename">
<td> <input type="text" value="${p.getProductinfo()}" name="productinfo"></td><td><img src=${filepath}/${f.getName()} height=100 width=100></td><td><input type=submit value=Add> </td></tr>
</c:if>
</c:forEach>
</c:forEach>
</table></form>
</c:if>



<c:if test="${msg=='viewcartlist' || msg=='total'}">
<center>
<body bgcolor=#86D55C>
<form action="reqaddtocart2">
<table border=1 width=80%>
<tr bgcolor=pink align="center">
<td>Pname</td><td>Price</td><td>Quantity</td><td>Image</td><td colspan=2 align=center>Actions</td></tr>
<c:forEach items="${cart}" var="c">   
<c:forEach items="${filenames}" var="f">   
<c:if test="${c.getFilename()==f.getName()}">
<td>${c.getPname()}</td>
<td>${c.getPrice()}</td>
<td>${c.getQty()}</td>
<td><img src=${filepath}/${f.getName()} height=100 width=100 name=filename></td><td><a href=reqdeletecart?pid=${c.getPid()}>Remove</a> </td></tr>
<c:set var="total" value="${total + c.getPrice()*c.getQty()}" />
</c:if>

</c:forEach>
</c:forEach>
</table></form>
Total Bill: ${total}
<h2><a href="reqaddaddress">Buy Now</a></h2>
<!--  <h2><a href="reqbuy?oamt=${total}">Buy Now</a></h2>-->
</c:if>



<c:if test="${msg=='addressinfo' }">
<h3><a href=reqaddnewaddress>Click here </a>to add new address</h3>
<br>
<h2>OR</h2><br>
<h3><a href=reqexistingaddress>Click here </a>to use existing address<h3>
</c:if>

<c:if test="${msg=='newaddress'}">
<center><table border=1>
<form action="reqaddress" name="address" onsubmit="return addingaddress();">
<tr><td>Enter name:</td><td> <input type=text name="name"></td></tr>
<tr><td>Enter mobile: </td><td><input type=text name="mobile"></td></tr>
<tr><td>Enter pincode: </td><td><input type=text name="pincode"></td></tr>
<tr><td>Enter Address :</td><td><textarea rows=2 cols=15 name="address"></textarea></td></tr>
<tr><td>Enter city:</td><td> <input type=text name="city"></td></tr>
<tr><td>Enter state: </td><td><input type=text name="state"></td></tr>
<!--  <input type=submit value="Submit">-->
<tr><td><input type=submit value="Add"></td><td><input type=reset value="Clear"></td></tr>
</form></table></center>
</c:if>


<c:if test="${msg=='viewaddress'}">
<center>
<body bgcolor=#86D55C>
<table border=2 width=80%>
<tr bgcolor=pink align="center">
 Select address
<c:forEach items="${address}" var="l"> 
<a href=selectaddress?address=${l.getName()},${l.getAddress()},${l.getCity()},${l.getState()},${l.getPincode()}>${l.getName()}${l.getAddress()}${l.getCity()}${l.getPincode()}${l.getState()}</a>

</c:forEach>


</table>
</c:if>



<c:if test="${msg=='tran'}">
<c:forEach items="${cart}" var="c">   
<c:set var="total" value="${total + c.getPrice()*c.getQty()}" />
</c:forEach><center><table border=0>
<form action="reqtransaction">
<tr><td>Address</td><td>
<select name="address"> 
<option>Select Address</option>
<c:forEach items="${address}" var="l"> 
<option>${l.getName()},
${l.getAddress()},  ${l.getCity()},   ${l.getPincode()},   ${l.getState()}<br></option>
</c:forEach>
</select>
</td></tr>
<tr><td>Transaction Date:</td><td><input type="text" value="${odate}" name="tdate"></td></tr>
<tr><td>Transaction Amount:</td><td><input type="text" value="${total}" name="tamt"></td></tr>
<tr><td>Transaction type</td><td>
<select name="ttype"> 
<option>Select payment mode</option>
<option>COD</option>
<option>Credit card</option>
<option>Debit card</option>
<option>EMI</option>
</select>
</td></tr>
<tr ><td colspan="2"><center><input type=submit value="Pay Now"></center></td></tr>
</form></table>

</c:if>


<c:if test="${msg=='orderinfo' }">
<center>
<body bgcolor=#86D55C>
<table border=1 width=80%>
<tr bgcolor=pink align="center">
<td>Order ID</td><td>Transaction ID</td><td>Product name</td><td>Price</td><td>Quantity</td><td>Image</td><td>Date</td></tr>
<c:forEach items="${orders}" var="c">
   
<c:forEach items="${filenames}" var="f">   
<c:if test="${c.getFilename()==f.getName()}">
<td>${c.getOid()}</td>
<td>${c.getTid()}</td>
<td>${c.getPname()}</td>
<td>${c.getPrice()}</td>
<td>${c.getQty()}</td>
<td><img src=${filepath}/${f.getName()} height=100 width=100 name=filename></td><td>${c.getOdate()} </td></tr>
</c:if>

</c:forEach>
</c:forEach>
</form></table></center>
</c:if>


<c:if test="${msg=='order'}">
<h3>Your order has been successfully placed<br>
<a href="reqordersform">Click here</a> to check your orders.</h3>
</c:if>


<c:if test="${msg=='success'}">
Success
</c:if>

