/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package th.co.entronica.mjolnir.model.service;

import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import th.co.entronica.mjolnir.model.db.EmploymentChangeBenefits;
import th.co.entronica.mjolnir.model.db.EmploymentType;
import th.co.entronica.mjolnir.model.manage.EmploymentTypeManager;
import th.co.entronica.mjolnir.model.reposity.EmploymentTypeRepository;

@Service
public class EmploymentTypeService implements EmploymentTypeManager {

    @Autowired
    private EmploymentTypeRepository employmentTypeRepository;

    @Override
    public EmploymentTypeRepository getRepository() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public EmploymentType save(EmploymentType employmentType) {
        EmploymentType employmentTypeDB = get(employmentType.getId());
        if (employmentTypeDB == null) {
            employmentTypeRepository.save(employmentType);
        }else{
            employmentTypeDB.setId(employmentType.getId());
            employmentTypeDB.setEmploymentTypeName(employmentType.getEmploymentTypeName());
            employmentTypeDB.setTypeName(employmentType.getTypeName());
            employmentTypeRepository.save(employmentTypeDB);
        }
        return null;
    }

    @Override
    public EmploymentType get(String id) {
        return employmentTypeRepository.findOne(id);
    }

    @Override
    public void delete(String id) {
        employmentTypeRepository.delete(id);
    }

    @Override
    public List<EmploymentType> getAll() {
        return employmentTypeRepository.findAll(new Sort(Sort.Direction.ASC, "id"));
    }

    @Override
    public void changeBenefits(EmploymentChangeBenefits employmentChangeBenefits) {
        String employment = employmentChangeBenefits.getEmploymentTypeName();

        if (employmentChangeBenefits.getCheckList() != null) {
            List<String> idCheckList = Arrays.asList(employmentChangeBenefits.getCheckList());
            String[] benefits;
            for (EmploymentType employTemp : employmentTypeRepository.findAll()) {
                if (employTemp.getEmploymentTypeName().equals(employment)) {
                    benefits = new String[idCheckList.size()];
                    for (int i = 0; i < idCheckList.size(); i++) {
                        String benefitId = idCheckList.get(i);
                        benefits[i] = benefitId;
                    }
                    employTemp.setBenefits(benefits);
                    employmentTypeRepository.save(employTemp);

                }
            }
        }

    }

}
