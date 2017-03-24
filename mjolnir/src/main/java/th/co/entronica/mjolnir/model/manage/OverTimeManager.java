/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package th.co.entronica.mjolnir.model.manage;

import java.util.List;
import th.co.entronica.mjolnir.model.db.OverTime;
import th.co.entronica.mjolnir.model.form.OverTimeForm;
import th.co.entronica.mjolnir.model.reposity.OverTimeRepository;

/**
 *
 * @author Gam
 */
public interface OverTimeManager {
    public OverTimeRepository getRepository();
    public List<OverTime> getAll();
    public OverTime get(String id);
    public OverTime save(OverTimeForm obj);
    public OverTime update(OverTimeForm obj);
    public void delete(String id);
}
