-- Databricks notebook source
-- MAGIC %md
-- MAGIC
-- MAGIC ## Delta Time Travel

-- COMMAND ----------

USE CATALOG company

-- COMMAND ----------

show tables

-- COMMAND ----------

DESCRIBE HISTORY company.unit.employees

-- COMMAND ----------

SELECT * 
FROM company.unit.employees VERSION AS OF 4

-- COMMAND ----------

SELECT * FROM company.unit.employees@v4

-- COMMAND ----------

DELETE FROM company.unit.employees

-- COMMAND ----------

SELECT * FROM company.unit.employees

-- COMMAND ----------

RESTORE TABLE company.unit.employees TO VERSION AS OF 5

-- COMMAND ----------

SELECT * FROM company.unit.employees

-- COMMAND ----------

DESCRIBE HISTORY company.unit.employees

-- COMMAND ----------

-- MAGIC %md
-- MAGIC
-- MAGIC ## OPTIMIZE Command

-- COMMAND ----------

DESCRIBE DETAIL company.unit.employees

-- COMMAND ----------

OPTIMIZE company.unit.employees
ZORDER BY id

-- COMMAND ----------

DESCRIBE DETAIL company.unit.employees

-- COMMAND ----------

DESCRIBE HISTORY company.unit.employees

-- COMMAND ----------

-- MAGIC %fs ls 'dbfs:/user/hive/warehouse/employees'

-- COMMAND ----------

-- MAGIC %md
-- MAGIC
-- MAGIC ## VACUUM Command

-- COMMAND ----------

VACUUM company.unit.employees

-- COMMAND ----------

-- MAGIC %fs ls 'dbfs:/user/hive/warehouse/employees'

-- COMMAND ----------

SET spark.databricks.delta.retentionDurationCheck.enabled = false;

-- COMMAND ----------

VACUUM company.unit.employees RETAIN 169 HOURS

-- COMMAND ----------

-- MAGIC %fs ls 'dbfs:/user/hive/warehouse/employees'

-- COMMAND ----------

SELECT * FROM company.unit.employees@v1

-- COMMAND ----------

-- MAGIC %md
-- MAGIC
-- MAGIC ## Dropping Tables

-- COMMAND ----------

DROP TABLE company.unit.employees

-- COMMAND ----------

SELECT * FROM company.unit.employees

-- COMMAND ----------

-- MAGIC %fs ls 'dbfs:/user/hive/warehouse/employees'
