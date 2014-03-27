class PostPolicy < Struct.new(:user, :post)
  def owned
    post.user_id == user.id
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    post.user_id = user.id
    new?
  end

  def new?
    true
  end

  def update?
    edit?
  end

  def edit?
    owned
  end

  def destroy?
    owned
  end
end
