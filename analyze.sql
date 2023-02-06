'''
(1) Which brand saw the most dollars spent in the month of June?
BRAND_CODE = KIRKLAND SIGNATURE
'''
Select ri.BRAND_CODE, SUM(TOTAL_FINAL_PRICE)
From receipts r JOIN receipt_items ri ON r.ID=ri.REWARDS_RECEIPT_ID
WHERE MONTH(r.PURCHASE_DATE)=6
GROUP BY ri.BRAND_CODE
ORDER BY SUM(TOTAL_FINAL_PRICE) DESC
LIMIT 5;

'''
(2) Which user spent the most money in the month of August?
USER_ID = 609ab37f7a2e8f2f95ae968f
'''
Select USER_ID, SUM(TOTAL_SPENT)
From receipts
WHERE MONTH(PURCHASE_DATE)=8
GROUP BY USER_ID
ORDER BY SUM(TOTAL_SPENT) DESC
LIMIT 1;

'''
(3) What is the name of the most expensive item purchased?
DESCRIPTION = Starbucks Iced Coffee Premium Coffee Beverage Unsweetened Blonde Roast Bottle 48 Oz 1 Ct
'''

Select ri.DESCRIPTION
FROM receipt_items ri
WHERE ri.QUANTITY_PURCHASED is not null AND ri.TOTAL_FINAL_PRICE/ri.QUANTITY_PURCHASED=(
        Select MAX(TOTAL_FINAL_PRICE/QUANTITY_PURCHASED)
        FROM receipt_items
        WHERE QUANTITY_PURCHASED is not null
)

'''
(4) What user bought the most expensive item?
    USER_ID = 617376b8a9619d488190e0b6
'''

Select r.USER_ID, ri.DESCRIPTION
FROM receipt_items ri JOIN receipts r ON ri.REWARDS_RECEIPT_ID=r.ID 
WHERE ri.QUANTITY_PURCHASED is not null AND ri.TOTAL_FINAL_PRICE/ri.QUANTITY_PURCHASED=(
        Select MAX(TOTAL_FINAL_PRICE/QUANTITY_PURCHASED)
        FROM receipt_items
        WHERE QUANTITY_PURCHASED is not null
)

'''
(5) How many users scanned in each month?
+----------------------+--------------------------+
| MONTH(PURCHASE_DATE) | COUNT(DISTINCT(USER_ID)) |
+----------------------+--------------------------+
|                    0 |                       97 |
|                    1 |                       97 |
|                    2 |                       89 |
|                    3 |                       89 |
|                    4 |                       90 |
|                    5 |                       89 |
|                    6 |                       89 |
|                    7 |                       89 |
|                    8 |                       91 |
|                    9 |                       90 |
|                   10 |                       94 |
|                   11 |                       97 |
|                   12 |                       99 |
+----------------------+--------------------------+
'''
Select MONTH(PURCHASE_DATE), COUNT(DISTINCT(USER_ID))
FROM receipts
GROUP BY MONTH(PURCHASE_DATE)
ORDER BY MONTH(PURCHASE_DATE);


'''
Observation 1: The most money is spent in Walmart.
'''
Select STORE_NAME, SUM(TOTAL_SPENT)
FROM receipts
GROUP BY STORE_NAME
ORDER BY SUM(TOTAL_SPENT) DESC
LIMIT 10;

'''
Observation 2: There is no data for processed date for receipts.
'''
Select * from receipts where PROCESSED_DATE <> 0000-00-00;

'''
Observation 3: Total spent of December is about 3 times of February.
'''
Select MONTH(PURCHASE_DATE), SUM(TOTAL_SPENT)
FROM receipts
GROUP BY MONTH(PURCHASE_DATE)
ORDER BY SUM(TOTAL_SPENT) DESC;