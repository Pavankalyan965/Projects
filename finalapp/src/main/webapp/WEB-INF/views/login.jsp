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
<form action="reqcustomerlogin" name="customerlogin" method="post" onsubmit="return validate();" >
<tr><td><b>EmailID:</td><td><input type="text" name="email"></td></tr>
<tr><td><b>Password:</td><td><input type="password" name="pwd"><br></td></tr>
<tr><td><input type="submit" value=Login></td><td><b><input type="reset" value=Clear></b></td></h2></td></tr></table></form>
<h3>Not an user?<a href=reqcustomerregisterform>Click here</a> to register</h3>
</c:if>


<c:if test="${msg=='paymentlogin'}">
<center><h2>Customer Login</h2> <br>
<table border=0><h2>
<form action="reqpaymentlogin" name="customerlogin" method="post" onsubmit="return validate();" >
<tr><td><b>EmailID:</td><td><input type="text" name="email"></td></tr>
<tr><td><b>Password:</td><td><input type="password" name="pwd"><br></td></tr>
<tr><td><input type="submit" value=Login></td><td><b><input type="reset" value=Clear></b></td></h2></td></tr></table></form>
<h3>Not an user?<a href=reqpaymentregisterform>Click here</a> to register</h3>
</c:if>

<c:if test="${msg=='viewcartlist' || msg=='total'}">
<c:set var="total" value="${total + c.getPrice()*c.getQty()}" />
</c:if>
<c:forEach items="${cart}" var="c">   
<c:set var="total" value="${total + c.getPrice()*c.getQty()}" />
</c:forEach>


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


