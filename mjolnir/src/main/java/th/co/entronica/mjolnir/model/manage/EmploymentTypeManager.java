
package th.co.entronica.mjolnir.model.manage;

import java.util.List;
import th.co.entronica.mjolnir.model.db.EmploymentChangeBenefits;
import th.co.entronica.mjolnir.model.db.EmploymentType;
import th.co.entronica.mjolnir.model.reposity.EmploymentTypeRepository;

public interface EmploymentTypeManager {
    public EmploymentTypeRepository getRepository();
    public List<EmploymentType> getAll();
    public EmploymentType get(String id);
    public EmploymentType save(EmploymentType employmentType);

    public void delete(String employmentTypeID);

    public void changeBenefits(EmploymentChangeBenefits employmentChangeBenefits);
    
}
