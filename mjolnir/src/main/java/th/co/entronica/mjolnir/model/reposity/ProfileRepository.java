/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package th.co.entronica.mjolnir.model.reposity;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;
import th.co.entronica.mjolnir.model.db.Profile;

/**
 *
 * @author Asus PC
 */
@Repository
public interface ProfileRepository extends MongoRepository<Profile, String> {
    
}
