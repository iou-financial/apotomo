# Source of this snippet https://stackoverflow.com/a/50178750/540852
Rails.application.routes.draw do
  match ':controller/render_event_response', :via => :all, :to => proc { |env|
    route = env["action_dispatch.request.path_parameters"]
    Rails.logger.error("******************************************************************************************************")
    Rails.logger.error("ROUTE NOT FOUND. USING WILDCARD ROUTE. REQUIRED ROUTE IS:>")
    Rails.logger.error("#{env['REQUEST_METHOD'].downcase} #{route[:controller]}/render_event_response => #{route[:controller]}#render_event_response")
    Rails.logger.error("******************************************************************************************************")

    controller = "#{route[:controller].camelize}Controller".safe_constantize
    action = "render_event_response"

    if controller
      controller.action(action).call(env)
    else
      [422, {}, ["Unprocessable entity"]]
    end
  }
end
