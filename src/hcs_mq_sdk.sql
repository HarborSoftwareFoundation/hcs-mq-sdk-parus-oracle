create or replace package hcs_mq_sdk
as
  procedure send(p_topic in varchar2, p_message in varchar2);
end hcs_mq_sdk;
/

show errors package hcs_mq_sdk;