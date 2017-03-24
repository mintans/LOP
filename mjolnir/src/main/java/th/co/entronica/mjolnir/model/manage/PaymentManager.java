/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package th.co.entronica.mjolnir.model.manage;

import java.util.List;
import th.co.entronica.mjolnir.model.db.Payment;
import th.co.entronica.mjolnir.model.form.PaymentForm;
import th.co.entronica.mjolnir.model.reposity.PaymentRepository;

/**
 *
 * @author Gam
 */
public interface PaymentManager {
    public PaymentRepository getRepository();
    public List<Payment> getAll();
    public Payment get(String id);
    public Payment save(PaymentForm obj);
    public Payment update(PaymentForm obj);
    public void delete(String id);
}
