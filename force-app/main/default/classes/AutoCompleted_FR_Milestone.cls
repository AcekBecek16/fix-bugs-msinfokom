/**
 * @author [AcekBecek]
 * @email [nurazispakaya16@mail.com]
 * @create date 2024-04-04 20:55:57
 * @modify date 2024-08-14 14:32:04
 * @desc [Completed Milestone]
 * @test [Test_AutoCompleted_FR_Milestone]
 */
global class AutoCompleted_FR_Milestone {
  @InvocableMethod(label='Completed Milestone')
  global static List<resultParams> AutoCompleted_FR_Milestone(
    List<requestParams> collection
  ) {
    List<resultParams> result = new List<resultParams>();

    if (collection.isEmpty())
      return result;

    String CaseID = '' + collection[0].CaseID;
    String MilestoneName = '' + collection[0].milestoneName;
    Datetime complDate = system.now();

    if (collection[0].completedDate != null) {
      complDate = collection[0].completedDate;
    }
    List<CaseMilestone> MilestoneUpdate = new List<CaseMilestone>();

    String query = 'SELECT Id, completionDate, TargetDate FROM CaseMilestone WHERE CaseId =:CaseID AND completionDate = null AND Case.SlaExitDate = null ';

    if (MilestoneName != '')
      query += 'AND MilestoneType.Name =: MilestoneName';

    MilestoneUpdate = Database.query(query);

    for (CaseMilestone cm : MilestoneUpdate) {
      if (MilestoneName == 'Auto Reply to Customer') {
        complDate = cm.TargetDate;
        complDate = complDate.addMinutes(-10);
      }

      cm.completionDate = complDate;
    }

    System.debug('milestone update: ' + MilestoneUpdate);
    Database.update(MilestoneUpdate);
    return result;
  }

  global class requestParams {
    @InvocableVariable
    global String CaseID;

    @InvocableVariable
    global String milestoneName;

    @InvocableVariable
    global Datetime completedDate;
  }

  global class resultParams {
    @InvocableVariable
    global String CaseID;
  }
}
