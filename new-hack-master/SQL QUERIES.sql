Create table BOT_users 
(id int PRIMARY KEY NOT NULL AUTO_INCREMENT
,id_in_BOT int 
,name VARCHAR(255) 
,first_use_time datetime default NOW()
);



Create table BOT_crpt_oper
(id_crpt_oper int PRIMARY KEY NOT NULL AUTO_INCREMENT
,name_crpt VARCHAR(255) 
,cur_value_crpt float
,time_crpt_oper datetime default NOW()
,user_id_in_BOT int
);


Create table BOT_crpt_oper_and_users_history 
(id_h int  PRIMARY KEY NOT NULL AUTO_INCREMENT
,user_id int
,oper_id int
,CONSTRAINT FK_USER_IDh FOREIGN KEY  (user_id) references BOT_users (id)
,CONSTRAINT FK_OPER_IDh FOREIGN KEY  (oper_id) references BOT_crpt_oper (id_crpt_oper)
);


Create table BOT_crpt_all
(id_crpt int PRIMARY KEY NOT NULL AUTO_INCREMENT
,name_crpt VARCHAR(255) 
);


Create table BOT_crpt_stat
(id_crpt int PRIMARY KEY NOT NULL AUTO_INCREMENT
,name_crpt VARCHAR(255) 
,fullname_crpt VARCHAR(255)
,max_value_crpt float
,min_value_crpt float
,avg_value_crpt float
,count_crpt float
,last_update_time datetime default NOW()
);




DELIMITER $$

CREATE
	TRIGGER `After_insert_crpt_oper` after INSERT 
	ON `BOT_crpt_oper` 
	FOR EACH ROW BEGIN
    insert into BOT_crpt_oper_and_users_history   (user_id ,oper_id) values ((select id from BOT_users where id_in_BOT= NEW.user_id_in_BOT),NEW.id_crpt_oper)
		;
		
    END$$
 
DELIMITER ;


DELIMITER $$
CREATE TRIGGER CHECK_CRPT
AFTER INSERT  
ON BOT_crpt_oper 
FOR EACH ROW  
BEGIN  
IF (NEW.name_crpt in (select name_crpt from BOT_crpt_all) and
NEW.name_crpt not in (select name_crpt from BOT_crpt_stat)  )  
THEN  
INSERT INTO BOT_crpt_stat (name_crpt) VALUES (NEW.name_crpt);
END IF;  

    END$$
 
DELIMITER ;



DELIMITER $$
CREATE
	TRIGGER `Stat_for_crpt` after INSERT 
	ON `BOT_crpt_oper` 
	FOR EACH ROW BEGIN
  Update BOT_crpt_stat set max_value_crpt= (select max(cur_value_crpt) from BOT_crpt_oper where name_crpt=NEW.name_crpt) where name_crpt=NEW.name_crpt;
  Update BOT_crpt_stat set min_value_crpt= (select min(cur_value_crpt) from BOT_crpt_oper where name_crpt=NEW.name_crpt)where name_crpt=NEW.name_crpt;
  Update BOT_crpt_stat set avg_value_crpt= (select avg(cur_value_crpt) from BOT_crpt_oper where name_crpt=NEW.name_crpt)where name_crpt=NEW.name_crpt;
  Update BOT_crpt_stat set count_crpt= (select count(cur_value_crpt) from BOT_crpt_oper where name_crpt=NEW.name_crpt)where name_crpt=NEW.name_crpt;
  Update BOT_crpt_stat set last_update_time= (NOW())where name_crpt=NEW.name_crpt;
  END$$
 
DELIMITER ;



select u.name as 'Имя пользователя'
,o.name_crpt as 'Название криптовалюты'
,o.cur_value_crpt as 'Актуальное значение'
,o.time_crpt_oper as 'Дата'
from BOT_crpt_oper_and_users_history h 
join BOT_users u on u.id=h.user_id 
join BOT_crpt_oper o on o.id_crpt_oper=h.oper_id 


select name_crpt as 'Название криптовалюты'
,max_value_crpt as 'Максимальное значение криптовалюты'
,min_value_crpt as 'Минимальное значение криптовалюты'
,avg_value_crpt as 'Среднее значение криптовалюты'
,count_crpt as 'Количество запросов'
,last_update_time as 'Дата последнего обновления данных'
from BOT_crpt_stat

















