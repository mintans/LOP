/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package th.co.entronica.mjolnir.model.service;

import java.util.List;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import th.co.entronica.mjolnir.model.db.Position;
import th.co.entronica.mjolnir.model.form.PositionForm;
import th.co.entronica.mjolnir.model.manage.PositionManager;
import th.co.entronica.mjolnir.model.manage.ProfileManager;
import th.co.entronica.mjolnir.model.reposity.PositionRepository;

@Service
public class PositionService implements PositionManager {

    @Autowired
    private PositionRepository positionRepository;

    @Autowired
    private ProfileManager profileManager;

    @Override
    public PositionRepository getRepository() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Position> getAll() {
        return positionRepository.findAll();
    }

    @Override
    public Position get(String id) {
        return positionRepository.findOne(id);
    }

    @Override
    public Position save(PositionForm obj) {
        Position position = new Position();
        BeanUtils.copyProperties(obj, position);
        position = positionRepository.save(obj);
        positionRepository.save(position);
        return position;
    }

    @Override
    public Position update(PositionForm obj) {
        Position position = obj;
        position = positionRepository.save(position);
        return position;
    }

    @Override
    public void delete(String id) {
        positionRepository.delete(id);
    }
}
