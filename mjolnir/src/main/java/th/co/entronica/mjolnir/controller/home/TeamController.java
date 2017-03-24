/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package th.co.entronica.mjolnir.controller.home;


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
import th.co.entronica.mjolnir.model.db.Leader;

import th.co.entronica.mjolnir.model.db.Profile;
import th.co.entronica.mjolnir.model.db.Team;
import th.co.entronica.mjolnir.model.db.Member;
import th.co.entronica.mjolnir.model.db.User;
import th.co.entronica.mjolnir.model.form.LeaderForm;
import th.co.entronica.mjolnir.model.form.MemberForm;
import th.co.entronica.mjolnir.model.form.TeamForm;
import th.co.entronica.mjolnir.model.manage.LeaderManager;
import th.co.entronica.mjolnir.model.manage.MemberManager;
import th.co.entronica.mjolnir.model.manage.ProfileManager;
import th.co.entronica.mjolnir.model.manage.TeamManager;
import th.co.entronica.mjolnir.model.manage.UserManager;
import th.co.entronica.mjolnir.session.UserInfo;
/**
 *
 * @author beer
 */
@Controller
@RequestMapping("/team")
public class TeamController {
    
    @Autowired
    private UserInfo userInfo;
    
    @Autowired
    private ProfileManager profileManager;
    
    @Autowired
    private TeamManager teamManager;
    
    @Autowired
    private UserManager userManager;
    
    @Autowired
    private LeaderManager leaderManager;
    
    @Autowired
    private MemberManager memberManager;
    

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String Show(ModelMap model, @RequestParam(value="tId", required = false)String tId) {
        List<Team> teamList = teamManager.getAll();
        model.addAttribute("userInfo", userInfo);
        model.put("formStructure", "structure");
        model.put("tId", tId);
        model.put("teamList", teamList);
        List<Leader> leaderList = leaderManager.getAll();
        model.put("leaderList", leaderList);
        List<Profile> profileList = profileManager.getAll();
        model.put("profileList", profileList);
        List<Member> memberList = memberManager.getAll();
        model.put("memberList", memberList);
        return "home/team/team";
    }
    
    @RequestMapping(value = "addForm", method = RequestMethod.GET)
    public String teamaddForm(ModelMap model) {
        TeamForm teamForm = new TeamForm();
        List<Team> teamList = teamManager.getAll();
        for (Team teamList1 : teamList) {
            model.put("teamList", teamList1.getId());
//            JOptionPane.showMessageDialog(null, userList1.getId());
        }
        List<User> userList = userManager.getAll();
        model.put("userList", userList);
        List<Profile> proList = profileManager.getAll();
        model.put("proList", proList);
        model.addAttribute("userInfo", userInfo);
        model.put("action", "save");
        model.put("teamForm", teamForm);
        return "home/team/team_form";
    }
    
    @RequestMapping(value = "save", method = RequestMethod.POST)
    public String saveTeam(@ModelAttribute("teamForm") TeamForm teamForm, ModelMap model, HttpServletResponse response) throws IOException {
        teamManager.save(teamForm);
        response.sendRedirect("../../main/team");
        return null;
    }
    
    @RequestMapping(value = "addLeader", method = RequestMethod.GET)
    public String LeaderaddForm(ModelMap model,@RequestParam(value="tId", required = true) String tId) {
        LeaderForm leaderForm = new LeaderForm();
        List<Profile> proList = profileManager.getAll();
        model.put("proList", proList);
        model.put("tId", tId);
        model.addAttribute("userInfo", userInfo);
        model.put("action", "saveleader");
        model.put("leaderForm", leaderForm);
        List<User> userList = userManager.getAll();
        model.put("userList", userList);
        List<Leader> leaderList = leaderManager.getAll();
        model.put("leaderList", leaderList);
        List<Member> memberList = memberManager.getAll();
        model.put("memberList", memberList);
        return "home/team/add_form_leader";
    }
    
