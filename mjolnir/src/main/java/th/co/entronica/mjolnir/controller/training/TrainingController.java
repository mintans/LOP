package th.co.entronica.mjolnir.controller.training;

import java.io.IOException;
import static java.lang.String.format;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
import th.co.entronica.mjolnir.session.UserInfo;

@Controller
@RequestMapping(value = "/training")
public class TrainingController {

    @Autowired
    private ProfileManager profileManager;

    @Autowired
    private UserManager userManager;

    @Autowired
    private TransferManager transferManager;

    @Autowired
    private UserInfo userInfo;

    @Autowired
    private TrainingManager trainingManager;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String Show(ModelMap model) {
        String arrayAllMember = "";
        List<User> userList = userManager.getAll();
        List<Profile> profileList = profileManager.getAll();
        List<Transfer> transferList = transferManager.getAll();
        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.US);
        if (userList != null) {
            for (Iterator<User> itrUser = userList.iterator(); itrUser.hasNext();) {
                String firstName = "", lastName = "", position = "";
                Date compareDate = null;
                User nextUser = itrUser.next();
                for (Iterator<Profile> itrProfile = profileList.iterator(); itrProfile.hasNext();) {
                    Profile nextProfile = itrProfile.next();
                    if (nextUser.getId().equals(nextProfile.getId())) {
                        firstName = nextProfile.getFirstName();
                        lastName = nextProfile.getLastName();
                        break;
                    }
                }
                for (Iterator<Transfer> itrTransfer = transferList.iterator(); itrTransfer.hasNext();) {
                    Transfer nextTransfer = itrTransfer.next();
                    if (nextUser.getId().equals(nextTransfer.getProfileId())) {
                        try {
                            Date transferDate = inputFormat.parse(nextTransfer.getDate());
                            if (compareDate == null) {
                                compareDate = transferDate;
                                position = nextTransfer.getPosition();
                            }else if(compareDate.before(transferDate)) {
                                compareDate = transferDate;
                                position = nextTransfer.getPosition();
                            }
                        } catch (ParseException ex) {
                            Logger.getLogger(TrainingController.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    }
                }
                
                arrayAllMember = arrayAllMember + nextUser.getId() + "|" + firstName + " " + lastName + "|" + position + ",";
            }
            model.put("arrayAllMember", arrayAllMember);
        }

        List<Training> trainingList = trainingManager.getAll();
        if (trainingList != null) {

            for (Iterator<Training> itrTrainingList = trainingList.iterator(); itrTrainingList.hasNext();) {
                Training nextTrainingList = itrTrainingList.next();
                for (Iterator<TrainingInfo> itrTrainingInfo = nextTrainingList.getTrainingInfo().iterator(); itrTrainingInfo.hasNext();) {
                    TrainingInfo nextTrainingInfo = itrTrainingInfo.next();

                    nextTrainingInfo.setDate(convertDate(nextTrainingInfo.getDate()));

                }
            }
            model.put("trainingList", trainingList);
        }
        for (Training trainingList1 : trainingList) {
            model.put("trainingId", trainingList1.getId());
        }

        model.addAttribute("userInfo", userInfo);
        model.put("formhome", "home");
        model.put("profileList", profileList);
        model.put("userList", userList);
        return "training/training_view";
    }

    private String convertDate(String inputDate) {

        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.US);
        SimpleDateFormat outputFormat = new SimpleDateFormat("dd MMMMMM yyyy", Locale.US);
        Date date = new Date();
        try {
            date = inputFormat.parse(inputDate);
        } catch (ParseException ex) {
            Logger.getLogger(TrainingController.class.getName()).log(Level.SEVERE, null, ex);
        }

        return outputFormat.format(date);
    }

    @RequestMapping(value = "save", method = RequestMethod.POST)
    public String TrainingSave(@ModelAttribute("trainingForm") TrainingForm trainingForm, ModelMap model, HttpServletResponse response) throws IOException {
        trainingManager.save(trainingForm);
        response.sendRedirect("../../main/training");
        return null;
    }

    @RequestMapping(value = "addMember", method = RequestMethod.POST)
    public String TrainingAddMember(@ModelAttribute("trainingForm") TrainingForm trainingForm, ModelMap model, HttpServletResponse response) throws IOException {
        trainingManager.update(trainingForm);
        response.sendRedirect("../../main/training");
        return null;
    }

    @RequestMapping(value = "sendEmail", method = RequestMethod.POST)
    public String TrainingSendEmail(@ModelAttribute("trainingForm") TrainingForm trainingForm, ModelMap model, HttpServletResponse response) throws IOException {
        trainingManager.sendEmail(trainingForm);
        response.sendRedirect("../../main/training");
        return null;
    }

    @RequestMapping(value = "delete/{id}", method = RequestMethod.GET)
    public String TrainingDelete(ModelMap model, @PathVariable String id, HttpServletResponse response) throws IOException {
        trainingManager.delete(id);
        response.sendRedirect("../../training");
        return null;
    }

    @RequestMapping(value = "deleteMember/{trainingId}&{memberId}&{memberDate}", method = RequestMethod.GET)
    public String MemberDelete(ModelMap model, @PathVariable String trainingId, @PathVariable String memberId, @PathVariable String memberDate, HttpServletResponse response) throws IOException {
        trainingManager.deleteMember(trainingId, memberId, memberDate);
        response.sendRedirect("../../training");
        return null;
    }
}
