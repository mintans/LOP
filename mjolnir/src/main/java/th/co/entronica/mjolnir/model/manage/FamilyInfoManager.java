/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package th.co.entronica.mjolnir.model.manage;

import java.util.List;
import th.co.entronica.mjolnir.model.db.FamilyInfo;
import th.co.entronica.mjolnir.model.form.FamilyInfoForm;
import th.co.entronica.mjolnir.model.reposity.FamilyInfoRepository;

/**
 *
 * @author Asus PC
 */
public interface FamilyInfoManager {
    
    public FamilyInfoRepository getRepository();
    public List<FamilyInfo> getAll();
    public FamilyInfo get(String id);
    public FamilyInfo save(FamilyInfoForm obj);
    public FamilyInfo save(FamilyInfo obj);
    public FamilyInfo update(FamilyInfoForm obj);
    public FamilyInfo update(FamilyInfo obj);
    public void delete(String id);
    
}
