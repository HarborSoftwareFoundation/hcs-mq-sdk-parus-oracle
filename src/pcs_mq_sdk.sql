create or replace package pcs_mq_sdk
as
  procedure send(p_topic in varchar2, p_message in varchar2);
end pcs_mq_sdk;
/

show errors package pcs_mq_sdk;