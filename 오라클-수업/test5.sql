-- ������ (��������) �ΰ��� ������ ���� ��쿡  AND , OR
-- AND => ���� , �ΰ��� ������ ���ÿ� true
-- ������ SALESMAN �̰� �޿��� 1500�̻��� ����� ��� ���� 
/*
SELECT *
FROM emp
WHERE job='SALESMAN' AND sal>=1500;
-- 81�⿡ �Ի��� ��� ����� ������ ��� 
SELECT * FROM EMP WHERE TO_CHAR(HIREDATE, 2) =81;

SELECT * FROM EMP WHERE HIREDATE >= '81/01/01' AND HIREDATE<='81/12/31';

SELECT * FROM EMP WHERE HIREDATE LIKE '81%';

SELECT * FROM EMP WHERE SUBSTR(HIREDATE,1,2)=81;
*/
-- OR => ���߿� �Ѱ��̻��� true�� ��� 
-- ������ MANAGER / CLERK�� ����� ��� ���� 
SELECT *
FROM emp
WHERE job='MANAGER' OR job='CLERK';
---------------------------------------------------------
-- ����Ŭ���� �����ϴ� ������ 
-- BETWEEN ~ AND : �Ⱓ ,���� = �ڹ� (����Ⱓ, üũ�αⰣ,������)
-- >= AND <= 
-- �޿��� 1000���� 3000������ ����� ��� ���� 
-- ���� / ��¥ 
SELECT *
FROM emp
WHERE sal BETWEEN 1000 AND 3000;
-- 80�⵵ �Ի��� ��� ����� ���� ���
SELECT * 
FROM emp 
WHERE hiredate BETWEEN '80/01/01' AND '80/12/31';

-- 5���� ���
SELECT empno,ename,job,hiredate,rownum
FROM emp
WHERE rownum BETWEEN 1 AND 5;

-- IN  => OR�� �������� ��쿡 ���
--deptno(�μ���ȣ) 10 20 30
SELECT *
FROM emp
WHERE deptno=10 OR deptno=20 OR deptno=30;

-- WHERE �÷��� IN(��...)
SELECT *
FROM emp
WHERE deptno IN(10,20,30);

-- ���� -> ���� ���� �˻� : <input type=checkbox>,��¥(���ڿ�)
-- KING , ADAMS , SCOTT , FORD , MARTIN
SELECT *
FROM emp
WHERE ename='KING' OR ename='ADAMS' OR ename='SCOTT'
	   OR ename='FORD' OR ename='MARTIN';
SELECT *
FROM emp
WHERE ename IN('KING' , 'ADAMS' , 'SCOTT' , 'FORD' , 'MARTIN');


-- NOT (����������)
-- job�� MANAGER , CLERK�� �ƴ� ����� ��� ���� 
SELECT *
FROM emp
WHERE NOT(job='MANAGER' OR job='CLERK');

--KING , ADAMS , SCOTT , FORD , MARTIN����� �ƴ� ��� ��� ����
SELECT *
FROM emp
WHERE ename NOT IN('KING' , 'ADAMS' , 'SCOTT' , 'FORD' , 'MARTIN');
-- 81�⿡ �Ի����� ���� ����� ��� ����
SELECT *
FROM emp
WHERE hiredate NOT BETWEEN '81/01/01' AND '81/12/31';
-- NOT IN , NOT BETWEEN , NOT LIKE
-- NULL => NULL ���� ���� ���� => ����ó���� �ȵȴ� 
-- ���� ó���� ���� ������ ���� => IS NULL, IS NOT NULL;
-- ���(mgr)�� ���� ����� ��� ���� ��� 
SELECT *
FROM emp
WHERE mgr IS NOT NULL;

/*
      LIKE ===> ��ȭ REGEXP_LIKE(ename,'[��-�R]')
	= % : ������ ������ �𸣴� ��� (���Ѿ���)
	= _ : �ѱ��� 

	=== �˻� 

	= ���۹��ڿ�  ==> ���ڿ�%	   IN%
	= ������ ���ڿ� ==> %���ڿ�  %EN
	= ���ԵǾ� �ִ� ���ڿ�  ==> %EN%
	= ���ڼ��� �˰� �ִ� _____  __T__ 
*/
/*
-- ����߿� A�ڷ� �����ϴ� ����� ��� ���� ��� 
SELECT *
FROM emp
WHERE ename LIKE 'A%';
-- ����߿� T�ڷ� ������ ����� ��� ���� ��� 
SELECT *
FROM emp
WHERE ename LIKE '%T';
-- ��� �̸��߿� IN�� �����ų� EN���� ������ ����� ��� ��� 
SELECT *
FROM emp
WHERE ename LIKE '%IN' OR ename LIKE '%EN';
-- ����̸��߿� O�� �����ϰ� �ִ� ����� ��� ���
SELECT *
FROM emp
WHERE ename LIKE '%O%';
-- �̸��߿� A�ڷ� ���� 5������ ����� ��� ���� ���
SELECT *
FROM emp
WHERE ename LIKE 'A____';

SELECT *
FROM emp
WHERE ename LIKE '__O__'; => SCOTT 


-- BOOK => �౸ 

SELECT *
FROM book
WHERE bookname LIKE '%�౸%';

-- name , type , => food 
SELECT name,type
FROM food
WHERE type LIKE '%�н�%';

SELECT * FROM FOOD WHERE ADDRESS LIKE '%����%';

-- emp : ����̸��߿� A , D , K , E , S
SELECT * FROM EMP WHERE LIKE ename IN('A' , 'D' , 'K' , 'E' , 'S');


SELECT * FROM EMP WHERE LIKE ename '%A%' || LIKE ename '%D%' || LIKE ename '%K%'
|| LIKE ename '%E%' || LIKE ename '%S%';
*/
SELECT *
FROM emp
WHERE REGEXP_LIKE(ename,'A|D|K|E|S');










