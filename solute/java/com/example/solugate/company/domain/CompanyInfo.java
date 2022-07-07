package com.example.solugate.company.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class CompanyInfo {
    private long id;
    private String ceoSubject;
    private String ceoContent;
    private String ceoPhoto;
    private String ceoSignPhoto;
    private String address;
    private String subway;
    private String bus;
    private String phone;
    private String fax;
    private String email;

    public CompanyInfo (long id, String ceoSubject, String ceoContent, String ceoPhoto,
                        String ceoSignPhoto, String address, String subway, String bus,
                        String phone, String fax, String email) {
        this.id = id;
        this.ceoSubject = ceoSubject;
        this.ceoContent = ceoContent;
        this.ceoPhoto = ceoPhoto;
        this.ceoSignPhoto = ceoSignPhoto;
        this.address = address;
        this.subway = subway;
        this.bus = bus;
        this.phone = phone;
        this.fax = fax;
        this.email = email;
    }
}
