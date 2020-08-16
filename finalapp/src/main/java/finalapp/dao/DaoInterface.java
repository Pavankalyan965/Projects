package finalapp.dao;

import java.util.ArrayList;
import java.util.List;

import finalapp.model.Address;
import finalapp.model.AdminLogin;
import finalapp.model.Cart;
import finalapp.model.Category;
import finalapp.model.Customer;
import finalapp.model.Orders;
import finalapp.model.Product;
import finalapp.model.Transactions;

public interface DaoInterface 
{
	public boolean adminLogin(AdminLogin al);
	public boolean customerRegister(Customer c);
	public boolean customerLogin(Customer c);
	public List<Customer> viewCustomerById(Customer c);
	public boolean addProduct(Product p);
	public List<Product> viewAllProducts();
	public boolean deleteProduct(Product p);
	public boolean addCategory(Category cat);
	public boolean deleteCategory(Category c);
	public List<Category> viewAllCaterories();
	public boolean updatecategory(Category c);
	public List<Product> displayProducts(String catname); 
	public boolean deleteCart(Cart c, String name);
	public List<Product> viewProductById(String pid);
	public boolean updateproduct(Product p);
	public boolean addToCart(Product p,String name);
	public List<Cart> viewCart(String name);
	public Category viewcatbyid(String cid);
	public List<Product> searchProducts(String search); 
	public boolean transactions(Transactions transactions,String name);
	public boolean addaddress(Address address,String name); 
	public ArrayList<Product> sortingProducts(String search,String value);
	public List<Address> viewAddress(String name);
	public boolean myOrders(List<Cart> lc,Transactions tr); 
	public List<Orders> viewOrders(String name); 
	public List<Orders> viewAllOrders(); 
	public List<Orders> viewOrdersBetweenDates(String start, String end); 
	public List<Product> viewElectronics(String Electronics); 
	public List<Product> viewFashion(String Fashion); 
	public List<Product> viewSports(String Sports); 
	public List<Product> viewHousing(String Housing); 
	public List<Product> viewGroceries(String Groceries); 
	public boolean orders(Product p, Transactions tr);
	
}
