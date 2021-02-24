create or replace function pcs_mq_sdk_core$send(p_url_base in varchar, p_method in varchar, p_content_type in varchar, p_content in varchar, p_url_params in varchar default null)
returns void
as
$$
declare
  l_request           http_request;
  l_response          http_response;
  l_url               varchar(2000) := p_url_base;
  l_response_value    varchar(2000);
begin
  if (rtrim(p_url_params) is not null) then
    l_url := l_url || '/' || p_url_params;
  end if;

  l_request.method = p_method;
  l_request.uri = l_url;
  l_request.content_type = p_content_type;
  l_request.content = p_content;

  l_response := http(l_request);

  if (l_response.status not in (200, 201, 202)) then
    perform p_exception(0, 'PCS MQ Web Proxy Service interaction error: HttpStatusCode %s.', to_char(l_response.status));
  end if;

  l_response_value := l_response.content;
exception
  when others then
    perform p_exception(0, 'PCS MQ Web Proxy Service interaction error: %s.', sqlerrm);
end;
$$
language PLPGSQL immutable security definer;

select revoke_execute('pcs_mq_sdk_core$send');