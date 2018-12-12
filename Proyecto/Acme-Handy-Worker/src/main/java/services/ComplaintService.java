
package services;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import repositories.ComplaintRepository;
import domain.Complaint;
import domain.Report;

@Service
@Transactional
public class ComplaintService {

	@Autowired
	private ComplaintRepository	complaintRepository;


	public Complaint create() {

		final Complaint complaint = new Complaint();

		final String description = new String();
		final Integer attachments = 0;
		complaint.setAttachments(attachments);
		complaint.setDescription(description);

		final Date moment = new Date();

		complaint.setMoment(moment);

		final List<Report> reports = new ArrayList<>();
		complaint.setReports(reports);

		final String ticket = new String();
		complaint.setTicket(ticket);

		Assert.notNull(complaint);

		return complaint;

	}

	public Collection<Complaint> findAll() {
		Collection<Complaint> complaints;
		complaints = this.complaintRepository.findAll();
		return complaints;
	}

	public Complaint save(final Complaint complaint) {

		Assert.notNull(complaint);
		final Complaint result = this.complaintRepository.save(complaint);

		return result;
	}

}
