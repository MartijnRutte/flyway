
 --
 -- S E Q U E N C E
 --
CREATE SEQUENCE SEQ_FLOWINST_ID START WITH 1 INCREMENT BY 1
MINVALUE 1 MAXVALUE 1000000000 CYCLE CACHE 100;
-- T A B L E S P A C E
--
--
--
CREATE TABLESPACE DPSTS800
    IN ${DBNAME}
    USING STOGROUP ${STOGROUP}
    PRIQTY -1 SECQTY -1
    MAXPARTITIONS ${MAXPARTITIONS}
    FREEPAGE 0 PCTFREE 10
    TRACKMOD NO
    SEGSIZE 32
    BUFFERPOOL BP1
    LOCKSIZE ${LOCKSIZE}
    LOCKMAX 0
    CCSID  UNICODE;
--
-- T A B L E
--
CREATE TABLE STATEFUL_SERVER_SETTINGS
    (SETTING_ID                                        BIGINT NOT NULL
     GENERATED ALWAYS AS IDENTITY       (START WITH 1, INCREMENT BY 1),
     SETTING_NAME                                 VARCHAR(60) NOT NULL,
     SETTING_VALUE                               VARCHAR(100) NOT NULL,
    PRIMARY KEY (SETTING_ID)
    )
    IN ${DBNAME}.DPSTS800
    DATA CAPTURE ${DB2TBDATACAPTURE}
    CCSID      UNICODE
    ;
--
-- I N D E X 1
--
CREATE UNIQUE INDEX X1800 ON
    STATEFUL_SERVER_SETTINGS
    (SETTING_ID)
    USING STOGROUP ${STOGROUP}
    PRIQTY -1 SECQTY -1
    FREEPAGE 0 PCTFREE 10
    CLUSTER
    NOT PADDED
    BUFFERPOOL BP2
    PIECESIZE 2 G
    ;
--
-- I N D E X 2
--
CREATE UNIQUE INDEX X2800 ON
    STATEFUL_SERVER_SETTINGS
    (SETTING_NAME)
    USING STOGROUP ${STOGROUP}
    PRIQTY -1 SECQTY -1
    FREEPAGE 0 PCTFREE 10
    NOT CLUSTER
    NOT PADDED
    BUFFERPOOL BP2
    PIECESIZE 2 G
    ;
-- T A B L E S P A C E
--
--
--
CREATE TABLESPACE DPSTS801
    IN ${DBNAME}
    USING STOGROUP ${STOGROUP}
    PRIQTY -1 SECQTY -1
    MAXPARTITIONS ${MAXPARTITIONS}
    FREEPAGE 0 PCTFREE 10
    TRACKMOD NO
    SEGSIZE 32
    BUFFERPOOL BP1
    LOCKSIZE ${LOCKSIZE}
    LOCKMAX 0
    CCSID  UNICODE;
--
-- T A B L E
--
CREATE TABLE STATEFUL_FLOW_TEMPLATE
    (FLOWTEMPL_ID                                      BIGINT NOT NULL
     GENERATED ALWAYS AS IDENTITY       (START WITH 1, INCREMENT BY 1),
     NAME                                        VARCHAR(100) NOT NULL,
     CORRELATION_POLICY                              SMALLINT NOT NULL,
     CRITICAL_SECTION_XPATH                      VARCHAR(200) NOT NULL,
     PERSISTENCE_MODE                                SMALLINT NOT NULL,
     STATISTICS_MODE                                 SMALLINT NOT NULL,
     FLOW_MSG_PERSISTENCE_OPT                        SMALLINT NOT NULL,
     SERVICE_REQ_PERSISTENCE_OPT                     SMALLINT NOT NULL,
     FLOW_DURATION_RECORD_OPT                        SMALLINT NOT NULL,
     RELIABILITY_ENFORCEMENT_MODE                    SMALLINT NOT NULL,
     FINALIZE_EVENTDEST_ID                           BIGINT,
     DEF_RETENTION_MODE                              SMALLINT NOT NULL,
     DEF_SERVICE_MATCHING_SYSTEM                     SMALLINT NOT NULL,
    PRIMARY KEY (FLOWTEMPL_ID)
    )
    IN ${DBNAME}.DPSTS801
    DATA CAPTURE ${DB2TBDATACAPTURE}
    CCSID      UNICODE
    ;
--
-- I N D E X 1
--
CREATE UNIQUE INDEX X1801 ON
    STATEFUL_FLOW_TEMPLATE
    (FLOWTEMPL_ID)
    USING STOGROUP ${STOGROUP}
    PRIQTY -1 SECQTY -1
    FREEPAGE 0 PCTFREE 10
    CLUSTER
    NOT PADDED
    BUFFERPOOL BP2
    PIECESIZE 2 G
    ;
--
-- I N D E X 2
--
CREATE UNIQUE INDEX X2801 ON
    STATEFUL_FLOW_TEMPLATE
    (NAME)
    USING STOGROUP ${STOGROUP}
    PRIQTY -1 SECQTY -1
    FREEPAGE 0 PCTFREE 10
    NOT CLUSTER
    NOT PADDED
    BUFFERPOOL BP2
    PIECESIZE 2 G
    ;
-- T A B L E S P A C E
--
--
--
CREATE TABLESPACE DPSTS802
    IN ${DBNAME}
    USING STOGROUP ${STOGROUP}
    PRIQTY -1 SECQTY -1
    MAXPARTITIONS ${MAXPARTITIONS}
    FREEPAGE 0 PCTFREE 10
    TRACKMOD NO
    SEGSIZE 32
    BUFFERPOOL BP1
    LOCKSIZE ${LOCKSIZE}
    LOCKMAX 0
    CCSID  UNICODE;
--
-- T A B L E
--
CREATE TABLE STATEFUL_FLOW_INSTANCE
    (FLOWINST_ID                                       BIGINT NOT NULL,
     FLOWTEMPL_ID                                      BIGINT NOT NULL,
     GID                                              CHAR(32)NOT NULL,
     REGISTRATION_DATE                              TIMESTAMP NOT NULL,
     STATUS                                          SMALLINT NOT NULL,
     PERSISTENCE_STATUS                              SMALLINT NOT NULL,
     LAST_ATTEMPT_NUMBER                                  INT NOT NULL,
     LAST_ATTEMPT_DATE                              TIMESTAMP NOT NULL,     
     FLOW_RETENTION_MODE                             SMALLINT NOT NULL,
     FLOW_SERVICE_MATCHING_SYSTEM                    SMALLINT NOT NULL,
    PRIMARY KEY (FLOWINST_ID)
    )
    VOLATILE IN ${DBNAME}.DPSTS802
    DATA CAPTURE ${DB2TBDATACAPTURE}
    CCSID      UNICODE
    ;
