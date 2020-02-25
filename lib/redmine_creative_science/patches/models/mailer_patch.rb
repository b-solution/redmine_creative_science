module  RedmineCreativeScience
  module  Patches
    module  Models
      module MailerPatch
        def self.included(base)
          base.class_eval do
            def mailer_reminder(user)
              @user = user
              mail :to => user, :subject => "Billing hours reminder"
            end
          end
        end
      end
    end
  end
end
Mailer.send(:include, RedmineCreativeScience::Patches::Models::MailerPatch )
