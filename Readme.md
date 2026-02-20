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
| 2026-02-14 | 936,389 |
| 2026-02-15 | 948,436 |
| 2026-02-16 | 939,181 |
| 2026-02-17 | 940,895 |
| 2026-02-18 | 948,011 |
| 2026-02-19 | 944,836 |
| 2026-02-20 | 766,022 |
(7 rows)
Time: 2113.326 ms (00:02.113)

#### Вывод с EXPLAIN (ANALYZE)
```SQL
JIT:
  Functions: 54
  Options: Inlining false, Optimization false, Expressions true, Deforming true
  Timing: Generation 2.027 ms, Inlining 0.000 ms, Optimization 1.181 ms, Emission 38.987 ms, Total 42.195 ms
 Execution Time: 2660.425 ms
```

---------------------------
### Создание индекса
```SQL
CREATE INDEX idx_order_product_order_id ON order_product(order_id);
CREATE INDEX idx_orders_status_date_created ON orders(status, date_created);

```

 date_created |  sum
|------|---------:|
| 2026-02-14 | 936,389 |
| 2026-02-15 | 948,436 |
| 2026-02-16 | 939,181 |
| 2026-02-17 | 940,895 |
| 2026-02-18 | 948,011 |
| 2026-02-19 | 944,836 |
| 2026-02-20 | 766,022 |
 (7 rows)
Time: 1326.152 ms (00:01.326)

#### Вывод с EXPLAIN (ANALYZE) с использованием индекса
```SQL
 JIT:
   Functions: 57
   Options: Inlining false, Optimization false, Expressions true, Deforming true
   Timing: Generation 3.701 ms, Inlining 0.000 ms, Optimization 1.064 ms, Emission 48.293 ms, Total 53.058 ms
 Execution Time: 1664.523 ms
```

## Выводы  
- Время сократилось с 2660 ms до 1664 ms 
