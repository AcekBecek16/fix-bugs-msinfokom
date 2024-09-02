Id caseId = '500BK00000AGtcJYAT';
String milestoneName = 'Auto Reply to Customer';
QueuebleCompletionMilestone qcm = new QueuebleCompletionMilestone(
  caseId,
  milestoneName
);
System.enqueueJob(qcm, 3);

// List<CaseMilestone> cm = [
//   SELECT Id, completionDate, Case.SlaStartDate, TargetDate
//   FROM CaseMilestone
//   WHERE
//     MilestoneType.Name = 'Auto Reply to Customer'
//     AND Case.Id = '500BK00000AGu8XYAT'
// ];

// for (CaseMilestone varCM : cm) {
//   Datetime complDate = varCM.TargetDate;

//   varCM.completionDate = complDate.addMinutes(-10);
// }
// update cm;

// System.debug(cm);

// List<Employee__c> listEmployee = [
//   SELECT Id, Name, Timesheet_User__c, Timesheet_Approver__c
//   FROM Employee__c
//   WHERE
//     (Role__c = 'Project Manager'
//     OR Role__c = 'Project Admin')
//     AND Active__c = TRUE
//     AND Grade__c != NULL
// ];

// for (Employee__c singleEmployee : listEmployee) {
//   singleEmployee.Timesheet_Approver__c = true;
// }
// Database.update(listEmployee);

// Batch_TimesheetRequest batch = new Batch_TimesheetRequest();
// ID batchprocessid = Database.executeBatch(batch, 100);

// Batch_SyncProjectSunfish batchid = new Batch_SyncProjectSunfish();
// Id processId = Database.executeBatch(batchid, 10);

// List<Timesheet__c> listTimesheets = [
//   SELECT Id, HRIS_Status__c, response__c, Remarks__c
//   FROM Timesheet__c
//   WHERE HRIS_Status__c = 'SYNCED'
// ];

// for (Timesheet__c ts : listTimesheets) {
//   ts.response__c = '';
// }
// Database.Update(listTimesheets);

// System.schedule(
//   'Sync Timesheet Every Hour',
//   '0 0 0/1 1/1 * ? *',
//   new Schedule_TimesheetRequest()
// );

// List<Asset> mergeAsset = [
//   SELECT Id, Name, POC_Asset__c, Demo_Asset__c
//   FROM Asset
//   WHERE POC_Asset__c = TRUE OR Demo_Asset__c = TRUE
// ];
// for (Asset singleAsset : mergeAsset) {
//   singleAsset.POC_Asset__c = true;
// }
// Database.Update(mergeAsset);

