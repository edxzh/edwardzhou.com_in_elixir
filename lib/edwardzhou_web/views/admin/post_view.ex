defmodule EdwardzhouWeb.Admin.PostView do
  use EdwardzhouWeb, :view

  defp publish_status_class(:published), do: "dark:bg-green-700 bg-green-100 text-green-700 dark:text-green-100"
  defp publish_status_class(:drafted),   do: "dark:bg-yellow-700 bg-yellow-100 text-yellow-700 dark:text-yellow-100"
  defp publish_status_class(:deleted),   do: "dark:bg-red-700 bg-red-100 text-red-700 dark:text-red-100"

  defp display_time(timestamp) do
    timestamp |> Calendar.strftime("%Y-%m-%d")
  end
end
