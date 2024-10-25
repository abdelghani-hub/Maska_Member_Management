package org.youcode.maska.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.youcode.maska.entity.Member;


@Repository
public interface MemberRepository extends JpaRepository<Member, Long> {

}
