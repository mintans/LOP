/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package th.co.entronica.mjolnir.model.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import th.co.entronica.mjolnir.model.db.Documention;
import th.co.entronica.mjolnir.model.manage.DocumentionManager;
import th.co.entronica.mjolnir.model.reposity.DocumentionRepository;

@Service
public class DocumentionService implements DocumentionManager{
    
    @Autowired
    private DocumentionRepository documentionRepository;

    @Override
    public DocumentionRepository getRepository() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Documention> getAll() {
        return documentionRepository.findAll(new Sort(Sort.Direction.ASC, "id"));
    }

    @Override
    public Documention save(Documention documention) {
        documentionRepository.save(documention);
        return null;
        
    }

    @Override
    public Documention get(String id) {
         return documentionRepository.findOne(id);
    }

    @Override
    public void delete(String DocumentionID) {
        documentionRepository.delete(DocumentionID);
    }

    @Override
    public void update(String documentId) {
       for (Documention documentTemp : documentionRepository.findAll()) {
           if(documentTemp.getId().equals(documentId)){
               documentTemp.setAdmin(true);
               documentionRepository.save(documentTemp);
           }
       }
    }
    
}
