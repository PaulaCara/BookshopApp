class ParamsSanitizer
  def initialize(params)
    @params = params
  end

  def sanitize_all
    @params.map { |param| run(param[0]) }

    @params
  end

  def run(method)
    method_name = "sanitize_#{ method }"
    send(method_name) if self.respond_to? method_name
  end

  def sanitize_sort
    @params[:sort] = 'title' unless @params[:sort] == 'price'
  end

  def sanitize_direction
    @params[:direction] = 'ASC' unless @params[:direction] == 'DESC'
  end

  def sanitize_category
    @params[:category] = nil if @params[:category] == ''
  end
end
