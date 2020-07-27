package finalapp.controller;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.servlet.Servlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import finalapp.dao.DaoImple;
import finalapp.dao.DaoInterface;
import finalapp.model.Address;
import finalapp.model.AdminLogin;
import finalapp.model.Cart;
import finalapp.model.Category;
import finalapp.model.Customer;
import finalapp.model.Orders;
import finalapp.model.Product;
import finalapp.model.Transactions;

@Controller
public class HomeController 
{
	public static final String cloud="F://cloud";
	@RequestMapping("/")
	public ModelAndView homePage()
	{
		String name="Electronics";
		List<Product> lp=new DaoImple().viewElectronics(name);
		String Fashion="Fashion";
		List<Product> lf=new DaoImple().viewFashion(Fashion);
		String Sports="Sports";
		List<Product> ls=new DaoImple().viewSports(Sports);
		File f=new File("F://cloud");
		File filenames[]=f.listFiles();
		ModelAndView mav=new ModelAndView("index");
		mav.addObject("product",lp);
		mav.addObject("filenames",filenames);  
		mav.addObject("filepath",f);
		mav.addObject("products",lf);
		mav.addObject("filenames",filenames);  
		mav.addObject("filepath",f);
		mav.addObject("products",ls);
		mav.addObject("filenames",filenames);  
		mav.addObject("filepath",f);
		mav.addObject("msg","viewproductslist");
		
		
		return mav;
	}
	@RequestMapping("/reqhomepage")
	public String adminHome()
	{
		return "adminoperations";
	}
	@RequestMapping("/reqadminloginform")
	public ModelAndView adminLoginForm()
	{
		ModelAndView mav=new ModelAndView("index");
		mav.addObject("msg","admin");
		return mav;
	}
	@RequestMapping("/reqadminlogin")
	public ModelAndView adminLogin(@ModelAttribute("adminlogin") AdminLogin adminlogin)
	{
		ModelAndView mav=null;
		boolean b=false;
		b=new DaoImple().adminLogin(adminlogin);
		if(b)
		{
			mav=new ModelAndView("adminoperations");
		}
		else
		{
			mav=new ModelAndView("index");
			mav.addObject("msg","adminfail");
		}
		return mav;
	}
	@RequestMapping("/reqadminlogout")
	public ModelAndView adminLogout()
	{
		Product p=new Product();
		String name="Electronics";
		List<Product> lp=null;
		lp=new DaoImple().viewElectronics(name);
		
		lp=new DaoImple().viewFashion(name);
		File f=new File("F://cloud");
		File filenames[]=f.listFiles();
		ModelAndView mav=new ModelAndView("index");
		mav.addObject("products",lp); 
		mav.addObject("filenames",filenames);  
		mav.addObject("filepath",f);           
		mav.addObject("msg","viewproductslist");
		return mav;
	}
	@RequestMapping("/reqcustomerregisterform")
	public ModelAndView customerRegisterForm()
	{
		ModelAndView mav=new ModelAndView("index");
		mav.addObject("msg","addingcustomerform");
		return mav;
	}
	@RequestMapping("/reqcustomerregister")
	public ModelAndView customerRegister(Customer c)
	{
		ModelAndView mav=new ModelAndView();
		boolean b=false;
		b=new DaoImple().customerRegister(c);
		if(b)
		{
			mav=new ModelAndView("index");
			mav.addObject("msg","addcustomer");
		}
		return mav;
	}
	@RequestMapping("/reqcustomerloginform")
	public ModelAndView customerLoginForm()
	{
		ModelAndView mav=new ModelAndView("index");
		mav.addObject("msg","customer");
		return mav;
	}
	
