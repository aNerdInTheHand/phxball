defmodule PhxballWeb.PlayerLive.RadarComponent do
  use PhxballWeb, :live_component
  @impl true
  def update(_, socket) do
    spec =
      # VegaLite.new(title: "Demo", width: :container, height: :container, padding: 5)
      # Load values. Values are a map with the attributes to be used by Vegalite
      # |> VegaLite.data_from_values(fake_data())
      # Defines the type of mark to be used
      # |> VegaLite.mark(:rect)
      # Sets the axis, the key for the data and the type of data
      # |> VegaLite.encode_field(:x, "date", type: :nominal)
      # |> VegaLite.encode_field(:y, "total", type: :quantitative)
      # Output the specifcation
      VegaLite.from_json(json_data)
      |> VegaLite.to_spec()

    socket = assign(socket, id: socket.id)
    {:ok, push_event(socket, "vega_lite:#{socket.id}:init", %{"spec" => spec})}
  end

  @impl true
  def render(assigns) do
    # Here we have the element that will load the embedded view. Special note to data-id which is the
    # identifier that will be used by the hooks to understand which socket sent want.

    # We also identify the hook that will use this component using phx-hook.
    # Refer again to https://hexdocs.pm/phoenix_live_view/js-interop.html#client-hooks-via-phx-hook
    ~H"""
    <div style="width:80%; height: 500px" id="graph" phx-hook="VegaLite" phx-update="ignore" data-id={@id}/>
    """
  end

  defp fake_data do
    today = Date.utc_today()
    until = today |> Date.add(10)

    Enum.map(Date.range(today, until), fn date ->
      %{total: Enum.random(1..100), date: Date.to_iso8601(date), name: "potato"}
    end)
  end

  # https://vega.github.io/vega/examples/radar-chart/
  defp json_data do """
  {
    "$schema": "https://vega.github.io/schema/vega/v5.json",
    "description": "A radar chart example, showing multiple dimensions in a radial layout.",
    "width": 400,
    "height": 400,
    "padding": 40,
    "autosize": {"type": "none", "contains": "padding"},

    "signals": [
      {"name": "radius", "update": "width / 2"}
    ],

    "data": [
      {
        "name": "table",
        "values": [
          {"key": "Passing", "value": 19, "category": 0},
          {"key": "Tackling", "value": 22, "category": 0},
          {"key": "key-2", "value": 14, "category": 0},
          {"key": "key-3", "value": 38, "category": 0},
          {"key": "key-4", "value": 23, "category": 0},
          {"key": "key-5", "value": 5, "category": 0},
          {"key": "key-6", "value": 27, "category": 0},
          {"key": "key-0", "value": 13, "category": 1},
          {"key": "key-1", "value": 12, "category": 1},
          {"key": "key-2", "value": 42, "category": 1},
          {"key": "key-3", "value": 13, "category": 1},
          {"key": "key-4", "value": 6, "category": 1},
          {"key": "key-5", "value": 15, "category": 1},
          {"key": "key-6", "value": 8, "category": 1}
        ]
      },
      {
        "name": "keys",
        "source": "table",
        "transform": [
          {
            "type": "aggregate",
            "groupby": ["key"]
          }
        ]
      }
    ],

    "scales": [
      {
        "name": "angular",
        "type": "point",
        "range": {"signal": "[-PI, PI]"},
        "padding": 0.5,
        "domain": {"data": "table", "field": "key"}
      },
      {
        "name": "radial",
        "type": "linear",
        "range": {"signal": "[0, radius]"},
        "zero": true,
        "nice": false,
        "domain": {"data": "table", "field": "value"},
        "domainMin": 0
      },
      {
        "name": "color",
        "type": "ordinal",
        "domain": {"data": "table", "field": "category"},
        "range": {"scheme": "category10"}
      }
    ],

    "encode": {
      "enter": {
        "x": {"signal": "radius"},
        "y": {"signal": "radius"}
      }
    },

    "marks": [
      {
        "type": "group",
        "name": "categories",
        "zindex": 1,
        "from": {
          "facet": {"data": "table", "name": "facet", "groupby": ["category"]}
        },
        "marks": [
          {
            "type": "line",
            "name": "category-line",
            "from": {"data": "facet"},
            "encode": {
              "enter": {
                "interpolate": {"value": "linear-closed"},
                "x": {"signal": "scale('radial', datum.value) * cos(scale('angular', datum.key))"},
                "y": {"signal": "scale('radial', datum.value) * sin(scale('angular', datum.key))"},
                "stroke": {"scale": "color", "field": "category"},
                "strokeWidth": {"value": 1},
                "fill": {"scale": "color", "field": "category"},
                "fillOpacity": {"value": 0.1}
              }
            }
          },
          {
            "type": "text",
            "name": "value-text",
            "from": {"data": "category-line"},
            "encode": {
              "enter": {
                "x": {"signal": "datum.x"},
                "y": {"signal": "datum.y"},
                "text": {"signal": "datum.datum.value"},
                "align": {"value": "center"},
                "baseline": {"value": "middle"},
                "fill": {"value": "black"}
              }
            }
          }
        ]
      },
      {
        "type": "rule",
        "name": "radial-grid",
        "from": {"data": "keys"},
        "zindex": 0,
        "encode": {
          "enter": {
            "x": {"value": 0},
            "y": {"value": 0},
            "x2": {"signal": "radius * cos(scale('angular', datum.key))"},
            "y2": {"signal": "radius * sin(scale('angular', datum.key))"},
            "stroke": {"value": "lightgray"},
            "strokeWidth": {"value": 1}
          }
        }
      },
      {
        "type": "text",
        "name": "key-label",
        "from": {"data": "keys"},
        "zindex": 1,
        "encode": {
          "enter": {
            "x": {"signal": "(radius + 5) * cos(scale('angular', datum.key))"},
            "y": {"signal": "(radius + 5) * sin(scale('angular', datum.key))"},
            "text": {"field": "key"},
            "align": [
              {
                "test": "abs(scale('angular', datum.key)) > PI / 2",
                "value": "right"
              },
              {
                "value": "left"
              }
            ],
            "baseline": [
              {
                "test": "scale('angular', datum.key) > 0", "value": "top"
              },
              {
                "test": "scale('angular', datum.key) == 0", "value": "middle"
              },
              {
                "value": "bottom"
              }
            ],
            "fill": {"value": "black"},
            "fontWeight": {"value": "bold"}
          }
        }
      },
      {
        "type": "line",
        "name": "outer-line",
        "from": {"data": "radial-grid"},
        "encode": {
          "enter": {
            "interpolate": {"value": "linear-closed"},
            "x": {"field": "x2"},
            "y": {"field": "y2"},
            "stroke": {"value": "lightgray"},
            "strokeWidth": {"value": 1}
          }
        }
      }
    ]
  }
  """
  end
end
