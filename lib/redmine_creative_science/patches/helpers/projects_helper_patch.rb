module  RedmineCreativeScience
  module  Patches
    module  Helpers
      module ProjectsHelperPatch
        def self.included(base)
          base.extend(ClassMethods)

          base.send(:include, InstanceMethods)
          base.class_eval do
            alias_method_chain :project_settings_tabs, :billing_hours
          end
        end
      end
      module ClassMethods

      end

      module InstanceMethods
        def project_settings_tabs_with_billing_hours
          tabs = project_settings_tabs_without_billing_hours
          if User.current.admin?
            tabs <<   {:name => 'billing_hours', :action => :billing_hours, :partial => 'projects/settings/billing_hours', :label => :label_billing_hour_plural}
          end
          tabs
        end
      end
    end
  end
end

ProjectsHelper.send(:include, RedmineCreativeScience::Patches::Helpers::ProjectsHelperPatch )