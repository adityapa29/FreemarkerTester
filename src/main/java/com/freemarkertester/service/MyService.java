package com.freemarkertester.service;

import java.text.ParseException;
import java.util.Map;

public interface MyService {
    Map<String, Object> createOrderAcknowledgement() throws ParseException;

    Map<String, Object> buildPickAndPackRollbackDataModel();

    Map<String, Object> buildmbproApprovalDataModel();

    Map<String, Object> buildMbproRejectDataModel();
}
