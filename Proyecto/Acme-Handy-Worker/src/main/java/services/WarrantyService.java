
package services;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import repositories.WarrantyRepository;
import domain.Warranty;

@Service
@Transactional
public class WarrantyService {

	@Autowired
	private WarrantyRepository	warrantyRepository;


	public Warranty findOne(final int warrantyId) {
		final Warranty warranty;
		warranty = this.warrantyRepository.findOne(warrantyId);
		return warranty;
	}

	public void delete(final Warranty warranty) {
		this.warrantyRepository.delete(warranty);

	}

	public Collection<Warranty> findByIdTask(final int idTask) {
		Collection<Warranty> result;
		result = this.warrantyRepository.findByIdTask(idTask);
		return result;
	}

	public Collection<Warranty> findAll() {
		Collection<Warranty> result;
		result = this.warrantyRepository.findAll();
		return result;
	}

}
