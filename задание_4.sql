-- роль для чтения 
CREATE ROLE IF NOT EXISTS reading_role;
GRANT SELECT ON *.* TO reading_role;



-- роль с  возможностью создавать и заполнять данные в БД стейджинга(stg)
CREATE ROLE IF NOT EXISTS staging_role;
GRANT CREATE, INSERT ON stg.* TO staging_role;



-- Создать двух пользователей с такими правами по умолчанию
CREATE USER IF NOT EXISTS smith default ROLE reading_role identified WITH sha256_password BY 'smith123';
CREATE USER IF NOT EXISTS jones default ROLE staging_role identified WITH sha256_password BY 'jones123';