--
-- I N D E X 1
--
CREATE UNIQUE INDEX X1802 ON
    STATEFUL_FLOW_INSTANCE
    (FLOWINST_ID)
    USING STOGROUP ${STOGROUP}
    PRIQTY -1 SECQTY -1
    FREEPAGE 0 PCTFREE 10
    CLUSTER
    NOT PADDED
    BUFFERPOOL BP2
    PIECESIZE 2 G
    ;
--
-- I N D E X 2
--
CREATE INDEX X2802 ON
    STATEFUL_FLOW_INSTANCE
    (FLOWTEMPL_ID, GID)
    USING STOGROUP ${STOGROUP}
    PRIQTY -1 SECQTY -1
    FREEPAGE 0 PCTFREE 10
    NOT CLUSTER
    NOT PADDED
    BUFFERPOOL BP2
    PIECESIZE 2 G
    ;
-- T A B L E S P A C E
--
--
--
CREATE TABLESPACE DPSTS803
    IN ${DBNAME}
    USING STOGROUP ${STOGROUP}
    PRIQTY -1 SECQTY -1
    MAXPARTITIONS ${MAXPARTITIONS}
    FREEPAGE 0 PCTFREE 10
    TRACKMOD NO
    SEGSIZE 32
    BUFFERPOOL BP1
    LOCKSIZE ${LOCKSIZE}
    LOCKMAX 0
    CCSID  UNICODE;
--
-- T A B L E
--
CREATE TABLE STATEFUL_FLOW_INSTANCE_ATTEMPT
    (FLOWATMPT_ID                                      BIGINT NOT NULL
     GENERATED ALWAYS AS IDENTITY      (START WITH 1, INCREMENT BY 1),
     FLOWINST_ID                                       BIGINT NOT NULL,
     ATTEMPT_NUMBER                                       INT NOT NULL,
     INPUT_MESSAGE_HASH                              CHAR(32) NOT NULL,
     INPUT_MESSAGE_ID                                CHAR(60) NOT NULL,
     ATTEMPT_DATE                                   TIMESTAMP NOT NULL,
     ATTEMPT_DURATION                                              INT,
     CORRELATION_METHOD                              SMALLINT NOT NULL,
     PERSISTENCE_MODE                                SMALLINT NOT NULL,
     SERVICE_MATCHING_SYSTEM                         SMALLINT NOT NULL,
    PRIMARY KEY (FLOWATMPT_ID)
    )
    VOLATILE IN ${DBNAME}.DPSTS803
    DATA CAPTURE ${DB2TBDATACAPTURE}
    CCSID      UNICODE
    ;
--
-- I N D E X 1
--
CREATE UNIQUE INDEX X1803 ON
    STATEFUL_FLOW_INSTANCE_ATTEMPT
    (FLOWATMPT_ID)
    USING STOGROUP ${STOGROUP}
    PRIQTY -1 SECQTY -1
    FREEPAGE 0 PCTFREE 10
    CLUSTER
    NOT PADDED
    BUFFERPOOL BP2
    PIECESIZE 2 G
    ;
--
-- I N D E X 2
--
CREATE UNIQUE INDEX X2803 ON
    STATEFUL_FLOW_INSTANCE_ATTEMPT
    (FLOWINST_ID, ATTEMPT_NUMBER)
    USING STOGROUP ${STOGROUP}
    PRIQTY -1 SECQTY -1
    FREEPAGE 0 PCTFREE 10
    NOT CLUSTER
    NOT PADDED
    BUFFERPOOL BP2
    PIECESIZE 2 G
    ;
--
-- I N D E X 3
--
CREATE INDEX X3803 ON
    STATEFUL_FLOW_INSTANCE_ATTEMPT
    (INPUT_MESSAGE_ID)
    USING STOGROUP ${STOGROUP}
    PRIQTY -1 SECQTY -1
    FREEPAGE 0 PCTFREE 10
    NOT CLUSTER
    NOT PADDED
    BUFFERPOOL BP2
    PIECESIZE 2 G
    ;
-- T A B L E S P A C E
--
--
--
CREATE TABLESPACE DPSTS804
    IN ${DBNAME}
    USING STOGROUP ${STOGROUP}
    PRIQTY -1 SECQTY -1
    MAXPARTITIONS ${MAXPARTITIONS}
    FREEPAGE 0 PCTFREE 10
    TRACKMOD NO
    SEGSIZE 32
    BUFFERPOOL BP32K1
    LOCKSIZE ${LOCKSIZE}
    LOCKMAX 0
    CCSID  UNICODE;
--
-- T A B L E
--
CREATE TABLE STATEFUL_FLOW_INSTANCE_ATTEMPT_INPUT_MSG
    (FLOWATMPT_INPTMSG_ID                              BIGINT NOT NULL,
     INPUT_MESSAGE                             VARCHAR(30000) NOT NULL,
    PRIMARY KEY (FLOWATMPT_INPTMSG_ID)
    )
    VOLATILE IN ${DBNAME}.DPSTS804
    DATA CAPTURE ${DB2TBDATACAPTURE}
    CCSID      UNICODE
    ;
--
-- I N D E X 1
--
CREATE UNIQUE INDEX X1804 ON
    STATEFUL_FLOW_INSTANCE_ATTEMPT_INPUT_MSG
    (FLOWATMPT_INPTMSG_ID)
    USING STOGROUP ${STOGROUP}
    PRIQTY -1 SECQTY -1
    FREEPAGE 0 PCTFREE 10
    CLUSTER
    NOT PADDED
    BUFFERPOOL BP2
    PIECESIZE 2 G
    ;
-- T A B L E S P A C E
--
--
--
CREATE TABLESPACE DPSTS805
    IN ${DBNAME}
    USING STOGROUP ${STOGROUP}
    PRIQTY -1 SECQTY -1
    MAXPARTITIONS ${MAXPARTITIONS}
    FREEPAGE 0 PCTFREE 10
    TRACKMOD NO
    SEGSIZE 32
    BUFFERPOOL BP1
    LOCKSIZE ${LOCKSIZE}
    LOCKMAX 0
    CCSID  UNICODE;
--
-- T A B L E
--
CREATE TABLE STATEFUL_MEASUREPOINT
    (MEASUREPOINT_ID                                   BIGINT NOT NULL
     GENERATED ALWAYS AS IDENTITY      (START WITH 1, INCREMENT BY 1),
     FLOWINST_ID                                       BIGINT NOT NULL,     
     LOG_DATE                                       TIMESTAMP NOT NULL,
     MEASUREPOINT_LABEL                          VARCHAR(100) NOT NULL,
     WORKPROCESS_NAME                            VARCHAR(100) NOT NULL,
     MEASUREPOINT_HASH                               CHAR(32) NOT NULL,
    PRIMARY KEY (MEASUREPOINT_ID)
    )
    VOLATILE IN ${DBNAME}.DPSTS805
    DATA CAPTURE ${DB2TBDATACAPTURE}
    CCSID      UNICODE
    ;
