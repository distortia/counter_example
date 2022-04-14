defmodule CounterExampleWeb.PageLive do
  use Phoenix.LiveView

  def render(assigns) do
    ~H"""
    <section class="phx-hero" id="page-live" phx-hook="restore" >
      <h1>Counter</h1>
      <button id="inc-button" phx-click="inc" phx-hook="saveCount">Increment</button>
      <br>
      <%= @count %>
    </section>
    """
  end

  def mount(_params, _session, socket) do
    socket = socket |> assign(count: 0)
    {:ok, socket}
  end

  def handle_event("inc", _session, socket) do
    count = socket.assigns.count + 1
    socket = socket |> assign(count: count)
    {:noreply, push_event(socket, "saveCount", %{count: count})}
  end

  def handle_event("restore", %{"count" => nil}, socket), do: {:noreply, socket}

  def handle_event("restore", %{"count" => count}, socket) do
    count = String.to_integer(count)
    socket = socket |> assign(count: count)
    {:noreply, socket}
  end
end
