
package services;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;

import repositories.ReportRepository;
import domain.Report;

public class ReportService {

	@Autowired
	private ReportRepository	reportRepository;


	public Collection<Report> finAll() {
		final Collection<Report> reports = this.reportRepository.findAll();
		return reports;
	}

}
