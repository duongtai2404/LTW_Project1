package model;

import java.util.List;

import org.apache.commons.mail.DefaultAuthenticator;	
import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

public class Mail {
	private final String MY_EMAIL = "tai97hd2013@gmail.com";
	private final String MY_PASSWORD = "quoctuan";
	private String reciveEmail;
	private Email email;
	
	public Mail() {
		email = new SimpleEmail();
	}
	
	/*configure Email
	 * 
	 */
	private void configureEmail(){
		email.setHostName("smtp.googlemail.com");
        email.setSmtpPort(465);
        email.setAuthenticator(new DefaultAuthenticator(MY_EMAIL,MY_PASSWORD));
        
        email.setSSLOnConnect(true);
	}
	
	/*send Mail to recive Email
	 * @parameter:
	 * @return: boolean
	 */
	
	public boolean sendMailReceipt(ShoppingCart shoppingCart,User user){
		//configure email
		configureEmail();
		
		try {
			//Email người nhận
			reciveEmail = user.getEmailAddress();
			//người gửi
			email.setFrom(MY_EMAIL);
			//tiêu đề
			email.setSubject("Receipt - Don hang");
			
			String userName = user.getUserName();
			//Nội dung
			String content = "Hello "+ userName  + "\n NameProduct \t Quantity \t Price \t ToTalPrice \n";
			//with each item => write
			List<ShoppingCartItem> items = shoppingCart.getItems();
			for (ShoppingCartItem shoppingCartItem : items) {
				content = content + shoppingCartItem.toString() + "\n";
			}
			content = content + "Subtotal = $" +shoppingCart.getSubtotal();
			
			//Nội dung email
			email.setMsg(content);
			
			//Người nhận
			email.addTo(reciveEmail);
			
			//Gửi mail
			email.send();
			
			return true;
		} catch (EmailException e) {
			System.out.println("Couldn't send email" + e);
			e.printStackTrace();
			return false;
		}	
		
		
	}
	
	public String getReciveEmail() {
		return reciveEmail;
	}

	public void setReciveEmail(String reciveEmail) {
		this.reciveEmail = reciveEmail;
	}

	public Email getEmail() {
		return email;
	}

	public void setEmail(Email email) {
		this.email = email;
	}

	public String getMY_EMAIL() {
		return MY_EMAIL;
	}

	public String getMY_PASSWORD() {
		return MY_PASSWORD;
	}

	//test mail
	public static void main(String[] args) {
		Mail mail = new Mail();
		mail.configureEmail();
		Email email = mail.getEmail();

		try {
			email.setFrom("tai97hd2013@gmail.com");
			//tiêu đề
			email.setSubject("Receipt - Don hang");
			String content = "Mai Duong Tai \t Ok \n Mai Duong Tai";
			//Nội dung email
			email.setMsg(content);
			
			email.addTo("maiduongtai.itnlu@gmail.com");
			
			email.send();
			
			System.out.println("Sent");
			
		} catch (EmailException e) {
			System.out.println("Couldn't send" + e);
			e.printStackTrace();
		}
	}
}
