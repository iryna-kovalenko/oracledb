REM   Script: Capital Gain/Loss
REM   Write an SQL query to report the Capital gain/loss for each stock.

The Capital gain/loss of a stock is the total gain or loss after buying and selling the stock one or many times.

Return the result table in any order.

The query result format is in the following example.

Create Table Stocks (stock_name varchar(15), operation ENUM('Sell', 'Buy'), operation_day int, price int);

insert into Stocks (stock_name, operation, operation_day, price) values ('Leetcode', 'Buy', '1', '1000');

insert into Stocks (stock_name, operation, operation_day, price) values ('Corona Masks', 'Buy', '2', '10');

insert into Stocks (stock_name, operation, operation_day, price) values ('Leetcode', 'Sell', '5', '9000');

insert into Stocks (stock_name, operation, operation_day, price) values ('Handbags', 'Buy', '17', '30000');

insert into Stocks (stock_name, operation, operation_day, price) values ('Corona Masks', 'Sell', '3', '1010');

insert into Stocks (stock_name, operation, operation_day, price) values ('Corona Masks', 'Buy', '4', '1000');

insert into Stocks (stock_name, operation, operation_day, price) values ('Corona Masks', 'Sell', '5', '500');

insert into Stocks (stock_name, operation, operation_day, price) values ('Corona Masks', 'Buy', '6', '1000');

insert into Stocks (stock_name, operation, operation_day, price) values ('Handbags', 'Sell', '29', '7000');

insert into Stocks (stock_name, operation, operation_day, price) values ('Corona Masks', 'Sell', '10', '10000');

Create Table Stocks (stock_name varchar(15), operation varchar2(10), operation_day int, price int);

insert into Stocks (stock_name, operation, operation_day, price) values ('Leetcode', 'Buy', '1', '1000');

insert into Stocks (stock_name, operation, operation_day, price) values ('Corona Masks', 'Buy', '2', '10');

insert into Stocks (stock_name, operation, operation_day, price) values ('Leetcode', 'Sell', '5', '9000');

insert into Stocks (stock_name, operation, operation_day, price) values ('Handbags', 'Buy', '17', '30000');

insert into Stocks (stock_name, operation, operation_day, price) values ('Corona Masks', 'Sell', '3', '1010');

insert into Stocks (stock_name, operation, operation_day, price) values ('Corona Masks', 'Buy', '4', '1000');

insert into Stocks (stock_name, operation, operation_day, price) values ('Corona Masks', 'Sell', '5', '500');

insert into Stocks (stock_name, operation, operation_day, price) values ('Corona Masks', 'Buy', '6', '1000');

insert into Stocks (stock_name, operation, operation_day, price) values ('Handbags', 'Sell', '29', '7000');

insert into Stocks (stock_name, operation, operation_day, price) values ('Corona Masks', 'Sell', '10', '10000');

with ss as (select STOCK_NAME,operation,sum(price) sum_pr 
    from Stocks 
    group by stock_name,OPERATION 
    order by stock_name) 
     
select STOCK_NAME, sell - buy as capital_gain_loss 
from( 
select STOCK_NAME, 
sum(decode(OPERATION,'Buy',sum_pr,0)) as buy, 
sum(decode(OPERATION,'Sell',sum_pr,0)) as sell 
from ss 
group by STOCK_NAME)


