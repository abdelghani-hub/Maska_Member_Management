package org.youcode.maska.entity;

import lombok.Data;

import jakarta.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;

@Entity
@Data
@Table(name = "members")
public class Member implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "first_name", nullable = false)
    private String firstName;

    @Column(name = "last_name", nullable = false)
    private String lastName;

    @Column(name = "cin", nullable = false, unique = true)
    private String cin;

    @Column(name = "nationality", nullable = false)
    private String nationality;

    @Column(name = "accession_date", nullable = false)
    private LocalDateTime accessionDate;

    @Column(name = "licence_expiry_date", nullable = false)
    private LocalDateTime licenceExpiryDate;

    @Column(name = "membership_number", nullable = false, unique = true)
    private Integer membershipNumber;

    public Member() {
    }

    public Member(String firstName, String lastName, String cin, String nationality, LocalDateTime accessionDate, LocalDateTime licenceExpiryDate, Integer membershipNumber) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.cin = cin;
        this.nationality = nationality;
        this.accessionDate = accessionDate;
        this.licenceExpiryDate = licenceExpiryDate;
        this.membershipNumber = membershipNumber;
    }
}
