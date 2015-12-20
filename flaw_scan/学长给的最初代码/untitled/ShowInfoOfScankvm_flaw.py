#! /usr/bin/python
#encoding=utf-8
#all info out!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
from sqlutils.sqlhelper import getConnection,closeConn
import sys
from scanflaw.type_tran import get_versions
def getFlawInfoBySql(sql):
  conn,cur = getConnection()
  versions = get_versions() #versions = {'redhat': '3.0','ovirt-engine-sdk': '3.1.0.5','ubuntu': 'none'}
  inum = cur.execute(sql)
  inlist=[]
  fitinlist = []
  while(1):
    row = cur.fetchone()
    if(row==None):
      break
    #row[[7]产品信息，row[8]版本信息，row[2]漏洞名称，row[4]漏洞信息
    pro = row[7]
    ver = row[8]
    #tes =  pro.find(",")
    #print tes
    if(pro.find(",")>=0):

        #多个产品,取出产品版本,多个产品时qemu版本未指定的情况未检测
        s = "漏洞名称：%s \n" % row[2].replace('\n','')+ "漏洞信息：%s \n" % row[4].replace('\n','')
        inlist.append(s)
        #fit the flaw
        prol = pro.split(",")
        verl = ver.split("_")
        for i in range (len(prol)):
            for key in versions:
                if(prol[i]==key):
                    if(verl[i].find(versions.get(key))>=0):
                        sfit = "漏洞名称：%s \n" % row[2].replace('\n','')+ "漏洞信息：%s \n" % row[4].replace('\n','')
                        fitinlist.append(sfit)
    if(pro.find(",")<0):
        #单个产品 huozhe chanping yilan wei "null"
        if(pro=="null"):
              s = "漏洞名称：%s \n" % row[2].replace('\n','')+ "漏洞信息：%s \n" % row[4].replace('\n','')
              inlist.append(s)
        else:
              s = "漏洞名称：%s \n" % row[2].replace('\n','')+ "漏洞信息：%s \n" % row[4].replace('\n','')
              inlist.append(s)
        #fit the flaw
        for key in versions:
                if(pro==key):
                    if(ver.find(versions.get(key))>=0):
                        sfit = "漏洞名称：%s \n" % row[2].replace('\n','')+ "漏洞信息：%s \n" % row[4].replace('\n','')
                        fitinlist.append(sfit)
        #if(pro=="qemu" and ver.find(versions.get('qemu'))>=0):
        #      s = "漏洞名称：%s \n" % row[2].replace('\n','')+ "漏洞信息：%s \n" % row[4].replace('\n','')
        #      inlist.append(s)
  closeConn(conn,cur)
  return inlist


if __name__ == '__main__':
  reload(sys)
  sys.setdefaultencoding('utf-8')
  
  slist = getFlawInfoBySql("select * from kvm_flaw_scan")
  for s in slist:
	print s
  #for sfit in slist:
   # print sfit