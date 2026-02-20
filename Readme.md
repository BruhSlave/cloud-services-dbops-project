# dbops-project

## Выполненные команды
### Создание БД
- CREATE DATABASE store;
- CREATE USER store_user WITH PASSWORD 'storeuser';
- GRANT ALL PRIVILEGES ON DATABASE store TO store_user;
- GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO store_user;

--------------------------- 
### Проданные сосиски за каждый день пред.недели
- SELECT o.date_created, SUM(op.quantity)
  FROM orders AS o
  JOIN order_product AS op ON o.id = op.order_id
  WHERE o.status = 'shipped' AND o.date_created > NOW() - INTERVAL '7 DAY'
  GROUP BY o.date_created; 

 date_created |  sum
--------------+--------
 2026-02-14   | 936389
 2026-02-15   | 948436
 2026-02-16   | 939181
 2026-02-17   | 940895
 2026-02-18   | 948011
 2026-02-19   | 944836
 2026-02-20   | 766022
(7 rows)

Time: 24102.303 ms (00:24.102)

