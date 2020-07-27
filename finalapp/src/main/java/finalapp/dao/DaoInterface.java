package finalapp.dao;

import java.util.List;

import finalapp.model.AdminLogin;
import finalapp.model.Product;

public interface DaoInterface 
{
	public boolean adminLogin(AdminLogin al);
	public boolean addProduct(Product p);
	public List<Product> viewAllProducts();
}
