package util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator{
	
	// 관리자의 계정
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("jeaho0613@gmail.com", "362514okok@");
	}
}
