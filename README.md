##Test Assignment
With reference to the below red text please add your code instead of the &#39;# Put your code
here’ line. You need to implement developer class so DataBase#find_developer method
does not fail. Try to add as few lines of code as possible.

  class Developer
    # Put your code here
  end
  
  class DataBase
    def find_developer(platform: :ruby, region: :london)
      all_developers(platform, region).select do |you|
        you.are.crazy
        .and { your.skill_level is :high }
        .and { you.are.not.in :plumbee }
        .and { you.love 'ruby', 'rails' }
        .and { want 'fun', 'money' }
        .and.if you do
          your work well
        end
      end
    end
  
    private
  
    def all_developers(*_)
      [Developer.new]
    end
  end
