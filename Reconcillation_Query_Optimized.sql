/* 

Maintanence Log  :
--Total 1982716 in vmf(coverage and rider) -> 1982517 matching 
--Mismatched records(199):
  1.3 mismatched recs(3 recs not present in alismaster) 
  2.71 recs covered in error report policies
  3.Coverage gross premium -> 2 recs penny diff(covaddcode-1 weekly)
                              63 recs huge diff (46 - covaddcode-1 & 17 - covaddcode-2)
  4.ELP -> 3 recs huge diff with covaddcode-1 
           2 huge diff with covaddcode-2
          57 penny diff with covaddcode-1
--combined mismatches of elp & cov gross -> 1 rec  

*/
/*select a.*,kt002.covaddcode from
(*/


	SELECT 
		CASE WHEN min_source != max_source THEN 'Both' ELSE min_source   END AS "In Source"
       ,CASE WHEN min_source != max_source THEN ''  ELSE val_date END AS "val_date"
       ,CASE WHEN min_source != max_source THEN ''  ELSE company_code END AS "company_code"
       ,CASE WHEN min_source != max_source THEN ''  ELSE policy_no    END AS "policy_no"
       ,CASE WHEN min_source != max_source THEN ''  ELSE record_type  END AS "record_type" 
       ,CASE WHEN min_source != max_source THEN ''  ELSE file_type  END AS "file_type" 
       ,CASE WHEN min_source != max_source THEN '' ELSE line_of_business  END AS "line_of_business"
       ,CASE WHEN min_source != max_source THEN '' ELSE phase_code END AS "phase_code"
       ,CASE WHEN min_source != max_source THEN '' ELSE units END AS "units"
       ,CASE WHEN min_source != max_source THEN '' ELSE issue_age END AS "issue_age"
       ,CASE WHEN min_source != max_source THEN '' ELSE class_code  END AS "class_code"
       ,CASE WHEN min_source != max_source THEN '' ELSE term_reason  END AS "term_reason"
       ,CASE WHEN min_source != max_source THEN '' ELSE pol_status END AS "pol_status"
       ,CASE WHEN min_source != max_source THEN '' ELSE rated_age END AS "rated_age"
       ,CASE WHEN min_source != max_source THEN '' ELSE IssueAge_Orig END AS "IssueAge_Orig"
       ,CASE WHEN min_source != max_source THEN '' ELSE risk_code  END AS "risk_code"
       ,CASE WHEN min_source != max_source THEN '' ELSE reins_pct  END AS "reins_pct"
       ,CASE WHEN min_source != max_source THEN '' ELSE fy_ren END AS "fy_ren"
       ,CASE WHEN min_source != max_source THEN '' ELSE policy_count  END AS "policy_count"
       ,CASE WHEN min_source != max_source THEN '' ELSE lm_plancode  END AS "lm_plancode"
       ,CASE WHEN min_source != max_source THEN '' ELSE gaap_int END AS "gaap_int"
       ,CASE WHEN min_source != max_source THEN '' ELSE dac_int END AS "dac_int"
       ,CASE WHEN min_source != max_source THEN '' ELSE amt_issued END AS "amt_issued"
       ,CASE WHEN min_source != max_source THEN '' ELSE amt_inforce END AS "amt_inforce"
       ,CASE WHEN min_source != max_source THEN '' ELSE ov_amt END AS "ov_amt"
       ,CASE WHEN min_source != max_source THEN '' ELSE sex_code END AS "sex_code"
       ,CASE WHEN min_source != max_source THEN '' ELSE yra END AS "yra"
       ,CASE WHEN min_source != max_source THEN '' ELSE mature_expire_date END AS "mature_expire_date"
       ,CASE WHEN min_source != max_source THEN '' ELSE trans_date END AS "trans_date"
       ,CASE WHEN min_source != max_source THEN '' ELSE term_date  END AS "term_date"
       ,CASE WHEN min_source != max_source THEN '' ELSE issue_date END AS "issue_date"
       ,CASE WHEN min_source != max_source THEN '' ELSE IssueDate_Orig END AS "IssueDate_Orig"
       ,CASE WHEN min_source != max_source THEN '' ELSE paid_to_date END AS "paid_to_date"
       ,CASE WHEN min_source != max_source THEN '' ELSE extralife_prem  END AS "extralife_prem"
       ,CASE WHEN min_source != max_source THEN '' ELSE gross_annlzd_prem END AS "gross_annlzd_prem"
       ,CASE WHEN min_source != max_source THEN '' ELSE prem_mode  END AS "prem_mode"
       ,CASE WHEN min_source != max_source THEN '' ELSE grossprem_field1 END AS "grossprem_field1"
       ,CASE WHEN min_source != max_source THEN '' ELSE state_code END AS "state_code"
       ,CASE WHEN min_source != max_source THEN '' ELSE res_state_code END AS "res_state_code"
       ,CASE WHEN min_source != max_source THEN '' ELSE csv_table END AS "csv_table"
       ,CASE WHEN min_source != max_source THEN '' ELSE sub_phase_code END AS "sub_phase_code"
       ,CASE WHEN min_source != max_source THEN '' ELSE admin_plan END AS "admin_plan"
       ,CASE WHEN min_source != max_source THEN '' ELSE cvlast END AS "cvlast"
       ,CASE WHEN min_source != max_source THEN '' ELSE cvnext END AS "cvnext"
       ,CASE WHEN min_source != max_source THEN '' ELSE premcd END AS "premcd"
       ,SUM(item_count) AS "Uniuqe Policy Number Count"
       ,SUM(dl_raw_record_count) AS "Data Lake Raw Record Count"
       ,SUM(vmf_raw_record_count) AS "VMF Raw Record Count"
