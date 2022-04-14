defmodule CounterExampleWeb.PageLive do
  use Phoenix.LiveView

  def render(assigns) do
    ~H"""
    <section class="phx-hero">
      <h1>Counter</h1>
      <button phx-click="inc">Increment</button>
      <br>
      <%= @count %>
    </section>
    """
  end

  def mount(_params, session, socket) do
    count = 0
    socket = socket |> assign(count: count)
    {:ok, socket}
  end

  def handle_event("inc", _session, socket) do
    count = socket.assigns.count + 1
    socket = socket |> assign(count: count)
    {:noreply, socket}
  end
end
