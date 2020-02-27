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

            def mailer_reminder_over(user)
              @user = user
              mail :to => user, :subject => "Purchased hours over"
            end
          end
        end
      end
    end
  end
end
Mailer.send(:include, RedmineCreativeScience::Patches::Models::MailerPatch )
