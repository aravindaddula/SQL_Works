1. 
	select 'AAAA_NS_1900' as LAPSE_FIELD2,'0000_0_A' as MORB_TABLE_FIELD2 
		from PolyExtract as p


2. 	select 

	(CASE WHEN a.AdminPlan = b.Adminplan THEN b.MB_TableCode 
		ELSE '0000_0_A' END) as MORB_TABLE_FIELD2

from alfmmst as alfm
left join Ovspilt a
inner join LNL_FDongMorbidityTableCode b
on a.AdminPlan = b.Adminplan

3. 
 	select 
	(CASE 
		WHEN a.LAPSE_FIELD1 = 'CCLAS' and left(a.MORB_TABLE_FIELD2,4) <> 'CLAS' THEN 'CLAS_0_' + RIGHT(a.MORB_TABLE_FIELD2,1)
		WHEN a.AdminPlan = b.Adminplan THEN b.MB_TableCode 
		ELSE '0000_0_A' END) as MORB_TABLE_FIELD2

from alfmmst as alfm
left join Ovspilt a
inner join LNL_FDongMorbidityTableCode b
on a.AdminPlan = b.Adminplan

-------------------------------------------------------------------------------

	select 'AAAA_NS_1900' as LAPSE_FIELD2 from alfmmst as alfm
	left join  #OV a
inner join ActuarialDataWarehouse.dbo.OVSplit b
on a.CC  = b.CompCode
and a.Pol = b.PolicyNo



/*
'AAAA_NS_1900' as LAPSE_FIELD2

update a
set  a.LAPSE_FIELD2 = left(LAPSE_FIELD2,5) + 'WS' + RIGHT(LAPSE_FIELD2,5)
from #OV a
inner join ActuarialDataWarehouse.dbo.OVSplit b
on a.CC  = b.CompCode
and a.Pol = b.PolicyNo
where b.valdate = @valdate
and b.IssMode in (6,7,50,51,52,59)

update #OV
set LAPSE_FIELD2 = LEFT(MORB_TABLE_FIELD2,4) + RIGHT(LAPSE_FIELD2,8)

update #OV
set LAPSE_FIELD2 = 'CARE'+ RIGHT(LAPSE_FIELD2,8)
WHERE LEFT(LAPSE_FIELD2,4) IN ('CARR', 'CARF')

update a
set a.LAPSE_FIELD2 = LEFT(a.LAPSE_FIELD2,5)+B.WKST + '_' + CONVERT(varchar(10),b.LoYr)
from #OV a, [ActuarialDataWarehouse].[dbo].[LNL_FDongLapseAssumptionFiles] b
where b.FileType = 'LP' 
and left(a.LAPSE_FIELD2,4) = b.ProdType
and (right(left(a.LAPSE_FIELD2,7),2) = b.wkst  or b.wkst = 'AS')
and left(a.IssueDate,4) BETWEEN b.LoYr and b.HiYr
*\