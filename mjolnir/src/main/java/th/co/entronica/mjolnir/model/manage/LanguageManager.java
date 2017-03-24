/*
 * To change this license header, choose License Headers in User Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package th.co.entronica.mjolnir.model.manage;

import java.util.List;
import th.co.entronica.mjolnir.model.db.Language;
import th.co.entronica.mjolnir.model.form.LanguageForm;
import th.co.entronica.mjolnir.model.reposity.LanguageRepository;




/**
 *
 * @author Pop
 */
public interface LanguageManager{
    public LanguageRepository getRepository();
    public List<Language> getAll();
    public Language get(String id);
    public Language save(LanguageForm obj);
    public Language update(LanguageForm obj);
    public void delete(String id);
    public void deleteOtherLanguage(String id, String languageName);
   // public Profile detail(ProfileForm obj);

     
}
