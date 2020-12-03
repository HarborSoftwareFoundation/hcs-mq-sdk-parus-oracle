create or replace package pcs_mq_sdk_core
as
  procedure send(p_url_base in varchar2, p_method in varchar, p_content_type in varchar2, p_content in varchar2, p_url_params in varchar2 default null);
end pcs_mq_sdk_core;
/

show errors package pcs_mq_sdk_core;