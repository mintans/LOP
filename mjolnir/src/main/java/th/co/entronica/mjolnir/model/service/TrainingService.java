package th.co.entronica.mjolnir.model.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.activation.CommandMap;
import javax.activation.MailcapCommandMap;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import th.co.entronica.mjolnir.model.db.Profile;
import th.co.entronica.mjolnir.model.db.Training;
import th.co.entronica.mjolnir.model.db.TrainingInfo;
import th.co.entronica.mjolnir.model.db.Transfer;
import th.co.entronica.mjolnir.model.db.User;
import th.co.entronica.mjolnir.model.form.TrainingForm;
import th.co.entronica.mjolnir.model.manage.ProfileManager;
import th.co.entronica.mjolnir.model.manage.TrainingManager;
import th.co.entronica.mjolnir.model.manage.TransferManager;
import th.co.entronica.mjolnir.model.manage.UserManager;
import th.co.entronica.mjolnir.model.reposity.TrainingRepository;
import th.co.entronica.mjolnir.model.reposity.UserRepository;

@Service
public class TrainingService implements TrainingManager {

    @Autowired
    private TrainingRepository trainingRepository;

    @Autowired
    private ProfileManager profileManager;

    @Autowired
    private TransferManager transferManager;

    @Autowired
    private UserManager userManager;

    @Override
    public TrainingRepository getRepository() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Training> getAll() {
        return trainingRepository.findAll();
    }

    @Override
    public Training get(String id) {
        return trainingRepository.findOne(id);
    }

    @Override
    public Training save(TrainingForm obj) {
        Training trainingItem = get(obj.getId());
        if (trainingItem == null) {
            Training training = new Training();
            BeanUtils.copyProperties(obj, training);
            training = trainingRepository.save(obj);
            trainingRepository.save(training);
            return training;
        } else {
            obj.setTrainingInfo(trainingItem.getTrainingInfo());
            BeanUtils.copyProperties(obj, trainingItem);
            trainingRepository.save(trainingItem);
            return trainingItem;
        }
    }

    @Override
    public Training update(TrainingForm obj) {
        Training trainingOld = trainingRepository.findOne(obj.getId());
        List<Transfer> transferList = transferManager.getAll();
        List<String> idCheckList = Arrays.asList(obj.getCheckList());
        ArrayList<TrainingInfo> trainingInfo = new ArrayList<>();
        int sizeOld = trainingOld.getTrainingInfo().size();
        Iterator<TrainingInfo> itrTraningInfo = trainingOld.getTrainingInfo().iterator();
        while (itrTraningInfo.hasNext()) {
            TrainingInfo next = itrTraningInfo.next();
            trainingInfo.add(next);
        }
        if (sizeOld == 0) {
            for (int i = 0; i < idCheckList.size(); i++) {
                String memberId = idCheckList.get(i);
                User user = userManager.get(memberId);
                Profile profile = profileManager.get(memberId);
                trainingInfo.add(i, new TrainingInfo(user.getId(), profile.getFirstName() + " " + profile.getLastName(), obj.getDate(), checkPosition(transferList, memberId)));
            }
        } else {
            int j = 0, z = sizeOld;
            Boolean isSameInfo = false;
            for (int i = sizeOld; i < sizeOld + idCheckList.size(); i++) {
                isSameInfo = false;
                String memberId = idCheckList.get(j);
                for (int k = 0; k < trainingInfo.size(); k++) {
                    if ((trainingInfo.get(k).getId().equals(memberId)) && (trainingInfo.get(k).getDate().equals(obj.getDate()))) {
                        isSameInfo = true;
                    }
                }
                User user = userManager.get(memberId);
                Profile profile = profileManager.get(memberId);
                if (!isSameInfo) {
                    trainingInfo.add(z, new TrainingInfo(user.getId(), profile.getFirstName() + " " + profile.getLastName(), obj.getDate(), checkPosition(transferList, memberId)));
                    z++;
                }
                j++;
            }

            Iterator<TrainingInfo> itrTraningInfo2 = trainingInfo.iterator();
            Boolean isRemoveMember = false;
            while (itrTraningInfo2.hasNext()) {
                TrainingInfo next = itrTraningInfo2.next();
                isRemoveMember = false;
                Iterator<String> itrIdCheckList = idCheckList.iterator();
                while (itrIdCheckList.hasNext()) {
                    String memberId = itrIdCheckList.next();
                    if (!next.getDate().equals(obj.getDate())) {
                        isRemoveMember = true;
                    }
                    if ((next.getId().equals(memberId)) && (next.getDate().equals(obj.getDate()))) {
                        isRemoveMember = true;
                    }

                }
                if (!isRemoveMember) {
                    itrTraningInfo2.remove();
                }
            }

        }
        trainingOld.setTrainingInfo(trainingInfo);
        trainingOld = trainingRepository.save(trainingOld);
        return trainingOld;
    }

    @Override
    public void delete(String id) {
        trainingRepository.delete(id);
    }

