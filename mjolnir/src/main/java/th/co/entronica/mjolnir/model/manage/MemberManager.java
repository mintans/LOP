/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package th.co.entronica.mjolnir.model.manage;

import java.util.List;
import th.co.entronica.mjolnir.model.db.Member;
import th.co.entronica.mjolnir.model.form.MemberForm;
import th.co.entronica.mjolnir.model.reposity.MemberRepository;

/**
 *
 * @author beer
 */
public interface MemberManager {
    public MemberRepository getRepository();
    public List<Member> getAll();
    public Member get(String id);
    public Member save(MemberForm obj);
    public Member update(MemberForm obj);
    public void delete(String id);
}
