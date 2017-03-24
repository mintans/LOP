package th.co.entronica.mjolnir.model.service;

import java.util.List;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import th.co.entronica.mjolnir.model.db.Transfer;
import th.co.entronica.mjolnir.model.form.TransferForm;
import th.co.entronica.mjolnir.model.manage.ProfileManager;
import th.co.entronica.mjolnir.model.manage.TransferManager;
import th.co.entronica.mjolnir.model.reposity.TransferRepository;

@Service
public class TransferService implements TransferManager{
    
    @Autowired
    private TransferRepository transferRepository;

    @Autowired
    private ProfileManager profileManager;

    @Override
    public TransferRepository getRepository() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Transfer> getAll() {
        return transferRepository.findAll();
    }

    @Override
    public Transfer get(String id) {
        return transferRepository.findOne(id);
    }

    @Override
    public Transfer save(TransferForm obj) {
        Transfer transfer = new Transfer();
        BeanUtils.copyProperties(obj, transfer);
        transfer = transferRepository.save(obj);
        transferRepository.save(transfer);
        return transfer;
    }

    @Override
    public Transfer update(TransferForm obj) {
        Transfer transfer = obj;        
        transfer = transferRepository.save(transfer);
        return transfer;
    }

    @Override
    public void delete(String id) {
        transferRepository.delete(id);
    }
}
