-- ¿¬»êÀÚ (³í¸®¿¬»êÀÚ) µÎ°³ÀÇ Á¶°ÇÀ» ºñ±³ÇÒ °æ¿ì¿¡  AND , OR
-- AND => Æ÷ÇÔ , µÎ°³ÀÇ Á¶°ÇÀÌ µ¿½Ã¿¡ true
-- Á÷À§°¡ SALESMAN ÀÌ°í ±Þ¿©°¡ 1500ÀÌ»óÀÎ »ç¿øÀÇ ¸ðµç Á¤º¸ 
/*
SELECT *
FROM emp
WHERE job='SALESMAN' AND sal>=1500;
-- 81³â¿¡ ÀÔ»çÇÑ ¸ðµç »ç¿øÀÇ Á¤º¸¸¦ Ãâ·Â 
SELECT * FROM EMP WHERE TO_CHAR(HIREDATE, 2) =81;

SELECT * FROM EMP WHERE HIREDATE >= '81/01/01' AND HIREDATE<='81/12/31';

SELECT * FROM EMP WHERE HIREDATE LIKE '81%';

SELECT * FROM EMP WHERE SUBSTR(HIREDATE,1,2)=81;
*/
-- OR => µÑÁß¿¡ ÇÑ°³ÀÌ»óÀÌ trueÀÏ °æ¿ì 
-- Á÷À§°¡ MANAGER / CLERKÀÎ »ç¿øÀÇ ¸ðµç Á¤º¸ 
SELECT *
FROM emp
WHERE job='MANAGER' OR job='CLERK';
---------------------------------------------------------
-- ¿À¶óÅ¬¿¡¼­ Á¦°øÇÏ´Â ¿¬»êÀÚ 
-- BETWEEN ~ AND : ±â°£ ,¹üÀ§ = ÀÚ¹Ù (¿¹¾à±â°£, Ã¼Å©ÀÎ±â°£,ÆäÀÌÁö)
-- >= AND <= 
-- ±Þ¿©°¡ 1000¿¡¼­ 3000»çÀÌÀÎ »ç¿øÀÇ ¸ðµç Á¤º¸ 
-- ¼ýÀÚ / ³¯Â¥ 
SELECT *
FROM emp
WHERE sal BETWEEN 1000 AND 3000;
-- 80³âµµ ÀÔ»çÇÑ ¸ðµç »ç¿øÀÇ Á¤º¸ Ãâ·Â
SELECT * 
FROM emp 
WHERE hiredate BETWEEN '80/01/01' AND '80/12/31';

-- 5°³¸¸ Ãâ·Â
SELECT empno,ename,job,hiredate,rownum
FROM emp
WHERE rownum BETWEEN 1 AND 5;

-- IN  => OR°¡ ¿©·¯°³ÀÎ °æ¿ì¿¡ »ç¿ë
--deptno(ºÎ¼­¹øÈ£) 10 20 30
SELECT *
FROM emp
WHERE deptno=10 OR deptno=20 OR deptno=30;

-- WHERE ÄÃ·³¸í IN(°ª...)
SELECT *
FROM emp
WHERE deptno IN(10,20,30);

-- ¹®ÀÚ -> ´ÙÁß Á¶°Ç °Ë»ö : <input type=checkbox>,³¯Â¥(¹®ÀÚ¿­)
-- KING , ADAMS , SCOTT , FORD , MARTIN
SELECT *
FROM emp
WHERE ename='KING' OR ename='ADAMS' OR ename='SCOTT'
	   OR ename='FORD' OR ename='MARTIN';
SELECT *
FROM emp
WHERE ename IN('KING' , 'ADAMS' , 'SCOTT' , 'FORD' , 'MARTIN');


-- NOT (ºÎÁ¤¿¬»êÀÚ)
-- jobÀÌ MANAGER , CLERKÀÌ ¾Æ´Ñ »ç¿øÀÇ ¸ðµç Á¤º¸ 
SELECT *
FROM emp
WHERE NOT(job='MANAGER' OR job='CLERK');

