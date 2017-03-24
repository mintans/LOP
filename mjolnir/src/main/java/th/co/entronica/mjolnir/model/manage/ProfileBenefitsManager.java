package th.co.entronica.mjolnir.model.manage;

import java.util.List;
import th.co.entronica.mjolnir.model.db.ProfileBenefits;
import th.co.entronica.mjolnir.model.form.ProfileBenefitsForm;
import th.co.entronica.mjolnir.model.reposity.ProfileBenefitsRepository;

public interface ProfileBenefitsManager {
    public ProfileBenefitsRepository getRepository();
    public List<ProfileBenefits> getAll();
    public ProfileBenefits get(String id);
    public ProfileBenefits save(ProfileBenefitsForm obj);
    public ProfileBenefits update(ProfileBenefitsForm obj);
     

    public void delete(String id);
}
