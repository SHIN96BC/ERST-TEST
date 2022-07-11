package com.example.solugate.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class CompanyInfo {
    private long id;
    private String companyName;
    private String ceoSubject;
    private String ceoContent;
    private String ceoPhoto;
    private String ceoSignPhoto;
    private String postNumber;
    private String address;
    private String addressDetail;
    private String subway;
    private String bus;
    private String phone;
    private String fax;
    private String email;

    public CompanyInfo(long id, String companyName, String ceoSubject,
                       String ceoContent, String ceoPhoto, String ceoSignPhoto,
                       String postNumber, String address, String addressDetail,
                       String subway, String bus, String phone, String fax,
                       String email) {
        this.id = id;
        this.companyName = companyName;
        this.ceoSubject = ceoSubject;
        this.ceoContent = ceoContent;
        this.ceoPhoto = ceoPhoto;
        this.ceoSignPhoto = ceoSignPhoto;
        this.postNumber = postNumber;
        this.address = address;
        this.addressDetail = addressDetail;
        this.subway = subway;
        this.bus = bus;
        this.phone = phone;
        this.fax = fax;
        this.email = email;
    }
}