--KING , ADAMS , SCOTT , FORD , MARTIN»ç¿øÀÌ ¾Æ´Ñ ¸ðµç »ç¿ø Á¤º¸
SELECT *
FROM emp
WHERE ename NOT IN('KING' , 'ADAMS' , 'SCOTT' , 'FORD' , 'MARTIN');
-- 81³â¿¡ ÀÔ»çÇÏÁö ¾ÊÀº »ç¿øÀÇ ¸ðµç Á¤º¸
SELECT *
FROM emp
WHERE hiredate NOT BETWEEN '81/01/01' AND '81/12/31';
-- NOT IN , NOT BETWEEN , NOT LIKE
-- NULL => NULL °ªÀÌ ¾ø´Â »óÅÂ => ¿¬»êÃ³¸®°¡ ¾ÈµÈ´Ù 
-- ¿¬»ê Ã³¸®¸¦ À§ÇÑ ¿¬»êÀÚ Á¦°ø => IS NULL, IS NOT NULL;
-- »ç¼ö(mgr)°¡ ¾ø´Â »ç¿øÀÇ ¸ðµç Á¤º¸ Ãâ·Â 
SELECT *
FROM emp
WHERE mgr IS NOT NULL;

/*
      LIKE ===> ÁøÈ­ REGEXP_LIKE(ename,'[°¡-ÆR]')
	= % : ¹®ÀÚÀÇ °¹¼ö¸¦ ¸ð¸£´Â °æ¿ì (Á¦ÇÑ¾ø´Ù)
	= _ : ÇÑ±ÛÀÚ 

	=== °Ë»ö 

	= ½ÃÀÛ¹®ÀÚ¿­  ==> ¹®ÀÚ¿­%	   IN%
	= ³¡³ª´Â ¹®ÀÚ¿­ ==> %¹®ÀÚ¿­  %EN
	= Æ÷ÇÔµÇ¾î ÀÖ´Â ¹®ÀÚ¿­  ==> %EN%
	= ±ÛÀÚ¼ö¸¦ ¾Ë°í ÀÖ´Ù _____  __T__ 
*/
/*
-- »ç¿øÁß¿¡ AÀÚ·Î ½ÃÀÛÇÏ´Â »ç¿øÀÇ ¸ðµç Á¤º¸ Ãâ·Â 
SELECT *
FROM emp
WHERE ename LIKE 'A%';
-- »ç¿øÁß¿¡ TÀÚ·Î ³¡³ª´Â »ç¿øÀÇ ¸ðµç Á¤º¸ Ãâ·Â 
SELECT *
FROM emp
WHERE ename LIKE '%T';
-- »ç¿ø ÀÌ¸§Áß¿¡ IN·Î ³¡³ª°Å³ª ENÀ¸·Î ³¡³ª´Â »ç¿øÀÇ ¸ðµç Ãâ·Â 
SELECT *
FROM emp
WHERE ename LIKE '%IN' OR ename LIKE '%EN';
-- »ç¿øÀÌ¸§Áß¿¡ O¸¦ Æ÷ÇÔÇÏ°í ÀÖ´Â »ç¿øÀÇ ¸ðµç Ãâ·Â
SELECT *
FROM emp
WHERE ename LIKE '%O%';
-- ÀÌ¸§Áß¿¡ AÀÚ·Î ½ÃÀÛ 5±ÛÀÚÀÎ »ç¿øÀÇ ¸ðµç Á¤º¸ Ãâ·Â
SELECT *
FROM emp
WHERE ename LIKE 'A____';

SELECT *
FROM emp
WHERE ename LIKE '__O__'; => SCOTT 


-- BOOK => Ãà±¸ 

SELECT *
FROM book
WHERE bookname LIKE '%Ãà±¸%';

-- name , type , => food 
SELECT name,type
FROM food
WHERE type LIKE '%ºÐ½Ä%';

SELECT * FROM FOOD WHERE ADDRESS LIKE '%¼­±³%';

-- emp : »ç¿øÀÌ¸§Áß¿¡ A , D , K , E , S
SELECT * FROM EMP WHERE LIKE ename IN('A' , 'D' , 'K' , 'E' , 'S');


SELECT * FROM EMP WHERE LIKE ename '%A%' || LIKE ename '%D%' || LIKE ename '%K%'
|| LIKE ename '%E%' || LIKE ename '%S%';
*/
SELECT *
FROM emp
WHERE REGEXP_LIKE(ename,'A|D|K|E|S');










