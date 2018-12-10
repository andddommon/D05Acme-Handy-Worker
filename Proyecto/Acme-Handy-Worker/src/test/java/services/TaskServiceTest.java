
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
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import utilities.AbstractTest;
import domain.Application;
import domain.Category;
import domain.Complaint;
import domain.Customer;
import domain.Phase;
import domain.Task;
import domain.Warranty;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
	"classpath:spring/datasource.xml", "classpath:spring/config/packages.xml"
})
@Transactional
public class TaskServiceTest extends AbstractTest {

	@Autowired
	private TaskService		taskSevice;

	@Autowired
	private CustomerService	customerService;

	@Autowired
	private CategoryService	categoryService;

	@Autowired
	private WarrantyService	warrantyService;


	@Test
	public void testSaveTask() {

		this.authenticate("customer1");

		final Task task, saved;
		final Collection<Task> tasks;

		task = this.taskSevice.create();

		final long d = 1533297652000L;
		final long dstart = 1505583052000L;
		final long dend = 1539451852000L;

		final String ticket = "987654";
		final Date moment = new Date(d);
		final String description = "urgently needed";
		final String address = "Universidad de Sevilla";
		final Date startDate = new Date(dstart);
		final Date endDate = new Date(dend);
		final Double maximumPrice = new Double(1400.80);
		final Collection<Application> applications = new ArrayList<Application>();
		final Collection<Phase> phases = new ArrayList<Phase>();
		final Collection<Complaint> complaints = new ArrayList<Complaint>();

		final List<Category> categories = new ArrayList<>(this.categoryService.findAll());
		final Category category = categories.get(0);
		final List<Customer> customers = new ArrayList<>(this.customerService.findAll());
		final Customer customer = customers.get(0);
		final List<Warranty> warranties = new ArrayList<>(this.warrantyService.findAll());
		final Warranty warranty = warranties.get(0);

		task.setAddress(address);
		task.setApplications(applications);
		task.setCategory(category);
		task.setComplaints(complaints);
		task.setCustomer(customer);
		task.setDescription(description);
		task.setEndDate(endDate);
		task.setMaximumPrice(maximumPrice);
		task.setMoment(moment);
		task.setPhases(phases);
		task.setStartDate(startDate);
		task.setTicket(ticket);
		task.setWarranty(warranty);

		saved = this.taskSevice.save(task);
		tasks = this.taskSevice.findAll();
		Assert.isTrue(tasks.contains(saved));

	}

	@Test
	public void TestDeleteTask() {
		this.authenticate("customer1");
		final Task task, saved;
		final Collection<Task> tasks;
		task = this.taskSevice.create();

		final long d = 1533297652000L;
		final long dstart = 1505583052000L;
		final long dend = 1539451852000L;

		final String ticket = "987654";
		final Date moment = new Date(d);
		final String description = "urgently needed";
		final String address = "Universidad de Sevilla";
		final Date startDate = new Date(dstart);
		final Date endDate = new Date(dend);
		final Double maximumPrice = new Double(1400.80);
		final Collection<Application> applications = new ArrayList<Application>();
		final Collection<Phase> phases = new ArrayList<Phase>();
		final Collection<Complaint> complaints = new ArrayList<Complaint>();
		final List<Category> categories = new ArrayList<>(this.categoryService.findAll());
		final Category category = categories.get(0);
		final List<Customer> customers = new ArrayList<>(this.customerService.findAll());
		final Customer customer = customers.get(0);
		//final List<Warranty> warranties = new ArrayList<>(this.warrantyService.findAll());
		//	final Warranty warranty = warranties.get(0);
		//		Warranty warranty = new Warranty();
		//		for (final Warranty w : warranties)
		//			if (w != null) {
		//				warranty = w;
		//				break;
		//			}

		task.setAddress(address);
		task.setApplications(applications);
		task.setCategory(category);
		task.setComplaints(complaints);
		task.setCustomer(customer);
		task.setDescription(description);
		task.setEndDate(endDate);
		task.setMaximumPrice(maximumPrice);
		task.setMoment(moment);
		task.setPhases(phases);
		task.setStartDate(startDate);
		task.setTicket(ticket);
		task.setWarranty(this.warrantyService.findOne(679));
		System.out.println(this.warrantyService.findOne(679));

		saved = this.taskSevice.save(task);
		this.taskSevice.delete(saved);
		tasks = this.taskSevice.findAll();
		Assert.isTrue(!tasks.contains(saved));

	}
}
