package th.co.entronica.mjolnir.model.service;

import java.util.List;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import th.co.entronica.mjolnir.model.db.Bonus;
import th.co.entronica.mjolnir.model.form.BonusForm;
import th.co.entronica.mjolnir.model.manage.BonusManager;
import th.co.entronica.mjolnir.model.manage.ProfileManager;
import th.co.entronica.mjolnir.model.reposity.BonusRepository;

@Service
public class BonusService implements BonusManager{
    
    @Autowired
    private BonusRepository bonusRepository;

    @Autowired
    private ProfileManager profileManager;

    @Override
    public BonusRepository getRepository() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Bonus> getAll() {
        return bonusRepository.findAll();
    }

    @Override
    public Bonus get(String id) {
        return bonusRepository.findOne(id);
    }

    @Override
    public Bonus save(BonusForm obj) {
        Bonus bonus = new Bonus();
        BeanUtils.copyProperties(obj, bonus);
        bonus = bonusRepository.save(obj);
        bonusRepository.save(bonus);
        return bonus;
    }

    @Override
    public Bonus update(BonusForm obj) {
        Bonus bonus = obj;        
        bonus = bonusRepository.save(bonus);
        return bonus;
    }

    @Override
    public void delete(String id) {
        bonusRepository.delete(id);
    }
}
