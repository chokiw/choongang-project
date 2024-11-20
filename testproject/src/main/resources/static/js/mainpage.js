/**
 * 
 */
$(document).ready(function() {
	$(".logout").mouseover(function() {
		$(".logout").css("background-color", "gray");
	});
	$(".logout").mouseout(function() {
		$(".logout").css("background-color", "#305346");
	});

	$(".mypage").mouseover(function() {
		$(".mypage").css("background-color", "gray");
	});
	$(".mypage").mouseout(function() {
		$(".mypage").css("background-color", "#305346");
	});
	$(".sns").mouseover(function() {
		$(".sns").css("background-color", "#b4b4b4");
	});
	$(".sns").mouseout(function() {
		$(".sns").css("background-color", "white");
	});

	$(".mate").mouseover(function() {
		$(".mate").css("background-color", "#b4b4b4");
	});
	$(".mate").mouseout(function() {
		$(".mate").css("background-color", "white");
	});

	$(".record").mouseover(function() {
		$(".record").css("background-color", "#b4b4b4");
	});
	$(".record").mouseout(function() {
		$(".record").css("background-color", "white");
	});

	$(".ranking").mouseover(function() {
		$(".ranking").css("background-color", "#b4b4b4");
	});
	$(".ranking").mouseout(function() {
		$(".ranking").css("background-color", "white");
	});
	$("#track1").mouseenter(function() {
		$("#track1").css("z-index", "1000");
	});

	$("#track1").mouseleave(function() {
		$("#track1").css("z-index", "0");
	});

	$("#track2").mouseenter(function() {
		$("#track2").css("z-index", "1000");
	});

	$("#track2").mouseleave(function() {
		$("#track2").css("z-index", "0");
	});

	$("#track3").mouseenter(function() {
		$("#track3").css("z-index", "1000");
	});

	$("#track3").mouseleave(function() {
		$("#track3").css("z-index", "0");
	});

});
