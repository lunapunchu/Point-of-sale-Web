// ---------- CHARTS ----------

// BAR CHART
var barChartOptions = {
  series: [{
    data: [350, 300, 295, 290, 210]
  }],
  chart: {
    type: 'bar',
    height: 350,
    toolbar: {
      show: false
    }
  },
  colors: [
    "#F07167",
    "#FED9B7",
    "#00A7B9",
    "#0081A7",
    "#4f35a1"
  ],
  plotOptions: {
    bar: {
      distributed: true,
      borderRadius: 4,
      horizontal: false,
      columnWidth: '40%'
    }
  },
  dataLabels: {
    enabled: false
  },
  legend: {
    show: false
  },
  xaxis: {
    categories: ["บะหมี่ไวไว", "โอวันติน", "ไมโล", "นมโฟร์โมสต์", "คนอร์ซุปก้อน"]
  },
  yaxis: {
    title: {
      text: "Count"
    }
  }
};

var barChart = new ApexCharts(document.querySelector("#bar-chart"), barChartOptions);
barChart.render();


// AREA CHART
var areaChartOptions = {
  series: [{
    name: 'Sales Orders',
    data: [72, 80, 75, 67, 72, 91, 61]
  }, {
    name: 'Supplier Orders',
    data: [31, 20, 25, 32, 40, 25, 27]
  }],
  chart: {
    height: 350,
    type: 'area',
    toolbar: {
      show: false
    }
  },
  colors: ["#4f35a1", "#246dec"],
  dataLabels: {
    enabled: false
  },
  stroke: {
    curve: 'smooth'
  },
  labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul"],
  markers: {
    size: 0
  },
  yaxis: [
    {
      title: {
        text: 'Sales Orders'
      }
    },
    {
      opposite: true,
      title: {
        text: 'Supplier Orders'
      }
    }
  ],
  tooltip: {
    shared: true,
    intersect: false
  }
};

var areaChart = new ApexCharts(document.querySelector("#area-chart"), areaChartOptions);
areaChart.render();