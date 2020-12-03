create or replace package body pcs_mq_sdk_core
as
  procedure send(p_url_base in varchar2, p_method in varchar, p_content_type in varchar2, p_content in varchar2, p_url_params in varchar2 default null)
  as
    l_request           utl_http.req;
    l_response          utl_http.resp := null;
    l_url               varchar2(4000) := p_url_base;
    l_response_value    varchar2(4000);
  begin
    if (rtrim(p_url_params) is not null) then
      l_url := l_url || '/' || p_url_params;
    end if;

    l_request := utl_http.begin_request(l_url, p_method);
    utl_http.set_header(l_request, 'Content-Type', p_content_type);
    utl_http.set_header(l_request, 'Content-Length', length(p_content));
    utl_http.write_text(l_request, p_content);

    l_response := utl_http.get_response(l_request);
    if (l_response.status_code not in (200, 201, 202)) then
      utl_http.end_response(l_response);

      p_exception(0, 'PCS MQ Web Proxy Service interaction error: HttpStatusCode %s.', l_response.status_code);
    end if;

    utl_http.read_text(l_response, l_response_value);
    utl_http.end_response(l_response);
  exception
    when utl_http.end_of_body then
      utl_http.end_response(l_response);
    when others then 
      pkg_state.diagnostics_stacked;
      p_exception(0, 'PCS MQ Web Proxy Service interaction error: %s.', pkg_state.sql_errm);
  end;
end pcs_mq_sdk_core;
/

show errors package body pcs_mq_sdk_core;