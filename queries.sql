-- Active: 1732907346681@@127.0.0.1@3306@india election results

--TOTAL SEATS - constituencywise_results
SELECT DISTINCT COUNT(`Parliament Constituency`) AS `TOTAL_SEATS` 
FROM `constituencywise_results` ;

--WHAT ARE THE TOTAL NO OF SEATS AVAILABLE FOR SELECTIONS IN EACH STATE.
SELECT
 SUM(CASE 
      WHEN `party` IN(
                'Bharatiya Janata Party - BJP', 
                'Telugu Desam - TDP', 
				'Janata Dal  (United) - JD(U)',
                'Shiv Sena - SHS', 
                'AJSU Party - AJSUP', 
                'Apna Dal (Soneylal) - ADAL', 
                'Asom Gana Parishad - AGP',
                'Hindustani Awam Morcha (Secular) - HAMS', 
                'Janasena Party - JnP', 
				'Janata Dal  (Secular) - JD(S)',
                'Lok Janshakti Party(Ram Vilas) - LJPRV', 
                'Nationalist Congress Party - NCP',
                'Rashtriya Lok Dal - RLD', 
                'Sikkim Krantikari Morcha - SKM'
)THEN `Won`
      ELSE 0
END) AS `NDA_Total_Seats_Won`
FROM 
`partywise_results`;

--SEATS WON BY NDA ALLIANCE PARTIES

SELECT
  `party` as `Party Name`,
  `won` as `Seats Won`
FROM  `partywise_results`
WHERE  `PARTY` IN (
                'Bharatiya Janata Party - BJP', 
                'Telugu Desam - TDP', 
				'Janata Dal  (United) - JD(U)',
                'Shiv Sena - SHS', 
                'AJSU Party - AJSUP', 
                'Apna Dal (Soneylal) - ADAL', 
                'Asom Gana Parishad - AGP',
                'Hindustani Awam Morcha (Secular) - HAMS', 
                'Janasena Party - JnP', 
				'Janata Dal  (Secular) - JD(S)',
                'Lok Janshakti Party(Ram Vilas) - LJPRV', 
                'Nationalist Congress Party - NCP',
                'Rashtriya Lok Dal - RLD', 
                'Sikkim Krantikari Morcha - SKM'
) 
ORDER BY `Won` DESC;

--Total Seats Won by I.N.D.I.A. Allianz
--INDIAN NATIONAL DEVELOPMENT INCLUSIVE ALLIANCE
SELECT 
 SUM(CASE 
      WHEN `party` IN(
               'Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK'
)THEN `Won`
      ELSE 0     
      END) AS `INDIA_Total_Seats_Won`
FROM 
`partywise_results`;

--SEATS WON BY NDA ALLIANCE PARTIES
SELECT
  `party` as `Party Name`,
  `won` as `Seats Won`
FROM  `partywise_results`
WHERE  `PARTY` IN (
                'Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK'
) 
ORDER BY `Won` DESC;


SELECT * FROM `partywise_results`;
--ADD NEW COLUMN FIELD IN THE TABLE PARTYWISE_RESULTS TO GET THE PARTY ALLIANCE AS NDA ND I.N.D.I.A AND OTHER
ALTER TABLE `partywise_results` 
ADD `party_alliance` VARCHAR(50);

UPDATE `partywise_results`
SET `party_alliance` = `I.N.D.I.A`
WHERE party IN 
('Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK'
);

--NDA
UPDATE `partywise_results`
SET `party_alliance` = 'NDA'
WHERE party IN (
    'Bharatiya Janata Party - BJP',
    'Telugu Desam - TDP',
    'Janata Dal  (United) - JD(U)',
    'Shiv Sena - SHS',
    'AJSU Party - AJSUP',
    'Apna Dal (Soneylal) - ADAL',
    'Asom Gana Parishad - AGP',
    'Hindustani Awam Morcha (Secular) - HAMS',
    'Janasena Party - JnP',
    'Janata Dal  (Secular) - JD(S)',
    'Lok Janshakti Party(Ram Vilas) - LJPRV',
    'Nationalist Congress Party - NCP',
    'Rashtriya Lok Dal - RLD',
    'Sikkim Krantikari Morcha - SKM'
); 

UPDATE `partywise_results`
SET `party_alliance` = 'OTHER'
WHERE `party_alliance` IS NULL; 

--WINNING CANDIDATE'S NAME, THEIR PARTY NAME, TOTAL VOTES, AND THE MARGIN OF VICTORY FOR A SPECIFIC STATE AND CONSTITUENCY?

SELECT
`cr`.`Winning Candidate`,
`pr`.`Party`,
`cr`.`Total Votes`,
`cr`.`Margin`,
`s`.`State`,
`cr`.`Constituency Name`
FROM
`constituencywise_results` cr,
`partywise_results` pr ,
`statewise_results` sr,
`states` s
WHERE
 `cr`.`party id` = `pr`.`party id` and
 `cr`.`Parliament Constituency` = `sr`.`Parliament Constituency` and
 `sr`.`state id` = `s`.`state id`;

--WHAT IS THE DISTRIBUTION OF EVM VOTES VERSUS POSTAL VOTES FOR CANDIDATES IN A SPECIFIC CONSTITUENCY?
SELECT
`cd`.`EVM Votes`,
`cd`.`Postal Votes`,
`cd`.`Total Votes`,
`cd`.`Candidate`,
`cr`.`Constituency Name`
FROM
`constituencywise_details` cd,
`constituencywise_results` cr
WHERE
`cr`.`Constituency ID` = `cd`.`Constituency ID` AND
`cr`.`Constituency Name` = 'AMETHI';