--
-- I N D E X 1
--
CREATE UNIQUE INDEX X1805 ON
    STATEFUL_MEASUREPOINT
    (MEASUREPOINT_ID)
    USING STOGROUP ${STOGROUP}
    PRIQTY -1 SECQTY -1
    FREEPAGE 0 PCTFREE 10
    CLUSTER
    NOT PADDED
    BUFFERPOOL BP2
    PIECESIZE 2 G
    ;
--
-- I N D E X 2
--
CREATE INDEX X2805 ON
    STATEFUL_MEASUREPOINT
    (FLOWINST_ID)
    USING STOGROUP ${STOGROUP}
    PRIQTY -1 SECQTY -1
    FREEPAGE 0 PCTFREE 10
    NOT CLUSTER
    NOT PADDED
    BUFFERPOOL BP2
    PIECESIZE 2 G
    ;
-- T A B L E S P A C E
--
--
--
CREATE TABLESPACE DPSTS806
    IN ${DBNAME}
    USING STOGROUP ${STOGROUP}
    PRIQTY -1 SECQTY -1
    MAXPARTITIONS ${MAXPARTITIONS}
    FREEPAGE 0 PCTFREE 10
    TRACKMOD NO
    SEGSIZE 32
    BUFFERPOOL BP1
    LOCKSIZE ${LOCKSIZE}
    LOCKMAX 0
    CCSID  UNICODE;
--
-- T A B L E
--
CREATE TABLE STATEFUL_EVENT_DESTINATION
    (EVENTDEST_ID                                      BIGINT NOT NULL
     GENERATED ALWAYS AS IDENTITY      (START WITH 1, INCREMENT BY 1),
     NAME                                        VARCHAR(60)  NOT NULL,
     JMS_CONNFACTORY_JNDI                        VARCHAR(100) NOT NULL,
     JMS_DESTINATION_JNDI                        VARCHAR(100) NOT NULL,
    PRIMARY KEY (EVENTDEST_ID)
    )
    IN ${DBNAME}.DPSTS806
    DATA CAPTURE ${DB2TBDATACAPTURE}
    CCSID      UNICODE
    ;
--
-- I N D E X 1
--
CREATE UNIQUE INDEX X1806 ON
    STATEFUL_EVENT_DESTINATION
    (EVENTDEST_ID)
    USING STOGROUP ${STOGROUP}
    PRIQTY -1 SECQTY -1
    FREEPAGE 0 PCTFREE 10
    CLUSTER
    NOT PADDED
    BUFFERPOOL BP2
    PIECESIZE 2 G
    ;
-- T A B L E S P A C E
--
--
--
CREATE TABLESPACE DPSTS807
    IN ${DBNAME}
    USING STOGROUP ${STOGROUP}
    PRIQTY -1 SECQTY -1
    MAXPARTITIONS ${MAXPARTITIONS}
    FREEPAGE 0 PCTFREE 10
    TRACKMOD NO
    SEGSIZE 32
    BUFFERPOOL BP1
    LOCKSIZE ${LOCKSIZE}
    LOCKMAX 0
    CCSID  UNICODE;
--
-- T A B L E
--
CREATE TABLE STATEFUL_SERVICE_INTERFACE
    (SERVICEIFACE_ID                                   BIGINT NOT NULL
     GENERATED ALWAYS AS IDENTITY      (START WITH 1, INCREMENT BY 1),
     INTERFACE_NAME                              VARCHAR(100) NOT NULL,
     INTERFACE_NAMESPACE                         VARCHAR(250) NOT NULL,
     DEF_RELIABILITY_LEVEL                           SMALLINT NOT NULL,
     DEF_HEADER_PROP_MODE                            SMALLINT NOT NULL,
     DEF_FINALIZE_EVENTDEST_ID                                  BIGINT,
     DEF_REPLAY_MODE                                 SMALLINT NOT NULL,
     DEF_REQ_MISMATCH_RULE                           SMALLINT NOT NULL,
    PRIMARY KEY (SERVICEIFACE_ID)
    )
    IN ${DBNAME}.DPSTS807
    DATA CAPTURE ${DB2TBDATACAPTURE}
    CCSID      UNICODE
    ;
--
-- I N D E X 1
--
CREATE UNIQUE INDEX X1807 ON
    STATEFUL_SERVICE_INTERFACE
    (SERVICEIFACE_ID)
    USING STOGROUP ${STOGROUP}
    PRIQTY -1 SECQTY -1
    FREEPAGE 0 PCTFREE 10
    CLUSTER
    NOT PADDED
    BUFFERPOOL BP2
    PIECESIZE 2 G
    ;
--
-- I N D E X 2
--
CREATE UNIQUE INDEX X2807 ON
    STATEFUL_SERVICE_INTERFACE
    (INTERFACE_NAME,INTERFACE_NAMESPACE)
    USING STOGROUP ${STOGROUP}
    PRIQTY -1 SECQTY -1
    FREEPAGE 0 PCTFREE 10
    NOT CLUSTER
    NOT PADDED
    BUFFERPOOL BP2
    PIECESIZE 2 G
    ;
-- T A B L E S P A C E
--
--
--
CREATE TABLESPACE DPSTS808
    IN ${DBNAME}
    USING STOGROUP ${STOGROUP}
    PRIQTY -1 SECQTY -1
    MAXPARTITIONS ${MAXPARTITIONS}
    FREEPAGE 0 PCTFREE 10
    TRACKMOD NO
    SEGSIZE 32
    BUFFERPOOL BP1
    LOCKSIZE ${LOCKSIZE}
    LOCKMAX 0
    CCSID  UNICODE;
--
-- T A B L E
--
CREATE TABLE STATEFUL_SERVICE_OPERATION
    (SERVICEOPER_ID                                    BIGINT NOT NULL
     GENERATED ALWAYS AS IDENTITY      (START WITH 1, INCREMENT BY 1),
     SERVICEIFACE_ID                                   BIGINT NOT NULL,
     OPERATION_NAME                              VARCHAR(100) NOT NULL,
     DEF_RELIABILITY_LEVEL                           SMALLINT NOT NULL,
     DEF_HEADER_PROP_MODE                            SMALLINT NOT NULL,
     DEF_FINALIZE_EVENTDEST_ID                                  BIGINT,
     DEF_CRITICAL_XPATH                          VARCHAR(200) NOT NULL,
     DEF_REPLAY_MODE                                 SMALLINT NOT NULL,
     DEF_REQ_MISMATCH_RULE                           SMALLINT NOT NULL,
    PRIMARY KEY (SERVICEOPER_ID)
    )
    IN ${DBNAME}.DPSTS808
    DATA CAPTURE ${DB2TBDATACAPTURE}
    CCSID      UNICODE
    ;
--
-- I N D E X 1
--
CREATE UNIQUE INDEX X1808 ON
    STATEFUL_SERVICE_OPERATION
    (SERVICEOPER_ID)
    USING STOGROUP ${STOGROUP}
    PRIQTY -1 SECQTY -1
    FREEPAGE 0 PCTFREE 10
    CLUSTER
    NOT PADDED
    BUFFERPOOL BP2
    PIECESIZE 2 G
    ;
