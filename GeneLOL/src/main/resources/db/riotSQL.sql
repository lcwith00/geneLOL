create table game(
	gameno number primary key,
	gameid number not null unique,
	id number,
	gamemode varchar2(100) not null,
	gametype varchar2(100) not null,
	"subtype" varchar2(100) not null,
	spell1 number not null,
	spell2 number not null,
	mapid number not null,
	teamid number not null,
	championid number not null,
	"level" number not null,
	ipearned number not null,
	createdate number not null,
	constraint "summonerid" foreign key (id) references summoner(id)
);

create table fellowplayer(
	fellowplayerid number primary key,
	gameid number,
	summonerid number not null,
	teamid number not null,
	championid number not null,
	constraint "gameid_player" foreign key (gameid) references game(gameid)
);

create table stats(
	statsid number primary key,
	gameid number,
	"level" number not null,
    goldearned number not null,
    numDeaths number not null,
    turretsKilled number not null,
    minionsKilled number not null,
    championsKilled number not null,
    goldSpent number not null,
    totalDamageDealt number not null,
    totalDamageTaken number not null,
    killingSprees number not null,
    largestKillingSpree number not null,
    team number not null,
    win number not null,
    neutralMinionsKilled number not null,
    largestMultiKill number not null,
    physicalDamageDealtPlayer number not null,
    magicDamageDealtPlayer number not null,
    physicalDamageTaken number not null,
    magicDamageTaken number not null,
    timePlayed number not null,
    totalHeal number not null,
    totalUnitsHealed number not null,
    assists number not null,
    item0 number,
    item1 number,
    item2 number,
    item3 number,
    item4 number,
    item5 number,
    item6 number,
    magicDamageDealtToChampions number not null,
    physicalDamageDealtToChampions number not null,
    totalDamageDealtToChampions number not null,
    trueDamageDealtPlayer number not null,
    trueDamageDealtToChampions number not null,
    trueDamageTaken number not null,
    wardPlaced number not null,
    KilledEnemyJungle number not null,
    KilledYourJungle number not null,
    totalTimeCrowdControlDealt number not null,
    playerRole number not null,
    playerPosition number not null,
    bountyLevel number not null,
    totalDamageDealtToBuildings number not null,
    constraint "gameid_stats" foreign key (gameid) references game(gameid)
);

create table champion(
	id number primary key,
	key varchar2(100) not null,
	name varchar2(100) not null,
	title varchar2(200) not null
);

create sequence game_seq
increment by 1
start with 1;

create sequence fellowplayer_seq
increment by 1
start with 1;

create sequence stats_seq
increment by 1
start with 1;

create table summoner(
	id number primary key,
	name varchar2(100) not null unique,
	profileiconid number,
	revisiondate number,
	summonerlevel number
);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(2718069, '초록나르', 595, 30, 1476560788000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(1981140, '151230', 1114, 30, 1476558519000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(3164750, '정상인좀', 1375, 30, 1476558519000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(13020859, 'Where is my E', 1298, 30, 1476642640000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(13342912, '고졸경찰', 907, 30, 1476638398000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(20220834, '몸짱호빵', 910, 30, 1476608870000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(28762291, 'li xiang', 1374, 30, 1476643289000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(22050528, 'Gaeneon', 1053, 30, 1476558519000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(1701098, '착한마음바른생각', 717, 30, 1476638398000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(3849638, '장애의 혼', 1105, 30, 1476635407000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(7951768, '서영국씨', 502, 30, 1476557799000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(4080941, '양키닭', 508, 30, 1476557799000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(3673641, '슈프림유저', 1301, 30, 1476632191000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(1724643, '못하면 입닥쳐', 1298, 30, 1476640310000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(4513747, '서영국님', 508, 30, 1476557799000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(10524404, 'AV 이따이', 1375, 30, 1476639643000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(14032187, '방구대장뿌지직', 984, 30, 1476639643000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(3457806, '모부기I', 984, 30, 1476640129000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(2745679, '앞으로도', 22, 30, 1476622373000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(4771624, '신안뻘전복', 1301, 30, 1476639643000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(23061329, '행동주의', 1112, 30, 1476639643000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(1311514, '깡충껑충', 1160, 30, 1476624475000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(6705171, '1함대', 661, 30, 1476626346000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(5844100, '바이오딘', 1155, 30, 1476550320000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(2571748, '멘붕교사제', 1301, 30, 1476628475000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(23530718, '트롤왕김벌래', 1375, 30, 1476557367000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(3322122, '멘붕교게이', 713, 30, 1476552683000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(14740124, '하복이엄마', 1301, 30, 1476634552000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(18440506, '삐 건', 935, 30, 1476554300000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(31925442, '가온도담', 1232, 30, 1476657519000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(28642376, '벡승훈님', 780, 30, 1476612302000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(3641955, 'ililiIiliilIlil', 23, 30, 1476629644000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(3170949, 'ReaDyOn', 1382, 30, 1476615281000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(1647442,'오민자',673,30,1476554727000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(10949060,'기리랄',606,30,1476627409000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(10385670,'픽스선픽',577,30,1476554727000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(5034322,'댕까이2',749,30,1476554727000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(14220141,'세무서징베',685,30,1476644876000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(30471148,'BurNisH7',1376,30,1476626740000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(7341011,'LeSsTT',984,30,1476627376000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(10010759,'Harley Clown',1301,30,1476627376000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(5581304,'팡이삐쥔',1377,30,1476627376000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(9668265,'강냉이11',1301,30,1476627376000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(29740180,'서곶동에이스',6,30,1476628572000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(17060671,'햇님이진주',1123,30,1476679705000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(3932858,'불꽃남자 낌세',1301,30,1476451743000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(2007219,'전자기 갓기채',22,30,1476520201000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(3257136,'원딜ADC',1301,30,1476635109000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(17584173,'엄사스케',1161,30,1476534954000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(7283422,'뭐없나',1301,30,1476617696000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(8382430,'서정민입니다',1377,30,1476433913000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(4615741,'EigenStyle',1301,30,1476520201000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(2486170,'plgh',1382,30,1476635109000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(20661520,'Talzuking',1211,30,1476777937000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(9256196,'덕덕형',781,30,1476778976000);;
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(17910224,'o똥꼬충o',552,30,1476783915000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(11081462,'돌 은 성',870,30,1476777937000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(1608804,'정일고기보쌈',1229,30,1476777937000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(5608434,'촌티팍팍',1301,30,1476793607000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(1486962,'Fear Me',1158,30,1476778503000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(8837796,'매떼매떼쿠다사이',1123,30,1476780407000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(2908241,'saojxzlf',1051,30,1476770478000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(10529249,'주월도로',774,30,1476774776000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(2445383,'초심으로 2016',982,30,1476770478000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(32001161,'할매유',1123,30,1476770478000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(3447857,'지금너에게로가',1301,30,1476770478000);
insert into summoner(id,name,profileiconid,summonerlevel,revisiondate) values(10385670,'픽스선픽',577,30,1476811302000);

