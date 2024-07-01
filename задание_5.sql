-- создание таблицы на stg слое:
CREATE TABLE stg.office_shk_info
(
    office_id      UInt32,
    qty_all_shk    UInt32,
    dt_date        Date,
    is_returning   UInt8
)
ENGINE = MergeTree() ORDER BY office_id;



-- создание буферной таблицы:
CREATE TABLE direct_log.office_shk_info_buffer
(
    office_id      UInt32,
    qty_all_shk    UInt32,
    dt_date        Date,
    is_returning   UInt8
)
ENGINE = Buffer('stg', 'office_shk_info', 16, 10, 100, 10000, 100000, 10000000, 100000000);