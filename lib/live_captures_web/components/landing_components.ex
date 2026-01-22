defmodule LiveCapturesWeb.LandingComponents do
  use LiveCapturesWeb, :html

  attr :color, :string, default: "yellow"
  def mono_divider(assigns) do
    ~H"""
    <div class={[
      "w-full h-[2px]",
      @color == "yellow" && "bg-[var(--mono-yellow)]",
      @color == "cyan" && "bg-[var(--mono-cyan)]",
      @color == "pink" && "bg-[var(--mono-pink)]"
    ]} />
    """
  end

  attr :number, :string, required: true
  def mono_index(assigns) do
    ~H"""
    <span class="text-5xl sm:text-6xl lg:text-7xl font-bold text-[var(--mono-dim)] leading-none tracking-tighter">
      <%= @number %>
    </span>
    """
  end

  attr :href, :string, required: true
  attr :class, :string, default: nil
  attr :rest, :global, include: ~w(target rel)
  slot :inner_block, required: true

  def mono_button(assigns) do
    ~H"""
    <a
      href={@href}
      class={[
        "inline-flex h-11 items-center gap-2 rounded-full border border-[var(--mono-border)] px-5 text-sm font-semibold transition",
        "hover:border-[var(--mono-yellow)] hover:text-[var(--mono-yellow)] focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-[var(--mono-yellow)]",
        @class
      ]}
      {@rest}
    >
      {render_slot(@inner_block)}
    </a>
    """
  end

  attr :class, :string, default: nil
  slot :inner_block, required: true

  def mono_card(assigns) do
    ~H"""
    <div class={[
      "rounded-2xl border border-[var(--mono-border)] bg-[var(--mono-surface-strong)] p-8 text-left",
      "shadow-[0_20px_40px_-32px_var(--mono-glow-pink)]",
      @class
    ]}>
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :name, :string, required: true
  attr :org, :string, required: true
  attr :org_extra, :string, default: nil
  attr :integration, :string, default: nil
  attr :explore, :string, required: true

  def library(assigns) do
    ~H"""
    <.mono_card class="w-full max-w-4xl">
      <div class="flex flex-col gap-6 sm:flex-row sm:items-center sm:justify-between">
        <div>
          <h3 class="text-xl font-bold tracking-tight"><%= @name %></h3>
          <p class="mt-2 text-sm text-[var(--mono-muted)]">
            by <%= @org %>
            <%= if @org_extra do %>
              <span class="text-[var(--mono-dim)]">/</span> <%= @org_extra %>
            <% end %>
          </p>
        </div>
        <div class="flex flex-col gap-3 min-[901px]:flex-row">
          <%= if @integration do %>
            <.mono_button
              href={@integration}
              class="justify-center bg-[var(--mono-surface-strong)] text-[var(--mono-text)]"
            >
              <.icon name="brand-github" class="size-4" /> Integration
              <.icon name="hero-arrow-top-right-on-square" class="size-4 text-[var(--mono-dim)]" />
            </.mono_button>
          <% end %>
          <.mono_button
            href={@explore}
            class="justify-center gap-3 bg-[var(--mono-surface-strong)] text-[var(--mono-text)]"
          >
            <img
              src={~p"/images/live-capture-logo.svg"}
              alt="LiveCapture"
              class="size-5"
              loading="lazy"
            /> Explore components
          </.mono_button>
        </div>
      </div>
    </.mono_card>
    """
  end
end
