import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tradingview"
export default class extends Controller {
  static targets = ["chart"]

  connect() {
    // preload chart when controller connects
  }

  show(event) {
    event.preventDefault()
    // Get the symbol from data attribute
    const symbol = event.currentTarget.dataset.symbol

    // Clear previous chart
    this.chartTarget.innerHTML = ""

    // Dynamically load TradingView widget script
    if (typeof TradingView === "undefined") {
      const script = document.createElement("script")
      script.src = "https://s3.tradingview.com/tv.js"
      script.onload = () => this.renderChart(symbol)
      document.body.appendChild(script)
    } else {
      this.renderChart(symbol)
    }

    // Show Bootstrap modal
    const modal = new bootstrap.Modal(document.getElementById("chartModal"))
    modal.show()
  }

  // renderChart with the selected symbol
  renderChart(symbol) {
    new TradingView.widget({
      width: "100%",
      height: 400,
      symbol: symbol.toUpperCase() + "USD",
      interval: "D",
      timezone: "Etc/UTC",
      theme: "light",
      style: "1",
      locale: "en",
      toolbar_bg: "#f1f3f6",
      enable_publishing: false,
      hide_top_toolbar: false,
      container_id: "tradingview_chart_container"
    })
  }
}