	@RequestMapping("/reqcustomerlogin")
	public ModelAndView customerLogin(@ModelAttribute("customerlogin") Customer customerlogin,HttpSession hs)
	{ 
		hs.setAttribute("name",customerlogin.getEmail());
		ModelAndView mav=null;
		boolean b=false;
		b=new DaoImple().customerLogin(customerlogin);
		if(b)
		{
			mav=new ModelAndView("welcomecustomer");
		}
		else
		{
			mav=new ModelAndView("index");
			mav.addObject("msg","customerfail");
		}
		return mav;
	}
	@RequestMapping("/reqaddtocart2")
	 public ModelAndView addToCart(@ModelAttribute("product") Product product,HttpSession hs)  
	 {
		 boolean b=false;
		 String name=hs.getAttribute("name").toString();
		 System.out.println("name"+name);
		 b=new DaoImple().addToCart(product,name);
		 List<Cart> lcart=null;
		 lcart=new DaoImple().viewCart(name);
		 File f=new File("F://cloud");
		 File filenames[]=f.listFiles();
		 ModelAndView mav=new ModelAndView("welcomecustomer");
		 mav.addObject("cart",lcart); 
		 mav.addObject("filenames",filenames);
		 mav.addObject("filepath",f);
		 mav.addObject("msg","viewcartlist");
		 return mav;
	 }
	@RequestMapping("/reqviewcart")
	public ModelAndView viewCart(@ModelAttribute("cart") Cart cart,HttpSession hs)
	{
		 List<Cart> lcart=null;
		 String name=hs.getAttribute("name").toString();
		 lcart=new DaoImple().viewCart(name);
		 File f=new File("F://cloud");
		 File filenames[]=f.listFiles();
		 ModelAndView mav=new ModelAndView("welcomecustomer");
		 mav.addObject("cart",lcart); 
		 mav.addObject("filenames",filenames);
		 mav.addObject("filepath",f);
		 mav.addObject("msg","viewcartlist");
		 mav.addObject("msg","total");
		 return mav;
	 
	}
	@RequestMapping("/reqaddaddress")
    public ModelAndView addAddress()
    {
    	ModelAndView mav=new ModelAndView("welcomecustomer");
    	mav.addObject("msg","addressinfo");
    	return mav;
    }
    @RequestMapping("/reqaddress")
    public ModelAndView address(@ModelAttribute("address") Address address,HttpSession hs)
    {
    	String name= hs.getAttribute("name").toString();
    	boolean b=false;
    	b=new DaoImple().addaddress(address,name);
    	List<Cart> lcart=null;
		lcart=new DaoImple().viewCart(name);
		 Date d1=new Date();
		 java.sql.Date d=new java.sql.Date(d1.getYear(),d1.getMonth(),d1.getDate());
		 List<Address> l=new DaoImple().viewAddress(name);	
    	ModelAndView mav=null;
    	if(b)
    	{
    	 mav=new ModelAndView("welcomecustomer");
    	mav.addObject("address",l);
       	mav.addObject("cart",lcart); 
    	mav.addObject("odate",d.toString());
    	mav.addObject("msg","tran");
    	}
    	return mav;
    }
    @RequestMapping("/reqexistingaddress")
    public ModelAndView reqexistingaddress(HttpSession session)
    { String name=session.getAttribute("name").toString();
    	boolean b=false;
    	List<Cart> lcart=null;
    	lcart=new DaoImple().viewCart(name);
		 Date d1=new Date();
		 java.sql.Date d=new java.sql.Date(d1.getYear(),d1.getMonth(),d1.getDate());
		 List<Address> l=new DaoImple().viewAddress(name);	
    	ModelAndView mav=null;
    	 mav=new ModelAndView("welcomecustomer");
    	mav.addObject("address",l);
    
    	mav.addObject("cart",lcart); 
		 
    	mav.addObject("odate",d.toString());
    	mav.addObject("msg","tran");
    	return mav;
    }
    
    
    @RequestMapping("/reqaddnewaddress")
    public ModelAndView addnewaddress()
    {
    	ModelAndView mav=new ModelAndView("welcomecustomer");
       	mav.addObject("msg","newaddress");
       	return mav;
    }
    
