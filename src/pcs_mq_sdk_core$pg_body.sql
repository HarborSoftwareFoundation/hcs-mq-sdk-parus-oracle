create or replace package body pcs_mq_sdk_core$pg
as
  procedure send(p_url_base in varchar2, p_method in varchar, p_content_type in varchar2, p_content in varchar2, p_url_params in varchar2 default null)
  as
  begin
    p_necessary_recreate_volatile('pcs_mq_sdk_core.send');
  end;
end pcs_mq_sdk_core$pg;
/

show errors package body pcs_mq_sdk_core$pg;