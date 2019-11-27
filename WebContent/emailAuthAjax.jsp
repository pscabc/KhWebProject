<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Properties"%>
<%@ page import="javax.mail.*"%>
<%@ page import="javax.mail.internet.*"%>

<%

	String authNum = RandomNum();
	String email = request.getParameter("email") == null ? "" : request.getParameter("email");
	String resultCode = sendEmail(email, authNum);
%>

{"resultCode" : "<%=resultCode%>", "authNum" : "<%=authNum%>"}
<%!private String sendEmail(String email, String authNum) {
		String resultStr = "9999";
		String host = "smtp.gmail.com";
		String subject = "인증번호 전달";
		String fromName = "관리자";
		String from = "toawlsdn34@gmail.com";
		String to1 = email;

		String content = "인증번호[" + authNum + "]";
		try {
			Properties props = new Properties();
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", host);
			props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.user", "toawlsdn34@gmail.com");
			props.put("mail.smtp.auth", "true");

			Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("toawlsdn34", "mupcfzzpvyfauxbu");//이메일 계정 아이디 비번입력 해봐야할듯
				}
			});
			Message msg = new MimeMessage(mailSession);
			msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName, "UTF-8", "B")));
			InternetAddress[] address1 = { new InternetAddress(to1) };
			msg.setRecipients(Message.RecipientType.TO, address1);
			msg.setSubject(subject);
			msg.setSentDate(new java.util.Date());
			msg.setContent(content, "text/html;charset=euc-kr");
			Transport.send(msg);
			resultStr = "0000";
		} catch (Exception e) {
			resultStr = "9999";
			e.printStackTrace();
		}
		return resultStr;
	}

	public String RandomNum() {//난수발생
		StringBuffer buffer = new StringBuffer();
		for (int i = 0; i <= 6; i++) {
			int n = (int) (Math.random() * 10);
			buffer.append(n);
		}
		return buffer.toString();

	}%>
