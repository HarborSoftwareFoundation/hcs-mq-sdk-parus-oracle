begin
  dbms_network_acl_admin.unassign_acl
  (
    acl        => 'hcsmqwebproxyservice.xml',
    host       => 'localhost',
    lower_port => 7100,
    upper_port => 7100
  );
exception
  when others then
    null;
end;
/

commit;
/

begin
  dbms_network_acl_admin.delete_privilege
  (
    acl       => 'hcsmqwebproxyservice.xml',
    principal => 'PARUS',
    is_grant  => false,
    privilege => 'connect'
  );
exception
  when others then
    null;
end;
/

commit;
/

begin
  dbms_network_acl_admin.drop_acl
  (
    acl => 'hcsmqwebproxyservice.xml'
  );
exception
  when others then
    null;
end;
/

commit;
/