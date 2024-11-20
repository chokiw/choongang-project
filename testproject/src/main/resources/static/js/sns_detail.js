/**
 * 화면 css칼라값과 카카오맵 경로
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

});