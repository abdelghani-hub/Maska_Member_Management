package org.youcode.maska;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;
import org.youcode.maska.entity.Member;
import org.youcode.maska.service.MemberService;

import java.time.LocalDateTime;
import java.util.List;

@Component
public class Main {

    public static void main(String[] args) {
        ApplicationContext context = new ClassPathXmlApplicationContext("ApplicationContext.xml");
        MemberService memberService = context.getBean(MemberService.class);
        SeedDB();
        List<Member> members = memberService.findAll();
        for (Member member : members) {
            System.out.println(member);
        }
    }



    public static void SeedDB(){
        ApplicationContext context = new ClassPathXmlApplicationContext("ApplicationContext.xml");
        MemberService memberService = context.getBean(MemberService.class);
        // Insert some members
        Member member1 = new Member("John", "Doe", "PA123456", "American", LocalDateTime.now(), LocalDateTime.now(), 889939);
        Member member2 = new Member("Jane", "Doe", "PA123457", "American", LocalDateTime.now(), LocalDateTime.now(), 889940);
        Member member3 = new Member("Alice", "Smith", "PA123458", "British", LocalDateTime.now(), LocalDateTime.now(), 889941);
        Member member4 = new Member("Bob", "Smith", "PA123459", "British", LocalDateTime.now(), LocalDateTime.now(), 889942);
        Member member5 = new Member("Charlie", "Brown", "PA123460", "Canadian", LocalDateTime.now(), LocalDateTime.now(), 889943);
        memberService.save(member1);
        memberService.save(member2);
        memberService.save(member3);
        memberService.save(member4);
        memberService.save(member5);
    }
}
