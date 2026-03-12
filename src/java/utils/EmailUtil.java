package utils;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.util.Properties;
import java.util.Random;

public class EmailUtil {

    // Helper method to generate a 6-digit OTP
    public static String generateOTP() {
        Random random = new Random();
        int otp = 100000 + random.nextInt(900000);
        return String.valueOf(otp);
    }

    public static boolean sendEmail(String toEmail, String subject, String body) {
        boolean isSent = false;

        // Thay đổi email và mật khẩu ứng dụng của bạn ở đây
        final String fromEmail = "your_email@gmail.com";
        final String password = "your_app_password"; // Mật khẩu ứng dụng (App Password) từ Google

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com"); // SMTP Host
        props.put("mail.smtp.port", "587"); // TLS Port
        props.put("mail.smtp.auth", "true"); // enable authentication
        props.put("mail.smtp.starttls.enable", "true"); // enable STARTTLS

        // create Authenticator object to pass in Session.getInstance argument
        Authenticator auth = new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        };

        Session session = Session.getInstance(props, auth);

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            message.setSubject(subject, "UTF-8");
            message.setText(body, "UTF-8");

            System.out.println("Sending email to " + toEmail + "...");
            Transport.send(message);
            System.out.println("Email sent successfully!");
            isSent = true;
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println("Error sending email: " + e.getMessage());
        }

        return isSent;
    }
}
