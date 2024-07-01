-- таблица в слое текущих данных:
CREATE TABLE currently.office_shk_info
(
    office_id      UInt32,
    qty_all_shk    UInt32,
    dt_date        Date,
    is_returning   UInt8
)
ENGINE = MergeTree() ORDER BY office_id;


-- матереализованное представление для перемещения данных из stg слоя в слой текущих данных:
CREATE MATERIALIZED VIEW stg.office_shk_info_currently TO currently.office_shk_info AS 
SELECT office_id
    , qty_all_shk
    , dt_date
    , is_returning
FROM stg.office_shk_info;