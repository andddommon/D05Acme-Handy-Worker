
package repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.Phase;

@Repository
public interface PhaseRepository extends JpaRepository<Phase, Integer> {

	@Query("select t.phases from Task t where t.id=?1")
	Collection<Phase> findByTaskId(int id);

}
