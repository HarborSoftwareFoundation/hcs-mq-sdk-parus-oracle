set serveroutput on;
declare
  l_numb    options.numb%type;
begin
  select coalesce(max(numb), 0) + 1 into l_numb from options;

  p_system_init_option
  (
    sunitcode       => 'OptionsSystemGlobal',
    scode           => 'HcsMqWebProxyServiceAddress',
    sname           => 'HCS MQ Web Proxy Service Address',
    nnumb           => l_numb,
    nopt_type       => 1,
    nopt_kind       => 1,
    nopt_mode       => 0,
    nentry_type     => 0,
    ndata_type      => 0,
    nstr_width      => 240,
    nnum_width      => null,
    nnum_precision  => null,
    senum_code      => null,
    senum_text      => null,
    slink_unitcode  => null,
    slink_method    => null,
    slink_inparam   => null,
    slink_outparam  => null,
    slink_option    => null,
    sstr_value      => null,
    nnum_value      => null,
    ddate_value     => null
  );

  dbms_output.put_line('Created parameter HcsMqWebProxyServiceAddress with number: ' || l_numb);
exception
  when others then
    dbms_output.put_line('Failed to create parameter HcsMqWebProxyServiceAddress with number: ' || l_numb);
end;
/