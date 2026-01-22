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
end
