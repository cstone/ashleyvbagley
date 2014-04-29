module ApplicationHelper
  def cp(path)
    "current" if current_page?(path)
  end

  def cpa(path)
    "active" if current_page?(path)
  end
end
