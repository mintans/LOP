/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package th.co.entronica.mjolnir.model.manage;

import java.util.List;
import th.co.entronica.mjolnir.model.db.Documention;
import th.co.entronica.mjolnir.model.reposity.DocumentionRepository;

/**
 *
 * @author MossWitthaya
 */
public interface DocumentionManager {
    public DocumentionRepository getRepository();
    public List<Documention> getAll();

    public Documention save(Documention documention);
    public Documention get(String id);

    public void delete(String DocumentionID);

    public void update(String userId);
}
