defmodule TeacExampleWeb.RedirectController do
  use TeacExampleWeb, :controller

  import TeacExampleWeb.UserAuth, only: [fetch_current_user: 2]

  plug :fetch_current_user

  def redirect_authenticated(conn, _) do
    if conn.assigns.current_user do
      TeacExampleWeb.UserAuth.redirect_if_user_is_authenticated(conn, [])
    else
      redirect(conn, to: ~p"/signin")
    end
  end
end
