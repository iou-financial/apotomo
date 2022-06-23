Rails.application.routes.draw do
  match ':controller/render_event_response', :via => :all, :to => proc { |env|
    route = env["action_dispatch.request.path_parameters"]
    Rails.logger.error("******************************************************************************************************")
    Rails.logger.error("ROUTE NOT FOUND. USING WILDCARD ROUTE. REQUIRED ROUTE IS:>")
    Rails.logger.error("#{env['REQUEST_METHOD'].downcase} #{route[:controller]}/render_event_response => #{route[:controller]}#render_event_response")
    Rails.logger.error("******************************************************************************************************")
    controller = eval("#{route[:controller].camelize}Controller")
    action = 'render_event_response'
    controller.action(action).call(env)
  }
end