FROM (

		SELECT val_date  ,company_code    ,policy_no  ,record_type  ,file_type ,line_of_business ,phase_code
     ,cast(units as varchar) as units  ,issue_age   ,class_code ,term_reason ,pol_status ,rated_age ,IssueAge_Orig
    ,risk_code  ,reins_pct,fy_ren ,cast(policy_count as varchar) as policy_count ,lm_plancode
   ,gaap_int  ,dac_int,cast(amt_issued as varchar) as amt_issued ,cast(amt_inforce as varchar) as amt_inforce
   ,cast(ov_amt as varchar) as ov_amt
   ,sex_code,yra,mature_expire_date,trans_date,term_date,issue_date,issuedate_orig,paid_to_date,extralife_prem,gross_annlzd_prem,
    prem_mode,grossprem_field1,state_code,res_state_code,csv_table,sub_phase_code,admin_plan
    ,cast(cvlast as varchar) as cvlast ,cast(cvnext as varchar) as cvnext ,premcd           
           ,MIN(source) AS min_source  ,MAX(source) AS max_source   , 1 AS item_count
  , SUM(dl_raw_record_count)  AS dl_raw_record_count , SUM(vmf_raw_record_count) AS vmf_raw_record_count
      FROM (
      
      -- Data Lake
           select val_date,company_code,policy_no,record_type,file_type,line_of_business,phase_code,units,issue_age,class_code,term_reason,
           pol_status,rated_age,issueage_orig,risk_code,reins_pct,fy_ren,policy_count,lm_plancode,gaap_int,dac_int,amt_issued,amt_inforce,
           ov_amt,sex_code,yra,mature_expire_date,trans_date,term_date,issue_date,issuedate_orig,paid_to_date,extralife_prem,gross_annlzd_prem,
           prem_mode,grossprem_field1,state_code,res_state_code,csv_table,sub_phase_code,admin_plan,cvlast,cvnext,premcd
		,'DataLake Only' AS source,COUNT(*) AS dl_raw_record_count,0 AS vmf_raw_record_count 
           from actuarial_inputs.lnl_build_dl_vmf_staging_life_health_coverage_records
           		group by val_date,company_code,policy_no,record_type,file_type,line_of_business,phase_code,units,issue_age,class_code,term_reason,
           pol_status,rated_age,issueage_orig,risk_code,reins_pct,fy_ren,policy_count,lm_plancode,gaap_int,dac_int,amt_issued,amt_inforce,
           ov_amt,sex_code,yra,mature_expire_date,trans_date,term_date,issue_date,issuedate_orig,paid_to_date,extralife_prem,gross_annlzd_prem,
           prem_mode,grossprem_field1,state_code,res_state_code,csv_table,sub_phase_code,admin_plan,cvlast,cvnext,premcd
            
          
   UNION ALL
      --VMF
      
      SELECT 
   valdate   ,cc AS company_code ,SuBSTR(CAST(CAST(pol AS INTEGER) + 1000000000 AS VARCHAR),2,9) AS policy_no
   ,recordtype AS record_type  ,filetype ,lineofbusiness AS line_of_business ,phase AS phase_code
             ,cast(units as decimal(13,4)) AS  units ,issueage  ,classcode ,termreason
   ,polstat     ,ratedage ,issueageorig  ,riskcode ,reinspct,fyren ,cast(policycount as bigint) AS policycount
   ,lmplancode ,gaapint  ,dacint ,cast(amtissued as bigint) AS amtissued ,cast(amtinforce as bigint) AS amtinforce
             ,cast(ovamt as bigint) AS ovamtval_date,company_code,policy_no,record_type,file_type,line_of_business,phase_code,units,issue_age,class_code,term_reason,
           pol_status,rated_age,issueage_orig,risk_code,reins_pct,fy_ren,policy_count,lm_plancode,gaap_int,dac_int,amt_issued,amt_inforce,
           ov_amt,sex_code,yra,mature_expire_date,trans_date,term_date,issue_date,issuedate_orig,paid_to_date,extralife_prem,gross_annlzd_prem,
           prem_mode,grossprem_field1,state_code,res_state_code,csv_table ,subph AS sub_phase_code
             ,adminplaN   ,cast(cvlast as bigint)  ,cast(cvnext as bigint)   ,premcd
             ,'VMF Only' AS source ,0 AS dl_raw_record_count ,COUNT(*) AS vmf_raw_record_count
     
 FROM "AwsDataCatalog".dl_actuarial.vmf_lnl_202108_polyfromsql                    -- Filter to August 2021 valuation date and life
      WHERE lineofbusiness = 'O'                                                  -- alis(ov)
      AND   subph IN ('1','9')                                                    -- 1- Coverage,9- Rider
      AND   filetype = 'A'                                                        -- Regular 
      AND (polstat in ('0','1','2','4') or (polstat = '3' and csvtable != '0'))   --combination of (polstat = '3' and csvtable = '0') related to endowment
      
      GROUP BY valdate
              ,cc
              ,SuBSTR(CAST(CAST(pol AS INTEGER) + 1000000000 AS VARCHAR),2,9)
              ,recordtype
              ,filetype
              ,lineofbusiness
              ,phase
              ,cast(units as decimal(13,4))
              ,issueage
              ,classcode    
              ,termreason 
              ,polstat 
              ,ratedage 
              ,issueageorig  
              ,riskcode      
              ,reinspct
              ,fyren
              ,cast(policycount as bigint)
              ,lmplancode
              ,gaapint
              ,dacint
              ,cast(amtissued as bigint)
              ,cast(amtinforce as bigint)
              ,cast(ovamt as bigint)
              ,sexcode
              ,yra
              ,matexpdate
              ,trxdate
              ,termdate
              ,issuedate
              ,issuedateorig
              ,paidtodate
              ,extralifeprem
              ,grossanlzdprem
              ,premmode
              ,grosspremfield1
              ,issstate
              ,resstate
              ,csvtable
              ,subph
              ,adminplan
--              ,substr(adminplan,1,4)
--              ,substr(adminplan,6,3)
              ,cast(cvlast as bigint)
              ,cast(cvnext as bigint)
              ,premcd

      ) AS UnionSubQuery
      
      GROUP BY  val_date
  ,company_code
  ,policy_no
  ,record_type
  ,file_type
  ,line_of_business
  ,phase_code
  ,cast(units as varchar)
  ,issue_age
  ,class_code
  ,term_reason
  ,pol_status
  ,rated_age
  ,Issueage_Orig
  ,risk_code
  ,reins_pct 
  ,fy_ren
  ,cast(policy_count as varchar)
  ,lm_plancode
  ,gaap_int
  ,dac_int
  ,cast(amt_issued  as varchar)
  ,cast(amt_inforce as varchar)
  ,cast(ov_amt as varchar)
  ,sex_code
  ,yra
  ,mature_expire_date
  ,trans_date
  ,term_date
               ,issue_date
               ,Issuedate_Orig
               ,paid_to_date
               ,extralife_prem
               ,gross_annlzd_prem
               ,prem_mode
               ,grossprem_field1 
               ,state_code
               ,res_state_code
               ,csv_table
               ,sub_phase_code
               ,admin_plan
               ,cast(cvlast as varchar)
               ,cast(cvnext as varchar)
               ,premcd

      ) MatchingSubQuery
      
