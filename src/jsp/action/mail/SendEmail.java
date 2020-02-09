package jsp.action.mail;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmail {
	  String host     = "smtp.naver.com";
	  final String user   = "jcho5078@naver.com";
	  final String password  = "passward";
	  
	  public String title = "";
	  public String msg = "";
	  public String to = "";

	 public void sendMethod() {
		 Properties props = new Properties();
		  props.put("mail.smtp.host", host);
		  props.put("mail.smtp.auth", "true");
		  
		  Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
		   protected PasswordAuthentication getPasswordAuthentication() {
		    return new PasswordAuthentication(user, password);
		   }
		  });
		
		  // Compose the message
		  try {
		   MimeMessage message = new MimeMessage(session);
		   message.setFrom(new InternetAddress(user));
		   message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
		
		   // Subject
		   message.setSubject(title);
		   
		   // Text
		   message.setText(msg);
		
		   // send the message
		   Transport.send(message);
		   System.out.println("message sent successfully...");
		
		  } catch (MessagingException e) {
		   e.printStackTrace();
		  }
	 }
 }