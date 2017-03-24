package th.co.entronica.mjolnir.model.reposity;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;
import th.co.entronica.mjolnir.model.db.TrainingRecord;

@Repository
public interface TrainingRecordRepository extends MongoRepository<TrainingRecord, String>{
    
}
