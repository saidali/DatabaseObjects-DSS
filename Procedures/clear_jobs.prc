DROP PROCEDURE DSS.CLEAR_JOBS;

CREATE OR REPLACE procedure DSS.Clear_Jobs ( JobNo number  )
as 
CNT number  ; 
begin  

   select count(*) into  cnt  from  DSS_ORDER_SCAN_SERIALS where  jobid =  JobNo ;
   
   if  cnt  =  0 then 
   
   delete from DSS_ORDER_SCAN_SERIALS  where jobid = JobNo ;
   delete from DSS_ORDER_SCAN_lines  where jobid = JobNo ;
   delete from DSS_ORDER_SCAN_header  where jobid = JobNo ;
   
   end  if  ;  
   

end  ;
/