GROUP BY
      CASE WHEN min_source != max_source THEN 'Both' ELSE min_source END
     ,CASE WHEN min_source != max_source THEN '' ELSE val_date END                  
     ,CASE WHEN min_source != max_source THEN '' ELSE company_code END              
     ,CASE WHEN min_source != max_source THEN '' ELSE policy_no END                 
     ,CASE WHEN min_source != max_source THEN '' ELSE record_type  END              
     ,CASE WHEN min_source != max_source THEN '' ELSE file_type  END                
     ,CASE WHEN min_source != max_source THEN '' ELSE line_of_business END          
     ,CASE WHEN min_source != max_source THEN '' ELSE phase_code END                
     ,CASE WHEN min_source != max_source THEN '' ELSE units END                     
     ,CASE WHEN min_source != max_source THEN '' ELSE issue_age END                 
     ,CASE WHEN min_source != max_source THEN '' ELSE class_code  END               
     ,CASE WHEN min_source != max_source THEN '' ELSE term_reason  END              
     ,CASE WHEN min_source != max_source THEN '' ELSE pol_status  END               
     ,CASE WHEN min_source != max_source THEN '' ELSE rated_age END                 
     ,CASE WHEN min_source != max_source THEN '' ELSE IssueAge_Orig END             
     ,CASE WHEN min_source != max_source THEN '' ELSE risk_code  END                
     ,CASE WHEN min_source != max_source THEN '' ELSE reins_pct  END                
     ,CASE WHEN min_source != max_source THEN '' ELSE policy_count  END             
     ,CASE WHEN min_source != max_source THEN '' ELSE lm_plancode  END              
     ,CASE WHEN min_source != max_source THEN '' ELSE gaap_int  END                 
     ,CASE WHEN min_source != max_source THEN '' ELSE dac_int  END                  
     ,CASE WHEN min_source != max_source THEN '' ELSE amt_issued END                
     ,CASE WHEN min_source != max_source THEN '' ELSE amt_inforce END                                      
     ,CASE WHEN min_source != max_source THEN '' ELSE ov_amt  END                   
     ,CASE WHEN min_source != max_source THEN '' ELSE sex_code END                  
     ,CASE WHEN min_source != max_source THEN '' ELSE fy_ren  END                   
     ,CASE WHEN min_source != max_source THEN '' ELSE yra END                       
     ,CASE WHEN min_source != max_source THEN '' ELSE mature_expire_date END        
     ,CASE WHEN min_source != max_source THEN '' ELSE trans_date END                
     ,CASE WHEN min_source != max_source THEN '' ELSE term_date  END                
     ,CASE WHEN min_source != max_source THEN '' ELSE issue_date END                
     ,CASE WHEN min_source != max_source THEN '' ELSE IssueDate_Orig END            
     ,CASE WHEN min_source != max_source THEN '' ELSE paid_to_date END              
     ,CASE WHEN min_source != max_source THEN '' ELSE extralife_prem END            
     ,CASE WHEN min_source != max_source THEN '' ELSE gross_annlzd_prem END         
     ,CASE WHEN min_source != max_source THEN '' ELSE prem_mode  END                
     ,CASE WHEN min_source != max_source THEN '' ELSE grossprem_field1  END         
     ,CASE WHEN min_source != max_source THEN '' ELSE state_code END                
     ,CASE WHEN min_source != max_source THEN '' ELSE res_state_code END            
     ,CASE WHEN min_source != max_source THEN '' ELSE csv_table END                 
     ,CASE WHEN min_source != max_source THEN '' ELSE sub_phase_code END            
     ,CASE WHEN min_source != max_source THEN '' ELSE admin_plan END              
     ,CASE WHEN min_source != max_source THEN '' ELSE cvlast END                    
     ,CASE WHEN min_source != max_source THEN '' ELSE cvnext END                    
     ,CASE WHEN min_source != max_source THEN '' ELSE premcd END                   
     
                                                                                    
