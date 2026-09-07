package com.realestate.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class VerificationDocument implements Serializable {
    private static final long serialVersionUID = 1L;

    public enum DocumentType {
        GOVT_ID, BROKER_LICENSE, PROPERTY_TITLE_DEED, BUSINESS_REGISTRATION, UTILITY_BILL
    }

    private int documentId;
    private int requestId;
    private DocumentType documentType;
    private String filePath;
    private String originalFileName;
    private int fileSizeKb;
    private Timestamp createdAt;

    public VerificationDocument() {}

    public VerificationDocument(int documentId, int requestId, DocumentType documentType, String filePath, String originalFileName, int fileSizeKb) {
        this.documentId = documentId;
        this.requestId = requestId;
        this.documentType = documentType;
        this.filePath = filePath;
        this.originalFileName = originalFileName;
        this.fileSizeKb = fileSizeKb;
    }

    public int getDocumentId() { return documentId; }
    public void setDocumentId(int documentId) { this.documentId = documentId; }

    public int getRequestId() { return requestId; }
    public void setRequestId(int requestId) { this.requestId = requestId; }

    public DocumentType getDocumentType() { return documentType; }
    public void setDocumentType(DocumentType documentType) { this.documentType = documentType; }

    public String getFilePath() { return filePath; }
    public void setFilePath(String filePath) { this.filePath = filePath; }

    public String getOriginalFileName() { return originalFileName; }
    public void setOriginalFileName(String originalFileName) { this.originalFileName = originalFileName; }

    public int getFileSizeKb() { return fileSizeKb; }
    public void setFileSizeKb(int fileSizeKb) { this.fileSizeKb = fileSizeKb; }

    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }
}
