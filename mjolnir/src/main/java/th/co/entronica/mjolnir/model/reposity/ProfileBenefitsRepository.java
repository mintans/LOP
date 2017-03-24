package th.co.entronica.mjolnir.model.reposity;

import java.io.Serializable;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;
import th.co.entronica.mjolnir.model.db.ProfileBenefits;

@Repository
public interface ProfileBenefitsRepository extends MongoRepository<ProfileBenefits, String>{
    
}
