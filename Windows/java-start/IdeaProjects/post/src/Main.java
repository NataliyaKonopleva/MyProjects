import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class Main {
    public static void main(String[] args) throws MessagingException {
        // Создание свойств
        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.yandex.ru");
        properties.put("mail.smtp.port", "465");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        // Создание подключения
        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("ksi17my", "jdbgjxpjzxjzerea");
            }
        });
        // Создание объекта сообщения
        Message message = new MimeMessage(session);
       // Установка отправителя
        message.setFrom(new InternetAddress("ksi17my@yandex.ru"));
       // Установка получателей
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse("89159600453kon@gmail.com"));
       // Установка темы
        message.setSubject("Тестовое сообщение");
       // Установка текста сообщения
        message.setText("Привет, это тестовое сообщение из Java!");
        // Отправка сообщения
        Transport.send(message);
        System.out.println("Email отправлен успешно!");
          }
}