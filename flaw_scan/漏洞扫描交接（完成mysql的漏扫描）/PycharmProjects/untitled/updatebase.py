#! /usr/bin/python
#coding=utf-8
import xlrd
from datetime import date,datetime
from sqlutils.sqlhelper import getConnection,closeConn
#time format transfor
def tran_type(efile):
  workbook = xlrd.open_workbook(efile)
  table = workbook.sheets()[0]
  nrows  = table.nrows
  flist = []
  for i in range(nrows):
    if(i > 0):
     value = table.row_values(i)
     for k in range(len(value)):
        if(table.cell(i,k).ctype == 3):
          date_value=xlrd.xldate_as_tuple(table.cell_value(i,k),workbook.datemode)
          s = date(*date_value[:3]).strftime('%Y-%m-%d')
          value[k] = s
     v =  '#1#2#3#'.join(value)
     d=savetodict(v)
     flist.append(d)
  return flist
def savetodict(value):
  info ={}
  strl = value.split('#1#2#3#')
  for i in range (len(strl)):
    if(i==0):
        info["cve_id"] = strl[i].replace('\n','')
    if (i==1):
        info["f_name"] = strl[i].replace('\n','').replace('\'',' ')
    if (i==2):
        ver = strl[i].split('\n')
        inf = ""
        for ii in range (len(ver)):
          if(ii==0):
            info["f_serverity"]= ver[ii].replace('\n','')
          if (ii!=0):
            inf += ver[ii]
        info["influence"]=inf
    if (i==3):
        info["f_describe"] = strl[i].replace('\n','')
    if (i==4):
        info["pub_date"] = strl[i].replace('\n','')
    if (i==5):
        info["ud_date"] = strl[i].replace('\n','')
    if (i==6):
        info["product"] = strl[i].replace('\n','')
    if (i==7):
        info["version"] = strl[i].replace('\n','_')
  return info

def udatebase():
    conn,cur = getConnection();
    flist = tran_type("Ovirt.xlsx")#更新数据库时需要改动“”中的内容为相应.xlsx文件，相应的在下面的sql="insert into Ovirt_flaw_scan....."这句话中需要修改相应的数据库表的名称
    cur.execute("delete from flaw_scan where id > 0;");
    for e in flist:

        sql = "insert into Ovirt_flaw_scan (cve_id,f_name,f_severity,f_describe,pub_date,ud_date,product,version,influence)values('"
        sql += e["cve_id"]+"','"+e["f_name"]+"','"+e["f_serverity"]+"','"+e["f_describe"]+"','"+e["pub_date"]+"','"+e["ud_date"]+"','"\
               +e["product"]+"','"+e["version"]+"','"+e["influence"]+"');"
        print sql
        cur.execute(sql)

    closeConn(conn,cur)

if __name__ == '__main__':
  udatebase();
# Ovirt insert Op
