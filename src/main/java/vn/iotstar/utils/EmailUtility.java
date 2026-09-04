package vn.iotstar.utils;

import java.util.Properties;
import java.util.Random;
import jakarta.mail.*;
import jakarta.mail.internet.*;

public class EmailUtility {
    // Thay đổi thông tin email gửi của bạn (Dùng Mật khẩu ứng dụng - App Password)
    private static final String SENDER_EMAIL = "pnv14062006@gmail.com";
    private static final String APP_PASSWORD = "ejjvmqlnhfkgxlga";

    public static String generateOTP(int length) {
        String numbers = "0123456789";
        Random rnd = new Random();
        StringBuilder sb = new StringBuilder(length);
        for (int i = 0; i < length; i++) {
            sb.append(numbers.charAt(rnd.nextInt(numbers.length())));
        }
        return sb.toString();
    }

    public static void sendEmail(String toAddress, String subject, String messageContent) throws MessagingException {
        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

        // Bổ sung timeout chống kẹt tiến trình Tomcat (ms)
        properties.put("mail.smtp.connectiontimeout", "5000"); // 5 giây
        properties.put("mail.smtp.timeout", "5000");
        properties.put("mail.smtp.writetimeout", "5000");

        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(SENDER_EMAIL, APP_PASSWORD);
            }
        };

        Session session = Session.getInstance(properties, auth);
        Message msg = new MimeMessage(session);
        msg.setFrom(new InternetAddress(SENDER_EMAIL));
        msg.setRecipient(Message.RecipientType.TO, new InternetAddress(toAddress));
        msg.setSubject(subject);
        msg.setContent(messageContent, "text/html; charset=UTF-8");

        Transport.send(msg);
    }
}