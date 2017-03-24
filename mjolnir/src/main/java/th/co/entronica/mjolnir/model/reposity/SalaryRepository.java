package th.co.entronica.mjolnir.model.reposity;

import org.springframework.data.mongodb.repository.MongoRepository;
import th.co.entronica.mjolnir.model.db.Salary;

public interface SalaryRepository extends MongoRepository<Salary, String>{
    
}
