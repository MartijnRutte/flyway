-- migration from 1.0 to 1.2
--
--

ALTER TABLE STATEFUL_FLOW_INSTANCE_ATTEMPT ADD COLUMN QMSG_ID BIGINT;
COMMIT;
