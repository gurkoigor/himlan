module Admin::RelizsHelper

  def status_collection_for_select
    return ([] << Reliz::Status::NEW << Reliz::Status::APPROVED << Reliz::Status::CLOSED)
  end
end
