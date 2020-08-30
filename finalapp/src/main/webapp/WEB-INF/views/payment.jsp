<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ page isELIgnored="false" %>
<html>
<head>


<link rel="stylesheet" href="webstuff/css/style.css">
<script type="text/javascript">

function adminvalidate()
{
	var uid=document.adminlogin.uid.value;
	var pwd=document.adminlogin.pwd.value;
	if(uid=="")
	{
	alert("Please Enter Username : ");
	document.adminlogin.uid.focus();
	return false;
	}
  
if(!isNaN(uid))
	{
	alert("Username should contains characters only");
	document.adminlogin.uid.select();
	return false;
	}
if(pwd=="")
{
	alert("Please Enter Password : ");
	document.adminlogin.pwd.focus();
	return false;
}

}

function validate() 
{
	var email=document.customerlogin.email.value;
	var pwd=document.customerlogin.pwd.value;
	
	
	if (email == "")
	{
	window.alert("Please enter your e-mail address.");
	email.focus();
	return false;
	}
	if (email.indexOf("@", 0) < 0)
	{
	window.alert("Please enter a valid e-mail address.");
	email.focus();
	return false;
	}
	if (email.indexOf(".", 0) < 0)
	{
	window.alert("Please enter a valid e-mail address.");
	email.focus();
	return false;
	}
if(pwd=="")
	{
		alert("Please Enter Password : ");
		document.customerlogin.pwd.focus();
		return false;
	}
}
function customervalidate() 
{
	var name=document.customerlogin.name.value;
	var email=document.customerlogin.email.value;
	var pwd=document.customerlogin.pwd.value;
	var city=document.customerlogin.city.value;
	var mobile=document.customerlogin.mobile.value;
	
	if(name=="")
	{
	alert("Please Enter Username : ");
	document.customerlogin.name.focus();
	return false;
	}
  
if(!isNaN(name))
	{
	alert("Username should contains characters only");
	document.customerlogin.name.select();
	return false;
	}
	if (email == "")
	{
	window.alert("Please enter a valid e-mail address.");
	email.focus();
	return false;
	}
	if (email.indexOf("@", 0) < 0)
	{
	window.alert("Please enter a valid e-mail address.");
	email.focus();
	return false;
	}
	if (email.indexOf(".", 0) < 0)
	{
	window.alert("Please enter a valid e-mail address.");
	email.focus();
	return false;
	}
if(pwd=="")
	{
		alert("Please Enter Password : ");
		document.customerlogin.pwd.focus();
		return false;
	}
if(city=="")
{
alert("Please Enter your city ");
document.customerlogin.city.focus();
return false;
}
if(mobile=="")
{
alert("Please Enter your mobile number ");
document.customerlogin.mobile.focus();
return false;
}

if(isNaN(mobile))
{
alert("Please enter valid mobile number");
document.customerlogin.mobile.focus();
return false;
}	
	
}

</script>
</head>


<body>

<c:if test="${msg=='admin'}">
<center>
<h2>AdminLogin</h2> <br>
<form action="reqadminlogin" name="adminlogin" method="post" onsubmit="return adminvalidate();" >
<table border=0><h2>
<tr><td><b>Username:</td><td><input type="text" name="uid"></td></tr>
<tr><td><b>Password:</td><td><input type="password" name="pwd"><br></td></tr>
<tr><td><input type="submit" value=Login></td><td><b><input type="reset" value=Clear></b></td></h2></td></tr></table></form>
   </c:if>

<c:if test="${msg=='adminfail'}">
<h3>Invalid credentials</h3>
</c:if>

<c:if test="${msg=='customer'}">
<center><h2>Customer Login</h2> <br>
<table border=0><h2>
<form action="reqpaymentlogin" name="customerlogin" method="post" onsubmit="return validate();" >
<tr><td><b>EmailID:</td><td><input type="text" name="email"></td></tr>
<tr><td><b>Password:</td><td><input type="password" name="pwd"><br></td></tr>
 <input type="hidden" value=${product.getPname()} name=pname></td>
<input type="hidden" value=${product.getPprice()} name=pprice></td>
<input type="hidden" value=${product.getPqty()} name=pqty></td>
<input type=hidden value="${product.getProductinfo()}" name="productinfo">
<input type=hidden value="${product.getPid()}" name="pid">
<input type=hidden value="${product.getFilename()}" name="filename"> 
<tr><td><input type="submit" value=Login></td><td><b><input type="reset" value=Clear></b></td></h2></td></tr></table></form>
<h3>Not an user?<a href=reqcustomerregisterform>Click here</a> to register</h3>
</c:if>

<c:if test="${msg=='customerfail'}">
<h3>Invalid credentials</h3>
</c:if>




<c:if test="${msg=='addcustomer' || msg=='registercustomer' || msg=='addingcustomerform' }">
<center><h2>Customer registration form</h2>
<hr color=red>
<table border=0 width=30%>
<form action="reqcustomerregister" name="customerlogin" method="post" onsubmit="return customervalidate();" >
<tr><td>Customer Name:</td><td><input type="text" name="name"></td></tr>
<tr><td>Email:</td><td><input type="text" name="email"></td></tr>
<tr><td>Password: </td><td><input type=text name="pwd"></td></tr>
<tr><td>City:</td><td><input type="text" name="city"></td></tr>
<tr><td>Mobile:</td><td><input type="text" name="mobile"></td></tr>
<tr><td><input type=submit value="register"><input type=reset value="Clear"></td></tr>
</form></table>
<h3><a href="reqcustomerloginform">Click here</a>  to Login</h3>
</c:if>
</body>
</h2>

<c:if test="${msg=='viewcartlist' || msg=='total'}">
<center>
<body bgcolor=#86D55C>
<table border=1 width=80%>
<tr bgcolor=pink align="center">
<td>Pname</td><td>Price</td><td>Quantity</td><td>Image</td><td colspan=2 align=center>Actions</td></tr>
<c:forEach items="${cart}" var="c">   
<c:forEach items="${filenames}" var="f">   
<c:if test="${c.getFilename()==f.getName()}">
<tr  align="center"><td>${c.getPname()}</td>
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
</c:if>


<c:if test="${msg=='viewbyidinhome' || msg=='success'}">
<br><center>
<body bgcolor=#86D55C>
<table border=0 width=70%>
<form action="reqpaymentloginform">
<tr bgcolor=pink align="center">
<c:forEach items="${products}" var="p">   
<c:forEach items="${filenames}" var="f">   
<c:if test="${p.getFilename()==f.getName()}">
<tr align=center ><td rowspan="6"><img src=${filepath}/${f.getName()} name=filename height=300 width=300></td></tr>
<tr align=center><td>Product name:<input type=text value=${p.getPname()} name=pname></td>
<tr align=center><td>Price:<input type=text value=${p.getPprice()} name=pprice></td>
<tr align=center><td>Quantity:<input type=text value=1 name=pqty></td>
<tr align=center><td>Product info:${p.getProductinfo()}</td></tr>
<input type=hidden value="${p.getProductinfo()}" name="productinfo">
<input type=hidden value="${p.getPid()}" name="pid">

<input type=hidden value="${p.getFilename()}" name="filename">
<tr align=center><td><input type="submit" value=PayNow></td></tr>
</c:if>
</c:forEach>
</c:forEach>
</table></form>
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

