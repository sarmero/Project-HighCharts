Highcharts.chart('barCharts', {
    chart: {
        type: 'bar',
        zoomType: 'y'
    },
    title: {
        text: 'Total ventas'
    },
    subtitle: {
        text:
        '<h1>Productos</h1>'
    },
    xAxis: {
        categories: [],
        title: {
            text: 'Productos'
        },
        accessibility: {
            description: 'Countries'
        }
    },
    yAxis: {
        min: 0,
        max: 20,
        tickInterval: 10,
        title: {
            text: null
        },
        accessibility: {
            description: 'Ventas de productos',
            rangeDescription: 'Range: 0 to 20%.'
        },
        labels: {
            overflow: 'justify',
            format: '{value}%'
        }
    },
    plotOptions: {
        bar: {
            dataLabels: {
                enabled: true,
                format: '{y}%'
            }
        }
    },
    tooltip: {
        valueSuffix: '%',
        stickOnContact: true,
        backgroundColor: 'rgba(255, 255, 255, 0.93)'
    },
    legend: {
        enabled: false
    },
    series: [
        {
            name: 'Ventas',
            color: '#a5d6a7',
            borderColor: '#60A465',
            data: []
        }
    ]
});

dataVentas();

function dataVentas() {

    $.ajax({
        url: 'service/salesProduct.php',
        method: 'GET',
        dataType: 'json',
        success: function (response) {
            if (response.length > 0) {
                // console.log('ventas: ', response);

                var chart = Highcharts.charts[1];

                if (chart) {
                    var data = response.map(function (item) {
                        return Number(item.ventas);
                    });

                    var categories = response.map(function (item) {
                        return item.prod+' ('+item.marca+')';
                    });

                    chart.series[0].setData(data);
                    chart.xAxis[0].setCategories(categories);
                    
                } 
            }
        },
        error: function (xhr, status, error) {
            console.log('Error al obtener los datos:', error);
        }
    });
}