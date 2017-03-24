package th.co.entronica.mjolnir.model.manage;

import java.util.List;
import th.co.entronica.mjolnir.model.db.Bonus;
import th.co.entronica.mjolnir.model.form.BonusForm;
import th.co.entronica.mjolnir.model.reposity.BonusRepository;

public interface BonusManager {
    public BonusRepository getRepository();
    public List<Bonus> getAll();
    public Bonus get(String id);
    public Bonus save(BonusForm obj);
    public Bonus update(BonusForm obj);
     

    public void delete(String id);
}
