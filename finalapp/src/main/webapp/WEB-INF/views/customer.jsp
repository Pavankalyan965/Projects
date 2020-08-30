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


<body>
<div class="login">
<h2>
<ul>
	<li><a href="reqcus">Home</a>
	</li>
	<li><h2><form action=reqsearchproducts><input type=text name="search" placeholder="search here"><input type=submit value="search"></form></h2></li>
	
<li><a href="">Welcome</a>
	<div class="sub-menu-manage">
		<ul>
			<li><a href="reqordersform">My orders</a></li>
			<li><a href="reqlogout">Logout</a></li>	
		</ul>	
	</div>
</li>
<li><a href="reqviewcart">View Cart</a></li>
</ul></h2>
</div>
<br>
</h2>
</center>



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


<c:if test="${msg=='viewbyidinhome' || msg=='success'}">
<br><center>
<body bgcolor=#86D55C>
<table border=0 width=70%>
<tr bgcolor=pink align="center">
<c:forEach items="${products}" var="p">   
<c:forEach items="${filenames}" var="f">   
<c:if test="${p.getFilename()==f.getName()}">
<tr align=center ><td rowspan="6"><img src=${filepath}/${f.getName()} height=300 width=300></td></tr>
<tr align=center><td>Product name:<input type=text value=${p.getPname()} name=pname></td>
<tr align=center><td>Price:<input type=text value=${p.getPprice()} name=pprice></td>
<tr align=center><td>Quantity:<input type=text value=1 name=pqty></td>
<tr align=center><td>Product info:${p.getProductinfo()}</td></tr>
<input type=hidden value="${p.getPid()}" name="pid">
<input type=hidden value="${p.getFilename()}" name="filename">
<tr align=center><td><a href="reqpaymentloginform">Buy now</td></tr>
</c:if>
</c:forEach>
</c:forEach>
</table></form>
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

<c:if test="${msg=='searchproducts2' || msg=='search2'}">
<center>
<body bgcolor=#86D55C>
<h2>Sort by price</h2><br>
<h3><a href=reqsorting?value=lh>Low to high</a></h3>
<h3><a href=reqsorting?value=hl>High to low</a></h3><br>
<table border=1 width=80%>
<tr bgcolor=pink align="center">
<td>Pname</td><td>PPrice</td><td>Productinfo</td><td>Image</td><td colspan=2 align=center>Actions</td></tr>
<c:forEach items="${products}" var="p">   
<c:forEach items="${filenames}" var="f">   
<c:if test="${p.getFilename()==f.getName()}">
<tr align="center"><td>${p.getPname()}</td><td>${p.getPprice()}</td><td>${p.getProductinfo()}</td><td><img src=${filepath}/${f.getName()} height=100 width=100></td><td><a href=reqviewproductinhome?pid=${p.getPid()}>Buy</a></td></tr>
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
<c:forEach items="${products}" var="p">   
<c:forEach items="${filenames}" var="f">   
<c:if test="${p.getFilename()==f.getName()}">
<tr align=center ><td rowspan="6"><img src=${filepath}/${f.getName()} height=300 width=300></td></tr>
<tr align=center><td>Product name:<input type=text value=${p.getPname()} name=pname></td>
<tr align=center><td>Price:<input type=text value=${p.getPprice()} name=pprice></td>
<tr align=center><td>Quantity:<select name="pqty">
<option>1</option>
<option>2</option>
<option>3</option>
<option>4</option>
<option>5</option>
<tr align=center><td>Product info:${p.getProductinfo()}</td></tr>
<input type=hidden value="${p.getPid()}" name="pid">
<input type=hidden value="${p.getFilename()}" name="filename">
<tr align=center><td><input type=submit value=Add> </td><tr align=center><td><a href="reqbuyproduct">Pay </td></tr>
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



<c:if test="${msg=='addressinfo' }">
<h3><a href=reqaddnewaddress>Click here </a>to add new address</h3>
<br>
<h2>OR</h2><br>
<h3><a href=reqexistingaddress>Click here </a>to use existing address<h3>
</c:if>

<c:if test="${msg=='addressinfo2' }">
<h3><a href=reqaddnewaddress>Click here </a>to add new address</h3>
<br>
<h2>OR</h2><br>
<h3><a href=reqexistingaddress2>Click here </a>to use existing address<h3>
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


