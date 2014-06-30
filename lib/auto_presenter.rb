require_relative 'auto_presenter/relation_presenter'

module AutoPresenter
  extend ActiveSupport::Concern

  included do
    define_callbacks :render
    set_callback :render, :before, :auto_present_instance_vars
  end

  private

  def render(*args, &block)
    run_callbacks(:render) { super }
  end

  def auto_present_instance_vars
    vars_to_present = instance_variables.collect(&:to_s).reject do |var_name|
      var_name.starts_with?('@_')
    end

    vars_to_present.each { |instance_var_name| auto_present(instance_var_name) }
  end

  def auto_present(instance_var_name)
    var = instance_variable_get(instance_var_name)
    var_name = instance_var_name[1..-1] # without the @

    presenter = auto_presenter_for(var_name, var)

    if presenter
      presented_object = presenter.new(var)
      instance_variable_set(instance_var_name, presented_object)
    end
  end

  def auto_presenter_for(var_name, var)
    controller_presenter = "#{params[:controller]}/#{var_name}_presenter".camelize.safe_constantize

    return controller_presenter if controller_presenter

    if var.is_a?(ActiveRecord::Relation)
      RelationPresenter
    else
      class_name = var.class.name
      "#{class_name}Presenter".safe_constantize
    end
  end
end