insert into BOT_users (id_in_BOT,name) values(12,'Anna');
insert into BOT_users (id_in_BOT,name) values(13,'Ivan');
insert into BOT_users (id_in_BOT,name) values(14,'Denis');
insert into BOT_users (id_in_BOT,name) values(15,'Alex');
insert into BOT_crpt_oper (name_crpt,cur_value_crpt,user_id_in_BOT) values('BTS',1600.16932625946,12);
insert into BOT_crpt_oper (name_crpt,cur_value_crpt,user_id_in_BOT) values('ETH',1500.16932625946,12);
insert into BOT_crpt_oper (name_crpt,cur_value_crpt,user_id_in_BOT) values('BTS',1300.16932625946,12);
insert into BOT_crpt_oper (name_crpt,cur_value_crpt,user_id_in_BOT) values('BTS',1600.16932625946,13);
insert into BOT_crpt_oper (name_crpt,cur_value_crpt,user_id_in_BOT) values('ETH',1600.16932625946,13);
insert into BOT_crpt_oper (name_crpt,cur_value_crpt,user_id_in_BOT) values('BTS',1300.16932625946,13);
insert into BOT_crpt_oper (name_crpt,cur_value_crpt,user_id_in_BOT) values('BTS',1600.16932625946,14);
insert into BOT_crpt_oper (name_crpt,cur_value_crpt,user_id_in_BOT) values('ETH',1700.16932625946,14);
insert into BOT_crpt_oper (name_crpt,cur_value_crpt,user_id_in_BOT) values('BTS',1300.16932625946,14);
insert into BOT_crpt_oper (name_crpt,cur_value_crpt,user_id_in_BOT) values('BTS',6800.16932625946,15);
insert into BOT_crpt_oper (name_crpt,cur_value_crpt,user_id_in_BOT) values('ETH',1800.16932625946,15);
insert into BOT_crpt_oper (name_crpt,cur_value_crpt,user_id_in_BOT) values('BTS',1200.16932625946,15);

insert into BOT_crpt_all (name_crpt) values ('BTC'),('ETH'),('USDT'),('BNB'),('ADA'),('DOGE'),('XRP'),('USDC'),('DOT'),('UNI'),('BUSD'),('BCH'),('SOL'),('LTC'),('LINK'),('MATIC'),('WBTC'),('ICP'),('ETC'),('THETA'),('XLM'),('VET'),('DAI'),('FIL'),('TRX'),('EOS'),('XMR'),('SHIB'),('AAVE'),('CRO'),('BSV'),('ALGO'),('FTT'),('MKR'),('CAKE'),('ATOM'),('NEO'),('XTZ'),('KLAY'),('BTCB'),('AMP'),('LUNA'),('MIOTA'),('LEO'),('TFUEL'),('COMP'),('AVAX'),('GRT'),('UST'),('DCR'),('HT'),('BTT'),('KSM'),('HBAR'),('WAVES'),('EGLD'),('CEL'),('TUSD'),('RUNE'),('ZEC'),('CHZ'),('DASH'),('XDC'),('TEL'),('XEM'),('YFI'),('HNT'),('HOT'),('QNT'),('ENJ'),('SUSHI'),('STX'),('MANA'),('ZIL'),('NEAR'),('CELO'),('PAX'),('BAT'),('MDX'),('SNX'),('NEXO'),('BTG'),('ZEN'),('BNT'),('QTUM'),('REV'),('ONE'),('CRV'),('NANO'),('DGB'),('SC'),('OMG'),('OKB'),('ONT'),('CHSB'),('FTM'),('ZRX'),('KCS'),('HUSD'),('UMA'),('ICX'),('ANKR'),('VGX'),('RVN'),('BAKE'),('FLOW'),('1INCH'),('IOST'),('USDN'),('BCD'),('XVG'),('LPT'),('RENBTC'),('REN'),('AR'),('WRX'),('LSK'),('CKB'),('KNC'),('RSR'),('LRC'),('MAID'),('KAVA'),('WIN'),('GLM'),('GNO'),('OCEAN'),('BTMX'),('GT'),('WOO'),('GUSD'),('VTHO'),('SNT'),('MINA'),('STORJ'),('DENT'),('ERG'),('RLC'),('STRAX'),('SKL'),('BTCST'),('OGN'),('STMX'),('PROM'),('FET'),('ONG'),('CFX'),('BAND'),('IOTX'),('XVS'),('UQC'),('INJ'),('WAXP'),('REEF'),('SAND'),('UBT'),('OXT'),('SXP'),('REP'),('FUN'),('EWT'),('MCO'),('SRM'),('ARDR'),('CTSI'),('ZKS'),('CVC'),('AGIX'),('NMR'),('ORBS'),('NU'),('CELR'),('BAL'),('PHA'),('ABBC'),('NKN'),('STEEM'),('TOMO'),('ANT'),('HIVE'),('META'),('ZB'),('MLN'),('UOS'),('MED'),('BTS'),('AMPL'),('ALPHA'),('STRK'),('DAG'),('HXRO'),('ARK'),('FX'),('POLY'),('JST'),('MTL'),('PPT'),('RIF'),('WAN'),('IQ')

















