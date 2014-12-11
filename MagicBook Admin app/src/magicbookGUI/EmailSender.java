package magicbookGUI;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Session;
import javax.mail.Message;
import javax.mail.Transport;
import javax.mail.PasswordAuthentication;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.MessagingException;

public class EmailSender {
	
	String recipients;
	String mail;
	String title;
	
	public EmailSender(String title, String recipients, String mail){
		this.recipients = recipients;
		this.mail = mail;
		this.title = title;
	}

	public void sendEmail() {

		String username = "magicbookftw@gmail.com";
		String password = "#kkeEl422}_f";
		
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		
		
		Session session = Session.getInstance(props, new Authenticator(){
			protected PasswordAuthentication getPasswordAuthentication(){
				return new PasswordAuthentication(username,password);
			}
		});
		
		try{
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(username));
			message.setRecipients(Message.RecipientType.BCC, InternetAddress.parse(recipients));
			message.setSubject(title);
			message.setContent("<html><body><b>"+ mail +"</b></body></html>", "text/html");
			
			Transport.send(message);
			
			System.out.println("Mail sent successfully");
		}
		catch(MessagingException e)
		{
			e.printStackTrace();
		}
	}
}