    @RequestMapping("/reqviewaddress")
    public ModelAndView viewAddress(HttpSession session)
    {String name=session.getAttribute("name").toString();
    	List<Address> l=new DaoImple().viewAddress(name);
    	ModelAndView mav=new ModelAndView("welcomecustomer");
    	mav.addObject("address",l);
    	mav.addObject("msg","viewaddress");
    	return mav;
    }
    
	
	@RequestMapping("/reqaddproductform")
	public ModelAndView addProductForm()
	{
		 List<Category> clist=null;
		 clist=new DaoImple().viewAllCaterories();
		 ModelAndView mav=new ModelAndView("adminoperations");
		 mav.addObject("msg","addproduct");
		 mav.addObject("clist",clist);
	return mav;
	}
	@RequestMapping("/reqaddproduct")
	public ModelAndView addProduct(HttpServletRequest req)
	{
		Product p=new Product();
		ModelAndView mav=new ModelAndView();
		if(ServletFileUpload.isMultipartContent(req))
		{
			try
			{
				List<FileItem> multiparts=new ServletFileUpload(new DiskFileItemFactory()).parseRequest(req);
				for(FileItem item:multiparts)
				{
					if(!item.isFormField())
					{
						p.setFilename(new File(item.getName()).getName());
						item.write(new File(cloud+File.separator+p.getFilename()));
					}
					else
					{
						if(item.getFieldName().equals("ctype"))
						{
							p.setCtype(item.getString());
						}
						if(item.getFieldName().equals("pname"))
						{
							p.setPname(item.getString());
						}
						if(item.getFieldName().equals("productinfo"))
						{
							p.setProductinfo(item.getString());
						}
						if(item.getFieldName().equals("pqty"))
						{
							p.setPqty(Integer.parseInt(item.getString()));
						}
						if(item.getFieldName().equals("pprice"))
						{
							p.setPprice(Double.parseDouble(item.getString()));
						}
						
					}
				}
				boolean b=false;
				b=new DaoImple().addProduct(p);
				if(b)
				{
					mav=new ModelAndView("adminoperations");
					mav.addObject("msg1","success");
					
				}
				}
					catch(Exception e)
					{
						System.out.println(e);
					}
				
				
			        } 
			 return mav;	
	}
	
	@RequestMapping("/reqallproducts")
	 public ModelAndView  viewAllProducts()
	 {
		 List<Product> al=null;
		 al=new DaoImple().viewAllProducts();
	     File f=new File("F://cloud");
	    File filenames[]=f.listFiles();
		 ModelAndView mav=new ModelAndView("adminoperations");
		 mav.addObject("products",al); 
		 mav.addObject("filenames",filenames);  // adding imges info
		 mav.addObject("filepath",f);            // adding cloud folder path
		 mav.addObject("msg","viewproducts");
		 return mav;
	 }
	@RequestMapping("/reqviewallproducts")
	 public ModelAndView  viewProducts()
	 {
		 List<Product> al=null;
		 al=new DaoImple().viewAllProducts();
	     File f=new File("F://cloud");
	    File filenames[]=f.listFiles();
		 ModelAndView mav=new ModelAndView("welcomecustomer");
		 mav.addObject("products",al); 
		 mav.addObject("filenames",filenames);  // adding imges info
		 mav.addObject("filepath",f);            // adding cloud folder path
		 mav.addObject("msg","viewproductslist");
		 return mav;
	 }
	
