
package th.co.entronica.mjolnir.model.manage;

import java.util.List;
import th.co.entronica.mjolnir.model.db.Benefits;
import th.co.entronica.mjolnir.model.reposity.BenefitsRepository;

public interface BenefitsManager {

    public BenefitsRepository getRepository();
    public List<Benefits> getAll();
    public Benefits save(Benefits benefits);

    public void delete(String benefitsID);

   
    
}
