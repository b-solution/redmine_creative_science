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
              if all_times_count >= billing_hours_count
                # Mailer.mailer_reminder(User.current).deliver_now
              end
            end
          end
        end
      end
    end
  end
end

TimeEntry.send(:include, RedmineCreativeScience::Patches::Models::TimeEntryPatch )
