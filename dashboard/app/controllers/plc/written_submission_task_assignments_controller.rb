class Plc::WrittenSubmissionTaskAssignmentsController < Plc::EnrollmentTaskAssignmentsController
  load_and_authorize_resource

  def submit_written_assignment
    puts params.inspect
    puts 'written assignment'
    puts @plc_enrollment_task_assignments.inspect
  end
end