--
-- I N D E X 2
--
CREATE UNIQUE INDEX X2808 ON
    STATEFUL_SERVICE_OPERATION
    (SERVICEIFACE_ID, OPERATION_NAME)
    USING STOGROUP ${STOGROUP}
    PRIQTY -1 SECQTY -1
    FREEPAGE 0 PCTFREE 10
    NOT CLUSTER
    NOT PADDED
    BUFFERPOOL BP2
    PIECESIZE 2 G
    ;
-- T A B L E S P A C E
--
--
--
CREATE TABLESPACE DPSTS809
    IN ${DBNAME}
    USING STOGROUP ${STOGROUP}
    PRIQTY -1 SECQTY -1
    MAXPARTITIONS ${MAXPARTITIONS}
    FREEPAGE 0 PCTFREE 10
    TRACKMOD NO
    SEGSIZE 32
    BUFFERPOOL BP1
    LOCKSIZE ${LOCKSIZE}
    LOCKMAX 0
    CCSID  UNICODE;
--
-- T A B L E
--
CREATE TABLE STATEFUL_SERVICE_TEMPLATE
    (SERVICETEMPL_ID                                   BIGINT NOT NULL
     GENERATED ALWAYS AS IDENTITY      (START WITH 1, INCREMENT BY 1),
     FLOWTEMPL_ID                                      BIGINT NOT NULL,
     SERVICEOPER_ID                                    BIGINT NOT NULL,
     RELIABILITY_LEVEL                               SMALLINT NOT NULL,
     HEADER_PROP_MODE                                SMALLINT NOT NULL,
     FINALIZE_EVENTDEST_ID                                      BIGINT,
     DEF_CRITICAL_XPATH                          VARCHAR(200) NOT NULL,
     DEF_REPLAY_MODE                                 SMALLINT NOT NULL,
     DEF_REQ_MISMATCH_RULE                           SMALLINT NOT NULL,
    PRIMARY KEY (SERVICETEMPL_ID)
    )
    IN ${DBNAME}.DPSTS809
    DATA CAPTURE ${DB2TBDATACAPTURE}
    CCSID      UNICODE
    ;
--
-- I N D E X 1
--
CREATE UNIQUE INDEX X1809 ON
    STATEFUL_SERVICE_TEMPLATE
    (SERVICETEMPL_ID)
    USING STOGROUP ${STOGROUP}
    PRIQTY -1 SECQTY -1
    FREEPAGE 0 PCTFREE 10
    CLUSTER
    NOT PADDED
    BUFFERPOOL BP2
    PIECESIZE 2 G
    ;
--
-- I N D E X 2
--
CREATE UNIQUE INDEX X2809 ON
    STATEFUL_SERVICE_TEMPLATE
    (FLOWTEMPL_ID, SERVICEOPER_ID)
    USING STOGROUP ${STOGROUP}
    PRIQTY -1 SECQTY -1
    FREEPAGE 0 PCTFREE 10
    NOT CLUSTER
    NOT PADDED
    BUFFERPOOL BP2
    PIECESIZE 2 G
    ;
-- T A B L E S P A C E
--
--
--
CREATE TABLESPACE DPSTS810
    IN ${DBNAME}
    USING STOGROUP ${STOGROUP}
    PRIQTY -1 SECQTY -1
    MAXPARTITIONS ${MAXPARTITIONS}
    FREEPAGE 0 PCTFREE 10
    TRACKMOD NO
    SEGSIZE 32
    BUFFERPOOL BP1
    LOCKSIZE ${LOCKSIZE}
    LOCKMAX 0
    CCSID  UNICODE;
--
-- T A B L E
--
CREATE TABLE STATEFUL_SERVICE_INSTANCE
    (SERVICEINST_ID                                    BIGINT NOT NULL
     GENERATED ALWAYS AS IDENTITY      (START WITH 1, INCREMENT BY 1),
     FLOWINST_ID                                       BIGINT NOT NULL,
     SERVICETEMPL_ID                                   BIGINT NOT NULL,
     REQUEST_HASH                                    CHAR(32) NOT NULL,
     RESPONSE_HASH                                   CHAR(32) NOT NULL,
     REGISTRATION_DATE                              TIMESTAMP NOT NULL,
     STATUS                                          SMALLINT NOT NULL,
     SERVICE_CRITICAL_XPATH                      VARCHAR(200) NOT NULL,
     SERVICE_REPLAY_MODE                             SMALLINT NOT NULL,
     SERVICE_REQ_MISMATCH_RULE                       SMALLINT NOT NULL,
    PRIMARY KEY (SERVICEINST_ID)
    )
    VOLATILE IN ${DBNAME}.DPSTS810
    DATA CAPTURE ${DB2TBDATACAPTURE}
    CCSID      UNICODE
    ;
--
-- I N D E X 1
--
CREATE UNIQUE INDEX X1810 ON
    STATEFUL_SERVICE_INSTANCE
    (SERVICEINST_ID)
    USING STOGROUP ${STOGROUP}
    PRIQTY -1 SECQTY -1
    FREEPAGE 0 PCTFREE 10
    CLUSTER
    NOT PADDED
    BUFFERPOOL BP2
    PIECESIZE 2 G
    ;
--
-- I N D E X 2
--
CREATE UNIQUE INDEX X2810 ON
    STATEFUL_SERVICE_INSTANCE
    (FLOWINST_ID, SERVICETEMPL_ID, REQUEST_HASH, RESPONSE_HASH)
    USING STOGROUP ${STOGROUP}
    PRIQTY -1 SECQTY -1
    FREEPAGE 0 PCTFREE 10
    NOT CLUSTER
    NOT PADDED
    BUFFERPOOL BP2
    PIECESIZE 2 G
    ;
-- T A B L E S P A C E
--
--
--
CREATE TABLESPACE DPSTS811
    IN ${DBNAME}
    USING STOGROUP ${STOGROUP}
    PRIQTY -1 SECQTY -1
    MAXPARTITIONS ${MAXPARTITIONS}
    FREEPAGE 0 PCTFREE 10
    TRACKMOD NO
    SEGSIZE 32
    BUFFERPOOL BP32K1
    LOCKSIZE ${LOCKSIZE}
    LOCKMAX 0
    CCSID  UNICODE;
--
-- T A B L E
--
CREATE TABLE STATEFUL_SERVICE_INSTANCE_REQUEST_MSG
    (SERVICEINST_REQMSG_ID                             BIGINT NOT NULL,
     REQUEST_MSG                               VARCHAR(30000) NOT NULL,
    PRIMARY KEY (SERVICEINST_REQMSG_ID)
    )
    VOLATILE IN ${DBNAME}.DPSTS811
    DATA CAPTURE ${DB2TBDATACAPTURE}
    CCSID      UNICODE
    ;
