package th.co.entronica.mjolnir.model.manage;

import java.util.List;
import th.co.entronica.mjolnir.model.db.Admonition;
import th.co.entronica.mjolnir.model.db.Position;
import th.co.entronica.mjolnir.model.form.AdmonitionForm;
import th.co.entronica.mjolnir.model.form.PositionForm;
import th.co.entronica.mjolnir.model.reposity.AdmonitionRepository;
import th.co.entronica.mjolnir.model.reposity.PositionRepository;

public interface PositionManager {
    public PositionRepository getRepository();
    public List<Position> getAll();
    public Position get(String id);
    public Position save(PositionForm obj);
    public Position update(PositionForm obj);
     

    public void delete(String id);
}
