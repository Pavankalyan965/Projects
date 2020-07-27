package finalapp.dao;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;

import finalapp.model.Address;
import finalapp.model.AdminLogin;
import finalapp.model.Cart;
import finalapp.model.Category;
import finalapp.model.Customer;
import finalapp.model.Orders;
import finalapp.model.Product;
import finalapp.model.Transactions;

public class DaoImpleTest {


/*	@Test
	public void testAdminLogin() 
	{
		AdminLogin al=new AdminLogin();
		al.setUid("pavan");
		al.setPwd("pavan");
		assertEquals(true, new DaoImple().adminLogin(al));
	}

	/*@Test
	public void testCustomerRegister()
	{
		Customer c=new Customer();
		c.setName("karthik");
		c.setEmail("karthik@gmail.com");
		c.setCity("hyd");
		c.setPwd("karthik");
		c.setMobile(709517734);
		assertEquals(true, new DaoImple().customerRegister(c));
	}*/
	
	@Test
	public void testCustomerLogin() 
	{
		Customer c=new Customer();
		c.setEmail("rrr@gmail.com");
		c.setPwd("ramesh");
		assertEquals(true, new DaoImple().customerLogin(c));
	
	}

	@Test
	public void testAddProduct() 
	{
		Product p=new Product();
		p.setPname("chessboard");
		p.setCtype("Sports");
		p.setPprice(200);
		p.setPqty(150);
		p.setProductinfo("Indoor game");
		//p.setFilename(filename);
		//assertEquals(true, new DaoImple().addProduct(p));
	}

	@Test
	public void testViewAllProducts()
	{
		//assertEquals(true, new DaoImple().viewAllProducts());
	}

	@Test
	public void testDeleteProduct() 
	{
		Product p=new Product();
		p.setPid("135");
		assertEquals(true, new DaoImple().deleteProduct(p));
		
	}

	@Test
	public void testAddCategory() 
	{
		Category c=new Category();
		c.setCatname("xy");
		assertEquals(true, new DaoImple().addCategory(c));
	}

	@Test
	public void testViewAllCaterories() 
	{
		//assertEquals(true, new DaoImple().viewAllCaterories());
	}

	@Test
	public void testDisplayProducts() 
	{
		Category c=new Category();
		String catname="Sports";
		c.setCatname(catname);
		assertEquals(true, new DaoImple().displayProducts(catname));
	}

	@Test
	public void testDeleteCategory()
	{
		Category c=new Category();
		c.setCid("194");
		assertEquals(true, new DaoImple().deleteCategory(c));
	}

	@Test
	public void testDeleteCart() 
	{
		Cart c=new Cart();
		String name="rrr@gmail.com";
		c.setPid("163");
		c.setName(name);
		assertEquals(true, new DaoImple().deleteCart(c, name));
	}

	@Test
	public void testSearchProducts() 
	{
		Product p=new Product();
		String search="cricket bat";
		p.setPname(search);
		assertEquals(true, new DaoImple().searchProducts(search));
	}

	@Test
	public void testViewProductById() 
	{
		Product p=new Product();
		String pid="135";
		p.setPid(pid);
		assertEquals(true, new DaoImple().viewProductById(pid));
	}

	@Test
	public void testUpdateproduct() 
	{
		Product p=new Product();
		p.setPid("164");
		p.setCtype("Sports");
		p.setPname("football");
		p.setPprice(500);
		p.setPqty(50);
		p.setFilename("football.jpg");
		p.setProductinfo("Leather");
		assertEquals(true, new DaoImple().updateproduct(p));
	}

/*	@Test
	public void testAddToCart() 
	{
		
	}*/

	@Test
	public void testViewCart()
	{
		Cart c=new Cart();
		String name="pavan@gmail.com";
		c.setName(name);
		assertEquals(true, new DaoImple().viewCart(name));
	}

	@Test
	public void testAddToCartString() 
	{
		Cart c=new Cart();
		Product p=new Product();
		String name="pavan@gmail.com";
		c.setPid(p.getPid());
		c.setPname(p.getPname());
		c.setPrice(p.getPprice());
		c.setFilename(p.getFilename());
		c.setQty(p.getPqty());
		assertEquals(true, new DaoImple().addToCart(p, name));
	}

	@Test
	public void testViewcatbyid() 
	{
		Category c=new Category();
		String cid="65";
		c.setCid(cid);
		assertEquals(true, new DaoImple().viewcatbyid(cid));
	}

	@Test
	public void testUpdatecategory()
	{
		Category c=new Category();
		c.setCid("4");
		c.setCatname("Housing");
		assertEquals(true, new DaoImple().updatecategory(c));
	}
	
	@Test
	public void testTransactions() 
	{
		
		//assertEquals(true, new DaoImple().transactions(transactions, name));
	}

	@Test
	public void testAddaddress() 
	{
		Address a=new Address();
		String name="pavan@gmail.com";
		a.setName("ab");
		a.setCid("pavan@gmail.com");
		a.setCity("pune");
		a.setPincode(500600);
		a.setAddress("Hebbal");
		a.setState("Maharastra");
		assertEquals(true, new DaoImple().addaddress(a, name));
	}

	@Test
	public void testSortingProducts() 
	{
		Product p=new Product();
		String search="Sports";
		String value="lh";
		assertEquals(true, new DaoImple().sortingProducts(search, value));
	}

	@Test
	public void testViewAddress()
	{
		String name="pavan@gmail.com";
		assertEquals(true, new DaoImple().viewAddress(name));
	}

	@Test
	public void testMyOrders() 
	{
		List<Cart> lc=null;
		Transactions tr=new Transactions();
		//assertEquals(true, new DaoImple().myOrders(lc, tr));
	}

	@Test
	public void testViewOrders() 
	{
		String name="pavan@gmail.com";
		Orders o=new Orders();
		o.setCid(name);
		assertEquals(true, new DaoImple().viewOrders(name));
	}

}
