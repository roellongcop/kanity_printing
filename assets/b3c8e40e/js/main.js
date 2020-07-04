/* eslint-disable object-shorthand */

/* global Chart, CustomTooltips, getStyle, hexToRgba */

/**
 * --------------------------------------------------------------------------
 * CoreUI Free Boostrap Admin Template (v2.1.11): main.js
 * Licensed under MIT (https://coreui.io/license)
 * --------------------------------------------------------------------------
 */

/* eslint-disable no-magic-numbers */
// Disable the on-canvas tooltip
Chart.defaults.global.pointHitDetectionRadius = 1;
Chart.defaults.global.tooltips.enabled = false;
Chart.defaults.global.tooltips.mode = 'index';
Chart.defaults.global.tooltips.position = 'nearest';
Chart.defaults.global.tooltips.custom = CustomTooltips; // eslint-disable-next-line no-unused-vars

$('.nav-link').on('click', function() {
    // $('ul').find('li.open').removeClass('open');
});


if ($('#card-chart1').length) {
  
  /*var cardChart1 = new Chart($('#card-chart1'), {
    type: 'line',
    data: {
      labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
      datasets: [{
        label: 'Total',
        backgroundColor: getStyle('--primary'),
        borderColor: 'rgba(255,255,255,.55)',
        data: [65, 59, 84, 84, 51, 55, 40]
      }]
    },
    options: {
      maintainAspectRatio: false,
      legend: {
        display: false
      },
      scales: {
        xAxes: [{
          gridLines: {
            color: 'transparent',
            zeroLineColor: 'transparent'
          },
          ticks: {
            fontSize: 2,
            fontColor: 'transparent'
          }
        }],
        yAxes: [{
          display: false,
          ticks: {
            display: false,
            min: 35,
            max: 89
          }
        }]
      },
      elements: {
        line: {
          borderWidth: 1
        },
        point: {
          radius: 4,
          hitRadius: 10,
          hoverRadius: 4
        }
      }
    }
  }); // eslint-disable-next-line no-unused-vars*/

}


if ($('#card-chart2').length) { 
  var cardChart2 = new Chart($('#card-chart2'), {
    type: 'line',
    data: {
      labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
      datasets: [{
        label: 'Total',
        backgroundColor: getStyle('--info'),
        borderColor: 'rgba(255,255,255,.55)',
        data: [1, 18, 9, 17, 34, 22, 11]
      }]
    },
    options: {
      maintainAspectRatio: false,
      legend: {
        display: false
      },
      scales: {
        xAxes: [{
          gridLines: {
            color: 'transparent',
            zeroLineColor: 'transparent'
          },
          ticks: {
            fontSize: 2,
            fontColor: 'transparent'
          }
        }],
        yAxes: [{
          display: false,
          ticks: {
            display: false,
            min: -4,
            max: 39
          }
        }]
      },
      elements: {
        line: {
          tension: 0.00001,
          borderWidth: 1
        },
        point: {
          radius: 4,
          hitRadius: 10,
          hoverRadius: 4
        }
      }
    }
  }); // eslint-disable-next-line no-unused-vars 
}

if ($('#card-chart3').length) { 
  var cardChart3 = new Chart($('#card-chart3'), {
    type: 'line',
    data: {
      labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
      datasets: [{
        label: 'Total',
        backgroundColor: 'rgba(255,255,255,.2)',
        borderColor: 'rgba(255,255,255,.55)',
        data: [78, 81, 80, 45, 34, 12, 40]
      }]
    },
    options: {
      maintainAspectRatio: false,
      legend: {
        display: false
      },
      scales: {
        xAxes: [{
          display: false
        }],
        yAxes: [{
          display: false
        }]
      },
      elements: {
        line: {
          borderWidth: 2
        },
        point: {
          radius: 0,
          hitRadius: 10,
          hoverRadius: 4
        }
      }
    }
  }); // eslint-disable-next-line no-unused-vars 
}

if ($('#card-chart4').length) { 
  var cardChart4 = new Chart($('#card-chart4'), {
    type: 'bar',
    data: {
      labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December', 'January', 'February', 'March', 'April'],
      datasets: [{
        label: 'Total',
        backgroundColor: 'rgba(255,255,255,.2)',
        borderColor: 'rgba(255,255,255,.55)',
        data: [78, 81, 80, 45, 34, 12, 40, 85, 65, 23, 12, 98, 34, 84, 67, 82]
      }]
    },
    options: {
      maintainAspectRatio: false,
      legend: {
        display: false
      },
      scales: {
        xAxes: [{
          display: false,
          barPercentage: 0.6
        }],
        yAxes: [{
          display: false
        }]
      }
    }
  }); // eslint-disable-next-line no-unused-vars
}


