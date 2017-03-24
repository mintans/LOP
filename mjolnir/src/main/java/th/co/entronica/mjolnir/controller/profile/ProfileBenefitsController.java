package th.co.entronica.mjolnir.controller.profile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import th.co.entronica.mjolnir.model.db.Admonition;
import th.co.entronica.mjolnir.model.db.Benefits;
import th.co.entronica.mjolnir.model.db.Employment;
import th.co.entronica.mjolnir.model.db.EmploymentType;
import th.co.entronica.mjolnir.model.db.Profile;
import th.co.entronica.mjolnir.model.db.ProfileBenefits;
import th.co.entronica.mjolnir.model.db.User;
import th.co.entronica.mjolnir.model.form.AdmonitionForm;
import th.co.entronica.mjolnir.model.form.ProfileBenefitsForm;
import th.co.entronica.mjolnir.model.form.ProfileForm;
import th.co.entronica.mjolnir.model.manage.AdmonitionManager;
import th.co.entronica.mjolnir.model.manage.BenefitsManager;
import th.co.entronica.mjolnir.model.manage.EmploymentManager;
import th.co.entronica.mjolnir.model.manage.EmploymentTypeManager;
import th.co.entronica.mjolnir.model.manage.ProfileBenefitsManager;
import th.co.entronica.mjolnir.model.manage.ProfileManager;
import th.co.entronica.mjolnir.model.manage.UserManager;
import th.co.entronica.mjolnir.session.UserInfo;

@Controller
@RequestMapping(value = "/profileBenefits")
public class ProfileBenefitsController {

    @Autowired
    private ProfileManager profileManager;

    @Autowired
    private ProfileBenefitsManager profileBenefitsManager;

    @Autowired
    private BenefitsManager benefitsManager;

    @Autowired
    private EmploymentTypeManager employmentTypeManager;
    
    @Autowired
    private EmploymentManager employmentManager;

    @Autowired
    private UserManager userManager;

    @Autowired
    private UserInfo userInfo;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String Show(ModelMap model) {
        List<User> userList = userManager.getAll();
        List<Profile> profileList = profileManager.getAll();
        model.addAttribute("userInfo", userInfo);
        model.put("formhome", "home");
        model.put("profileList", profileList);
        model.put("userList", userList);
        return "profile/benefits/benefits_view";
    }

    @RequestMapping(value = "save", method = RequestMethod.POST)
    public String ProfileBenefitsSave(@ModelAttribute("profileBenefitsForm") ProfileBenefitsForm profileBenefitsForm, ModelMap model, HttpServletResponse response) throws IOException {
        ProfileBenefits profileBenefitsTemp = profileBenefitsManager.save(profileBenefitsForm);
        response.sendRedirect("../../main/profileBenefits/view/" + profileBenefitsTemp.getProfileId());
        return null;
    }

    @RequestMapping(value = "delete/{id}", method = RequestMethod.GET)
    public String ProfileBenefitsDelete(ModelMap model, @PathVariable String id, HttpServletResponse response) throws IOException {
        ProfileBenefits profileBenefitsList = profileBenefitsManager.get(id);
        String profileId = profileBenefitsList.getProfileId();
        profileBenefitsManager.delete(id);
        response.sendRedirect("../../profileBenefits/view/" + profileId);
        return null;
    }

    @RequestMapping(value = "view/{profileID}", method = RequestMethod.GET)
    public String ProfileBenefitsView(ModelMap model, @PathVariable String profileID, HttpServletResponse response) throws IOException {
        int ck = 0;
        List<Profile> profileList = profileManager.getAll();
        for (Profile profileList1 : profileList) {
            if (profileID.equals(profileList1.getId())) {
                model.put("profileBenefitsItem", profileList1);
                ck = 1;
            }
        }
        List<ProfileBenefits> profileBenefitsList = profileBenefitsManager.getAll();
        if (profileBenefitsList != null) {
            model.put("profileBenefitsList", profileBenefitsList);
        } else {
            profileBenefitsList = new ArrayList<>();
        }
        if (ck == 1) {
            List<Benefits> benefitsList = benefitsManager.getAll();
            if (benefitsList != null) {
                model.put("benefitsList", benefitsList);
            } else {
                benefitsList = new ArrayList<>();
            }
            List<User> userList = userManager.getAll();
            List<EmploymentType> employmentTypeList = employmentTypeManager.getAll();
            List<String> employmentBenefitsList = new ArrayList<>();
            List<Employment> employmentList = employmentManager.getAll();
            if (employmentTypeList != null) {
                for (Employment employmentList1 : employmentList) {
                    if (profileID.equals(employmentList1.getProfileId())) {
                        for (EmploymentType employmentTypeList1 : employmentTypeList) {
                            if (employmentList1.getType().equals(employmentTypeList1.getEmploymentTypeName())) {
                                model.put("employmentTypeList", employmentTypeList1);
                                employmentBenefitsList = Arrays.asList(employmentTypeList1.getBenefits());
                            }
                        }
                    }
                }
            } else {
                return "profile/benefits/benefits_view";
            }

            List<String> profileBenefitsIdList = new ArrayList<>();
            for (Iterator<ProfileBenefits> itrProfileBenefitsList = profileBenefitsList.iterator(); itrProfileBenefitsList.hasNext();) {
                ProfileBenefits next = itrProfileBenefitsList.next();
                if (profileID.equals(next.getProfileId())) {
                    profileBenefitsIdList.add(next.getBenefitsId());
                }
            }
            profileBenefitsIdList.addAll(profileBenefitsIdList.size(), employmentBenefitsList);

            List<String> benefitsNameList = new ArrayList<>();
            for (Iterator<Benefits> iterator = benefitsList.iterator(); iterator.hasNext();) {
                Benefits next = iterator.next();
                benefitsNameList.add(next.getId());
            }
            benefitsNameList.removeAll(profileBenefitsIdList);

            HashMap<String, Benefits> mapListBenefits = new HashMap<String, Benefits>();
            for (Iterator<String> iterator = benefitsNameList.iterator(); iterator.hasNext();) {
                String next = iterator.next();
                for (Iterator<Benefits> itrBenefits = benefitsList.iterator(); itrBenefits.hasNext();) {
                    Benefits benefitsNext = itrBenefits.next();
                    if (benefitsNext.getId().equals(next)) {
                        mapListBenefits.put(benefitsNext.getId(), new Benefits(benefitsNext.getId(), benefitsNext.getBenefitsName(), benefitsNext.getDescription()));
                    }
                }
            }
            model.put("mapListBenefits", mapListBenefits);

            model.put("benefitsList", benefitsList);
            model.put("action", "profile");
            model.addAttribute("userInfo", userInfo);
            model.put("profileid", profileID);
            model.put("formProfile", "profile");
            model.put("profileList", profileList);
            model.addAttribute("language", profileManager.get(profileID).getLanguage());
            model.addAttribute("family", profileManager.get(profileID).getFamilyinfo());
            model.addAttribute("education", profileManager.get(profileID).getEducation());
            model.addAttribute("special", profileManager.get(profileID).getSpecialAbility());
            model.addAttribute("work", profileManager.get(profileID).getWorkExperiences());
            return "profile/benefits/benefits_view";
        } else {
//            ProfileForm profileForm = new ProfileForm();
//            model.addAttribute("userInfo", userInfo);
//            model.put("uId", profileID);
//            model.put("formProfile", "profile");
//            model.put("formtype", "add");
//            model.put("action", "save");
//            model.put("profileForm", profileForm);
            response.sendRedirect("../addFormTH?uId=" + profileID);
            return null;
        }
    }
}
