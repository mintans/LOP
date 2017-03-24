package th.co.entronica.mjolnir.model.service;

import java.util.List;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import th.co.entronica.mjolnir.model.db.TrainingRecord;
import th.co.entronica.mjolnir.model.form.TrainingRecordForm;
import th.co.entronica.mjolnir.model.manage.ProfileManager;
import th.co.entronica.mjolnir.model.manage.TrainingRecordManager;
import th.co.entronica.mjolnir.model.reposity.TrainingRecordRepository;

@Service
public class TrainingRecordService implements TrainingRecordManager{
        
    @Autowired
    private TrainingRecordRepository trainingRecordRepository;

    @Autowired
    private ProfileManager profileManager;

    @Override
    public TrainingRecordRepository getRepository() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<TrainingRecord> getAll() {
        return trainingRecordRepository.findAll();
    }

    @Override
    public TrainingRecord get(String id) {
        return trainingRecordRepository.findOne(id);
    }

    @Override
    public TrainingRecord save(TrainingRecordForm obj) {
        TrainingRecord trainingRecord = new TrainingRecord();
        BeanUtils.copyProperties(obj, trainingRecord);
        trainingRecord = trainingRecordRepository.save(obj);
        trainingRecordRepository.save(trainingRecord);
        return trainingRecord;
    }

    @Override
    public TrainingRecord update(TrainingRecordForm obj) {
        TrainingRecord trainingRecord = obj;        
        trainingRecord = trainingRecordRepository.save(trainingRecord);
        return trainingRecord;
    }

    @Override
    public void delete(String id) {
        trainingRecordRepository.delete(id);
    }
}