ORDER BY "Uniuqe Policy Number Count" desc
        , policy_no,phase_code
        ,"In Source" 

LIMIT 1000


		---------------------------------- optimized query ----------------------------------------

		
	with UnionSubQuery(
	val_date,company_code,policy_no,record_type,file_type,line_of_business,phase_code,units,issue_age,class_code,term_reason,
    pol_status,rated_age,issueage_orig,risk_code,reins_pct,fy_ren,policy_count,lm_plancode,gaap_int,dac_int,amt_issued,amt_inforce,
    ov_amt,sex_code,yra,mature_expire_date,trans_date,term_date,issue_date,issuedate_orig,paid_to_date,extralife_prem,gross_annlzd_prem,
    prem_mode,grossprem_field1,state_code,res_state_code,csv_table,sub_phase_code,admin_plan,cvlast,cvnext,premcd
	,source,dl_raw_record_count,vmf_raw_record_count  ) AS 
	( 
	   select val_date,company_code,policy_no,record_type,file_type,line_of_business,phase_code,units,issue_age,class_code,term_reason,
           pol_status,rated_age,issueage_orig,risk_code,reins_pct,fy_ren,policy_count,lm_plancode,gaap_int,dac_int,amt_issued,amt_inforce,
           ov_amt,sex_code,yra,mature_expire_date,trans_date,term_date,issue_date,issuedate_orig,paid_to_date,extralife_prem,gross_annlzd_prem,
           prem_mode,grossprem_field1,state_code,res_state_code,csv_table,sub_phase_code,admin_plan,cvlast,cvnext,premcd
		,'DataLake Only' AS source,COUNT(*) AS dl_raw_record_count,0 AS vmf_raw_record_count 
           from actuarial_inputs.lnl_build_dl_vmf_staging_life_health_coverage_records
       group by val_date,company_code,policy_no,record_type,file_type,line_of_business,phase_code,units,issue_age,class_code,term_reason,
           pol_status,rated_age,issueage_orig,risk_code,reins_pct,fy_ren,policy_count,lm_plancode,gaap_int,dac_int,amt_issued,amt_inforce,
           ov_amt,sex_code,yra,mature_expire_date,trans_date,term_date,issue_date,issuedate_orig,paid_to_date,extralife_prem,gross_annlzd_prem,
           prem_mode,grossprem_field1,state_code,res_state_code,csv_table,sub_phase_code,admin_plan,cvlast,cvnext,premcd
                      
   UNION ALL

      SELECT 
   valdate   ,cc AS company_code ,SuBSTR(CAST(CAST(pol AS INTEGER) + 1000000000 AS VARCHAR),2,9) AS policy_no
   ,recordtype AS record_type  ,filetype ,lineofbusiness AS line_of_business ,phase AS phase_code
             ,cast(units as decimal(13,4)) AS  units ,issueage  ,classcode ,termreason
   ,polstat     ,ratedage ,issueageorig  ,riskcode ,reinspct,fyren ,cast(policycount as bigint) AS policycount
   ,lmplancode ,gaapint  ,dacint ,cast(amtissued as bigint) AS amtissued ,cast(amtinforce as bigint) AS amtinforce
             ,cast(ovamt as bigint) AS ovamtval_date,company_code,policy_no,record_type,file_type,line_of_business,phase_code,units,issue_age,class_code,term_reason,
           pol_status,rated_age,issueage_orig,risk_code,reins_pct,fy_ren,policy_count,lm_plancode,gaap_int,dac_int,amt_issued,amt_inforce,
           ov_amt,sex_code,yra,mature_expire_date,trans_date,term_date,issue_date,issuedate_orig,paid_to_date,extralife_prem,gross_annlzd_prem,
           prem_mode,grossprem_field1,state_code,res_state_code,csv_table ,subph AS sub_phase_code
             ,adminplaN   ,cast(cvlast as bigint)  ,cast(cvnext as bigint)   ,premcd
             ,'VMF Only' AS source ,0 AS dl_raw_record_count ,COUNT(*) AS vmf_raw_record_count
     
 FROM "AwsDataCatalog".dl_actuarial.vmf_lnl_202108_polyfromsql                  
      WHERE lineofbusiness = 'O'                                                
      AND   subph IN ('1','9')                                                  
      AND   filetype = 'A'                                                      
      AND (polstat in ('0','1','2','4') or (polstat = '3' and csvtable != '0')) 
      
      GROUP BY   valdate   ,cc ,SuBSTR(CAST(CAST(pol AS INTEGER) + 1000000000 AS VARCHAR),2,9)
   ,recordtype ,filetype ,lineofbusiness  ,phase
             ,cast(units as decimal(13,4)),issueage  ,classcode ,termreason
   ,polstat     ,ratedage ,issueageorig  ,riskcode ,reinspct,fyren ,cast(policycount as bigint)
   ,lmplancode ,gaapint  ,dacint ,cast(amtissued as bigint) ,cast(amtinforce as bigint) 
 ,cast(ovamt as bigint),company_code,policy_no,record_type,file_type,line_of_business,phase_code,units,issue_age,class_code,term_reason,
  pol_status,rated_age,issueage_orig,risk_code,reins_pct,fy_ren,policy_count,lm_plancode,gaap_int,dac_int,amt_issued,amt_inforce,
  ov_amt,sex_code,yra,mature_expire_date,trans_date,term_date,issue_date,issuedate_orig,paid_to_date,extralife_prem,gross_annlzd_prem,
  prem_mode,grossprem_field1,state_code,res_state_code,csv_table ,subph AS sub_phase_code
    ,adminplaN   ,cast(cvlast as bigint)  ,cast(cvnext as bigint)   ,premcd ) 
	-- end of UnionSubQuery