--
-- I N D E X 1
--
CREATE UNIQUE INDEX X1811 ON
    STATEFUL_SERVICE_INSTANCE_REQUEST_MSG
    (SERVICEINST_REQMSG_ID)
    USING STOGROUP ${STOGROUP}
    PRIQTY -1 SECQTY -1
    FREEPAGE 0 PCTFREE 10
    CLUSTER
    NOT PADDED
    BUFFERPOOL BP2
    PIECESIZE 2 G
    ;
-- T A B L E S P A C E
--
--
--
CREATE TABLESPACE DPSTS812
    IN ${DBNAME}
    USING STOGROUP ${STOGROUP}
    PRIQTY -1 SECQTY -1
    MAXPARTITIONS ${MAXPARTITIONS}
    FREEPAGE 0 PCTFREE 10
    TRACKMOD NO
    SEGSIZE 32
    BUFFERPOOL BP32K1
    LOCKSIZE ${LOCKSIZE}
    LOCKMAX 0
    CCSID  UNICODE;
--
-- T A B L E
--
CREATE TABLE STATEFUL_SERVICE_INSTANCE_RESPONSE_MSG
    (SERVICEINST_RESMSG_ID                             BIGINT NOT NULL,
     RESPONSE_MSG                              VARCHAR(30000) NOT NULL,
    PRIMARY KEY (SERVICEINST_RESMSG_ID)
    )
    VOLATILE IN ${DBNAME}.DPSTS812
    DATA CAPTURE ${DB2TBDATACAPTURE}
    CCSID      UNICODE
    ;
--
-- I N D E X 1
--
CREATE UNIQUE INDEX X1812 ON
    STATEFUL_SERVICE_INSTANCE_RESPONSE_MSG
    (SERVICEINST_RESMSG_ID)
    USING STOGROUP ${STOGROUP}
    PRIQTY -1 SECQTY -1
    FREEPAGE 0 PCTFREE 10
    CLUSTER
    NOT PADDED
    BUFFERPOOL BP2
    PIECESIZE 2 G
    ;
-- T A B L E S P A C E
--
--
--
CREATE TABLESPACE DPSTS813
    IN ${DBNAME}
    USING STOGROUP ${STOGROUP}
    PRIQTY -1 SECQTY -1
    MAXPARTITIONS ${MAXPARTITIONS}
    FREEPAGE 0 PCTFREE 10
    TRACKMOD NO
    SEGSIZE 32
    BUFFERPOOL BP1
    LOCKSIZE ${LOCKSIZE}
    LOCKMAX 0
    CCSID  UNICODE;
--
-- T A B L E
--
CREATE TABLE STATEFUL_SERVICE_PENDING_CALL
    (SERVICEPENDCALL_ID                                BIGINT NOT NULL
     GENERATED ALWAYS AS IDENTITY      (START WITH 1, INCREMENT BY 1),
     FLOWINST_ID                                       BIGINT NOT NULL,
     SERVICETEMPL_ID                                   BIGINT NOT NULL,
     CALL_INDEX                                           INT NOT NULL,
     CALL_DATE                                      TIMESTAMP NOT NULL,
    PRIMARY KEY (SERVICEPENDCALL_ID)
    )
    VOLATILE IN ${DBNAME}.DPSTS813
    DATA CAPTURE ${DB2TBDATACAPTURE}
    CCSID      UNICODE
    ;
--
-- I N D E X 1
--
CREATE UNIQUE INDEX X1813 ON
    STATEFUL_SERVICE_PENDING_CALL
    (SERVICEPENDCALL_ID)
    USING STOGROUP ${STOGROUP}
    PRIQTY -1 SECQTY -1
    FREEPAGE 0 PCTFREE 10
    CLUSTER
    NOT PADDED
    BUFFERPOOL BP2
    PIECESIZE 2 G
    ;
--
-- I N D E X 2
--
CREATE UNIQUE INDEX X2813 ON
    STATEFUL_SERVICE_PENDING_CALL
    (FLOWINST_ID, CALL_INDEX)
    USING STOGROUP ${STOGROUP}
    PRIQTY -1 SECQTY -1
    FREEPAGE 0 PCTFREE 10
    NOT CLUSTER
    NOT PADDED
    BUFFERPOOL BP2
    PIECESIZE 2 G
    ;
-- T A B L E S P A C E
--
--
--
CREATE TABLESPACE DPSTS814
    IN ${DBNAME}
    USING STOGROUP ${STOGROUP}
    PRIQTY -1 SECQTY -1
    MAXPARTITIONS ${MAXPARTITIONS}
    FREEPAGE 0 PCTFREE 10
    TRACKMOD NO
    SEGSIZE 32
    BUFFERPOOL BP32K1
    LOCKSIZE ${LOCKSIZE}
    LOCKMAX 0
    CCSID  UNICODE;
--
-- T A B L E
--
CREATE TABLE STATEFUL_SERVICE_PENDING_CALL_REQUEST_MSG
    (SERVICEPENDCALL_REQMSG_ID                         BIGINT NOT NULL,
     REQUEST_MSG                               VARCHAR(30000) NOT NULL,
    PRIMARY KEY (SERVICEPENDCALL_REQMSG_ID)
    )
    VOLATILE IN ${DBNAME}.DPSTS814
    DATA CAPTURE ${DB2TBDATACAPTURE}
    CCSID      UNICODE
    ;
--
-- I N D E X 1
--
CREATE UNIQUE INDEX X1814 ON
    STATEFUL_SERVICE_PENDING_CALL_REQUEST_MSG
    (SERVICEPENDCALL_REQMSG_ID)
    USING STOGROUP ${STOGROUP}
    PRIQTY -1 SECQTY -1
    FREEPAGE 0 PCTFREE 10
    CLUSTER
    NOT PADDED
    BUFFERPOOL BP2
    PIECESIZE 2 G
    ;
-- T A B L E S P A C E
--
--
--
CREATE TABLESPACE DPSTS815
    IN ${DBNAME}
    USING STOGROUP ${STOGROUP}
    PRIQTY -1 SECQTY -1
    MAXPARTITIONS ${MAXPARTITIONS}
    FREEPAGE 0 PCTFREE 10
    TRACKMOD NO
    SEGSIZE 32
    BUFFERPOOL BP1
    LOCKSIZE ${LOCKSIZE}
    LOCKMAX 0
    CCSID  UNICODE;
--
-- T A B L E
--
CREATE TABLE STATEFUL_SERVICE_CALL
    (SERVICECALL_ID                                    BIGINT NOT NULL
     GENERATED ALWAYS AS IDENTITY      (START WITH 1, INCREMENT BY 1),
     FLOWINST_ID                                       BIGINT NOT NULL,
     SERVICEINST_ID                                    BIGINT NOT NULL,
     FLOW_ATTEMPT_NUMBER                                  INT NOT NULL,
     CALL_INDEX                                           INT NOT NULL,
     CALL_DATE                                      TIMESTAMP NOT NULL,
     CALL_DURATION                                        INT NOT NULL,
     CALL_TYPE                                       SMALLINT NOT NULL,
     CALL_TYPE_REASON                                SMALLINT NOT NULL,
    PRIMARY KEY (SERVICECALL_ID)
    )
    VOLATILE IN ${DBNAME}.DPSTS815
    DATA CAPTURE ${DB2TBDATACAPTURE}
    CCSID      UNICODE
    ;
