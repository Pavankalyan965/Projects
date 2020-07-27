<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ page isELIgnored="false" %> 

<head>
<link rel="stylesheet" href="webstuff/css/style.css">
<link rel="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" href="webstuff/css/style.css">

<script type="text/javascript">

function addproductvalidate() 
{
	var pname=document.addproduct.pname.value;
	var ctype=document.addproduct.ctype.value;
	var pprice=document.addproduct.pprice.value;
	var pqty=document.addproduct.pqty.value;
	var productinfo=document.addproduct.productinfo.value;
	
	if(pname=="")
	{
		alert("Please enter product name : ");
		document.addproduct.pname.focus();
		return false;
	}
  
	if(!isNaN(pname))
	{
		alert("Product name should contains characters only");
		document.addproduct.pname.select();
		return false;
	}
	if(document.addproduct.ctype.selectedIndex==0)
	{
		alert("please select a category");
		return false;
	}
	if(productinfo=="")
	{
		alert("Please enter product specifications: ");
		document.addproduct.productinfo.focus();
		return false;
	}

	if(pqty=="")
	{
		alert("Please enter product quantity: ");
		document.addproduct.pqty.focus();
		return false;
	}
  
	if(isNaN(pqty))
	{
		alert("Product price should be in numbers only");
		document.addproduct.pqty.select();
		return false;
	}
	
	if(pprice=="")
	{
		alert("Please enter product price: ");
		document.addproduct.pprice.focus();
		return false;
	}
  
	if(isNaN(pprice))
	{
		alert("Product price should be in numbers only");
		document.addproduct.pprice.select();
		return false;
	}
	
  
}


</script>

</head>



<body bgcolor=DACBC9>
<div class="login">
<h2>
<ul>
<li class="active"><a href="reqhomepage">Home</a></li>
<li><a href="">Products</a>
	<div class="sub-menu-product">
		<ul>
			<li><a href="reqaddproductform">Add Products</a></li>
			<li><a href="reqallproducts">Manage Products</a></li>
		</ul>
	</div>
</li>	
<li><a href="">Categories</a>
	<div class="sub-menu-manage">
		<ul>
			<li><a href="reqaddcategoryform">Add categories</a></li>
			<li><a href="reqviewallcategories">Manage categories</a></li>	
		</ul>	
	</div>
</li>
<li><a href="reqviewallorders">Orders</a></li>
<li><a href="reqchecksalesbetweendates">Check sales between dates</a></li>
<li><a href="reqadminlogout">Logout </a></li>
</ul></h2>
</div>

<c:if test="${msg=='addproduct'}">
<center><h2>Add Product Form</h2>
<hr color=red>
<table border=0 width=30%><input type=hidden value="${p.getPname() }" value=pname>
 <form action="reqaddproduct" name="addproduct" method="post" onsubmit="return addproductvalidate();" enctype="multipart/form-data" >     
<tr><td>Product Name:</td><td> <input type=text name="pname" ></td></tr>
<tr><td>FileName:</td><td><input type="file" name="filename" placeholder="select image"></td></tr>
<tr><td>Category</td><td>
<select name="ctype"> 
<option>Select Category</option>
<c:forEach items="${clist}" var="clist">
<option>${clist.getCatname()}</option>
${clist.getCatname()}
</c:forEach>
</select>
</td></tr>
<tr><td>Product info:</td><td> <textarea rows=2 cols=20 name="productinfo"></textarea></td></tr>
<tr><td>Quantity:</td><td><input type="text" name="pqty"></td></tr>
<tr><td>Price:</td><td><input type="text" name="pprice"></td></tr><br>
<tr><td><input type=submit value="Add"></td><td><input type=reset value="Clear"></td></tr>
</form></table></center>
</c:if>

<c:if test="${msg=='success'}">
<center><h2>Product added succesfully</h2></center>
</c:if>



<c:if test="${msg=='viewproducts' || msg=='success'}"><br><br>
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

<c:if test="${msg=='editproduct'}">
<center><table>
<form action="requpdateproduct">
<c:forEach items="${products}" var="product"><br>
<tr><td>Product id: </td><td><input type=text name="pid"  readonly  value=${product.getPid()}></td></tr>
<tr><td>Product Name : </td><td><input type=text name=pname value=${product.getPname()}></td></tr>
<tr><td>product Price :</td><td><input type=text name=pprice value=${product.getPprice()}></td></tr>
<tr><td>product quantity :</td><td><input type=text name=pqty value=${product.getPqty()}></td></tr>
<tr><td>product info:</td><td><input type=text name=productinfo value=${product.getProductinfo()}></td></tr>
<input type=hidden name=filename value=${product.getFilename()}>
<input type=hidden name=ctype value=${product.getCtype()}>
<tr><td><input type=submit value="Update Product"></td><td><input type=reset value="clear"></td></tr>
</form></c:forEach></center>
</c:if>