	@RequestMapping("/reqdeleteproduct")
	public ModelAndView deleteProduct(@RequestParam("pid") String pid)
	{
		ModelAndView mav=new ModelAndView();
		boolean b=false;
		Product p=new Product();
		p.setPid(pid);
		b=new DaoImple().deleteProduct(p);
		if(b)
		{
			mav=new ModelAndView();
			mav.setViewName("redirect:reqallproducts");
			mav.addObject("msg","Success");
		}
		return mav;
	}
	 @RequestMapping("/reqviewallcategories")
	 public ModelAndView viewAllCategories()
	 {
		 List<Category> clist=null;
		 clist=new DaoImple().viewAllCaterories();
		 
		 ModelAndView mav=new ModelAndView("adminoperations");
		 mav.addObject("msg","viewcat");
		 mav.addObject("clist",clist);
		 
		 return mav;
	 }
	 @RequestMapping("/reqaddcategoryform")
	 public ModelAndView addCategoryForm()
	 {
		 ModelAndView mav=new ModelAndView("adminoperations");
		 mav.addObject("msg","addcategoryform");
		 
		 return mav;
	 }
	 @RequestMapping("/reqaddcategory")
	 public ModelAndView addCategory(@ModelAttribute("categories") Category catergories)
	 {
		 boolean b=false;
		 ModelAndView mav=null;
		
         b=new DaoImple().addCategory(catergories);	 
		 if(b)
		 {
          mav=new ModelAndView("adminoperations");
          mav.addObject("msg1","Category added Successfully");
		 }
		 else
		 {
			 mav=new ModelAndView("adminoperations");
	          mav.addObject("msg1","fail"); 
		 }
		

		 return mav;
		 
	 }
	 @RequestMapping("/reqdisplayproducts")
		public ModelAndView displayProducts(@RequestParam("catname") String catname)
		{
			List<Product> plist=null;
			plist=new DaoImple().displayProducts(catname);
			
			for(Product p:plist)
			{
				System.out.println("h: "+p.getPname()+" : "+p.getFilename());
			}
			
			ModelAndView mav=new ModelAndView("adminoperations");
			File f=new File("F://cloud");
		    File filenames[]=f.listFiles();
			mav.addObject("plist",plist);     // adding product info
			mav.addObject("filenames",filenames);  // adding img filenames
		     mav.addObject("filepath",f);
			mav.addObject("msg","productslist");
			
			return mav;
		}
	 	
		@RequestMapping("/reqeditproduct")
		public ModelAndView editproduct(@RequestParam("pid") String pid)
		{
		List<Product> list;
		list=new DaoImple().viewProductById(pid);
		 File f=new File("F://cloud");
	     File filenames[]=f.listFiles();
		 ModelAndView mav=new ModelAndView("adminoperations");
		 mav.addObject("products",list); 
		 mav.addObject("filenames",filenames);
		 mav.addObject("filepath",f);
		 mav.addObject("msg","editproduct");
		 return mav;
			
		}
	
		@RequestMapping("/requpdateproduct")
		public ModelAndView updateproduct(@ModelAttribute("product") Product product)
		{    boolean b=false;
		     b=new DaoImple().updateproduct(product);
		     List<Product> al=null;
			 al=new DaoImple().viewAllProducts();
		     File f=new File("F://cloud");
		     File filenames[]=f.listFiles();
			 ModelAndView mav=new ModelAndView("adminoperations");
			 mav.addObject("products",al); 
			 mav.addObject("filenames",filenames);
			 mav.addObject("filepath",f);
			 mav.addObject("msg","viewproducts");
			 return mav;
		}
		@RequestMapping("/requpdatecategory")
		public ModelAndView updatecategory(@ModelAttribute("category") Category category)
		{
			boolean b=false;
			Category c=new Category();
			b=new DaoImple().updatecategory(category);
			ModelAndView mav=new ModelAndView("adminoperations");
			mav.addObject("msg","viewcat");	 
			return mav;
		}
		