$('#select-year-category').on('change', function() {
  createCategoryChart($(this).val());
})

$('#select-year-department').on('change', function() {
  createDepartmentChart($(this).val());
})


$('#select-year-category-user').on('change', function() {
  createUserCategoryChart($(this).val());
})

function createCategoryChart(semester_id='') {
  $('#report-category-chart-wrapper').html('<canvas class="chart" id="report-category-chart" height="300"></canvas>');
  var category = ['SELF', 'PEER', 'SUPERVISORY VISIT', 'SET'];

  $.ajax({
    url: base_url + 'report/category-chart/' + semester_id,
    // semester_id: semester_id,
    // method: 'get',
    dataType: 'json',
    success: (res => {

      var mainChart = new Chart($('#report-category-chart'), {
        type: 'bar',
        // type: 'line',
        data: {
          labels: category,
          datasets: [{
            label: 'Evaluation Score',
            backgroundColor: hexToRgba(getStyle('--info'), 10),
            borderColor: getStyle('--info'),
            pointHoverBackgroundColor: '#fff',
            borderWidth: 2,
            data: res
          }]
        },
        options: {
          maintainAspectRatio: false,
          legend: {
            display: false
          },
          scales: {
            xAxes: [{
              gridLines: {
                drawOnChartArea: false
              }
            }],
            yAxes: [{
              ticks: {
                beginAtZero: true,
                maxTicksLimit: 5,
                // stepSize: Math.ceil(250 / 5),
                // max: 250
              }
            }]
          },
          elements: {
            point: {
              radius: 0,
              hitRadius: 10,
              hoverRadius: 4,
              hoverBorderWidth: 3
            }
          }
        }
      });

   })
  })
}


function createUserCategoryChart(semester_id='') {
  $('#user-chart-wrapper').html('<canvas class="chart" id="user-category-chart" height="300"></canvas>');
  var category = ['SELF', 'PEER', 'SUPERVISORY VISIT', 'SET'];

  var user_id = $('.user-evaluation').data('key');

  user_id = user_id ? user_id : 0;


  $.ajax({
    url: base_url + 'report/user-category-chart/' + user_id + (semester_id ? '/' + semester_id: ''),
    // semester_id: semester_id,
    // method: 'get',
    dataType: 'json',
    success: (res => {

      var mainChart = new Chart($('#user-category-chart'), {
        type: 'line',
        data: {
          labels: category,
          datasets: [{
            label: 'Evaluation Score',
            backgroundColor: hexToRgba(getStyle('--info'), 10),
            borderColor: getStyle('--info'),
            pointHoverBackgroundColor: '#fff',
            borderWidth: 2,
            data: res
          }]
        },
        options: {
          maintainAspectRatio: false,
          legend: {
            display: false
          },
          scales: {
            xAxes: [{
              gridLines: {
                drawOnChartArea: false
              }
            }],
            yAxes: [{
              ticks: {
                beginAtZero: true,
                maxTicksLimit: 5,
                // stepSize: Math.ceil(250 / 5),
                // max: 250
              }
            }]
          },
          elements: {
            point: {
              radius: 0,
              hitRadius: 10,
              hoverRadius: 4,
              hoverBorderWidth: 3
            }
          }
        }
      });

   })
  })
}

if ($('#report-category-chart-wrapper').length) { 
  createCategoryChart();
}


if ($('#user-chart-wrapper').length) { 
  createUserCategoryChart();
}



if ($('#report-department-wrapper').length) { 
  createDepartmentChart();
}



function createDepartmentChart(semester_id='') {
  $('#report-department-wrapper').html('<canvas class="chart" id="report-department-chart" height="300"></canvas>');
  $.ajax({
    url: base_url + 'report/department-chart/' + semester_id,
    // semester_id: semester_id,
    // method: 'get',
    dataType: 'json',
    success: (res => {

      var mainChart = new Chart($('#report-department-chart'), {
        type: 'bar',
        // type: 'line',
        data: {
          labels: res.labels,
          datasets: [{
            label: 'Evaluation Score',
            backgroundColor: hexToRgba(getStyle('--info'), 10),
            borderColor: getStyle('--info'),
            pointHoverBackgroundColor: '#fff',
            borderWidth: 2,
            data: res.data
          }]
        },
        options: {
          maintainAspectRatio: false,
          legend: {
            display: false
          },
          scales: {
            xAxes: [{
              gridLines: {
                drawOnChartArea: false
              }
            }],
            yAxes: [{
              ticks: {
                beginAtZero: true,
                maxTicksLimit: 5,
                // stepSize: Math.ceil(250 / 5),
                // max: 250
              }
            }]
          },
          elements: {
            point: {
              radius: 0,
              hitRadius: 10,
              hoverRadius: 4,
              hoverBorderWidth: 3
            }
          }
        }
      });

    })
  })


  $.ajax({
    url: base_url + 'report/department-records/' + semester_id,
        // semester_id: semester_id,
        // method: 'get',
        dataType: 'html',
        success: (res => {
          $('.print').html(res);
     })
  })

}