<c:if test="${msg=='tran2'}">
<center><table border=0>
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
<tr><td>Transaction Amount:</td><td><input type="text" value="${product.getPprice()*product.getPqty()}" name="tamt"></td></tr>
<tr><td>Transaction type</td><td>
<select name="ttype"> 
<option>Select payment mode</option>
<option>COD</option>
<option>Credit card</option>
<option>Debit card</option>
<option>EMI</option>
</select>
</td></tr>
 <input type="hidden" value=${product.getPname()} name=pname></td>
<input type="hidden" value=${product.getPprice()} name=pprice></td>
<input type="hidden" value=${product.getPqty()} name=pqty></td>
<input type=hidden value="${product.getProductinfo()}" name="productinfo">
<input type=hidden value="${product.getPid()}" name="pid">
<input type=hidden value="${product.getFilename()}" name="filename"> 
<tr ><td colspan="2"><center><input type=submit value="Place order"></center></td></tr>
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




<c:if test="${msg=='viewproductslist' || msg=='success'}">
<div class="categories">
<h1>Electronics
<a href=reqsearchproducts?search=Electronics><button>VIEW ALL</button></a></h1> 
<hr color=#E5E8E8>
<br><c:forEach items="${product}" var="p">   
<c:forEach items="${filenames}" var="f">   
<c:if test="${p.getFilename()==f.getName()}">
<ul><li>
<a href="reqviewproductbyid?pid=${p.getPid()}">
<img src=${filepath}/${f.getName()} height=150 width=150><br>
${p.getPname()}<br>
Price:${p.getPprice()}</a></li>
</ul>
</c:if>
</c:forEach>
</c:forEach>
</div>
<br>




<div class="fashion">
<h1>Fashion
<a href=reqsearchproducts?search=Fashion><button>VIEW ALL</button></a></h1> 
<hr color=#E5E8E8>
<br><c:forEach items="${products}" var="p1">  
<c:forEach items="${filenames}" var="f">   
<c:if test="${p1.getFilename()==f.getName()}">
<ul><li>
<a href="reqviewproductbyid?pid=${p1.getPid()}">
<img src=${filepath}/${f.getName()} height=150 width=150><br>
${p1.getPname()}<br>
Price:${p1.getPprice()}</a></li>
</ul>
</c:if>
</c:forEach>
</c:forEach>
</div>
<br>

<div class="Sports">
<h1>Sports
<a href=reqsearchproducts?search=Sports><button>VIEW ALL</button></a></h1> 
<hr color=#E5E8E8>
<br><c:forEach items="${Sports}" var="s">   
<c:forEach items="${filenames}" var="f">   
<c:if test="${s.getFilename()==f.getName()}">
<ul><li>
<a href="reqviewproductbyid?pid=${s.getPid()}">
<img src=${filepath}/${f.getName()} height=150 width=150><br>
${s.getPname()}<br>
Price:${s.getPprice()}</a></li>
</ul>
</c:if>
</c:forEach>
</c:forEach>
</div>
<br>


<div class="Housing">
<h1>Housing
<a href=reqsearchproducts?search=Housing><button>VIEW ALL</button></a></h1> 
<hr color=#E5E8E8>
<br><c:forEach items="${Housing}" var="h">   
<c:forEach items="${filenames}" var="f">   
<c:if test="${h.getFilename()==f.getName()}">
<ul><li>
<a href="reqviewproductbyid?pid=${h.getPid()}">
<img src=${filepath}/${f.getName()} height=150 width=150><br>
${h.getPname()}<br>
Price:${h.getPprice()}</a></li>
</ul>
</c:if>
</c:forEach>
</c:forEach>
</div>
<br>



<div class="Groceries">
<h1>Groceries
<a href=reqsearchproducts?search=Groceries><button>VIEW ALL</button></a></h1> 
<hr color=#E5E8E8>
<br><c:forEach items="${Groceries}" var="g">   
<c:forEach items="${filenames}" var="f">   
<c:if test="${g.getFilename()==f.getName()}">
<ul><li>
<a href="reqviewproductbyid?pid=${g.getPid()}">
<img src=${filepath}/${f.getName()} height=150 width=150><br>
${g.getPname()}<br>
Price:${g.getPprice()}</a></li>
</ul>
</c:if>
</c:forEach>
</c:forEach>
</div>
<br>
</c:if>

