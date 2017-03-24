/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package th.co.entronica.mjolnir.model.manage;

import java.util.List;
import th.co.entronica.mjolnir.model.db.Leave;
import th.co.entronica.mjolnir.model.form.LeaveForm;
import th.co.entronica.mjolnir.model.reposity.LeaveRepository;

/**
 *
 * @author Gam
 */
public interface LeaveManager {
    public LeaveRepository getRepository();
    public List<Leave> getAll();
    public Leave get(String id);
    public Leave save(LeaveForm obj);
    public Leave update(LeaveForm obj);
    public void delete(String id);
}
