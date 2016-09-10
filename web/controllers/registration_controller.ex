defmodule ElChat.RegistrationController do 
	use ElChat.Web, :controller
	alias ElChat.User

	def new(conn, _params) do
		changeset = User.changeset(%User{})
		render(conn, %{changeset: changeset})
	end

	def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)

	    case ElChat.Registration.create(changeset) do
	      {:ok, _user} ->
	        conn
	        |> put_flash(:info, "Your acount created successfully.")
	        |> redirect(to: "/rooms")
	      {:error, changeset} ->
	        render(conn, "new.html", changeset: changeset)
	    end
 	 end
end