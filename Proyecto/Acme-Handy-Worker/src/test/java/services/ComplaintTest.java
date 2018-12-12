
package services;

import java.util.Collection;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import utilities.AbstractTest;
import domain.Complaint;
import domain.Report;

@ContextConfiguration(locations = {
	"classpath:spring/junit.xml"
})
@RunWith(SpringJUnit4ClassRunner.class)
@Transactional
public class ComplaintTest extends AbstractTest {

	@Autowired
	private ComplaintService	complaintService;

	@Autowired
	private ReportService		reportService;


	@Test
	public void testsaveComplaint() {
		final Complaint complaint, saved;
		final Collection<Complaint> complaints;

		complaint = this.complaintService.create();

		complaint.setAttachments(5);
		complaint.setDescription("New Version");
		final Collection<Report> reports = this.reportService.finAll();
		complaint.setReports(reports);

	}

}
