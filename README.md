[En progreso]
# Análisis de valor de cliente - ECommerce Olist
Olist es una empresa brasileña dedicada al comercio eléctronico (e-comerce)

El objetivo de este proyecto es determinar que segmentos de clientes generan mayor valor económico usando análisis RFM

El dataset usado proviene de [Brazilian E-Commerce Public Dataset by Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce/data), fue usada la versión del 1 de octubre de 2021, que tiene información sobre al rededor de 100k pedidos realizados entre 2016 y 2018.

## Planificación y ejecución

### Descripción del análisis RFM
El análisis RFM se basa en tres principios fundamentales:

- Recency: Buscar aquellos clientes que han comprado más recientemente
- Frecuency: Buscar aquellos clientes con más compras
- Monetary : Buscar aquellos clientes con más valor monetario en sus compras

### Recency
Usando la tabla `orders`
Se utiliza `order_purchase_timestamp`, porque representa el momento en que el cliente se compromete con la compra.
También debemos considerar `order_status`, para no tomar pedidos cancelados (`canceled`) o no disponibles (`unavailable `)

Para este proyecto, consideraremos como Recency la cantidad de días desde la última compra válida de un cliente.

La fecha más reciente de las órden válida encontrada ejecutando
```sql
SELECT * FROM orders
WHERE order_status not in ('canceled','unavailable')
ORDER BY order_purchase_timestamp DESC
LIMIT 1 
```
es 2018-09-03 09:06:57, por lo que consideraremos esta fecha de referencia: 2018/09/03

### Frequency
Se realiza un conteo en las órdenes válidas

### Monetary
Para este proyecto se considera el acumulado (Life time value o LTV) de cada cliente, y no el promedio como podría ser el caso en otros análisis
A su vez, no filtraremos los medios de pagos (salvo `not_defined`, pues los pagos de este tipo son 0), usaremos el GMV (Gross Merchandise Value), es decir el total vendido incluyendo cupones o vouchers, pero luego se hace un estudio con estos valores.


## Stack


Dataset actualizado el 1 de octubre de 2021