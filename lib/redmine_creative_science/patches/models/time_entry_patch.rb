module  RedmineCreativeScience
  module  Patches
    module  Models
      module TimeEntryPatch
        def self.included(base)
          base.class_eval do
            after_save do
              project = self.project
              return if project.nil?
              billing_hours_count = BillingHour.where(project_id: project.self_and_descendants.map(&:id)).sum(:time)
              all_times_count = TimeEntry.where(project_id: project.self_and_descendants.map(&:id)).sum(:hours)
              if project.account_contact_mail.present? && ( all_times_count >= (billing_hours_count.to_f * 0.9)) && ( billing_hours_count > 0)
                Mailer.mailer_reminder(project.account_contact_mail).deliver_now
              end
            end
          end
        end
      end
    end
  end
end

TimeEntry.send(:include, RedmineCreativeScience::Patches::Models::TimeEntryPatch )
