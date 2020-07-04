function printPage(url, title, w=1000, h=650) {
    // Fixes dual-screen position                         Most browsers      Firefox
    var dualScreenLeft = window.screenLeft != undefined ? window.screenLeft : window.screenX;
    var dualScreenTop = window.screenTop != undefined ? window.screenTop : window.screenY;

    var width = window.innerWidth ? window.innerWidth : document.documentElement.clientWidth ? document.documentElement.clientWidth : screen.width;
    var height = window.innerHeight ? window.innerHeight : document.documentElement.clientHeight ? document.documentElement.clientHeight : screen.height;

    var systemZoom = width / window.screen.availWidth;
    var left = (width - w) / 2 / systemZoom + dualScreenLeft
    var top = (height - h) / 2 / systemZoom + dualScreenTop
    var newWindow = window.open(url, title, 'scrollbars=yes, width=' + w / systemZoom + ', height=' + h / systemZoom + ', top=' + top + ', left=' + left);

    // Puts focus on the newWindow
    if (window.focus) newWindow.focus();
}


$( function() {
    $( ".sortable" ).sortable({
      placeholder: "ui-state-highlight"
    });
    $( ".sortable" ).disableSelection();

  } );




$(document).ready(function() {
    if ($('#window_print').length) {
        window.print();
    }

    // $('.date_range').daterangepicker({
    //     ranges   : {
    //         'Today'       : [moment(), moment()],
    //         'Yesterday'   : [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
    //         'Last 7 Days' : [moment().subtract(6, 'days'), moment()],
    //         'Last 30 Days': [moment().subtract(29, 'days'), moment()],
    //         'This Month'  : [moment().startOf('month'), moment().endOf('month')],
    //         'Last Month'  : [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')],
    //         'This Year'  : [moment().startOf('year'), moment().endOf('year')],
    //         'Last Year'  : [moment().subtract(1, 'year').startOf('year'), moment().subtract(1, 'year').endOf('month')],
    //     },
    //     startDate: moment(),
    //     endDate  : moment()
    // },
    // function (start, end) {
    //     var date_range = start.format('MM/DD/YYYY') + ' - ' + end.format('MM/DD/YYYY')
    //     $('#date_range').val(date_range);

    //     $('#date_range').closest('form').submit();
    // } 
    // );


    $('.btn-printer').on('click', function() {
        var url = $(this).data('url');
        var title = $(this).data('title');
        printPage(url, title);
    });

    
    var td = $('span.not-evaluated').parents('td').css('background-color', 'rgba(255, 0, 0, 0.3)');

    toggleQuality();
    function toggleQuality() {
        setTimeout( function() {
            $('.quality').fadeIn('slow') 
            $('.login-form').css('margin-top', '17%');
            $('.mission-vission').hide();
            toggleMission();
        }, 5000 );
    }

    function toggleMission() {
        setTimeout( function() {
            $('.mission-vission ').fadeIn('slow') 
            $('.quality').hide();
            $('.login-form').css('margin-top', '30%');
            toggleQuality();
        }, 5000 );
    }

    
    $('.btn-print').on('click', function() {
        $('.btn-info').hide();
        // $('.print').printThis();
        $(".print").printThis({
            debug: false,               // show the iframe for debugging
            importCSS: true,            // import page CSS
            importStyle: true,         // import style tags
            pageTitle: ".",              // add title to print page
            removeInline: false,        // remove all inline styles from print elements
            printDelay: 333,            // variable print delay
            header: "",               // prefix to html
            footer: "",               // postfix to html
            base: true,                // preserve the BASE tag, or accept a string for the URL
            formValues: true,           // preserve input/form values
            canvas: true,              // copy canvas elements (experimental)
            removeScripts: 0,       // remove script tags from print content
            copyTagClasses: true       // copy classes from the html & body tag
        });

    });
   




    $('#show-search').on('click', function() {
        $('#search-panel').toggle()
    })

    $('select').select2();

    $('.pagination > li').on('click', function(e) {

        var href = $(this).find('a').attr('href');

        if(href !== undefined) {
            window.location.href = href;
        }
        
    })

    
    var createChart = function(element, labels, data) {
        var cardChart1 = new Chart(element, {
            type: 'line',
            data: {
                labels: labels,
                datasets: [{
                    label: 'Registered',
                    backgroundColor: getStyle('--primary'),
                    borderColor: 'rgba(255,255,255,.55)',
                    data: data
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
                            // max: ,
                            // min: 
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
        }); 
    }


    



    

    $('.btn-logout').on('click', function() {
        $('#frm-logout').submit();
    });


    $('textarea.summernote').summernote({
        height: 650,
        tabsize: 2,
        followingToolbar: true,
    });
 
    $('.summernote-merchant').summernote({
        height: 650,
        tabsize: 2,
        followingToolbar: true,
    });

  

    

    $('.image-input').on('change', function() {
        var id = $(this).attr('id');
        previewImage(id);
    })


    function previewImage(id) {
        var oFReader = new FileReader();
        oFReader.readAsDataURL(document.getElementById(id).files[0]);

        oFReader.onload = function(oFREvent) {
            $('#image-preview').attr('src', oFREvent.target.result);
            $('#image-preview').show();
            $('.fa-spinner').removeClass('fa-spin');
            $('.fa-spinner').hide();
        };
    }


    $(".delete").on("click", function() {
        var id = $(this).data("key");
        var page = $(this).data("page");
        var selected = $(this).data("selected");
        swal({
            title: "Are you sure?",
            text: "This data will be lost",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "Yes, delete it!",
            closeOnConfirm: false
        }, function () {
            $.ajax({
                url: base_url + page + "/delete/" + id ,
                method: "post",
                // data: {id: id},
                success: (response => {
                    swal({
                        title: "Deleted! ",
                        text: selected +" was deleted!",
                        type: "success",
                        showCancelButton: false,
                        confirmButtonColor: "#337ab7",
                        confirmButtonText: "Done",
                        closeOnConfirm: false
                    }, function () {
                        window.location.href = base_url + page;
                    });
                })
            });
        });
    });




    $('.sortable').sortable({
        placeholder: 'ui-state-highlight',
    });



    $('.sortable').disableSelection();


    if($('#evaluation-chart').length) {

        var id = $('.evaluation-view').data('id');

        
        $.ajax({
            url: base_url + 'evaluation/get-chart/',
            data: {id: id},
            method: 'get',
            dataType: 'json',
            success: (res => {
                var pieChart = new Chart($('#evaluation-chart'), {
                    type: 'pie',
                    data: {
                        labels: res.labels,
                        datasets: [{
                        data: res.data,
                        backgroundColor: ['#FF6384', '#36A2EB', '#FFCE56', '#CCC'],
                        hoverBackgroundColor: ['#FF6384', '#36A2EB', '#FFCE56',  '#CCC']
                        }]
                    },
                    options: {
                        responsive: true
                    }
                }); // eslint-disable-next-line no-unused-vars
            })
        });




    }


})




function createDashboardChart(year) {
  $('#main-chart-wrapper').html('<canvas class="chart" id="dashboard-chart" height="300"></canvas>');
 

  $.ajax({
    url: base_url + 'dashboard/chart',
    data: {year: year},
    method: 'get',
    dataType: 'json',
    success: (res => {

      var mainChart = new Chart($('#dashboard-chart'), {
        // type: 'bar',
        type: 'line',
        data: {
          labels: res.labels,
          datasets: [{
            label: 'Quotation',
            backgroundColor: hexToRgba(getStyle('--info'), 10),
            borderColor: '#337ab7',
            pointHoverBackgroundColor: '#337ab7',
            borderWidth: 2,
            data: res.data.q_data
          },
          {
            label: 'Purchase Order',
            backgroundColor: hexToRgba(getStyle('--info'), 10),
            borderColor: '#20a8d8',
            pointHoverBackgroundColor: '#20a8d8',
            borderWidth: 2,
            data: res.data.po_data
          },
          {
            label: 'Job Order',
            backgroundColor: hexToRgba(getStyle('--info'), 10),
            borderColor: '#4dbd74',
            pointHoverBackgroundColor: '#4dbd74',
            borderWidth: 2,
            data: res.data.jo_data
          },
          {
            label: 'Base Stock',
            backgroundColor: hexToRgba(getStyle('--info'), 10),
            borderColor: '#f86c6b',
            pointHoverBackgroundColor: '#f86c6b',
            borderWidth: 2,
            data: res.data.stock_data
          }
          ], 
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
  });
}


if ($('#main-chart-wrapper').length) { 
  createDashboardChart($('#year-filter').val())
}

$('.btn-confirm-toc').on('click', function() {
        $('#agree-checkbox').prop('checked', true);
    });

if ($('.table thead th:first-child').html() == '#') {
    $('.table thead th:first-child').css('color', 'transparent');
}