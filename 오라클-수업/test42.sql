-- 8�� =====> �� ���α׷� ���۽� ���� 
/*
     3�� : SELECT => ������ �˻� 
		| JOIN / SUBQUERY 
		| ������ 
     4�� : **���� �Լ� / DDL (CREATE , ALTER , DROP , RENAME , TRUNCATE)
	    **DML (INSERT , UPDATE , DELETE)
     5�� : PL/SQL ( FUNCTION , PROCEDURE, TRIGGER)
     6�� : ER-MODEL (���� 1:1 , 1:N , N:M)
     7�� : ����ȭ 
	     1 ����ȭ => ���ڰ� ( �÷��� ���ϰ� �켱)
	     2 ����ȭ => �ߺ� ���� 
	     3 ����ȭ => �÷� => ��� ROW�� �÷��� ���� 
     8�� : **Ʈ����� 
	     => �ϰ�ó�� 
	     => ����Ŭ �ϰ�ó�� => �ڹ� (AutoCommit)
						| �������� SQL�� ���ÿ� ó�� (commit����)
	     try{
		      ����
		      conn.setAutoCommit(false)
		      INSERT 
		      UPDATE 
		      INSERT   
		      INSERT   
	     }catch(Exception e)
	     {
		       ROLLBACK
	     }
	     ** COMMIT ���� 
		=> INSERT / UPDATE / DELETE => ����Ŭ ������ ������ �Ǵ� ����
		=> COMMIT�� ������ �Ǹ� ROLLBACK�� ����� �� ����
		=> �ڵ� 
		      CREATE / DROP / ALTER / TRUNCATE 
	    ** ROLLBACK ����
		=> ����  : SAVEPOINT (Ư�� ������ ����) => �κ� ROLLBACK 

*/
/*
CREATE TABLE emp_tr 
AS
  SELECT empno,ename,job,sal,deptno
  FROM emp
  WHERE 1=2;
*/
/*
INSERT INTO emp_tr VALUES(100,'ȫ�浿','�븮',3500,10);
-- ���� �޸� ����� ���°� �ƴϴ� 
SELECT * FROM emp_tr;
*/
-- ROLLBACK;
/*
INSERT INTO emp_tr VALUES(101,'�ڹ���','����',4000,20);
SAVEPOINT sp1;
INSERT INTO emp_tr VALUES(101,'��û��','����',6000,30);
ROLLBACK TO sp1;
COMMIT;
*/
/*
INSERT INTO emp_tr VALUES(102,'��û��','����',6000,30);
COMMIT;

UPDATE emp_tr SET sal=sal+100 WHERE deptno=10;
SAVEPOINT sp1;
UPDATE emp_tr SET sal=sal+200 WHERE deptno=20;
SAVEPOINT sp2;
UPDATE emp_tr SET sal=sal+300 WHERE deptno=30;
ROLLBACK TO sp2;
COMMIT;
/*
/*
   COMMIT   => �������� ���� 
   ROLLBACK => ��� (��ɾ� ��� => INSERT / UPDATE / DELETE)
   SAVEPOINT => �����ġ => ROLLBACK TO savepoint��  

   =>  ������  => �޼ҵ� ���� @Transactional => AOP
*/
-- �亯�� �Խ��� 
-- ���̺� ���� 
/*
					     no  group   step   tab
	  AAAAAA			      1	      1		0	0
	    => BBBBBB		      2	      1		1	1
	     =>CCCCCCC		      3	      1		2	2
	    =>KKKKKK		      5      1		3	1
	  DDDDDD			      4	      2		0	0
*/






