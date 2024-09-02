/**
 * @author [AcekBecek]
 * @email [nurazispakaya16@mail.com]
 * @create date 2024-08-29 19:54:51
 * @modify date 2024-08-29 19:54:51
 * @test []
 * @desc [QueubleCompletionMilestone]
 */

public with sharing class QueuebleCompletionMilestone implements Queueable {
  private Id setCaseId;
  private String setMilestoneName;

  public QueuebleCompletionMilestone(Id caseId, String milestoneName) {
    this.setCaseId = caseId;
    this.setMilestoneName = milestoneName;
  }

  public void completedMilestone() {
    List<CaseMilestone> cm = [
      SELECT Id, completionDate, Case.SlaStartDate, TargetDate
      FROM CaseMilestone
      WHERE
        MilestoneType.Name = :setMilestoneName
        AND Case.Id = :setCaseId
        AND completionDate = NULL
        AND Case.SlaExitDate = NULL
    ];

    if (cm.size() > 0) {
      for (CaseMilestone singleCM : cm) {
        Datetime complDate = singleCM.TargetDate;
        singleCM.completionDate = complDate.addMinutes(-10);
      }
      Database.update(cm);
    }

    System.debug('milestone update: ' + cm);
  }

  public void execute(QueueableContext context) {
    //execute function
    try {
      completedMilestone();
    } catch (Exception e) {
      System.debug(e.getMessage());
    }
  }
}
