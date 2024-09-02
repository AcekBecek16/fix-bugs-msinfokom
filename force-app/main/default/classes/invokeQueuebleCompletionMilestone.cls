/**
 * @author [AcekBecek]
 * @email [nurazispakaya16@mail.com]
 * @create date 2024-08-30 11:33:42
 * @modify date 2024-08-30 11:33:42
 * @test []
 * @desc [Invoke Method for QueuebleCompletionMilestone]
 */
global with sharing class invokeQueuebleCompletionMilestone {
  @InvocableMethod(label='Auto Completed Milestobe')
  public static List<resultParams> invokeQueue(List<requestParams> collection) {
    QueuebleCompletionMilestone qcm = new QueuebleCompletionMilestone(
      collection[0].CaseID,
      collection[0].milestoneName
    );
    resultParams res = new resultParams();
    res.CaseID = collection[0].CaseID;

    Id jobId = System.enqueueJob(qcm, 3);

    system.debug('Queue jobId => ' + jobId);

    list<resultParams> listRes = new List<resultParams>();
    listRes.add(res);
    return listRes;
  }

  global class requestParams {
    @InvocableVariable
    global Id CaseID;

    @InvocableVariable
    global String milestoneName;
  }

  global class resultParams {
    @InvocableVariable
    global Id CaseID;
  }
}
