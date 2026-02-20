# dbops-project

## Выполненные команды
### Создание БД
```SQL
CREATE DATABASE store;
CREATE USER store_user WITH PASSWORD 'storeuser';
GRANT ALL PRIVILEGES ON DATABASE store TO store_user;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO store_user;
```

--------------------------- 
### Проданные сосиски за каждый день пред.недели
```SQL
  SELECT o.date_created, SUM(op.quantity)
  FROM orders AS o
  JOIN order_product AS op ON o.id = op.order_id
  WHERE o.status = 'shipped' AND o.date_created > NOW() - INTERVAL '7 DAY'
  GROUP BY o.date_created; 
```

 date_created |  sum
|------|---------:|
| 14.02.2026 | 936,389 |
| 15.02.2026 | 948,436 |
| 16.02.2026 | 939,181 |
| 17.02.2026 | 940,895 |
| 18.02.2026 | 948,011 |
| 19.02.2026 | 944,836 |
| 20.02.2026 | 766,022 |
(7 rows)
Time: 24102.303 ms (00:24.102)

