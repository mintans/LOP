/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package th.co.entronica.mjolnir.model.service;

import java.util.Date;
import java.util.Iterator;
import java.util.List;
import javax.swing.JOptionPane;
import org.codehaus.jackson.map.util.BeanUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import th.co.entronica.mjolnir.model.db.Language;
import th.co.entronica.mjolnir.model.db.OtherLanguage;
import th.co.entronica.mjolnir.model.db.Profile;
import th.co.entronica.mjolnir.model.form.LanguageForm;
import th.co.entronica.mjolnir.model.manage.LanguageManager;
import th.co.entronica.mjolnir.model.manage.ProfileManager;
import th.co.entronica.mjolnir.model.reposity.LanguageRepository;

/**
 *
 * @author Pop
 */
@Service
public class LanguageService implements LanguageManager {

    @Autowired
    private LanguageRepository languageRepository;

    @Autowired
    private ProfileManager profileManager;

    @Override
    public LanguageRepository getRepository() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Language> getAll() {
        return languageRepository.findAll();
    }

    @Override
    public Language get(String id) {
        return languageRepository.findOne(id);
    }

    @Override
    public Language save(LanguageForm obj) {
        Language language = new Language();
        BeanUtils.copyProperties(obj, language);
        language = languageRepository.save(obj);

        Profile profile = profileManager.get(language.getProfileId());
        profile.setLanguage(language);
        profileManager.save(profile);
        return language;
    }

    @Override
    public Language update(LanguageForm obj) {
        Language language = obj;
        languageRepository.save(language);
        Profile profile = profileManager.get(language.getProfileId());
        profile.setLanguage(language);
        profileManager.save(profile);
        return language;
    }

    @Override
    public void delete(String id) {
        Language language = get(id);
        Profile profile = profileManager.get(language.getProfileId());
        profile.setLanguage(null);
        profileManager.save(profile);
        languageRepository.delete(id);
    }

    @Override
    public void deleteOtherLanguage(String id, String languageName) {
        Profile profile = profileManager.get(id);
        Language language = profile.getLanguage();
        Iterator<OtherLanguage> itrOtherLanguage = language.getOtherLanguage().iterator();
        Boolean isRemoveLanguage = false;
        while (itrOtherLanguage.hasNext()) {
            OtherLanguage next = itrOtherLanguage.next();
            isRemoveLanguage = false;
            if (next.getLanguage().equals(languageName)) {
                isRemoveLanguage = true;
            }
            if (isRemoveLanguage) {
                itrOtherLanguage.remove();
                break;
            }
        }
        languageRepository.save(language);
        profile.setLanguage(language);
        profileManager.save(profile);
    }
}
