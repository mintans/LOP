package th.co.entronica.mjolnir.model.manage;

import java.util.List;
import th.co.entronica.mjolnir.model.db.Admonition;
import th.co.entronica.mjolnir.model.form.AdmonitionForm;
import th.co.entronica.mjolnir.model.reposity.AdmonitionRepository;

public interface AdmonitionManager {
    public AdmonitionRepository getRepository();
    public List<Admonition> getAll();
    public Admonition get(String id);
    public Admonition save(AdmonitionForm obj);
    public Admonition update(AdmonitionForm obj);
     

    public void delete(String id);
}
