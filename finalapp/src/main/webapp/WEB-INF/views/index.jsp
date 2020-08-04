<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ page isELIgnored="false" %>
<html>
<head>


<link rel="stylesheet" href="webstuff/css/style.css">
</head>


<body>
<div class="login">
<ul>
  <li><form action=reqsearchproducts2>
<input type=text name="search"><button>
<i class="fa fa-search" aria-hidden="true"></i></button>
</form>
</li>
<li><h2><a href="">Login</a></h2>
	<div class="sub-menu-manage">
		<ul>
			<li><h2><a href="reqadminloginform">Admin</a></h2></li>
			<li><h2><a href="reqcustomerloginform">Customer</a></h2></li>	
		</ul>	
	</div>
</li>


</ul>
</div>
<br>


<c:if test="${msg=='viewproductslist' || msg=='success'}">
<div class="categories">
<h1>Electronics
<a href=reqsearchproducts2?search=Electronics><button>VIEW ALL</button></a></h1> 
<hr color=#E5E8E8>
<br><c:forEach items="${product}" var="p">   
<c:forEach items="${filenames}" var="f">   
<c:if test="${p.getFilename()==f.getName()}">
<ul><li>
<a href="reqviewproductinhome?pid=${p.getPid()}">
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
<a href=reqsearchproducts2?search=Fashion><button>VIEW ALL</button></a></h1> 
<hr color=#E5E8E8>
<br><c:forEach items="${products}" var="p1">  
<c:forEach items="${filenames}" var="f">   
<c:if test="${p1.getFilename()==f.getName()}">
<ul><li>
<a href="reqviewproductinhome?pid=${p1.getPid()}">
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
<a href=reqsearchproducts2?search=Sports><button>VIEW ALL</button></a></h1> 
<hr color=#E5E8E8>
<br><c:forEach items="${Sports}" var="s">   
<c:forEach items="${filenames}" var="f">   
<c:if test="${s.getFilename()==f.getName()}">
<ul><li>
<a href="reqviewproductinhome?pid=${s.getPid()}">
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
<a href=reqsearchproducts2?search=Housing><button>VIEW ALL</button></a></h1> 
<hr color=#E5E8E8>
<br><c:forEach items="${Housing}" var="h">   
<c:forEach items="${filenames}" var="f">   
<c:if test="${h.getFilename()==f.getName()}">
<ul><li>
<a href="reqviewproductinhome?pid=${h.getPid()}">
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
<a href=reqsearchproducts2?search=Groceries><button>VIEW ALL</button></a></h1> 
<hr color=#E5E8E8>
<br><c:forEach items="${Groceries}" var="g">   
<c:forEach items="${filenames}" var="f">   
<c:if test="${g.getFilename()==f.getName()}">
<ul><li>
<a href="reqviewproductinhome?pid=${g.getPid()}">
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

