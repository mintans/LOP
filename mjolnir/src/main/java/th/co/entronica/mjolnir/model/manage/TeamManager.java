/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package th.co.entronica.mjolnir.model.manage;

import java.util.List;
import th.co.entronica.mjolnir.model.db.Team;
import th.co.entronica.mjolnir.model.form.TeamForm;
import th.co.entronica.mjolnir.model.reposity.TeamRepository;

/**
 *
 * @author Gam
 */
public interface TeamManager {
    public TeamRepository getRepository();
    public List<Team> getAll();
    public Team get(String id);
    public Team save(TeamForm obj);
    public Team update(TeamForm obj);
    public void delete(String id);
}
