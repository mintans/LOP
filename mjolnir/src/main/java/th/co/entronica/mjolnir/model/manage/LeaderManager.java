/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package th.co.entronica.mjolnir.model.manage;

import java.util.List;
import th.co.entronica.mjolnir.model.db.Leader;
import th.co.entronica.mjolnir.model.form.LeaderForm;
import th.co.entronica.mjolnir.model.reposity.LeaderRepository;

/**
 *
 * @author Gam
 */
public interface LeaderManager {
    public LeaderRepository getRepository();
    public List<Leader> getAll();
    public Leader get(String id);
    public Leader save(LeaderForm obj);
    public Leader update(LeaderForm obj);
    public void delete(String id);
}
