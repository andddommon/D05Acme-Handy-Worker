
package services;

import java.util.Collection;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import repositories.EndorseRepository;
import security.Authority;
import security.LoginService;
import security.UserAccount;
import domain.Customer;
import domain.Endorse;
import domain.HandyWorker;

@Service
@Transactional
public class EndorseService {

	// Managed repository..............................................
	@Autowired
	private EndorseRepository	endorseRepository;

	@Autowired
	private CustomerService		customerService;

	@Autowired
	private HandyWorkerService	handyWorkerService;


	// Simple CRUD METHODS..............

	public Endorse findyid(final int id) {
		Endorse endorse;
		endorse = this.endorseRepository.findOne(id);
		return endorse;
	}
	public Endorse saveEndorse(final Endorse endorse) {

		UserAccount userAccount;
		userAccount = LoginService.getPrincipal();
		boolean isCustomer = false;

		for (final Authority autoAuthority : userAccount.getAuthorities())
			if (autoAuthority.getAuthority().equals(Authority.CUSTOMER)) {
				isCustomer = true;
				break;
			}
		Assert.isTrue(isCustomer, "No puedes guardar un endorse porque no eres Customer");

		Assert.notNull(endorse);
		final Endorse result = this.endorseRepository.save(endorse);

		return result;
	}
	public void delete(final Endorse endorse) {

		Assert.notNull(endorse);

		int userAccountId;

		userAccountId = LoginService.getPrincipal().getId();

		Assert.isTrue(endorse.getHandyWorkerReceiver().getUserAccount().getId() != userAccountId, "Este tutorial no es suyo para eliminarlo");

		this.endorseRepository.delete(endorse);
	}
	//Other Business methods..................

	public Collection<Endorse> findByCustomerUserAccount() {

		Collection<Endorse> endorses;

		int userAccountId;

		userAccountId = LoginService.getPrincipal().getId();

		endorses = this.endorseRepository.findByCustomerUserAccountid(userAccountId);

		return endorses;
	}

	public Collection<Endorse> findByPrincipalHWR() {

		Collection<Endorse> endorses;

		int userAccountId;

		userAccountId = LoginService.getPrincipal().getId();

		endorses = this.endorseRepository.findByUserHWRAccountid(userAccountId);

		return endorses;

	}

	public Collection<Endorse> findByPrincipalHWS() {

		Collection<Endorse> endorses;

		int userAccountId;

		userAccountId = LoginService.getPrincipal().getId();

		endorses = this.endorseRepository.findByUserHWSAccountid(userAccountId);

		return endorses;

	}
	public Collection<Endorse> findAll() {
		Collection<Endorse> endorses;
		endorses = this.endorseRepository.findAll();
		return endorses;
	}
	public Endorse create() {

		final Endorse endorse = new Endorse();
		Boolean otro = false;
		UserAccount userAccount;
		userAccount = LoginService.getPrincipal();

		for (final Authority autoAuthority : userAccount.getAuthorities())
			if (autoAuthority.getAuthority().equals(Authority.CUSTOMER)) {
				final int customerId = LoginService.getPrincipal().getId();
				final Customer customerSender = this.customerService.findCustomerById(customerId);
				endorse.setCustomerSender(customerSender);

				final HandyWorker handyWorkerReceiver = new HandyWorker();
				endorse.setHandyWorkerReceiver(handyWorkerReceiver);

				final Customer customerReceiver = new Customer();
				endorse.setCustomerReceiver(customerReceiver);

				final String comments = new String();
				endorse.setComents(comments);

				final Date date = new Date();
				endorse.setMoment(date);
				otro = true;
				break;

			} else if (autoAuthority.getAuthority().equals(Authority.HANDYWORKER)) {
				final int handyWorkerId = LoginService.getPrincipal().getId();
				final HandyWorker handyWorkerSender = this.handyWorkerService.findById(handyWorkerId);
				endorse.setHandyWorkerSender(handyWorkerSender);

				final HandyWorker handyWorkerReceiver = new HandyWorker();
				endorse.setHandyWorkerReceiver(handyWorkerReceiver);

				final Customer customerReceiver = new Customer();
				endorse.setCustomerReceiver(customerReceiver);

				final String comments = new String();
				endorse.setComents(comments);

				final Date date = new Date();
				endorse.setMoment(date);
				otro = true;
				break;
			} else
				Assert.isTrue(otro, "No puedes enviar un endorse porque no eres un HandyWorker ni Customer");

		return endorse;
	}

}
