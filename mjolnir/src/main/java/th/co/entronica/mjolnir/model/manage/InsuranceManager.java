/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package th.co.entronica.mjolnir.model.manage;

import java.util.List;
import th.co.entronica.mjolnir.model.db.Insurance;
import th.co.entronica.mjolnir.model.reposity.InsuranceRepository;

/**
 *
 * @author MossWitthaya
 */
public interface InsuranceManager {
    public InsuranceRepository getRepository();
    public List<Insurance> getAll();

    public void acceptManage(String insuranceID);

    public void acceptDone(String insuranceID);
}
