##Comments 
Used TDD approach.

Since only one class can be used to write code, code is not very solid, and 
Developer not only contains attributes but also contains method to check it
attributes, kind of 'find' itself.

The goal was to make find_developers method work which meanth that select 
method has to work.
Given DtaBase code ignores platform and region, so I ignored them too, but it
would be logical to use platform as condition for #love and region for #in.

To make Developer's methods chainable, each of them returns wether self or nil.

I decided to set default value for each instance variable. This makes code more
readable and faster to test, despite the fact that it adds few lines of code..

I used methaprograming to add methods for each instance variables.

I redefined method_missing to allow using different names for self inside of
select block, ex your, its, etc.

There are commants in the code explainig some details.

The test 'runs test assignment code' is written for self assesment.

##To run 
1. Clone repo
2. cd your/clone/folder
3. bundle install
4. run specs with following command: rspec  

##Test Assignment
With reference to the below red text please add your code instead of the &#39;# Put your code
here’ line. You need to implement developer class so DataBase#find_developer method
does not fail. Try to add as few lines of code as possible.

```ruby
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
```