// function createDashboardChart() {
//   $('#main-chart-wrapper').html('<canvas class="chart" id="main-chart" height="300"></canvas>');
 

//   $.ajax({
//     url: base_url + 'dashboard/chart',
//     dataType: 'json',
//     success: (res => {

//       var mainChart = new Chart($('#main-chart'), {
//         type: 'bar',
//         // type: 'line',
//         data: {
//           labels: res.labels,
//           datasets: [{
//             label: 'Evaluation Score',
//             backgroundColor: hexToRgba(getStyle('--info'), 10),
//             borderColor: getStyle('--info'),
//             pointHoverBackgroundColor: '#fff',
//             borderWidth: 2,
//             data: res.data
//           }]
//         },
//         options: {
//           maintainAspectRatio: false,
//           legend: {
//             display: false
//           },
//           scales: {
//             xAxes: [{
//               gridLines: {
//                 drawOnChartArea: false
//               }
//             }],
//             yAxes: [{
//               ticks: {
//                 beginAtZero: true,
//                 maxTicksLimit: 5,
//                 // stepSize: Math.ceil(250 / 5),
//                 // max: 250
//               }
//             }]
//           },
//           elements: {
//             point: {
//               radius: 0,
//               hitRadius: 10,
//               hoverRadius: 4,
//               hoverBorderWidth: 3
//             }
//           }
//         }
//       });

//     })
//   });
// }


// if ($('#main-chart-wrapper').length) { 
//   createDashboardChart()
// }



var brandBoxChartLabels = ['January', 'February', 'March', 'April', 'May', 'June', 'July'];
var brandBoxChartOptions = {
  responsive: true,
  maintainAspectRatio: false,
  legend: {
    display: false
  },
  scales: {
    xAxes: [{
      display: false
    }],
    yAxes: [{
      display: false
    }]
  },
  elements: {
    point: {
      radius: 0,
      hitRadius: 10,
      hoverRadius: 4,
      hoverBorderWidth: 3
    }
  } // eslint-disable-next-line no-unused-vars

};

if ($('#social-box-chart-1').length) {
  var brandBoxChart1 = new Chart($('#social-box-chart-1'), {
    type: 'line',
    data: {
      labels: brandBoxChartLabels,
      datasets: [{
        label: 'Total',
        backgroundColor: 'rgba(255,255,255,.1)',
        borderColor: 'rgba(255,255,255,.55)',
        pointHoverBackgroundColor: '#fff',
        borderWidth: 2,
        data: [65, 59, 84, 84, 51, 55, 40]
      }]
    },
    options: brandBoxChartOptions
  }); // eslint-disable-next-line no-unused-vars
}

if ($('#social-box-chart-2').length) { 
  var brandBoxChart2 = new Chart($('#social-box-chart-2'), {
    type: 'line',
    data: {
      labels: brandBoxChartLabels,
      datasets: [{
        label: 'Total',
        backgroundColor: 'rgba(255,255,255,.1)',
        borderColor: 'rgba(255,255,255,.55)',
        pointHoverBackgroundColor: '#fff',
        borderWidth: 2,
        data: [1, 13, 9, 17, 34, 41, 38]
      }]
    },
    options: brandBoxChartOptions
  }); // eslint-disable-next-line no-unused-vars
}

if ($('#social-box-chart-3').length) { 
  var brandBoxChart3 = new Chart($('#social-box-chart-3'), {
    type: 'line',
    data: {
      labels: brandBoxChartLabels,
      datasets: [{
        label: 'Total',
        backgroundColor: 'rgba(255,255,255,.1)',
        borderColor: 'rgba(255,255,255,.55)',
        pointHoverBackgroundColor: '#fff',
        borderWidth: 2,
        data: [78, 81, 80, 45, 34, 12, 40]
      }]
    },
    options: brandBoxChartOptions
  }); // eslint-disable-next-line no-unused-vars
}

if ($('#social-box-chart-4').length) {
  var brandBoxChart4 = new Chart($('#social-box-chart-4'), {
    type: 'line',
    data: {
      labels: brandBoxChartLabels,
      datasets: [{
        label: 'Total',
        backgroundColor: 'rgba(255,255,255,.1)',
        borderColor: 'rgba(255,255,255,.55)',
        pointHoverBackgroundColor: '#fff',
        borderWidth: 2,
        data: [35, 23, 56, 22, 97, 23, 64]
      }]
    },
    options: brandBoxChartOptions
  });
}
//# sourceMappingURL=main.js.map