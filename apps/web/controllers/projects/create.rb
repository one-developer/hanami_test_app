module Web::Controllers::Projects
  class Create
    include Web::Action

    expose :project

    params do
      required(:project).schema do
        required(:name).filled(:str?)
        required(:description).filled(:str?)
        optional(:url).maybe(:str?)
      end
    end

    def call(params)
      if params.valid?
        @project = ProjectRepository.new.create(params[:project])

        redirect_to routes.projects_path
      else
        self.status = 422
      end
    end
  end
end