    @RequestMapping(value = "saveleader", method = RequestMethod.POST)
    public String saveLeader(@ModelAttribute("leaderForm") LeaderForm leaderForm, ModelMap model, HttpServletResponse response) throws IOException {
        String tId = leaderForm.getTeamId();
        leaderManager.save(leaderForm);
        response.sendRedirect("../../main/team?tId=" + tId);
        return null;
    }
    
    @RequestMapping(value = "addMember", method = RequestMethod.GET)
    public String MemberaddForm(ModelMap model,@RequestParam(value="tId", required = true) String tId) {
        MemberForm memberForm = new MemberForm();
        List<Profile> proList = profileManager.getAll();
        model.put("proList", proList);
        model.put("tId", tId);
        model.addAttribute("userInfo", userInfo);
        model.put("action", "savemember");
        model.put("memberForm", memberForm);
        List<User> userList = userManager.getAll();
        model.put("userList", userList);
        List<Leader> leaderList = leaderManager.getAll();
        model.put("leaderList", leaderList);
        List<Member> memberList = memberManager.getAll();
        model.put("memberList", memberList);
        return "home/team/add_form_member";
    }
    
    @RequestMapping(value = "savemember", method = RequestMethod.POST)
    public String saveMember(@ModelAttribute("memberForm") MemberForm memberForm, ModelMap model, HttpServletResponse response) throws IOException {
        String tId = memberForm.getTeamId();
        memberManager.save(memberForm);
        response.sendRedirect("../../main/team?tId=" + tId);
        return null;
    }
    
    @RequestMapping(value = "delete/{tId}", method = RequestMethod.GET)
    public String teamDelete(ModelMap model, HttpServletResponse response, @PathVariable String tId) throws IOException {
        List<Leader> leaderList = leaderManager.getAll();
        for(Leader leaderList1 : leaderList ){
            if(tId.equals(leaderList1.getTeamId())){
                leaderManager.delete(leaderList1.getLeaderId());
            }
        }
        List<Member> memberList = memberManager.getAll();
        for(Member memberList1 : memberList ){
            if(tId.equals(memberList1.getTeamId())){
                memberManager.delete(memberList1.getMemberId());
            }
        }
        teamManager.delete(tId); 
//        List<Member> memberList = memberManager.getAll();
//        model.put("memberList", memberList);
//        memberManager.delete(tId);
        response.sendRedirect("../../../main/team");
        return null;
    }
    
    //editteam
    @RequestMapping(value = "editForm/{teamId}", method = RequestMethod.GET)
    public String teamEdit(ModelMap model, @PathVariable String teamId) {
        Team teamForm = (Team) teamManager.get(teamId);
        model.addAttribute("id", teamForm.getId());
        model.addAttribute("userInfo", userInfo);
        model.put("action", "update");
        model.put("teamForm", teamForm);
        model.addAttribute("tId", teamForm);
        List<User> userList = userManager.getAll();
        model.put("userList", userList);
        List<Profile> proList = profileManager.getAll();
        model.put("proList", proList);
        return "home/team/team_form";
    }
    
    @RequestMapping(value = "editForm/update", method = RequestMethod.POST)
    public String teamUpdate(@ModelAttribute("teamForm") TeamForm tForm, ModelMap model, HttpServletResponse response) throws IOException {
        String empId = tForm.getId();
        teamManager.update(tForm);
        response.sendRedirect("../../../main/team?tId="+empId);
        return null;
    }
    
    //leader delete
    @RequestMapping(value = "leaderdelete/{lId}", method = RequestMethod.GET)
    public String leaderDelete(ModelMap model, HttpServletResponse response, @PathVariable String lId ,@RequestParam(value="tId", required = true)String tId) throws IOException {
        leaderManager.delete(lId); 
        response.sendRedirect("../../../main/team?tId=" + tId);
        return null;
    }
    
    //leader delete
    @RequestMapping(value = "memberdelete/{mId}", method = RequestMethod.GET)
    public String memberDelete(ModelMap model, HttpServletResponse response, @PathVariable String mId ,@RequestParam(value="tId", required = true)String tId) throws IOException {
        memberManager.delete(mId); 
        response.sendRedirect("../../../main/team?tId=" + tId);
        return null;
    }
}