--
-- I N D E X 1
--
CREATE UNIQUE INDEX X1815 ON
    STATEFUL_SERVICE_CALL
    (SERVICECALL_ID)
    USING STOGROUP ${STOGROUP}
    PRIQTY -1 SECQTY -1
    FREEPAGE 0 PCTFREE 10
    CLUSTER
    NOT PADDED
    BUFFERPOOL BP2
    PIECESIZE 2 G
    ;
--
-- I N D E X 2
--
CREATE UNIQUE INDEX X2815 ON
    STATEFUL_SERVICE_CALL
    (FLOWINST_ID, CALL_INDEX, FLOW_ATTEMPT_NUMBER)
    USING STOGROUP ${STOGROUP}
    PRIQTY -1 SECQTY -1
    FREEPAGE 0 PCTFREE 10
    NOT CLUSTER
    NOT PADDED
    BUFFERPOOL BP2
    PIECESIZE 2 G
    ;
-- T A B L E S P A C E
--
--
--
CREATE TABLESPACE DPSTS816
    IN ${DBNAME}
    USING STOGROUP ${STOGROUP}
    PRIQTY -1 SECQTY -1
    MAXPARTITIONS ${MAXPARTITIONS}
    FREEPAGE 0 PCTFREE 10
    TRACKMOD NO
    SEGSIZE 32
    BUFFERPOOL BP1
    LOCKSIZE ${LOCKSIZE}
    LOCKMAX 0
    CCSID  UNICODE;
--
-- T A B L E
--
CREATE TABLE STATEFUL_SERVICE_REJECTED_CALL
    (SERVICEREJCALL_ID                                 BIGINT NOT NULL
     GENERATED ALWAYS AS IDENTITY      (START WITH 1, INCREMENT BY 1),
     FLOWINST_ID                                       BIGINT NOT NULL,
     SERVICETEMPL_ID                                   BIGINT NOT NULL,
     FLOW_ATTEMPT_NUMBER                                  INT NOT NULL,
     CALL_INDEX                                           INT NOT NULL,
     CALL_DATE                                      TIMESTAMP NOT NULL,
     CALL_REJECTION_REASON                           SMALLINT NOT NULL,
    PRIMARY KEY (SERVICEREJCALL_ID)
    )
    VOLATILE IN ${DBNAME}.DPSTS816
    DATA CAPTURE ${DB2TBDATACAPTURE}
    CCSID      UNICODE
    ;
--
-- I N D E X 1
--
CREATE UNIQUE INDEX X1816 ON
    STATEFUL_SERVICE_REJECTED_CALL
    (SERVICEREJCALL_ID)
    USING STOGROUP ${STOGROUP}
    PRIQTY -1 SECQTY -1
    FREEPAGE 0 PCTFREE 10
    CLUSTER
    NOT PADDED
    BUFFERPOOL BP2
    PIECESIZE 2 G
    ;
--
-- I N D E X 2
--
CREATE INDEX X2816 ON
    STATEFUL_SERVICE_REJECTED_CALL
    (FLOWINST_ID, FLOW_ATTEMPT_NUMBER)
    USING STOGROUP ${STOGROUP}
    PRIQTY -1 SECQTY -1
    FREEPAGE 0 PCTFREE 10
    NOT CLUSTER
    NOT PADDED
    BUFFERPOOL BP2
    PIECESIZE 2 G
    ;
-- T A B L E S P A C E
--
--
--
CREATE TABLESPACE DPSTS817
    IN ${DBNAME}
    USING STOGROUP ${STOGROUP}
    PRIQTY -1 SECQTY -1
    MAXPARTITIONS ${MAXPARTITIONS}
    FREEPAGE 0 PCTFREE 10
    TRACKMOD NO
    SEGSIZE 32
    BUFFERPOOL BP32K1
    LOCKSIZE ${LOCKSIZE}
    LOCKMAX 0
    CCSID  UNICODE;
--
-- T A B L E
--
CREATE TABLE STATEFUL_SERVICE_REJECTED_CALL_REQUEST_MSG
    (SERVICEREJCALL_REQMSG_ID                          BIGINT NOT NULL,
     REQUEST_MSG                               VARCHAR(30000) NOT NULL,
    PRIMARY KEY (SERVICEREJCALL_REQMSG_ID)
    )
    VOLATILE IN ${DBNAME}.DPSTS817
    DATA CAPTURE ${DB2TBDATACAPTURE}
    CCSID      UNICODE
    ;
--
-- I N D E X 1
--
CREATE UNIQUE INDEX X1817 ON
    STATEFUL_SERVICE_REJECTED_CALL_REQUEST_MSG
    (SERVICEREJCALL_REQMSG_ID)
    USING STOGROUP ${STOGROUP}
    PRIQTY -1 SECQTY -1
    FREEPAGE 0 PCTFREE 10
    CLUSTER
    NOT PADDED
    BUFFERPOOL BP2
    PIECESIZE 2 G
    ;
-- T A B L E S P A C E
--
--
--
CREATE TABLESPACE DPSTS818
    IN ${DBNAME}
    USING STOGROUP ${STOGROUP}
    PRIQTY -1 SECQTY -1
    MAXPARTITIONS ${MAXPARTITIONS}
    FREEPAGE 0 PCTFREE 10
    TRACKMOD NO
    SEGSIZE 32
    BUFFERPOOL BP1
    LOCKSIZE ${LOCKSIZE}
    LOCKMAX 0
    CCSID  UNICODE;
--
-- T A B L E
--
CREATE TABLE STATEFUL_FLOW_RAWSTAT_LOG
    (FLOWTEMPL_ID                                      BIGINT NOT NULL,
     STAT_DATE                                      TIMESTAMP NOT NULL,
     STAT_TYPE                                       SMALLINT NOT NULL
    )
    IN ${DBNAME}.DPSTS818
    DATA CAPTURE ${DB2TBDATACAPTURE}
    CCSID      UNICODE
    ;
-- T A B L E S P A C E
--
--
--
CREATE TABLESPACE DPSTS819
    IN ${DBNAME}
    USING STOGROUP ${STOGROUP}
    PRIQTY -1 SECQTY -1
    MAXPARTITIONS ${MAXPARTITIONS}
    FREEPAGE 0 PCTFREE 10
    TRACKMOD NO
    SEGSIZE 32
    BUFFERPOOL BP1
    LOCKSIZE ${LOCKSIZE}
    LOCKMAX 0
    CCSID  UNICODE;
--
-- T A B L E
--
CREATE TABLE STATEFUL_FLOW_TEMPLATE_DELETED
    (FLOWTEMPL_ID                                      BIGINT NOT NULL,
     NAME                                        VARCHAR(100) NOT NULL,
    PRIMARY KEY (FLOWTEMPL_ID)
    )
    IN ${DBNAME}.DPSTS819
    DATA CAPTURE ${DB2TBDATACAPTURE}
    CCSID      UNICODE
    ;
