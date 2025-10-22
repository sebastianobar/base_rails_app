class Users::ProfilesController < AuthenticatedController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  skip_before_action :check_profile_completion, only: [ :new, :create ]

  before_action :set_users_profile, only: %i[ edit update destroy_avatar ]

  # GET /users/profiles/new
  def new
    @users_profile = current_user.build_profile
  end

  # GET /users/profiles/1/edit
  def edit
  end

  # POST /users/profiles or /users/profiles.json
  def create
    @users_profile = current_user.build_profile(users_profile_params)

    respond_to do |format|
      if @users_profile.save
        format.html { redirect_to root_path, notice: I18n.t("controllers.users.profiles_controller.create.success") }
        format.json { render :show, status: :created, location: @users_profile }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @users_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/profiles/1 or /users/profiles/1.json
  def update
    respond_to do |format|
      if @users_profile.update(users_profile_params)
        format.html { redirect_to root_path, notice: I18n.t("controllers.users.profiles_controller.update.success"), status: :see_other }
        format.json { render :show, status: :ok, location: @users_profile }
      else
        persisted_avatar = Users::Profile.find(@users_profile.id).avatar
        @users_profile.define_singleton_method(:avatar) { persisted_avatar }
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @users_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy_avatar
    @users_profile.avatar.purge_later if @users_profile.avatar.attached?
    redirect_to edit_users_profile_path(@users_profile), notice: I18n.t("controllers.users.profiles_controller.destroy_avatar.success")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_users_profile
      @users_profile = Users::Profile.find_by(user: current_user)
    end

    # Only allow a list of trusted parameters through.
    def users_profile_params
      params.expect(users_profile: [ :first_name, :last_name, :birthdate, :lang, :avatar ])
    end

    def record_not_found
      redirect_to root_path, alert: I18n.t("devise.shared.complete_profile_alert")
    end
end
