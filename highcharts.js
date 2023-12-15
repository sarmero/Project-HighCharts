
Highcharts.chart('container', {
    chart: {
        type: 'pie'
    },
    title: {
        text: 'Total de ventas'
    },
    tooltip: {
        valueSuffix: '%'
    },
    subtitle: {
        text:
            '<h1>Proveedores</h1>'
    },
    plotOptions: {
        series: {
            allowPointSelect: true,
            cursor: 'pointer',
            dataLabels: [{
                enabled: true,
                distance: 20
            }, {
                enabled: true,
                distance: -40,
                format: '{point.percentage:.0f}%',
                style: {
                    fontSize: '1.2em',
                    textOutline: 'none',
                    opacity: 0.7
                },
                filter: {
                    operator: '>',
                    property: 'percentage',
                    value: 10
                }
            }]
        }
    },
    series: [
        {
            name: 'Percentage',
            colorByPoint: true,
            data: []
        }
    ]
});

dataVentas();

function dataVentas() {

    $.ajax({
        url: 'service/sales.php',
        method: 'GET',
        dataType: 'json',
        success: function (response) {
            if (response.length > 0) {
                // console.log('ventas: ', response);

                var chart = Highcharts.charts[0];

                if (chart) {
                    var data = response.map(function (item) {
                        return { name: item.marca, y: Number(item.ventas) };
                    });

                    chart.series[0].setData(data);
                } 
            }
        },
        error: function (xhr, status, error) {
            console.log('Error al obtener los datos:', error);
        }
    });
}