    @Override
    public void deleteMember(String trainingId, String memberId, String memberDate) {
        String convertMemberDate = convertDateLongToShort(memberDate);
        Training trainingItem = get(trainingId);
        List<TrainingInfo> trainingInfo = trainingItem.getTrainingInfo();
        Iterator<TrainingInfo> itrMemberTraining = trainingInfo.iterator();
        while (itrMemberTraining.hasNext()) {
            TrainingInfo memberTraining = itrMemberTraining.next();
            if ((memberTraining.getId().equals(memberId)) && (memberTraining.getDate().equals(convertMemberDate))) {
                itrMemberTraining.remove();
            }
        }
        trainingItem.setTrainingInfo(trainingInfo);
        trainingRepository.save(trainingItem);
    }

    @Override
    public void sendEmail(TrainingForm obj) {
        List<String> idCheckList = Arrays.asList(obj.getCheckSendEmailList());
        List<String> emailMemberCheckList = new ArrayList<>();
        for (int i = 0; i < idCheckList.size(); i++) {
            User user = userManager.get(idCheckList.get(i));
            emailMemberCheckList.add(user.getEmail());
        }
        String startDate = convertDateShortToLong(obj.getStartDate());
        String endDate = convertDateShortToLong(obj.getEndDate());
        final String username = "exsodustarm777@gmail.com"; //real Username Email
        final String password = "0837204682";               //real Password Email
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
            String textBody = "<b>Subjet :</b>"+ " " + obj.getSubject()
                    + "<br>" + "<br>" + "<b>Start Date :</b>" + " " + startDate + " " + "<b>Time : </b>" + " " + obj.getStartTime()
                    + "<br>" + "<br>" + "<b>End Date :</b>" + " " + endDate + " " + "<b>Time : </b>" + " " + obj.getEndTime()
                    + "<br>" + "<br>" + "<b>Location :</b>" + " " + obj.getLocation()
                    + "<br>" + "<br>" + "<b>Description :</b>" + " " + obj.getDescriptionSendEmail();
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress("your@gmail.com"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(username));
            for (int i = 0; i < emailMemberCheckList.size(); i++) {
                message.addRecipient(Message.RecipientType.CC, new InternetAddress(emailMemberCheckList.get(i)));
            }
            message.setSubject(obj.getSubject(), "UTF-8");
            MailcapCommandMap mc = (MailcapCommandMap) CommandMap.getDefaultCommandMap();
            mc.addMailcap("text/html;; x-java-content-handler=com.sun.mail.handlers.text_html");
            mc.addMailcap("text/xml;; x-java-content-handler=com.sun.mail.handlers.text_xml");
            mc.addMailcap("text/plain;; x-java-content-handler=com.sun.mail.handlers.text_plain");
            mc.addMailcap("multipart/*;; x-java-content-handler=com.sun.mail.handlers.multipart_mixed");
            mc.addMailcap("message/rfc822;; x-java-content-handler=com.sun.mail.handlers.message_rfc822");
            CommandMap.setDefaultCommandMap(mc);
            message.setText(htmlBody, "UTF-8");
            message.setContent(textBody, "text/html");
            Transport.send(message);

            System.out.println("Done");

        } catch (MessagingException e) {
            e.printStackTrace();
        }

    }

    private String convertDateShortToLong(String inputDate) {

        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.US);
        SimpleDateFormat outputFormat = new SimpleDateFormat("dd MMMMMM yyyy", Locale.US);
        Date date = new Date();
        try {
            date = inputFormat.parse(inputDate);
        } catch (ParseException ex) {
            Logger.getLogger(TrainingService.class.getName()).log(Level.SEVERE, null, ex);
        }

        return outputFormat.format(date);
    }

    private String convertDateLongToShort(String inputDate) {

        SimpleDateFormat inputFormat = new SimpleDateFormat("dd MMMMMM yyyy", Locale.US);
        SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.US);

        Date date = new Date();
        try {
            date = inputFormat.parse(inputDate);
        } catch (ParseException ex) {
            Logger.getLogger(TrainingService.class.getName()).log(Level.SEVERE, null, ex);
        }

        return outputFormat.format(date);
    }

    private String checkPosition(List<Transfer> transferList, String memberId) {
        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.US);
        String position = "";
        Date compareDate = null;
        for (Iterator<Transfer> itrTransfer = transferList.iterator(); itrTransfer.hasNext();) {
            Transfer nextTransfer = itrTransfer.next();
            if (memberId.equals(nextTransfer.getProfileId())) {
                try {
                    Date transferDate = inputFormat.parse(nextTransfer.getDate());
                    if (compareDate == null) {
                        compareDate = transferDate;
                        position = nextTransfer.getPosition();
                    } else if (compareDate.before(transferDate)) {
                        compareDate = transferDate;
                        position = nextTransfer.getPosition();
                    }
                } catch (ParseException ex) {
                    Logger.getLogger(TrainingService.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return position;
    }
}