, MatchingSubQuery ( val_date,company_code,policy_no,record_type,file_type,line_of_business,phase_code,units,issue_age,class_code,term_reason,
    pol_status,rated_age,issueage_orig,risk_code,reins_pct,fy_ren,policy_count,lm_plancode,gaap_int,dac_int,amt_issued,amt_inforce,
    ov_amt,sex_code,yra,mature_expire_date,trans_date,term_date,issue_date,issuedate_orig,paid_to_date,extralife_prem,gross_annlzd_prem,
    prem_mode,grossprem_field1,state_code,res_state_code,csv_table,sub_phase_code,admin_plan,cvlast,cvnext,premcd
	,min_source,max_source,item_count,dl_raw_record_count,vmf_raw_record_count  )  AS
	
	( SELECT val_date  ,company_code    ,policy_no  ,record_type  ,file_type ,line_of_business ,phase_code
     ,cast(units as varchar) as units  ,issue_age   ,class_code ,term_reason ,pol_status ,rated_age ,IssueAge_Orig
    ,risk_code  ,reins_pct,fy_ren ,cast(policy_count as varchar) as policy_count ,lm_plancode
   ,gaap_int  ,dac_int,cast(amt_issued as varchar) as amt_issued ,cast(amt_inforce as varchar) as amt_inforce
   ,cast(ov_amt as varchar) as ov_amt
   ,sex_code,yra,mature_expire_date,trans_date,term_date,issue_date,issuedate_orig,paid_to_date,extralife_prem,gross_annlzd_prem,
    prem_mode,grossprem_field1,state_code,res_state_code,csv_table,sub_phase_code,admin_plan
    ,cast(cvlast as varchar) as cvlast ,cast(cvnext as varchar) as cvnext ,premcd           
           ,MIN(source) AS min_source  ,MAX(source) AS max_source   , 1 AS item_count
  , SUM(dl_raw_record_count)  AS dl_raw_record_count , SUM(vmf_raw_record_count) AS vmf_raw_record_count
  FROM UnionSubQuery

  GROUP BY val_date  ,company_code    ,policy_no  ,record_type  ,file_type ,line_of_business ,phase_code
 ,cast(units as varchar) ,issue_age   ,class_code ,term_reason ,pol_status ,rated_age ,IssueAge_Orig
 ,risk_code  ,reins_pct,fy_ren ,cast(policy_count as varchar) ,lm_plancode
 ,gaap_int  ,dac_int,cast(amt_issued as varchar) ,cast(amt_inforce as varchar),cast(ov_amt as varchar)
,sex_code,yra,mature_expire_date,trans_date,term_date,issue_date,issuedate_orig,paid_to_date,extralife_prem,
gross_annlzd_prem,
 prem_mode,grossprem_field1,state_code,res_state_code,csv_table,sub_phase_code,admin_plan
 ,cast(cvlast as varchar) ,cast(cvnext as varchar) ,premcd  ) 
