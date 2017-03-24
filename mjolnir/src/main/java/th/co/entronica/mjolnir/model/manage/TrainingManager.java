package th.co.entronica.mjolnir.model.manage;

import java.util.List;
import th.co.entronica.mjolnir.model.db.Training;
import th.co.entronica.mjolnir.model.form.TrainingForm;
import th.co.entronica.mjolnir.model.reposity.TrainingRepository;

public interface TrainingManager {
    public TrainingRepository getRepository();
    public List<Training> getAll();
    public Training get(String id);
    public Training save(TrainingForm obj);
    public Training update(TrainingForm obj);
    public void sendEmail(TrainingForm obj);

    public void delete(String id);
    public void deleteMember(String trainingId,String memberId,String memberDate);
}