		@RequestMapping("/reqeditcategory")
		public ModelAndView editcategory(@RequestParam("cid") String cid)
		{
	 		boolean b= false;
	 		Category c=new Category();
	 		b=new DaoImple().updatecategory(c);
	 		ModelAndView mav=new ModelAndView("adminoperations");
	 		mav.addObject("msg", "editcategory");
	 		return mav;
		}
		@RequestMapping("/reqdeletecategory")
		public ModelAndView deleteCategory(@RequestParam("cid") String cid)
		{
			boolean b=false;
			ModelAndView mav=null;
			Category c=new Category();
			c.setCid(cid);
			b=new DaoImple().deleteCategory(c);
			if(b)
			{
			 mav=new ModelAndView();
			 mav.addObject("msg","Category deleted successfully");
			 mav.setViewName("redirect:reqviewallcategories");
			}
			return mav;
		}
		@RequestMapping("/reqdeletecart")
		public ModelAndView deleteCart(@RequestParam("pid") String pid,HttpSession session)
		{String name=session.getAttribute("name").toString();
			boolean b=false;
			Cart c=new Cart();
			c.setPid(pid);
			b=new DaoImple().deleteCart(c,name);
			List<Cart> lcart=null;
			 lcart=new DaoImple().viewCart(name);
			 File f=new File("F://cloud");
			 File filenames[]=f.listFiles();
			 ModelAndView mav=new ModelAndView("welcomecustomer");
			 mav.addObject("cart",lcart); 
			 mav.addObject("filenames",filenames);
			 mav.addObject("filepath",f);
			 mav.addObject("msg","viewcartlist");
			 return mav;
		 
		}
		@RequestMapping("/reqsearchproducts")
		 public ModelAndView  searchProducts(@RequestParam("search") String search,HttpSession ses)
		 {
			 List<Product> al=null;
			 ses.setAttribute("search", search);
			 al=new DaoImple().searchProducts(search);
			
		     File f=new File("F://cloud");
		     File filenames[]=f.listFiles();
			 ModelAndView mav=new ModelAndView("welcomecustomer");
			 mav.addObject("products",al); 
			 mav.addObject("filenames",filenames);
			 mav.addObject("filepath",f);
			 mav.addObject("msg","search");
			 return mav;
		 }
		@RequestMapping("/reqviewproductbyid")
		public ModelAndView viewProductByID(@RequestParam("pid") String pid)
		{
			List<Product> al=null;
			 al=new DaoImple().viewProductById(pid);
		     File f=new File("F://cloud");
		     File filenames[]=f.listFiles();
			 ModelAndView mav=new ModelAndView("welcomecustomer");
			 mav.addObject("products",al); 
			 mav.addObject("filenames",filenames);
			 mav.addObject("filepath",f);
			 mav.addObject("msg","viewbyid");
			 return mav;
		}
		 @RequestMapping("/reqeditcat")
			public ModelAndView viewcatbyid(@ModelAttribute("cid") String cid)
			{ Category c=new Category();
			 
			   c=new DaoImple().viewcatbyid(cid);
			
			   ModelAndView mav=new ModelAndView("adminoperations");
			   mav.addObject("categroy",c);
			   mav.addObject("msg","viewcategorybyid");
		 	   return mav;
			}
			@RequestMapping("/requpdatecat")
			public ModelAndView requpdatecat(@ModelAttribute("category") Category category)
			{
			 boolean b=false;
			 b=new DaoImple().requpdatecat(category);
			 List<Category> clist=null;
			 clist=new DaoImple().viewAllCaterories();
			 
			 ModelAndView mav=new ModelAndView("adminoperations");
			 mav.addObject("msg","viewcat");
			 mav.addObject("clist",clist);
			 return mav;				
		}
	    @RequestMapping("/reqordersform")
	    public ModelAndView placeOrder(HttpSession session)
	    { 
	    	String name=session.getAttribute("name").toString();
	    	List<Orders> l=new DaoImple().viewOrders(name);
	    	 File f=new File("F://cloud");
			 File filenames[]=f.listFiles();
			 ModelAndView mav=new ModelAndView("welcomecustomer");
			 mav.addObject("orders",l); 
			 mav.addObject("filenames",filenames);
			 mav.addObject("filepath",f);
			mav.addObject("msg","orderinfo");
	    	return mav;
	    }
	    @RequestMapping("/reqviewallorders")
	    public ModelAndView allOrders()
	    { 
	    	List<Orders> l=new DaoImple().viewAllOrders();
	    	 File f=new File("F://cloud");
			 File filenames[]=f.listFiles();
			 ModelAndView mav=new ModelAndView("adminoperations");
			 mav.addObject("orders",l); 
			 mav.addObject("filenames",filenames);
			 mav.addObject("filepath",f);
			mav.addObject("msg","viewallorders");
	    	return mav;
	    }	    
	    @RequestMapping("/reqchecksalesbetweendates")
	    public ModelAndView checkSales()
	    {
	    	ModelAndView mav=new ModelAndView("adminoperations");
	    	mav.addObject("msg","check sales");
	    	return mav;
	    }
	    @RequestMapping("/reqviewordersbetweendates")
	    public ModelAndView ordersBetweenDates(@RequestParam("start") String start,@RequestParam("end") String end)
	    { 
	    	
	    	List<Orders> l=new DaoImple().viewOrdersBetweenDates(start,end);
	    	 File f=new File("F://cloud");
			 File filenames[]=f.listFiles();
			 ModelAndView mav=new ModelAndView("adminoperations");
			 mav.addObject("orders",l); 
			 mav.addObject("filenames",filenames);
			 mav.addObject("filepath",f);
			mav.addObject("msg","viewallorders");
	    	return mav;
	    }
	    