<c:if test="${msg=='editcategory'}">
<center><table>
<form action="requpdatecategory">
<c:forEach items="${category}" var="category"><br><br>
<tr><td>Category id: </td><td><input type=text name="cid"  readonly  value=${category.getCid()}></td></tr>
<tr><td>Category Name : </td><td><input type=text name=name value=${category.getName()}></td></tr>
<tr><td><input type=submit value="Update"></td><td><input type=reset value="clear"></td></tr>
</form></c:forEach></table></center>
</c:if>


<c:if test="${msg=='viewcategorybyid'}"><br><center><table>
<form action=requpdatecat>
<tr><td>Category ID</td><td><input type=text name=cid readonly value="${categroy.getCid()}"></td></tr>
<tr><td>CategoryName</td><td><input type=text name=catname value="${categroy.getCatname()}"></td></tr>
<tr><td><input type=submit value="Update"></td><td><input type=reset value="clear"></td></tr>
</from></table></center>
</c:if>


<c:if test="${msg=='viewcat'}">
<h3>Product Categories</h3>
<center>
<body bgcolor=#A4DEEB>
<table border=2 width=50%>
<tr align=center><td>Category ID</td><td>Category Name</td><td>Actions</td></tr>
<c:forEach items="${clist}" var="clist">
<tr align=center><td>${clist.getCid()}</td><td>${clist.getCatname()}</td><td><a href="reqdisplayproducts?catname=${clist.getCatname()}">Display Products</a>|<a href="reqdeletecategory?cid=${clist.getCid()}">Delete</a>|<a href="reqeditcat?cid=${clist.getCid()}">Edit</a></td></tr>
</c:forEach>
</table>
</body>
</center>
</c:if>

<c:if test="${msg=='addcategoryform' || msg1=='Category added Successfully'}"><br><br>
<center><h1>Add category form</h1><br>
<form action="reqaddcategory">
<input type=text name="catname" placeholder=" Enter category">
<td><input type="submit" value="Submit"></td>
</form><br>
${msg1}</center>
</c:if>

<c:if test="${msg=='productslist'}">
<center>
<table border=2 width=80%>
<tr bgcolor=yellow align="center"><td>Pid</td><td>Ctype</td><td>FileName</td><td>Pname</td><td>PPrice</td><td>Pqty</td><td>Productinfo</td><td>Image</td><td colspan=2 align=center>Actions</td></tr>
<c:forEach items="${plist}" var="p">  
<c:forEach items="${filenames}" var="f">   
<c:if test="${p.getFilename()==f.getName()}">
<tr align="center"><td>${p.getPid()}</td><td>${p.getCtype()}</td><td>${p.getFilename()}</td><td>${p.getPname()}</td><td>${p.getPprice()}</td><td>${p.getPqty()}</td><td>${p.getProductinfo()}</td><td><img src=${filepath}/${f.getName()} height=100 width=100></td><td><a href=reqdeleteproduct?pid=${p.getPid()}>Delete Product</a></td><td><a href=reqeditproduct?pid=${p.getPid()}>Edit Product</a></td></tr>
</c:if>
</c:forEach>
</c:forEach>
</table>
</center>
</c:if>


<c:if test="${msg=='viewallorders' }">
<br><br><center>
<body bgcolor=#86D55C>
<table border=1 align="center" width=80%>
<tr bgcolor=skyblue align="center">
<td>Customer name</td><td>Order ID</td><td>Transaction ID</td><td>Product name</td><td>Price</td><td>Quantity</td><td>Image</td><td>Date</td></tr>
<c:forEach items="${orders}" var="c">
<c:forEach items="${filenames}" var="f">   
<c:if test="${c.getFilename()==f.getName()}">
<tr align="center"><center><td>${c.getCid()}</td>
<td>${c.getOid()}</td>
<td>${c.getTid()}</td>
<td>${c.getPname()}</td>
<td>${c.getPrice()}</td>
<td>${c.getQty()}</td>
<td><img src=${filepath}/${f.getName()} height=100 width=100 name=filename></td><td>${c.getOdate()} </td></tr>
</c:if>
</c:forEach>
</c:forEach>
</table></center>
</c:if>

<c:if test="${msg=='check sales'}">
<form action=reqviewordersbetweendates>
<td>Start date<input type="date" name=start></td><br>
<td>End date<input type="date" name=end></td><br>
<input type="submit" value=submit>
</form>
</c:if>

