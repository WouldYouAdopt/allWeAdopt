// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';


      
      // Bar Chart Example
      var ctx1 = document.getElementById("myBarChart1");
      var myLineChart = new Chart(ctx1, {
        type: 'bar',
        data: {
          labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
          datasets: [{
            label: "Revenue",
            backgroundColor: "rgba(251,131,107,1)",
            borderColor: "rgba(251,131,107,1)",
            data: [10,20,33,28,40,30,37,45,52,58,45,54],
          }],
        },
        options: {
          scales: {
            xAxes: [{
              time: {
                unit: 'month'
              },
              gridLines: {
                display: false
              },
              ticks: {
                maxTicksLimit: 12
              }
            }],
            yAxes: [{
              ticks: {
                min: 0,
                max: 60,
                maxTicksLimit: 5
              },
              gridLines: {
                display: true
              }
            }],
          },
          legend: {
            display: false
          }
        }
      });


