#! /usr/bin/python
#from  scanflaw.type_tran import get_flaw_info
import MySQLdb
def getConnection():
 try:
     conn=MySQLdb.connect(
        host='localhost',
        user='root',
        passwd='root',
        port=3306,db='cloud',
        charset='utf8'	
        )
     cur = conn.cursor()
     return conn,cur
 except MySQLdb.Error,e:
     print "Mysql Error %d: %s" % (e.args[0], e.args[1])
def closeConn(conn,cur):
 conn.commit()
 cur.close()
 conn.close()

if __name__ == '__main__':
 conn,cur = getConnection()
 closeConn(conn,cur)