	    @RequestMapping("/reqtransactionform")
	    public ModelAndView startTransaction(HttpSession session)
	    { 
	    	String name=session.getAttribute("name").toString();
	    	List<Cart> lcart=null;
	    	lcart=new DaoImple().viewCart(name);
	    	ModelAndView mav=new ModelAndView("welcomecustomer");
	    	mav.addObject("cart",lcart); 
			mav.addObject("msg","transactions");
	    	return mav;
	    }
	    @RequestMapping("/reqtransaction")
	    public ModelAndView transactions(@ModelAttribute("transactions") Transactions transactions,@ModelAttribute("cart") Cart cart,HttpSession session)
	    {
	    	boolean b=false;
	    	ModelAndView  mav=null;
	    	Orders o=new Orders();
	    	String name=session.getAttribute("name").toString();
	    	b=new DaoImple().transactions(transactions,name);
	    	Transactions tr=new Transactions();
	    	tr.setTid(transactions.getTid()); 
	    	List<Cart> lc=new DaoImple().viewCart(name);
	    	boolean b1=new DaoImple().myOrders(lc,tr);
	    	if(b && b1)
	    	{
	    	mav=new ModelAndView("welcomecustomer");
	    	mav.addObject("msg","order");
	    	}
	    	return mav;
	    }
	    
	    @RequestMapping("/reqsorting")
	    public ModelAndView sorting(@RequestParam("value") String value,HttpSession session)
	    {
	    	List<Product> al=null;
	    	
	    	System.out.println("value:"+value);
	    	String search=session.getAttribute("search").toString();
			al=new DaoImple().sortingProducts(search,value);
			 
			 File f=new File("F://cloud");
		     File filenames[]=f.listFiles();
		     System.out.println("value:"+value);
				
			 ModelAndView mav=new ModelAndView("welcomecustomer");
			 mav.addObject("products",al); 
			 mav.addObject("filenames",filenames);
			 mav.addObject("filepath",f);
			 mav.addObject("msg","search");
			 return mav;
		 
	    }
	    @RequestMapping("/reqbuyproduct")
	    public ModelAndView buynow(@RequestParam("pid") String pid)
	    {
	    	List<Product> al=null;
			 al=new DaoImple().viewProductById(pid);
		     File f=new File("F://cloud");
		     File filenames[]=f.listFiles();
			 ModelAndView mav=new ModelAndView("welcomecustomer");
			 mav.addObject("products",al); 
			 mav.addObject("filenames",filenames);
			 mav.addObject("filepath",f);
			 mav.addObject("msg","buyproduct");
			 return mav;
	    }
	    @RequestMapping("/reqbuy")
	    public ModelAndView buy(@ModelAttribute("product") Product product,HttpSession hs)  
		 {
			 boolean b=false;
			 Date d1=new Date();
			 java.sql.Date d=new java.sql.Date(d1.getYear(),d1.getMonth(),d1.getDate());
			 String name=hs.getAttribute("name").toString();
			 b=new DaoImple().addToCart(product,name);
			 List<Address> l=null;
			 List<Cart> lcart=null;
			 lcart=new DaoImple().viewCart(name);
			 File f=new File("F://cloud");
			 File filenames[]=f.listFiles();
			 ModelAndView mav=new ModelAndView("welcomecustomer");
			 mav.addObject("cart",lcart); 
			 mav.addObject("filenames",filenames);
			 mav.addObject("filepath",f);
			 mav.addObject("address",l);
		    mav.addObject("cart",lcart); 
		    mav.addObject("odate",d.toString());
		    mav.addObject("msg","tran");
			 return mav;
		 }
}