--
-- I N D E X 1
--
CREATE UNIQUE INDEX X1819 ON
    STATEFUL_FLOW_TEMPLATE_DELETED
    (FLOWTEMPL_ID)
    USING STOGROUP ${STOGROUP}
    PRIQTY -1 SECQTY -1
    FREEPAGE 0 PCTFREE 10
    CLUSTER
    NOT PADDED
    BUFFERPOOL BP2
    PIECESIZE 2 G
    ;
 --
 -- TRIGGER
 --
--#SET TERMINATOR @
CREATE TRIGGER TRIG_KEEP_DELETED_FLOW_TEMPLATES
      AFTER DELETE ON STATEFUL_FLOW_TEMPLATE
      REFERENCING OLD AS DELETED
      FOR EACH ROW MODE DB2SQL
      BEGIN ATOMIC
           INSERT INTO STATEFUL_FLOW_TEMPLATE_DELETED
(FLOWTEMPL_ID, NAME) VALUES (DELETED.FLOWTEMPL_ID,
DELETED.NAME);
    END @

--2-ADDTEMPLATEFOREIGNKEYS
--
--

ALTER TABLE STATEFUL_FLOW_INSTANCE ADD CONSTRAINT
FLOWINSTANCE_FLOWTEMPL_FK FOREIGN KEY (FLOWTEMPL_ID)
REFERENCES STATEFUL_FLOW_TEMPLATE ON DELETE RESTRICT@

ALTER TABLE STATEFUL_SERVICE_INTERFACE ADD CONSTRAINT
SERVICEIFACE_FINALEVENTDEST_FK FOREIGN KEY
(DEF_FINALIZE_EVENTDEST_ID) REFERENCES
STATEFUL_EVENT_DESTINATION ON DELETE RESTRICT@

ALTER TABLE STATEFUL_SERVICE_OPERATION ADD CONSTRAINT
SERVICEOPER_FINALEVENTDEST_FK FOREIGN KEY
(DEF_FINALIZE_EVENTDEST_ID) REFERENCES
STATEFUL_EVENT_DESTINATION ON DELETE RESTRICT@

ALTER TABLE STATEFUL_SERVICE_OPERATION ADD CONSTRAINT
SERVICEOPER_SERVICEIFACE_FK FOREIGN KEY (SERVICEIFACE_ID)
REFERENCES STATEFUL_SERVICE_INTERFACE ON DELETE CASCADE@

ALTER TABLE STATEFUL_SERVICE_TEMPLATE ADD CONSTRAINT
SERVICETEMPL_FINALEVENTDEST_FK FOREIGN KEY
(FINALIZE_EVENTDEST_ID) REFERENCES STATEFUL_EVENT_DESTINATION
ON DELETE RESTRICT@

ALTER TABLE STATEFUL_SERVICE_TEMPLATE ADD CONSTRAINT
SERVICETEMPL_SERVICEOPER_FK FOREIGN KEY (SERVICEOPER_ID)
REFERENCES STATEFUL_SERVICE_OPERATION ON DELETE CASCADE@

ALTER TABLE STATEFUL_SERVICE_TEMPLATE ADD CONSTRAINT
SERVICETEMPL_FLOWTEMPL_FK FOREIGN KEY (FLOWTEMPL_ID)
REFERENCES STATEFUL_FLOW_TEMPLATE ON DELETE CASCADE@

ALTER TABLE STATEFUL_SERVICE_PENDING_CALL ADD CONSTRAINT
SERVICEPENDCALL_SERVICETEMPL_FK FOREIGN KEY (SERVICETEMPL_ID)
REFERENCES STATEFUL_SERVICE_TEMPLATE ON DELETE RESTRICT@

ALTER TABLE STATEFUL_SERVICE_REJECTED_CALL ADD CONSTRAINT
SERVICEREJCALL_SERVICETEMPL_FK FOREIGN KEY (SERVICETEMPL_ID)
REFERENCES STATEFUL_SERVICE_TEMPLATE ON DELETE RESTRICT@

ALTER TABLE STATEFUL_SERVICE_INSTANCE ADD CONSTRAINT
SERVICEINSTANCE_SERVICETEMPL_FK FOREIGN KEY (SERVICETEMPL_ID)
REFERENCES STATEFUL_SERVICE_TEMPLATE ON DELETE RESTRICT@
--3-ADDINSTANCEFOREIGNKEYS
--
--
ALTER TABLE STATEFUL_FLOW_INSTANCE_ATTEMPT ADD CONSTRAINT
FLOWATMPT_FLOWINST_FK FOREIGN KEY (FLOWINST_ID) REFERENCES
STATEFUL_FLOW_INSTANCE ON DELETE CASCADE@

ALTER TABLE STATEFUL_FLOW_INSTANCE_ATTEMPT_INPUT_MSG ADD
CONSTRAINT FLOWATMPTINPUTMSG_FK FOREIGN KEY
(FLOWATMPT_INPTMSG_ID) REFERENCES
STATEFUL_FLOW_INSTANCE_ATTEMPT ON DELETE CASCADE@

ALTER TABLE STATEFUL_SERVICE_CALL ADD CONSTRAINT
SERVICECALL_FLOWINSTANCE_FK FOREIGN KEY (FLOWINST_ID)
REFERENCES STATEFUL_FLOW_INSTANCE ON DELETE CASCADE@

ALTER TABLE STATEFUL_SERVICE_PENDING_CALL ADD CONSTRAINT
SERVICEPENDCALL_FLOWINSTANCE_FK FOREIGN KEY (FLOWINST_ID)
REFERENCES STATEFUL_FLOW_INSTANCE ON DELETE CASCADE@

ALTER TABLE STATEFUL_SERVICE_PENDING_CALL_REQUEST_MSG ADD
CONSTRAINT SRVPENDCALLREQMSG_FK FOREIGN KEY
(SERVICEPENDCALL_REQMSG_ID) REFERENCES
STATEFUL_SERVICE_PENDING_CALL ON DELETE CASCADE@

ALTER TABLE STATEFUL_SERVICE_REJECTED_CALL ADD CONSTRAINT
SERVICEREJCALL_FLOWINSTANCE_FK FOREIGN KEY (FLOWINST_ID)
REFERENCES STATEFUL_FLOW_INSTANCE ON DELETE CASCADE@

ALTER TABLE STATEFUL_SERVICE_REJECTED_CALL_REQUEST_MSG ADD
CONSTRAINT SRVREJCTCALLREQMSG_FK FOREIGN KEY
(SERVICEREJCALL_REQMSG_ID) REFERENCES
STATEFUL_SERVICE_REJECTED_CALL ON DELETE CASCADE@

