create or replace package body pcs_mq_sdk
as
  function to_json(p_topic in varchar2, p_message in varchar2) return varchar2
  as
  begin
    return '{' || cr
        || '  "topic": "' || p_topic || '",' || cr
        || '  "message": "' || replace(p_message, '"', '\"') || '"' || cr
        || '}';
  end;

  procedure send(p_topic in varchar2, p_message in varchar2)
  as
    l_base_url  varchar2(4000) := get_options_str('PcsMqWebProxyServiceAddress');
  begin
    pcs_mq_sdk_core.send(l_base_url, 'POST', 'application/json', to_json(p_topic, p_message));
  end;
end pcs_mq_sdk;
/

show errors package body pcs_mq_sdk;