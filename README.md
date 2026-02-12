**[En progreso]**

# Análisis de valor de cliente - ECommerce Olist
Olist es una empresa brasileña dedicada al comercio eléctronico (e-commerce)

El objetivo de este proyecto es determinar que segmentos de clientes generan mayor valor económico usando análisis RFM. A su vez, se compararán dos  formas de asignar los *scores*: Quintiles y asignación manual.

El dataset usado proviene de [Brazilian E-Commerce Public Dataset by Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce/data), fue usada la versión del 1 de octubre de 2021, que tiene información sobre alrededor de 100k pedidos realizados entre 2016 y 2018. En este enlace también pueden entender mejor la organización de los datos.


## Descripción del análisis RFM
El análisis RFM se basa en tres principios fundamentales:

- Recency: Días transcurridos desde la última compra
- Frecuency: Buscar aquellos clientes con más compras
- Monetary : Buscar aquellos clientes con más valor monetario en sus compras

### **Recency**:  
Para el caso de recency, se decidió tomar como fecha de referencia 2018/09/03, el día de la última compra válida realizada (`order_purchase_timestamp`) en las órdenes del dataset. Dado que el objetivo es analizar el comportamiento del cliente, se usó la fecha de **compra** de su orden (`order_purchase_timestamp`) en lugar de la fecha de entrega, pues la primera explica mejor el momento en el cual el cliente tuvo la intención de comprar. Entonces se tomó como valor de `recency` la cantidad de días desde la última compra **valida** (`order_status != canceled AND order_status != unavailable`) de un clíente hasta la fecha de referencia.

### **Frequency**:  
Para el caso de frequency, hay dos opciones principales: Frecuencia de consumo por un tiempo determinado (Ejm: Compras/Semana), o el total de veces que se ha comprado en total (frecuencia total acumulada). Para un negocio de EComerce, si se quiere tomar una frecuencia por tiempo determinado esta tendría que ser relativamente larga (Ejm: Compras/Semestre). Pero dado que el dataset solo cubre dos años aproximadamente (Desde mitad de 2016 hasta mitad de 2018), se tomó como valor de `frequency` la cantidad total de compras de un cliente **durante estos dos años**.

### **Monetary**: 
Para el caso de monetary, nuevamente también hay enfoques entre gasto por un tiempo determinado (Ejm: Gasto/Semana) o gasto total acumulado. Por los mismos motivos que se explicaron en `frequency`, se decidió tomar como valor de `monetary` el monto total pagado por un cliente.


## Notebooks
Ubicados en la carpeta `/notebooks`, contienen el análisis realizado, toma de decisiones y comparación de resultados.

- `notebooks/01_exploration.ipynb`: Aquí se realiza un análisis inicial de las tablas, buscando valores vacíos, incongruencias lógicas y en general verificando que los datos sean fiables.
- `notebooks/02_rfm-quintiles.ipynb`: Aquí se asignaron scores mediante uso de quintiles (salvo por *frequency*, explicado en el notebook), y se busca que tan coherentes son los datos.
- `notebooks/03_rfm_manual.ipynb`: Aquí se asignaron scores manualmente mediante rangos, buscando representar mejor el valor de cada cliente.

- `notebooks/04_clustering_segmentation.ipynb`: Aquí se aplicarán modelos de *machine learning* mediante la librería sklearn, para segmentar a los cliente. Es importante detallar que también se trabajará NLP (Procesamiento de lenguaje natural) para segmentar mediante mercados específicos.

## Instrucciones de uso
Descargar el dataset de la página oficial, y ejecutar los scripts en `sql/`.
Nota: Scripts probados en PostgreSQl

Importante: En `02_load_data.sql`, reemplazar `<DATA_PATH>` por la ruta donde se guardaron los archivos .csv del dataset.

Crear un archivo .env, y colocar (y completar) lo siguiente según tu base de datos:

```{.env}
DB_USER=
DB_PASSWORD=
DB_HOST=
DB_PORT=
DB_NAME=

```

Instalar librerías en el entorno virtual

```{bash}
pip install -r requirements.txt
```

Con esto ya se pueden ejecutar los notebooks.

Dataset actualizado el 1 de octubre de 2021