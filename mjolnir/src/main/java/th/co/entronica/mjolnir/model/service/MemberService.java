/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package th.co.entronica.mjolnir.model.service;

import java.util.List;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import th.co.entronica.mjolnir.model.db.Member;
import th.co.entronica.mjolnir.model.form.MemberForm;
import th.co.entronica.mjolnir.model.manage.MemberManager;
import th.co.entronica.mjolnir.model.reposity.MemberRepository;


/**
 *
 * @author beer
 */
@Service
public class MemberService implements MemberManager{
    @Autowired    
    private MemberRepository leaderRepository;
    
    @Override
    public MemberRepository getRepository() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Member> getAll() {
        return leaderRepository.findAll(new Sort(Sort.Direction.ASC, "id"));
    }

    @Override
    public Member get(String id) {
        return leaderRepository.findOne(id);
    }
    
    @Override
    public Member save(MemberForm obj) {
        Member project = new Member();
        BeanUtils.copyProperties(obj, project);
        leaderRepository.save(project);
        return project;
    }

    @Override
    public Member update(MemberForm obj) {
        Member project = obj;     
        leaderRepository.save(project);
        return project;
    }

    @Override
    public void delete(String id) {
        leaderRepository.delete(id);
  
    }
}
