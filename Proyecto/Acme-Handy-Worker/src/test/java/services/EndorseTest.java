
package services;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import utilities.AbstractTest;
import domain.Customer;
import domain.Endorse;
import domain.HandyWorker;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
	"classpath:spring/datasource.xml", "classpath:spring/config/packages.xml"
})
@Transactional
@TransactionConfiguration(defaultRollback = false)
public class EndorseTest extends AbstractTest {

	@Autowired
	private EndorseService		endorseService;
	@Autowired
	private CustomerService		customerService;
	@Autowired
	private HandyWorkerService	handyworkerService;


	@Test
	public void testFindByCustomerUserAccount() {
		// hay que cambiar refere a customer
		this.authenticate("referee1");
		Collection<Endorse> all;

		all = this.endorseService.findByCustomerUserAccount();
		Assert.isTrue(!all.isEmpty());
		this.authenticate(null);
	}
	@Test
	public void testSaveEndorse() {
		this.authenticate("customer1");

		final List<Customer> cus = new ArrayList<>(this.customerService.findAll());
		final Customer cR = cus.get(0);
		final Customer cS = cus.get(1);

		final List<HandyWorker> han = new ArrayList<>(this.handyworkerService.findAll());
		final HandyWorker hwSender = han.get(0);

		final HandyWorker hwReciever = han.get(1);

		final Endorse endorse;
		Endorse saved;
		final Collection<Endorse> endorses;

		endorse = this.endorseService.create();

		endorse.setCustomerReceiver(cR);
		endorse.setCustomerSender(cS);
		endorse.setComents("comentario sobre el endorse del test");
		endorse.setHandyWorkerSender(hwSender);
		endorse.setHandyWorkerReceiver(hwReciever);
		endorse.setMoment(new Date(22 / 2 / 2018));
		saved = this.endorseService.saveEndorse(endorse);

		endorses = this.endorseService.findAll();
		Assert.isTrue(endorses.contains(saved));

	}
	//	@Test
	//	public void testDelete(){	
	//		authenticate("referee1");
	//		Endorse endorse=endorseService.findyid(557056);
	//		endorseService.delete(endorse);
	//		authenticate(null);
	//	}
	@Test
	public void testFinByPrincipalHWR() {
		this.authenticate("handyWorker");

		Collection<Endorse> all;

		all = this.endorseService.findByPrincipalHWR();

		Assert.isTrue(!all.isEmpty());

		this.authenticate(null);

	}
	@Test
	public void testFinByPrincipalHWS() {
		this.authenticate("handyworker1");

		Collection<Endorse> all;

		all = this.endorseService.findByPrincipalHWS();

		Assert.isTrue(!all.isEmpty());

		this.authenticate(null);

	}

}
