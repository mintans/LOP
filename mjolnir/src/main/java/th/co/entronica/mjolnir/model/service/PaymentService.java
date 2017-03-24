/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package th.co.entronica.mjolnir.model.service;

import java.util.List;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import th.co.entronica.mjolnir.model.db.Payment;
import th.co.entronica.mjolnir.model.form.PaymentForm;
import th.co.entronica.mjolnir.model.manage.PaymentManager;
import th.co.entronica.mjolnir.model.reposity.PaymentRepository;

/**
 *
 * @author Gam
 */
@Service
public class PaymentService implements PaymentManager{
    @Autowired
    
    private PaymentRepository paymentRepository;
    
    @Override
    public PaymentRepository getRepository() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Payment> getAll() {
        return paymentRepository.findAll(new Sort(Sort.Direction.ASC, "date"));
    }

    @Override
    public Payment get(String id) {
        return paymentRepository.findOne(id);
    }

    @Override
    public Payment save(PaymentForm obj) {
        Payment payment = new Payment();
        BeanUtils.copyProperties(obj, payment);
        //overtime.setCreateByDate(new Date();
        paymentRepository.save(payment);
        return payment;
    }

    @Override
    public Payment update(PaymentForm obj) {
        Payment payment = obj;     
        //overtime.setCreateByDate(new Date());
        paymentRepository.save(payment);
        return payment;
    }

    @Override
    public void delete(String id) {
        paymentRepository.delete(id);
  
    }
}