ALTER TABLE STATEFUL_SERVICE_INSTANCE ADD CONSTRAINT
SERVICEINSTANCE_FLOWINSTANCE_FK FOREIGN KEY (FLOWINST_ID)
REFERENCES STATEFUL_FLOW_INSTANCE ON DELETE CASCADE@

ALTER TABLE STATEFUL_SERVICE_INSTANCE_REQUEST_MSG ADD
CONSTRAINT SRVINSTREQMSG_FK FOREIGN KEY
(SERVICEINST_REQMSG_ID) REFERENCES STATEFUL_SERVICE_INSTANCE
ON DELETE CASCADE@

ALTER TABLE STATEFUL_SERVICE_INSTANCE_RESPONSE_MSG ADD
CONSTRAINT SRVINSTRESMSG_FK FOREIGN KEY
(SERVICEINST_RESMSG_ID) REFERENCES STATEFUL_SERVICE_INSTANCE
ON DELETE CASCADE@

ALTER TABLE STATEFUL_MEASUREPOINT ADD CONSTRAINT
MEASUREPOINT_FLOWINSTANCE_FK FOREIGN KEY (FLOWINST_ID)
REFERENCES STATEFUL_FLOW_INSTANCE ON DELETE CASCADE@
 --
 -- INSERT SETTINGS VOOR SFM
 --

GRANT SELECT, UPDATE, DELETE, INSERT ON STATEFUL_SERVER_SETTINGS TO ${GRANTTABMUT} @
GRANT SELECT, UPDATE, DELETE, INSERT ON STATEFUL_FLOW_TEMPLATE TO ${GRANTTABMUT}@
GRANT SELECT, UPDATE, DELETE, INSERT ON STATEFUL_FLOW_INSTANCE TO ${GRANTTABMUT}@
GRANT SELECT, UPDATE, DELETE, INSERT ON STATEFUL_FLOW_INSTANCE_ATTEMPT TO ${GRANTTABMUT}@
GRANT SELECT, UPDATE, DELETE, INSERT ON STATEFUL_FLOW_INSTANCE_ATTEMPT_INPUT_MSG TO ${GRANTTABMUT}@
GRANT SELECT, UPDATE, DELETE, INSERT ON STATEFUL_MEASUREPOINT TO ${GRANTTABMUT}@
GRANT SELECT, UPDATE, DELETE, INSERT ON STATEFUL_EVENT_DESTINATION TO ${GRANTTABMUT}@
GRANT SELECT, UPDATE, DELETE, INSERT ON STATEFUL_SERVICE_INTERFACE TO ${GRANTTABMUT}@
GRANT SELECT, UPDATE, DELETE, INSERT ON STATEFUL_SERVICE_OPERATION TO ${GRANTTABMUT}@
GRANT SELECT, UPDATE, DELETE, INSERT ON STATEFUL_SERVICE_TEMPLATE TO ${GRANTTABMUT}@
GRANT SELECT, UPDATE, DELETE, INSERT ON STATEFUL_SERVICE_INSTANCE TO ${GRANTTABMUT}@
GRANT SELECT, UPDATE, DELETE, INSERT ON STATEFUL_SERVICE_INSTANCE_REQUEST_MSG TO ${GRANTTABMUT}@
GRANT SELECT, UPDATE, DELETE, INSERT ON STATEFUL_SERVICE_INSTANCE_RESPONSE_MSG TO ${GRANTTABMUT}@
GRANT SELECT, UPDATE, DELETE, INSERT ON STATEFUL_SERVICE_PENDING_CALL TO ${GRANTTABMUT}@
GRANT SELECT, UPDATE, DELETE, INSERT ON STATEFUL_SERVICE_PENDING_CALL_REQUEST_MSG TO ${GRANTTABMUT}@
GRANT SELECT, UPDATE, DELETE, INSERT ON STATEFUL_SERVICE_CALL TO ${GRANTTABMUT}@
GRANT SELECT, UPDATE, DELETE, INSERT ON STATEFUL_SERVICE_REJECTED_CALL TO ${GRANTTABMUT}@
GRANT SELECT, UPDATE, DELETE, INSERT ON STATEFUL_SERVICE_REJECTED_CALL_REQUEST_MSG TO ${GRANTTABMUT}@
GRANT SELECT, UPDATE, DELETE, INSERT ON STATEFUL_FLOW_RAWSTAT_LOG TO ${GRANTTABMUT}@
GRANT SELECT, UPDATE, DELETE, INSERT ON STATEFUL_FLOW_TEMPLATE_DELETED TO ${GRANTTABMUT}@

GRANT SELECT ON STATEFUL_SERVER_SETTINGS TO ${GRANTTABREAD} @
GRANT SELECT ON STATEFUL_FLOW_TEMPLATE TO ${GRANTTABREAD}@
GRANT SELECT ON STATEFUL_FLOW_INSTANCE TO ${GRANTTABREAD}@
GRANT SELECT ON STATEFUL_FLOW_INSTANCE_ATTEMPT TO ${GRANTTABREAD}@
GRANT SELECT ON STATEFUL_FLOW_INSTANCE_ATTEMPT_INPUT_MSG TO ${GRANTTABREAD}@
GRANT SELECT ON STATEFUL_MEASUREPOINT TO ${GRANTTABREAD}@
GRANT SELECT ON STATEFUL_EVENT_DESTINATION TO ${GRANTTABREAD}@
GRANT SELECT ON STATEFUL_SERVICE_INTERFACE TO ${GRANTTABREAD}@
GRANT SELECT ON STATEFUL_SERVICE_OPERATION TO ${GRANTTABREAD}@
GRANT SELECT ON STATEFUL_SERVICE_TEMPLATE TO ${GRANTTABREAD}@
GRANT SELECT ON STATEFUL_SERVICE_INSTANCE TO ${GRANTTABREAD}@
GRANT SELECT ON STATEFUL_SERVICE_INSTANCE_REQUEST_MSG TO ${GRANTTABREAD}@
GRANT SELECT ON STATEFUL_SERVICE_INSTANCE_RESPONSE_MSG TO ${GRANTTABREAD}@
GRANT SELECT ON STATEFUL_SERVICE_PENDING_CALL TO ${GRANTTABREAD}@
GRANT SELECT ON STATEFUL_SERVICE_PENDING_CALL_REQUEST_MSG TO ${GRANTTABREAD}@
GRANT SELECT ON STATEFUL_SERVICE_CALL TO ${GRANTTABREAD}@
GRANT SELECT ON STATEFUL_SERVICE_REJECTED_CALL TO ${GRANTTABREAD}@
GRANT SELECT ON STATEFUL_SERVICE_REJECTED_CALL_REQUEST_MSG TO ${GRANTTABREAD}@
GRANT SELECT ON STATEFUL_FLOW_RAWSTAT_LOG TO ${GRANTTABREAD}@
GRANT SELECT ON STATEFUL_FLOW_TEMPLATE_DELETED TO ${GRANTTABREAD}@

GRANT USAGE ON SEQUENCE SEQ_FLOWINST_ID TO ${GRANTTABMUT}@

COMMIT@