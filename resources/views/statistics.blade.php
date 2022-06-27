<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Laravel Chart</title>
    </head>
    <body>
        <div id="chart-container"> </div>
        <script src="https://code.highcharts.com/highcharts.js"></script>
        <script>
            var datas = @php echo json_encode($datas) @endphp
            Highchats.chart('chart-container',{
                title:{
                    text:'New User Growth, 2020'
                },
                subtitle:{
                    text: 'Source: Surfside Media'
                },
                xAxis:{
                    categories:['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
                },
                yAxis:{
                    text:'Number of New User'
                },
                legend:{
                    layout:'vertical',
                    align:'right',
                    verticalAlign:'middle'
                },
                plotOptions:{
                    series:{
                        allowPontSelect:true
                    }
                },
                series:[{
                    name:'New User',
                    data:datas
                }],
                responsive:{
                    rules:[
                        {
                            condition:{
                                mawWidth:500
                            },
                            chartOptions:{
                                legend:{
                                    layout:'horizontal',
                                    align:'center',
                                    verticalAlign:'bottom'
                                }
                            }
                        }
                    ]
                }
            })
        </script>
    </body>
</html>


{{-- ========&&======== --}}
  {{--  <div id="chart-container"> </div>
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script>
        var datas = 10
        Highcharts.chart('chart-container',{
            title:{
                text:'New User Growth, 2020'
            },
            subtitle:{
                text: 'Source: Surfside Media'
            },
            xAxis:{
                categories:['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
            },
            yAxis:{
                text:'Number of New User'
            },
            legend:{
                layout:'vertical',
                align:'right',
                verticalAlign:'middle'
            },
            plotOptions:{
                series:{
                    allowPontSelect:true
                }
            },
            series:[{
                name:'New User',
                data:datas
            }],
            responsive:{
                rules:[
                    {
                        condition:{
                            mawWidth:500
                        },
                        chartOptions:{
                            legend:{
                                layout:'horizontal',
                                align:'center',
                                verticalAlign:'bottom'
                            }
                        }
                    }
                ]
            }
        })
    </script> --}}

    {{-- 
    <script type="text/javascript">
        let chart =  JSON.parse('<?php echo $chart ?>');
            
            Highcharts.chart('container', {
                title: {
                    text: 'New User Growth, 2019'
                },
                subtitle: {
                    text: 'Source: tutsmake.com'
                },
                xAxis: {
                    categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
                },
                yAxis: {
                    title: {
                        text: 'Number of New Users'
                    }
                },
                legend: {
                    layout: 'vertical',
                    align: 'right',
                    verticalAlign: 'middle'
                },
                plotOptions: {
                    series: {
                        allowPointSelect: true
                    }
                },
                series: [{
                    name: 'New Users',
                    data: chart
                }],
                responsive: {
                    rules: [{
                        condition: {
                            maxWidth: 500
                        },
                        chartOptions: {
                            legend: {
                                layout: 'horizontal',
                                align: 'center',
                                verticalAlign: 'bottom'
                            }
                        }
                    }]
                }
        });
    </script> --}}



    
{{-- 
var visites =  <?php echo json_encode($visites)?>;
//console.log(users)
Highcharts.chart('container', 
{
    chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: 'pie'
        },
    title: {
        text: 'New Visite Growth, 2022'
    },
    tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
    subtitle: {
        text: 'Source: Gesttion-Patients.com'
    },
    xAxis: {
    categories: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September',
        'October', 'November', 'December'
    ]
    },
    yAxis: {
        title: {
            text: 'Number of New Visites'
        }
    },
    legend: {
        layout: 'vertical',
        align: 'right',
        verticalAlign: 'middle'
    },
    accessibility: {
            point: {
                valueSuffix: '%'
            }
        },
    plotOptions: {
        series: {
            allowPointSelect: true
        },
        pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    format: '<b>{point.name}</b>: {point.percentage:.1f} %'
                }
            }    
    },
    series: [{
        name: 'New Visites',
        data: visites
    }],
    responsive: {
        rules: [{
            condition: {
                maxWidth: 500
            },
            chartOptions: {
                legend: {
                    layout: 'horizontal',
                    align: 'center',
                    verticalAlign: 'bottom'
                }
            }
        }]
    }
});
</script>
 --}}

 var visites =  <?php echo json_encode($visites)?>;
        //console.log(users)
        Highcharts.chart('container', {
           
            title: {
                text: 'New Visite Growth, 2022'
            },
            subtitle: {
                text: 'Source: Gesttion-Patients.com'
            },
            xAxis: {
            categories: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September',
                'October', 'November', 'December'
            ]
        },
            yAxis: {
                title: {
                    text: 'Number of New Visites'
                }
            },
            legend: {
                layout: 'vertical',
                align: 'right',
                verticalAlign: 'middle'
            },
            plotOptions: {
                series: {
                    allowPointSelect: true
                }
            },
            series: [{
                name: 'New Visites',
                data: visites
            }],
            responsive: {
                rules: [{
                    condition: {
                        maxWidth: 500
                    },
                    chartOptions: {
                        legend: {
                            layout: 'horizontal',
                            align: 'center',
                            verticalAlign: 'bottom'
                        }
                    }
                }]
            }
        });
    </script>

    
{{-- 
@if ($dataType->slug == 'visites')    
<form  action="{{ route('export') }}" method="POST">
    @csrf
    <div class="row">
    
        @if(Session::has('branche'))
        @php
            $branche_id = Session::get('branche');
        @endphp
        <input name="branche_id"  type="hidden" value="{{ $branche_id }}">
        @endif

        @if(Session::has('service'))
        @php
            $service_id = Session::get('service');
        @endphp
        <input name="service_id"  type="hidden" value="{{ $service_id }}">
        @endif

        @if(Session::has('annee'))
        @php
            $annee = Session::get('annee');
        @endphp
        <input name="annee"  type="hidden" value="{{ $annee }}">
        @endif
        <div class="col-md-10"></div>
        <div class="col-md-2"> <br>
            <style>
                .btn {
                    color:#fff;
                    background-color: #2a7493
                }
            </style>
            <button class="btn" type="submit" >Exporter</button>
        </div>
    </div>
</form>
@endif --}}
 