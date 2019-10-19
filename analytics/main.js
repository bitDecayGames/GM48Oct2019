// TODO: replace this with real data
const dataRAW = {
  "event" : {
    "-dfasdfasdsdasdasdfadsffadffsdfas" : {
      "date" : "2019-10-19T01:41:20",
      "game_guid" : "EEasdfasdB6E8asd1-8951-7C52-F621-66FEBD7E2005",
      "name" : "checkpoint_0",
      "x" : -1,
      "y" : -1
    }
  }
};

const data = [];
for (var key in dataRAW.event) {
	if (dataRAW.event.hasOwnProperty(key)) data.push(dataRAW.event[key]);
}



function shadeColor2(color, percent) {   
    var f=parseInt(color.slice(1),16),t=percent<0?0:255,p=percent<0?percent*-1:percent,R=f>>16,G=f>>8&0x00FF,B=f&0x0000FF;
    return "#"+(0x1000000+(Math.round((t-R)*p)+R)*0x10000+(Math.round((t-G)*p)+G)*0x100+(Math.round((t-B)*p)+B)).toString(16).slice(1);
}

function blendColors(c0, c1, p) {
    var f=parseInt(c0.slice(1),16),t=parseInt(c1.slice(1),16),R1=f>>16,G1=f>>8&0x00FF,B1=f&0x0000FF,R2=t>>16,G2=t>>8&0x00FF,B2=t&0x0000FF;
    return "#"+(0x1000000+(Math.round((R2-R1)*p)+R1)*0x10000+(Math.round((G2-G1)*p)+G1)*0x100+(Math.round((B2-B1)*p)+B1)).toString(16).slice(1);
}

function sumReduce(sum, num) {
	return sum + 1;
}

const colors = [
	"#FF8C00",
	"#778899",
	"#66CDAA",
	"#1E90FF",
	"#00BFFF",
	"#C71585",
	"#B0E0E6",
	"#A0522D",
	"#FFDEAD",
	"#B0C4DE",
	"#9400D3",
];

const numberOfTotalCheckpoints = 5;

function getUniqueGuids(eventName) {
	let uniqueGuidsMap = {};
	data.forEach(d => {
		uniqueGuidsMap[d.game_guid] = 1;
	});
	let uniqueGuids = [];
	for (let key in uniqueGuidsMap) {
		if (uniqueGuidsMap.hasOwnProperty(key)) uniqueGuids.push(key);
	}
	return uniqueGuids;
}

function calculateUniqueGameEvents(eventName) {
	let uniqueGuidsMap = {};
	data.forEach(d => {
		if (d.name === eventName) uniqueGuidsMap[d.game_guid] = 1;
	});
	let uniqueGuids = [];
	for (let key in uniqueGuidsMap) {
		if (uniqueGuidsMap.hasOwnProperty(key)) uniqueGuids.push(key);
	}
	return uniqueGuids.length;
}

function dateStringToMoment(dateStr) {
	return moment(dateStr, "YYYY-MM-DDTHH:mm:ss");
}

function shuffleColors() {
	let i = colors.length - 1;
	for(; i > 0; i--){
		const j = Math.floor(Math.random() * i);
		const temp = colors[i];
		colors[i] = colors[j];
		colors[j] = temp;
	}
}

function totalPlaysChart() {
	let totalPlays = getUniqueGuids().length;
	let totalWins = calculateUniqueGameEvents("completed");
	let totalInstructions = calculateUniqueGameEvents("instructions");
	let totalCredits = calculateUniqueGameEvents("view_credits");

	Highcharts.chart('TotalPlays', {
	    chart: {
	        type: 'column'
	    },
	    title: {
	        text: 'Totals'
	    },
	    xAxis: {
	        categories: ['Plays', 'Wins', 'Instructions', 'Credits'],
	        title: {
	            text: null
	        }
	    },
	    yAxis: {
	        min: 0,
	        title: {
	            text: 'Count'
	        },
	        labels: {
	            overflow: 'justify'
	        }
	    },
	    plotOptions: {
	        bar: {
	            dataLabels: {
	                enabled: true
	            }
	        }
	    },
	    legend: {
	        x: -40,
	        y: 80,
	        floating: true,
	        borderWidth: 1,
	        backgroundColor:
	            Highcharts.defaultOptions.legend.backgroundColor || '#FFFFFF',
	        shadow: true
	    },
	    series: [{
	        name: 'Total',
	        data: [{y:totalPlays, color:colors[0]}, {y:totalWins, color:colors[1]}, {y:totalInstructions, color:colors[2]}, {y:totalCredits, color:colors[3]}]
	    }]
	});
}

