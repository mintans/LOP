package th.co.entronica.mjolnir.model.manage;

import java.util.List;
import th.co.entronica.mjolnir.model.db.Transfer;
import th.co.entronica.mjolnir.model.form.TransferForm;
import th.co.entronica.mjolnir.model.reposity.TransferRepository;

public interface TransferManager {
    public TransferRepository getRepository();
    public List<Transfer> getAll();
    public Transfer get(String id);
    public Transfer save(TransferForm obj);
    public Transfer update(TransferForm obj);
     

    public void delete(String id);
}
