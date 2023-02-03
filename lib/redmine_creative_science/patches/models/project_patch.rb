module  RedmineCreativeScience
  module  Patches
    module  Models
      module ProjectPatch
        def self.included(base)
          base.class_eval do
            safe_attributes 'account_contact_mail', 'contact_timezone', 'day_ends_at', 'puchased_hours', 'puchased_start_date'
          end
        end
      end
    end
  end
end

Project.send(:include, RedmineCreativeScience::Patches::Models::ProjectPatch )
