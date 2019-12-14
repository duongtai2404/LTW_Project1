package dao;

public interface ObjectDao {
	public  boolean add(Object object);
	public  Object find(String objectID);
	public  boolean remove(Object object, String objectID);
}
