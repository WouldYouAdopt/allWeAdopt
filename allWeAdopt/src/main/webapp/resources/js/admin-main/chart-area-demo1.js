// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';



// Area Chart Example
var ctx1 = document.getElementById("myAreaChart1");
var myLineChart1 = new Chart(ctx1, {
  type: 'line',
  data: {
    labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
    datasets: [{
      label: "Sessions",
      lineTension: 0.3,
      backgroundColor: "rgba(251,151,107,0.2)",
      borderColor: "rgba(251,131,107,1)",
      pointRadius: 5,
      pointBackgroundColor: "rgba(251,251,251,1)",
      pointBorderColor: "rgba(251,131,107,1)",
      pointHoverRadius: 5,
      pointHoverBackgroundColor: "rgba(251,131,107,1)",
      pointHitRadius: 50,
      pointBorderWidth: 2,
      data: [1,3,5,4,3,4,6,6,8,9,8,10],
    }],
  },
  options: {
    scales: {
      xAxes: [{
        time: {
          unit: 'date'
        },
        gridLines: {
          display: false
        },
        ticks: {
          maxTicksLimit: 8
        }
      }],
      yAxes: [{
        ticks: {
          min: 0,
          max: 10,
          maxTicksLimit: 5
        },
        gridLines: {
          color: "rgba(0, 0, 0, .125)",
        }
      }],
    },
    legend: {
      display: false
    }
  }
});

  
