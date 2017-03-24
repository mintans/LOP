package th.co.entronica.mjolnir.controller.position;

import java.io.IOException;
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
import th.co.entronica.mjolnir.model.db.Employment;
import th.co.entronica.mjolnir.model.db.Position;
import th.co.entronica.mjolnir.model.db.Profile;
import th.co.entronica.mjolnir.model.db.User;
import th.co.entronica.mjolnir.model.form.EmploymentForm;
import th.co.entronica.mjolnir.model.form.PositionForm;
import th.co.entronica.mjolnir.model.form.ProfileForm;
import th.co.entronica.mjolnir.model.manage.PositionManager;
import th.co.entronica.mjolnir.model.manage.ProfileManager;
import th.co.entronica.mjolnir.model.manage.UserManager;
import th.co.entronica.mjolnir.session.UserInfo;

@Controller
@RequestMapping(value = "/position")
public class PositionController {

    @Autowired
    private ProfileManager profileManager;

    @Autowired
    private PositionManager positionManager;

    @Autowired
    private UserManager userManager;

    @Autowired
    private UserInfo userInfo;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String Show(ModelMap model) {
        List<User> userList = userManager.getAll();
        List<Profile> profileList = profileManager.getAll();
        List<Position> positionList = positionManager.getAll();
        for (Position positionList1 : positionList) {
            model.put("positionId", positionList1.getId());
        }
        model.addAttribute("userInfo", userInfo);
        model.put("formPosition", "position");
        model.put("positionList", positionList);
        model.put("profileList", profileList);
        model.put("userList", userList);
        return "position/position_view";
    }

    @RequestMapping(value = "addForm", method = RequestMethod.GET)
    public String PositionAddForm(ModelMap model, @RequestParam(value = "uId") String uId) {
        ProfileForm profileForm = new ProfileForm();
        model.addAttribute("userInfo", userInfo);
        model.put("uId", uId);
        model.put("formProfile", "profile");
        model.put("formtype", "add");
        model.put("action", "save");
        model.put("profileForm", profileForm);
        return "profile_add_update";
    }

    @RequestMapping(value = "save", method = RequestMethod.POST)
    public String PositionSave(@ModelAttribute("positionForm") PositionForm positionForm, ModelMap model, HttpServletResponse response) throws IOException {
        Position positionTemp = positionManager.save(positionForm);
        response.sendRedirect("../../main/position");
        return null;
    }

    @RequestMapping(value = "delete/{id}", method = RequestMethod.GET)
    public String EmploymentDelete(ModelMap model, @PathVariable String id, HttpServletResponse response) throws IOException {
        Position positionList = positionManager.get(id);
        positionManager.delete(id);
        response.sendRedirect("../../position");
        return null;
    }

}
