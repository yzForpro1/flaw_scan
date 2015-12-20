create table libvirt_flaw_scan (/*kvm;Ovirt;VDSM*/
  id INTEGER PRIMARY KEY NOT NULL,
  cve_id TEXT NOT NULL,
  f_name TEXT  NULL,
  f_severity TEXT  NULL,
  f_describe TEXT  NULL,
  pub_date TEXT  NULL,
  ud_date TEXT  NULL,
  product TEXT  NULL ,
  version TEXT  NULL,
  influence TEXT  NULL);

