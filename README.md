# README -- Code The Dream Backend Additional Topics

This repository contains the framework for a Rails application called validations. Unfortunately the Treehouse videos do not cover some critical
skills required of Rails developers.  Therefore we have developed additional material and presentation slides to cover these key subjects.

After you clone the repository, create a new branch called validations, and put your work there.  When you complete the section on Additional Subjects,
push your validations branch to github and create a pull request.  Then create a new branch called rspec, for the section on Rails Testing with RSpec.
When you complete that section, push your work to github again, and create a pull request.  Then create a new branch called full-assignment, for the
class section on a complete assignment.  Once you finish that, you push the full-assignment branch to github and create another pull request.  Typically each
of these sections will be assigned in separate weeks.

This repository will be used again for the class section on Bootstrap in Rails, which is also
a separate week.

_____________________________________________________________________________________
### using byebug 
place `byebug` right before the line of code where error was encountered 
run the server after this 

#### shortcuts
type `c` to resume the server until it finishes or hits another breakpoint
type `n` to execute the next line of code 
type `l` to output the source code around the currently executing line
type `q` to quit

`self.class` - show the current object
`hist` - show history of debugging statements



you can even put `<% byebug %>` in your erb files 
make sure all `byebug` statements are removed before pushing code to production - otherwise the server will hang when it reaches this the statements


when using `pry` don't forget to `ctrl + d` to exit it in order to resume the server from byebug    


### exception handling 
The rescue_from statement calls the catch_not_found method 
`rescue_from ActiveRecord::RecordNotFound, with: :catch_not_found`
`def catch_not_found(e)
      Rails.logger.debug("We had a not found exception.")
      flash.alert = e.to_s
      redirect_to customers_path
end`


_____________________________________________________________________________________
Behavior driven development (BDD)


_____________________________________________________________________________________
### RSpec cheatsheet
render_template: 

#### FactoryBot
create_list
create
attributes_for: 