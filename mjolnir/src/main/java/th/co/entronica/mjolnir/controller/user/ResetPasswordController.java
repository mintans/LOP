package th.co.entronica.mjolnir.controller.user;

import java.io.IOException;
import java.util.Properties;
import javax.activation.CommandMap;
import javax.activation.MailcapCommandMap;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import th.co.entronica.mjolnir.model.db.User;
import th.co.entronica.mjolnir.model.form.UserForm;
import th.co.entronica.mjolnir.model.manage.UserManager;

@Controller
@RequestMapping("/resetPassword")
public class ResetPasswordController {

    @Autowired
    private UserManager userManager;

    @RequestMapping(value = "sendEmail/{urlId}", method = RequestMethod.GET)
    public String doSendEmail(ModelMap model, HttpServletResponse response, HttpServletRequest request, @PathVariable String urlId) throws MessagingException, IOException {
        String sendTo = userManager.checkResetPassword(urlId);
        if (sendTo == null) {
            response.sendRedirect("../../../main/user");
        }
        final String username = "exsodustarm777@gmail.com";
        final String password = "0837204682";
        Properties prop = new Properties();
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getDefaultInstance(prop,
                new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });
        try {
            String body = "Dear Renish Khunt Welcome";
            String htmlBody = "<strong>This is an HTML Message</strong>";
            String urlResetPassword = "http://localhost:8084/Mjolnir/main/resetPassword/" + urlId;
            String textBody = "Hello " + sendTo + "!"
                    + "<br>" + "<br>" + "Someone has requested a link to change your password, and you can do this through the link below."
                    + "<br>" + "<br>" + "<a href="+ urlResetPassword + "> Change my password</a>"
                    + "<br>" + "<br>" + "If you didn't request this, please ignore this email."
                    + "<br>" + "<br>" + "Your password won't change until you access the link above and create a new one.";
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("your@gmail.com"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(sendTo));
            message.setSubject("Reset Password");
            MailcapCommandMap mc = (MailcapCommandMap) CommandMap.getDefaultCommandMap();
            mc.addMailcap("text/html;; x-java-content-handler=com.sun.mail.handlers.text_html");
            mc.addMailcap("text/xml;; x-java-content-handler=com.sun.mail.handlers.text_xml");
            mc.addMailcap("text/plain;; x-java-content-handler=com.sun.mail.handlers.text_plain");
            mc.addMailcap("multipart/*;; x-java-content-handler=com.sun.mail.handlers.multipart_mixed");
            mc.addMailcap("message/rfc822;; x-java-content-handler=com.sun.mail.handlers.message_rfc822");
            CommandMap.setDefaultCommandMap(mc);
            message.setText(htmlBody);
            message.setContent(textBody, "text/html");
            Transport.send(message);

            System.out.println("Done");

        } catch (MessagingException e) {
            e.printStackTrace();
        }

        response.sendRedirect("../../../main/user");
        return null;
    }

    @RequestMapping(value = "{urlId}", method = RequestMethod.GET)
    public String doResetPasswordForm(ModelMap model, HttpServletResponse response, HttpServletRequest request, @PathVariable String urlId) throws IOException {
        Boolean checkReset = userManager.getCheckResetPassword(urlId);
        if (checkReset == true) {
            model.put("userForm", new UserForm());
            model.put("action", "doResetPassword/" + urlId);
            return "user/resetPasswordForm";
        } else {
            response.sendRedirect("../../main/home");
            return null;
        }
    }

    @RequestMapping(value = "doResetPassword/{urlId}", method = RequestMethod.POST)
    public String doResetPassword(@ModelAttribute UserForm userForm, ModelMap model, HttpServletResponse response, HttpServletRequest request, @PathVariable String urlId) throws IOException {
        User userResetPWD = userManager.resetPassword(userForm, urlId);
        if (userResetPWD == null) {
            model.put("userForm", new UserForm());
            response.sendRedirect("../../../main/resetPassword/" + urlId);
            return null;
        } else {
            model.put("userForm", new UserForm());
            response.sendRedirect("../../../main/home");
            return null;
        }
    }
}
