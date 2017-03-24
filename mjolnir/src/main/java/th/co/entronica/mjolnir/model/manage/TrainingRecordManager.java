/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package th.co.entronica.mjolnir.model.manage;

import java.util.List;
import th.co.entronica.mjolnir.model.db.TrainingRecord;
import th.co.entronica.mjolnir.model.form.TrainingRecordForm;
import th.co.entronica.mjolnir.model.reposity.TrainingRecordRepository;

/**
 *
 * @author Fil2sTCr4zYz
 */
public interface TrainingRecordManager {
    public TrainingRecordRepository getRepository();
    public List<TrainingRecord> getAll();
    public TrainingRecord get(String id);
    public TrainingRecord save(TrainingRecordForm obj);
    public TrainingRecord update(TrainingRecordForm obj);
     

    public void delete(String id);
}
