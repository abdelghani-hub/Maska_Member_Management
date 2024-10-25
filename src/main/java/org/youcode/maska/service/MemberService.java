package org.youcode.maska.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.youcode.maska.entity.Member;
import org.youcode.maska.repository.MemberRepository;

import java.util.List;
import java.util.Optional;

@Service
public class MemberService implements CrudInterface<Member>{

    @Autowired
    private MemberRepository memberRepository;

    @Override
    public Member save(Member member) {
        return memberRepository.save(member);
    }

    @Override
    public Member update(Member member) {
        return memberRepository.save(member);
    }

    @Override
    public Member delete(Member member) {
        memberRepository.delete(member);
        return member;
    }

    @Override
    public Optional<Member> findById(Long id) {
        return memberRepository.findById(id);
    }

    @Override
    public List<Member> findAll() {
        return memberRepository.findAll();
    }
}