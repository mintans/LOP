/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package th.co.entronica.mjolnir.model.manage;

import java.util.List;
import th.co.entronica.mjolnir.model.db.BirthDay;
import th.co.entronica.mjolnir.model.reposity.BirthDayRepository;

/**
 *
 * @author MossWitthaya
 */
public interface BirthDayManager {
    public BirthDayRepository getRepository();
    public List<BirthDay> getAll();

    public void acceptDone(String birthDayID);
}
