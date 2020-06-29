import Chart from 'chart.js';

const radarChart = () => {
  const radarDiv = document.getElementById("radar-container");
  if (radarDiv) {
    // const data = radarDiv.datasets;
    const data_stats = radarDiv.dataset.chart.split(',');
    const ctx = radarDiv.getContext('2d');
    const pokemonColor = radarDiv.dataset.color;
    const color = Chart.helpers.color;

  const colorMap = {
    bug: 'olive',
    dark: 'black',
    dragon: 'blue',
    electric: 'yellow',
    fairy: 'pink',
    fighting: 'red',
    fire: 'orange',
    flying: 'blue',
    ghost: 'purple',
    grass: 'green',
    ground: 'brown',
    ice: 'teal',
    normal: 'grey',
    poison: 'purple',
    psychic: 'pink',
    rock: 'grey',
    steel: 'grey',
    water: 'blue'
  };

    var myRadarChart = new Chart(ctx, {
    type: 'radar',
    data: {
    labels: ['Hp', 'Speed', 'Attack', 'Defense', 'Special Attack', 'Special Defense'],
    datasets: [{
        label: 'Stats',
        data: data_stats,
        backgroundColor: color(colorMap[pokemonColor]).alpha(0.2).rgbString(),
        borderColor: colorMap[pokemonColor],
        pointBackgroundColor: colorMap[pokemonColor],
    }]
  },
  options: {
    legend: {
            display: false,
         },
    scale: {
      gridLines: {
        circular: true
      },
      ticks: {
        beginAtZero: true
      },
    }
  },
});
  };
}

export { radarChart }



