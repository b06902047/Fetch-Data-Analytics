CREATE TABLE brands (
    ID varchar(255),
    BARCODE varchar(255),
    BRAND_CODE varchar(255),
    CPG_ID varchar(255),
    CATEGORY varchar(255),
    CATEGORY_CODE varchar(255),
    NAME varchar(255),
    ROMANCE_TEXT text,
    RELATED_BRAND_IDS text,
    PRIMARY KEY (ID)
);


CREATE TABLE users (
    CREATED_DATE date,
    BIRTH_DATE date,
    GENDER varchar(255),
    LAST_REWARDS_LOGIN timestamp,
    STATE varchar(10),
    SIGN_UP_PLATFORM varchar(255),
    SIGN_UP_SOURCE varchar(255),
    ID varchar(255),
    PRIMARY KEY (ID)
);

CREATE TABLE receipts(
    ID varchar(255),
    STORE_NAME varchar(255),
    PURCHASE_DATE date,
    PURCHASE_TIME timestamp,
    DATE_SCANNED date,
    TOTAL_SPENT float,
    REWARDS_RECEIPT_STATUS varchar(255),
    USER_ID varchar(255),
    USER_VIEWED boolean,
    PURCHASED_ITEM_COUNT int,
    CREATE_DATE date,
    PENDING_DATE date,
    MODIFY_DATE date,
    FLAGGED_DATE date,
    PROCESSED_DATE date,
    FINISHED_DATE date,
    REJECTED_DATE date,
    NEEDS_FETCH_REVIEW boolean,
    DIGITAL_RECEIPT boolean,
    DELETED boolean,
    NON_POINT_EARNING_RECEIPT boolean,
    PRIMARY KEY (ID),
    FOREIGN KEY (USER_ID) REFERENCES users(ID)
);

CREATE TABLE receipt_items(
    REWARDS_RECEIPT_ID varchar(255),
    ITEM_INDEX int,
    REWARDS_RECEIPT_ITEM_ID varchar(255),
    DESCRIPTION text,
    BARCODE varchar(255),
    BRAND_CODE varchar(255),
    QUANTITY_PURCHASED float,
    TOTAL_FINAL_PRICE float,
    POINTS_EARNED float,
    REWARDS_GROUP varchar(255),
    ORIGINAL_RECEIPT_ITEM_TEXT text,
    MODIFY_DATE date,
    PRIMARY KEY (REWARDS_RECEIPT_ITEM_ID),
    FOREIGN KEY (REWARDS_RECEIPT_ID) REFERENCES receipts(ID)
);

'''
The below command is used to load csv file
'''
LOAD DATA LOCAL INFILE "/Users/chenyen/Desktop/receipt_items.csv"  
INTO TABLE receipt_items 
FIELDS TERMINATED BY ',' ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS;

