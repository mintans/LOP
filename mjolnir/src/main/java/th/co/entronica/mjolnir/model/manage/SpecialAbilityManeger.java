/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package th.co.entronica.mjolnir.model.manage;

import java.util.List;
import th.co.entronica.mjolnir.model.db.SpecialAbility;
import th.co.entronica.mjolnir.model.form.SpecialAbilityForm;
import th.co.entronica.mjolnir.model.reposity.SpecialAbilityRepository;

/**
 *
 * @author Asus PC
 */
public interface SpecialAbilityManeger {
    public SpecialAbilityRepository getRepository();
    public List<SpecialAbility> getAll();
    public SpecialAbility get(String id);
    public SpecialAbility save(SpecialAbilityForm obj);
    public SpecialAbility update(SpecialAbilityForm obj);
    public void delete(String id);
    
}