--END OF MatchingSubQuery

, OuterrQuery ("In Source", val_date,company_code,policy_no,record_type,file_type,line_of_business,phase_code,units,issue_age,class_code,term_reason,
    pol_status,rated_age,issueage_orig,risk_code,reins_pct,fy_ren,policy_count,lm_plancode,gaap_int,dac_int,amt_issued,amt_inforce,
    ov_amt,sex_code,yra,mature_expire_date,trans_date,term_date,issue_date,issuedate_orig,paid_to_date,extralife_prem,gross_annlzd_prem,
    prem_mode,grossprem_field1,state_code,res_state_code,csv_table,sub_phase_code,admin_plan,cvlast,cvnext,premcd
	,"Uniuqe Policy Number Count" ,"Data Lake Raw Record Count","VMF Raw Record Count" ) AS 
	
	( CASE WHEN min_source != max_source THEN 'Both' ELSE min_source   END AS "In Source"
       ,CASE WHEN min_source != max_source THEN ''  ELSE val_date END AS "val_date"
       ,CASE WHEN min_source != max_source THEN ''  ELSE company_code END AS "company_code"
       ,CASE WHEN min_source != max_source THEN ''  ELSE policy_no    END AS "policy_no"
       ,CASE WHEN min_source != max_source THEN ''  ELSE record_type  END AS "record_type" 
       ,CASE WHEN min_source != max_source THEN ''  ELSE file_type  END AS "file_type" 
       ,CASE WHEN min_source != max_source THEN '' ELSE line_of_business  END AS "line_of_business"
       ,CASE WHEN min_source != max_source THEN '' ELSE phase_code END AS "phase_code"
       ,CASE WHEN min_source != max_source THEN '' ELSE units END AS "units"
       ,CASE WHEN min_source != max_source THEN '' ELSE issue_age END AS "issue_age"
       ,CASE WHEN min_source != max_source THEN '' ELSE class_code  END AS "class_code"
       ,CASE WHEN min_source != max_source THEN '' ELSE term_reason  END AS "term_reason"
       ,CASE WHEN min_source != max_source THEN '' ELSE pol_status END AS "pol_status"
       ,CASE WHEN min_source != max_source THEN '' ELSE rated_age END AS "rated_age"
       ,CASE WHEN min_source != max_source THEN '' ELSE IssueAge_Orig END AS "IssueAge_Orig"
       ,CASE WHEN min_source != max_source THEN '' ELSE risk_code  END AS "risk_code"
       ,CASE WHEN min_source != max_source THEN '' ELSE reins_pct  END AS "reins_pct"
       ,CASE WHEN min_source != max_source THEN '' ELSE fy_ren END AS "fy_ren"
       ,CASE WHEN min_source != max_source THEN '' ELSE policy_count  END AS "policy_count"
       ,CASE WHEN min_source != max_source THEN '' ELSE lm_plancode  END AS "lm_plancode"
       ,CASE WHEN min_source != max_source THEN '' ELSE gaap_int END AS "gaap_int"
       ,CASE WHEN min_source != max_source THEN '' ELSE dac_int END AS "dac_int"
       ,CASE WHEN min_source != max_source THEN '' ELSE amt_issued END AS "amt_issued"
       ,CASE WHEN min_source != max_source THEN '' ELSE amt_inforce END AS "amt_inforce"
       ,CASE WHEN min_source != max_source THEN '' ELSE ov_amt END AS "ov_amt"
       ,CASE WHEN min_source != max_source THEN '' ELSE sex_code END AS "sex_code"
       ,CASE WHEN min_source != max_source THEN '' ELSE yra END AS "yra"
       ,CASE WHEN min_source != max_source THEN '' ELSE mature_expire_date END AS "mature_expire_date"
       ,CASE WHEN min_source != max_source THEN '' ELSE trans_date END AS "trans_date"
       ,CASE WHEN min_source != max_source THEN '' ELSE term_date  END AS "term_date"
       ,CASE WHEN min_source != max_source THEN '' ELSE issue_date END AS "issue_date"
       ,CASE WHEN min_source != max_source THEN '' ELSE IssueDate_Orig END AS "IssueDate_Orig"
       ,CASE WHEN min_source != max_source THEN '' ELSE paid_to_date END AS "paid_to_date"
       ,CASE WHEN min_source != max_source THEN '' ELSE extralife_prem  END AS "extralife_prem"
       ,CASE WHEN min_source != max_source THEN '' ELSE gross_annlzd_prem END AS "gross_annlzd_prem"
       ,CASE WHEN min_source != max_source THEN '' ELSE prem_mode  END AS "prem_mode"
       ,CASE WHEN min_source != max_source THEN '' ELSE grossprem_field1 END AS "grossprem_field1"
       ,CASE WHEN min_source != max_source THEN '' ELSE state_code END AS "state_code"
       ,CASE WHEN min_source != max_source THEN '' ELSE res_state_code END AS "res_state_code"
       ,CASE WHEN min_source != max_source THEN '' ELSE csv_table END AS "csv_table"
       ,CASE WHEN min_source != max_source THEN '' ELSE sub_phase_code END AS "sub_phase_code"
       ,CASE WHEN min_source != max_source THEN '' ELSE admin_plan END AS "admin_plan"
       ,CASE WHEN min_source != max_source THEN '' ELSE cvlast END AS "cvlast"
       ,CASE WHEN min_source != max_source THEN '' ELSE cvnext END AS "cvnext"
       ,CASE WHEN min_source != max_source THEN '' ELSE premcd END AS "premcd"
       ,SUM(item_count) AS "Uniuqe Policy Number Count"
       ,SUM(dl_raw_record_count) AS "Data Lake Raw Record Count"
       ,SUM(vmf_raw_record_count) AS "VMF Raw Record Count"
	   from MatchingSubQuery
	   
	   group by
	   CASE WHEN min_source != max_source THEN 'Both' ELSE min_source END
     ,CASE WHEN min_source != max_source THEN '' ELSE val_date END                  
     ,CASE WHEN min_source != max_source THEN '' ELSE company_code END              
     ,CASE WHEN min_source != max_source THEN '' ELSE policy_no END                 
     ,CASE WHEN min_source != max_source THEN '' ELSE record_type  END              
     ,CASE WHEN min_source != max_source THEN '' ELSE file_type  END                
     ,CASE WHEN min_source != max_source THEN '' ELSE line_of_business END          
     ,CASE WHEN min_source != max_source THEN '' ELSE phase_code END                
     ,CASE WHEN min_source != max_source THEN '' ELSE units END                     
     ,CASE WHEN min_source != max_source THEN '' ELSE issue_age END                 
     ,CASE WHEN min_source != max_source THEN '' ELSE class_code  END               
     ,CASE WHEN min_source != max_source THEN '' ELSE term_reason  END              
     ,CASE WHEN min_source != max_source THEN '' ELSE pol_status  END               
     ,CASE WHEN min_source != max_source THEN '' ELSE rated_age END                 
     ,CASE WHEN min_source != max_source THEN '' ELSE IssueAge_Orig END             
     ,CASE WHEN min_source != max_source THEN '' ELSE risk_code  END                
     ,CASE WHEN min_source != max_source THEN '' ELSE reins_pct  END                
     ,CASE WHEN min_source != max_source THEN '' ELSE policy_count  END             
     ,CASE WHEN min_source != max_source THEN '' ELSE lm_plancode  END              
     ,CASE WHEN min_source != max_source THEN '' ELSE gaap_int  END                 
     ,CASE WHEN min_source != max_source THEN '' ELSE dac_int  END                  
     ,CASE WHEN min_source != max_source THEN '' ELSE amt_issued END                
     ,CASE WHEN min_source != max_source THEN '' ELSE amt_inforce END                                      
     ,CASE WHEN min_source != max_source THEN '' ELSE ov_amt  END                   
     ,CASE WHEN min_source != max_source THEN '' ELSE sex_code END                  
     ,CASE WHEN min_source != max_source THEN '' ELSE fy_ren  END                   
     ,CASE WHEN min_source != max_source THEN '' ELSE yra END                       
     ,CASE WHEN min_source != max_source THEN '' ELSE mature_expire_date END        
     ,CASE WHEN min_source != max_source THEN '' ELSE trans_date END                
     ,CASE WHEN min_source != max_source THEN '' ELSE term_date  END                
     ,CASE WHEN min_source != max_source THEN '' ELSE issue_date END                
     ,CASE WHEN min_source != max_source THEN '' ELSE IssueDate_Orig END            
     ,CASE WHEN min_source != max_source THEN '' ELSE paid_to_date END              
     ,CASE WHEN min_source != max_source THEN '' ELSE extralife_prem END            
     ,CASE WHEN min_source != max_source THEN '' ELSE gross_annlzd_prem END         
     ,CASE WHEN min_source != max_source THEN '' ELSE prem_mode  END                
     ,CASE WHEN min_source != max_source THEN '' ELSE grossprem_field1  END         
     ,CASE WHEN min_source != max_source THEN '' ELSE state_code END                
     ,CASE WHEN min_source != max_source THEN '' ELSE res_state_code END            
     ,CASE WHEN min_source != max_source THEN '' ELSE csv_table END                 
     ,CASE WHEN min_source != max_source THEN '' ELSE sub_phase_code END            
     ,CASE WHEN min_source != max_source THEN '' ELSE admin_plan END              
     ,CASE WHEN min_source != max_source THEN '' ELSE cvlast END                    
     ,CASE WHEN min_source != max_source THEN '' ELSE cvnext END                    
     ,CASE WHEN min_source != max_source THEN '' ELSE premcd END 
	 
	 order by "Uniuqe Policy Number Count" desc
        , policy_no,phase_code ,"In Source"  ) 
	 -- end of OuterrQuery
	 SELECT * FROM OuterrQuery 