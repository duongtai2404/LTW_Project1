package servletfrontend;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BillDao;
import dao.ComputerDao;
import model.Bill;
import model.Date;
import model.Mail;
import model.ShoppingCart;
import model.ShoppingCartItem;
import model.User;


@WebServlet("/Pay")
public class PayBillServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public PayBillServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		//get ComputerDao in servletContext
		ComputerDao computerDao = (ComputerDao)getServletContext().getAttribute("computerDao");
		//get ShoppingCart in servletContext
		ShoppingCart shoppingCart = (ShoppingCart)getServletContext().getAttribute("shoppingCart");
		//get UserLogin in session
		User loginedUser = (User)session.getAttribute("user");
		//create mail
		Mail mail = new Mail();
		
		//create BillDao
		BillDao billDao = new BillDao();
		
		//get list items in shoppingcart
		ArrayList<ShoppingCartItem> items = shoppingCart.getItems();
		
		//list errors, if don't have enough quantity
		ArrayList<String> errorsNotEnoughQuantity = new ArrayList<String>();
		
		//check database
		for (ShoppingCartItem item : items) {
			if(!computerDao.buyComputerWithQuantity(item.getComputer(), item.getQuantity())){
				String error = item.getComputer().getNameComputer();
				errorsNotEnoughQuantity.add(error);
			}
		}
		
		//if has error, go to cart.jsp with errorsNotEnoghQuantity
		if(errorsNotEnoughQuantity.size() != 0){
			request.setAttribute("errorsNotEnoughQuantity", errorsNotEnoughQuantity);
			getServletContext().getRequestDispatcher("/cart.jsp").forward(request, response);
			return;
		}
		
		//create bill
		for (ShoppingCartItem item : items) {
			LocalDate date = LocalDate.now();
			Bill bill = new Bill(item.getComputer().getIdComputer(), loginedUser.getUserName(), item.getQuantity(), item.getPrice(), loginedUser.getEmailAddress(), loginedUser.getAddress(), loginedUser.getPhone(), new Date(date.getDayOfMonth(), date.getMonthValue(), date.getYear()));
			billDao.add(bill);
		}
		
		//send receipt to user
		mail.sendMailReceipt(shoppingCart, loginedUser);
		
		ShoppingCart newShoppingCart = new ShoppingCart();
		getServletContext().setAttribute("shoppingCart", newShoppingCart);

		request.getRequestDispatcher("/index.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
