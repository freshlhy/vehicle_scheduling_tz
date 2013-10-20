class Permission
  def initialize(current_user)
    allow :index_page,   [:index]
    allow :static_pages, [:about, :contact]
    allow :sessions,     [:new, :create, :destroy]
    allow :users,        [:edit, :update] do |edit_user|
      edit_user.id == current_user.id
    end
    if current_user.is_a? Driver
      allow :'drivers/status',         [:start, :tour, :update]
      allow :'drivers/trips',          [:index, :new, :create]
      allow :'drivers/trips',          [:edit, :update, :destroy] do |trip|
        trip.driver.id == current_user.id
      end
      allow :'drivers/driver_history', [:index]
    end
    if current_user.is_a? Worker
      allow :'workers/status',         [:start, :tour, :update]
      allow :'workers/trips',          [:index]
      allow :'workers/trips',          [:edit, :update] do |trip|
        trip.workers.exists? current_user
      end
      allow :'workers/worker_history', [:index]
    end
    if current_user.is_a? Admin
      allow :'admins/trips',           [:index, :edit, :update, :destroy]
      allow :'admins/drivers_history', [:index, :edit, :update, :destroy]
      allow :'admins/workers_history', [:index, :edit, :update, :destroy]
      allow :'admins/cars',            [:index, :new, :create, :edit, :update, :destroy]
      allow :'admins/drivers',         [:index, :new, :create, :edit, :update, :destroy]
      allow :'admins/groups',          [:index, :new, :create, :edit, :update, :destroy]
      allow :'admins/workers',         [:index, :new, :create, :edit, :update, :destroy]
      allow :'admins/destinations',    [:index, :new, :create, :edit, :update, :destroy]
      allow :'admins/notes',           [:index, :new, :create, :edit, :update, :destroy]
    end
  end

  def allow?(controller, action, resource = nil)
    allowed = @allowed_actions[[controller.to_s, action.to_s]]
    allowed && (allowed == true || resource && allowed.call(resource))
    #true
  end

  def allow(controllers, actions, &block)
    @allowed_actions ||= {}
    Array(controllers).each do |controller|
      Array(actions).each do |action|
        @allowed_actions[[controller.to_s, action.to_s]] = block || true
      end
    end
  end

end