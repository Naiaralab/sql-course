/*
* SQL Course - CASE Exercise - Start
*/

/* 
 * Create a new column HospitalLocation
 * Kings College is Urban,other hospitals are Rural 
 * Use the simple CASE form
*/

SELECT
	ps.PatientId
	,ps.Hospital
	,case ps.hospital when 'Kings College' then 'Urban' else 'Rural' end as HospitalLocation
FROM
	dbo.PatientStay ps
ORDER BY
	HospitalLocation;

/* 
 * Create a new column WardType
 * Any ward that contains 'Surgery' is 'Surgical',otherwise 'Non Surgical'
 * Use the searched CASE form
*/

SELECT
	ps.PatientId
	,ps.Hospital
    ,ps.Ward
	,Case when ps.ward like '%Surgery%' then 'Surgical' else 'Non Surgical' end AS WardType
FROM
	dbo.PatientStay ps
ORDER BY
	WardType;

/*
 * Create a new column PatientTariffGroup
 * A patient with a Tariff of 7 or more is in the 'High Tariff' group
 * A patient with a Tariff of 4 or more but below 7 is in the 'Medium Tariff' group
 * A patient with a Tariff below 4 is is in the 'Low Tariff' group
 * 
 * Optional advanced question: how many patients are in each PatientTariffGroup?
 */
        
SELECT
    ps.PatientId
	,ps.AdmittedDate
	,ps.Tariff
	,CASE 
    WHEN ps.tariff >= 7 THEN 'High Tariff'
    WHEN ps.tariff >=4 THEN 'Medium Tariff'
    ELSE 'Low Tariff' END  AS PatientTariffGroup
FROM
    dbo.PatientStay ps
ORDER BY
	PatientTariffGroup
	,ps.Tariff
	,ps.PatientId;