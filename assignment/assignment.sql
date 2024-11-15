---                                          RITT JAN                                            ---

-- 1.) Folgende Abfragen sollen beschleunigt werden.
--       Erstellen Sie - für jede Abfrage einzeln betrachtet - einen oder mehrere Index/izes, 
--       so dass jede Abfrage für sich bestmöglich abgearbeitet werden kann.

  -- a) SELECT * FROM emp WHERE ENAME=:some_name;

  -- b) SELECT * FROM emp WHERE job=:sel_job AND sal > :min_sal ORDER BY hiredate DESC; 

  -- c) SELECT * FROM emp WHERE (ROUND(sal/1000)*1000) = 2000; ( alle Mitarbeiter, deren Verdienst auf ganze Tausender gerundet 2000 beträgt )



---

-- 2.) Welche Zugriffsarten werden für folgende Queries verwendet und begründen Sie.
--       Gehen Sie davon aus, dass die abgefragten Tabellen eine große Zahl von Zeilen enthalten 
--       und dass die gegebenen Indexe nur für den jeweiligen Unterpunkt der Aufgabe existieren.
--       ( DDL/DML zu Tabelle inventories siehe DataWarehouse.zip )

  -- a)
    -- SELECT COUNT(*) FROM table; 
      -- i)   ohne Primary-Key, ohne Index

      -- ii)  ohne Primary-Key, irgendeinem beliebigen Index

      -- iii) ohne Primary-Key, irgendeinem beliebigen NOT NULL Index

      -- iv)  mit Primary Key


  -- b)
    -- CREATE INDEX inventories_product_idx ON inventories(product_id);

    -- SELECT SUM(quantity) FROM inventories WHERE product_id = 210;


  -- c)
    -- CREATE INDEX inventories_quantity_idx ON inventories(quantity);

    -- CREATE INDEX inventories_product_idx ON inventories(product_id);

    -- SELECT SUM(quantity) FROM inventories WHERE product_id = 210;


  -- d)
    -- CREATE INDEX inventories_prod_quant_idx ON inventories(product_id, quantity);

    -- SELECT SUM(quantity) FROM inventories WHERE product_id = 210;


  -- e)
    -- CREATE INDEX inventories_quant_prod_idx ON inventories(warehouse_id, product_id);

    -- SELECT COUNT(product_id) FROM inventories WHERE product_id = 210;



---

-- 3.) Welcher Komplexitätsklasse gehörden folgende Operationen an:
  -- a) SELECT * FROM emp WHERE sal > 1000; (ohne index)

  -- b) SELECT ename FROM emp ORDER BY ename; (kein Index)

  -- c) SELECT e.ename, e.sal, (SELECT COUNT(*) FROM emp e2 WHERE e2.sal < e.sal) FROM emp e; (ohne index auf sal)

  -- d) SELECT e.ename, e.sal, (SELECT COUNT(*) FROM emp e2 WHERE e2.sal < e.sal) FROM emp e; (mit index auf sal)
  
---  