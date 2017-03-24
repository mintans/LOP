package th.co.entronica.mjolnir.model.service;

import java.util.List;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import th.co.entronica.mjolnir.model.db.Admonition;
import th.co.entronica.mjolnir.model.db.Profile;
import th.co.entronica.mjolnir.model.form.AdmonitionForm;
import th.co.entronica.mjolnir.model.manage.AdmonitionManager;
import th.co.entronica.mjolnir.model.manage.ProfileManager;
import th.co.entronica.mjolnir.model.reposity.AdmonitionRepository;

@Service
public class AdmonitionService implements AdmonitionManager {
    
    @Autowired
    private AdmonitionRepository admonitionRepository;

    @Autowired
    private ProfileManager profileManager;

    @Override
    public AdmonitionRepository getRepository() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Admonition> getAll() {
        return admonitionRepository.findAll();
    }

    @Override
    public Admonition get(String id) {
        return admonitionRepository.findOne(id);
    }

    @Override
    public Admonition save(AdmonitionForm obj) {
        Admonition admonition = new Admonition();
        BeanUtils.copyProperties(obj, admonition);
        admonition = admonitionRepository.save(obj);
        admonitionRepository.save(admonition);
        return admonition;
    }

    @Override
    public Admonition update(AdmonitionForm obj) {
        Admonition admonition = obj;        
        admonition = admonitionRepository.save(admonition);
        return admonition;
    }

    @Override
    public void delete(String id) {
        admonitionRepository.delete(id);
    }
}