function checkpointsChart() {
	let checkpointCounts = [];
	let checkpointNames = [];
	for (let i = 0; i < numberOfTotalCheckpoints; i++){
		let name = "checkpoint_" + i;
		checkpointNames.push(name);
		checkpointCounts.push(calculateUniqueGameEvents(name));
	}

	Highcharts.chart('Checkpoints', {
	    chart: {
	        type: 'column'
	    },
	    title: {
	        text: 'Checkpoints'
	    },
	    xAxis: {
	        categories: checkpointNames,
	        title: {
	            text: null
	        }
	    },
	    yAxis: {
	        min: 0,
	        title: {
	            text: 'Count'
	        },
	        labels: {
	            overflow: 'justify'
	        }
	    },
	    plotOptions: {
	        bar: {
	            dataLabels: {
	                enabled: true
	            }
	        }
	    },
	    legend: {
	        x: -40,
	        y: 80,
	        floating: true,
	        borderWidth: 1,
	        backgroundColor:
	            Highcharts.defaultOptions.legend.backgroundColor || '#FFFFFF',
	        shadow: true
	    },
	    series: [{
	        name: 'Total',
	        data: checkpointCounts.map((c, i) => {return {y:c, color:colors[i]};})
	    }]
	});
}

function timePlayedChart() {

	let uniqueGuids = getUniqueGuids();
	let timesPlayed = uniqueGuids.map(guid => {
		let allEventsForGuid = data.filter(d => d.game_guid === guid).sort((a, b) => dateStringToMoment(b.date).utc() - dateStringToMoment(a.date).utc());
		let first = allEventsForGuid[0];
		let last = allEventsForGuid[allEventsForGuid.length - 1];
		let diff = dateStringToMoment(first.date).diff(dateStringToMoment(last.date), "minutes");
		return diff;
	});

	let sortedTimes = timesPlayed.sort((a, b) => a - b);
	let shortestPlay = sortedTimes[0];
	let longestPlay = sortedTimes[sortedTimes.length - 1];

	let timeGroups = [];
	let timeGroupNames = [];

	timeGroupNames.push("0-5min");
	timeGroups.push(timesPlayed.filter(d => d >= 0 && d < 5).reduce(sumReduce, 0));

	timeGroupNames.push("5-10min");
	timeGroups.push(timesPlayed.filter(d => d >= 5 && d < 10).reduce(sumReduce, 0));

	timeGroupNames.push("10-15min");
	timeGroups.push(timesPlayed.filter(d => d >= 10 && d < 15).reduce(sumReduce, 0));

	timeGroupNames.push("15-20min");
	timeGroups.push(timesPlayed.filter(d => d >= 15 && d < 20).reduce(sumReduce, 0));

	timeGroupNames.push(">20min");
	timeGroups.push(timesPlayed.filter(d => d >= 20).reduce(sumReduce, 0));

	Highcharts.chart('TimePlayed', {
	    chart: {
	        type: 'column'
	    },
	    title: {
	        text: `Time Played (${shortestPlay}-${longestPlay}min)`
	    },
	    xAxis: {
	        categories: timeGroupNames,
	        title: {
	            text: null
	        }
	    },
	    yAxis: {
	        min: 0,
	        title: {
	            text: 'Count'
	        },
	        labels: {
	            overflow: 'justify'
	        }
	    },
	    plotOptions: {
	        bar: {
	            dataLabels: {
	                enabled: true
	            }
	        }
	    },
	    legend: {
	        x: -40,
	        y: 80,
	        floating: true,
	        borderWidth: 1,
	        backgroundColor:
	            Highcharts.defaultOptions.legend.backgroundColor || '#FFFFFF',
	        shadow: true
	    },
	    series: [{
	        name: 'Total',
	        data: timeGroups.map((c, i) => {return {y:c, color:colors[i]};})
	    }]
	});
}

document.onreadystatechange = function () {
	if (document.readyState == "interactive") {
		shuffleColors();
		totalPlaysChart();
		shuffleColors();
		checkpointsChart();
		shuffleColors();
		timePlayedChart();
	}
}