--WHICH PARTIES WON THE MOST SEATS IN a STATE, AND 
--HOW MANY SEATS DID EACH PARTY WIN? 
SELECT
 `pr`.`Party`,
 COUNT(`cr`.`Constituency ID`) AS `Seats Won`
FROM
 `partywise_results` pr,
 `constituencywise_results` cr,
 `statewise_results` sr,
 `states` s
WHERE
`pr`.`Party ID` = `cr`.`Party ID` AND
`cr`.`Parliament Constituency` = `sr`.`Parliament Constituency` AND `sr`.`State ID` = `s`.`State ID` AND
`s`.`State` = 'Tamil Nadu'
GROUP BY `pr`.`Party`
ORDER BY `Seats Won` DESC;

--WHAT IS THE TOTAL NUMBER OF SEATS WON BY EACH PARTY ALLIANCE(NDA,I.N.D.I.A AND OTHER) IN EACH STATE FOR THE INDIA ELECTION 2024
SELECT
 `s`.`State`,
 SUM(CASE WHEN `pr`.`party_alliance` = 'NDA' THEN 1 ELSE 0 END) AS 'NDA Seats Won',
 SUM(CASE WHEN `pr`.`party_alliance` = 'I.N.D.I.A' THEN 1 ELSE 0 END) AS 'INDIA Seats Won',
 SUM(CASE WHEN `pr`.`party_alliance` = 'OTHER' THEN 1 ELSE 0 END) AS 'Other Seats Won'
FROM
 `partywise_results` pr,
 `constituencywise_results` cr,
 `statewise_results` sr,
 `states` s
WHERE
`pr`.`Party ID` = `cr`.`Party ID` AND
`cr`.`Parliament Constituency` = `sr`.`Parliament Constituency` AND `sr`.`State ID` = `s`.`State ID`
GROUP BY `s`.`State`;


--WHICH CANDIDATE RECEIVED THE HIGHEST NUMBER OF EVM VOTES IN EACH CONSTITUENCY (TOP 10)?
SELECT
`cd`.`Candidate`, 
`cd`.`EVM Votes`, 
`cd`.`Constituency ID`,
`cr`.`Constituency Name` 
FROM `constituencywise_details` cd JOIN `constituencywise_results` cr
ON `cr`.`Constituency ID` = `cd`.`Constituency ID` WHERE `cd`.`EVM Votes` = 
( SELECT MAX(`cd1`.`EVM Votes`) 
FROM `constituencywise_details` cd1
 WHERE `cd`.`Constituency ID` = `cd1`.`Constituency ID`) 
ORDER BY `cd`.`EVM Votes` DESC limit 10;

WITH RankedCandidates AS (
    SELECT 
        `cd`.`Constituency ID`,
        `cd`.`Candidate`,
        `cd`.`Party`,
        `cd`.`EVM Votes`,
        `cd`.`Postal Votes`,
        `cd`.`EVM Votes` + `cd`.`Postal Votes` AS `Total_Votes`,
        ROW_NUMBER() OVER (
            PARTITION BY `cd`.`Constituency ID` 
            ORDER BY `cd`.`EVM Votes` + `cd`.`Postal Votes` DESC
        ) AS `VoteRank`
    FROM 
        `constituencywise_details` cd
    JOIN 
        `constituencywise_results` cr 
        ON `cd`.`Constituency ID` = `cr`.`Constituency ID`
    JOIN 
        `statewise_results` sr 
        ON `cr`.`Parliament Constituency` = `sr`.`Parliament Constituency`
    JOIN 
        `states` s 
        ON `sr`.`State ID` = `s`.`State ID`
    WHERE 
        `s`.`State` = 'Delhi'
)
SELECT 
    `cr`.`Constituency Name`,
    MAX(CASE WHEN `rc`.`VoteRank` = 1 THEN `rc`.`Candidate` END) AS `Winning_Candidate`,
    MAX(CASE WHEN `rc`.`VoteRank` = 2 THEN `rc`.`Candidate` END) AS `Runnerup_Candidate`
FROM 
    RankedCandidates rc
JOIN 
    `constituencywise_results` cr 
    ON `rc`.`Constituency ID` = `cr`.`Constituency ID`
GROUP BY 
    `cr`.`Constituency Name`
ORDER BY 
    `cr`.`Constituency Name`
LIMIT 10; -- Apply LIMIT here to get the first 100 results

--FOR THE STATE OF MAHARASHTRA, WHAT ARE THE TOTAL NUMBER OF SEATS, TOTAL NUMBER OF CANDIDATES, TOTAL NUMBER OF PARTIES,
--TOTAL VOTES (INCLUDING EVM AND POSTAL), AND THE BREAKDOWN OF EVM AND POSTAL VOTES?
SELECT 
    COUNT(DISTINCT cr.`Constituency ID`) AS Total_Seats,
    COUNT(DISTINCT cd.`Candidate`) AS Total_Candidates,
    COUNT(DISTINCT p.`Party`) AS Total_Parties,
    SUM(cd.`EVM Votes` + cd.`Postal Votes`) AS Total_Votes,
    SUM(cd.`EVM Votes`) AS Total_EVM_Votes,
    SUM(cd.`Postal Votes`) AS Total_Postal_Votes
FROM 
    `constituencywise_results` cr
JOIN 
    `constituencywise_details` cd ON cr.`Constituency ID` = cd.`Constituency ID`
JOIN 
    `statewise_results` sr ON cr.`Parliament Constituency` = sr.`Parliament Constituency`
JOIN 
    `states` s ON sr.`State ID` = s.`State ID`
JOIN 
    `partywise_results` p ON cr.`Party ID` = p.`Party ID`
WHERE 
    s.`State` = 'Maharashtra';
