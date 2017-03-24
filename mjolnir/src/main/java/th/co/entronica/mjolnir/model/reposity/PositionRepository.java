package th.co.entronica.mjolnir.model.reposity;

import org.springframework.data.mongodb.repository.MongoRepository;
import th.co.entronica.mjolnir.model.db.Position;

public interface PositionRepository extends MongoRepository<Position, String> {
    
}
