# AutoPresenter

[![Build Status](https://secure.travis-ci.org/afcapel/auto_presenter.png)](http://travis-ci.org/afcapel/auto_presenter)
[![Code Climate](https://codeclimate.com/github/afcapel/auto_presenter.png)](https://codeclimate.com/github/afcapel/auto_presenter)

AutoPresenter uses convention over configuration to remove the bolierplate code to use presenters in your rails app. That allows you to cleanly remove the presentation logic from your controllers.

## Usage

Let's say you have a controller:

```ruby
class ProjectsController < ApplicationController

  def show
    @project = Project.find(params[:id])

    @completed_tasks   = @project.tasks.completed
    @uncompleted_tasks = @project.tasks.uncompleted
  end
end
```

To decorate `@completed_tasks` just create a presenter in `app/presenters/projects/completed_tasks_presenter.rb`. If you want to decorate any `Task` instance variable in your views just create a `TaskPresenter` in `app/presenters/task_presenter.rb`. There is no need to change your controller code.


### Presenters

Autopresenter doesn't ship with any base presenter class you can inherit from. A presenter can be any object that accepts the decorated object in the initializer and adds presentation methods to it. The ruby standard library is `SimpleDelegator` usually a good and simple option to implement your delegators. Drapper decorators work well too.

```ruby
class TaskPresenter < SimpleDelegator

  # This method will be added to Task objects in the views.
  def status
    completed_at.present? ? 'Completed' : 'Uncompleted'
  end
end
```

## Installation

Add AutoPresenter to your Gemfile

```ruby
  gem 'auto_presenter'
```

## License

Autopresenter is released under the [MIT License](http://www.opensource.org/licenses/MIT).
