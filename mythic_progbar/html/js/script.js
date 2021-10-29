var cancelledTimer = null;

$('document').ready(function() {
    let MythicProgBar = {};
    let currentAtMs = 0;
    let isSkillCheck = false;

    MythicProgBar.SetGame = data => {
        if(data.skill_check) isSkillCheck = true
        if(!data.skill_check) isSkillCheck = false
        // console.log('inserting first one at', insertMsOne)
        let firstPointPercent = Math.floor((data.first_point / data.duration) * 100);
        let secondPointPercent = Math.floor((data.second_point / data.duration) * 100);
        $('.skill-check').show()
        $('.skill-check-a').attr('style', `left: ${firstPointPercent}%`)
        $('.skill-check-b').attr('style', `left: ${secondPointPercent}%`)
        MythicProgBar.Game = {firstPointPercent: firstPointPercent, secondPointPercent: secondPointPercent, duration: data.duration };
    }

    MythicProgBar.TryGameHit = data => {
        if (!MythicProgBar.Game) return false
        const firstPointPercent = MythicProgBar.Game.firstPointPercent
        const secondPointPercent = MythicProgBar.Game.secondPointPercent
        let subAmount = 0
        if(MythicProgBar.Game.duration > 15000)
        {
            subAmount = 1
        } else if (MythicProgBar.Game.duration > 10000)
        {
            subAmount = 2
        } else if (MythicProgBar.Game.duration > 8000)
        {
            subAmount = 3
        } else if (MythicProgBar.Game.duration > 6000)
        {
            subAmount = 4
        } else if (MythicProgBar.Game.duration > 5000)
        {
            subAmount = 5
        } else if (MythicProgBar.Game.duration > 4000)
        {
            subAmount = 6
        } else if (MythicProgBar.Game.duration > 3000)
        {
            subAmount = 7
        } else if (MythicProgBar.Game.duration > 2000)
        {
            subAmount = 9
        } else {
            subAmount = 15
        }
        const currentPercentComplete = Math.floor((currentAtMs / MythicProgBar.Game.duration) * 100) - subAmount //f this is a hack
        // console.log(`${firstPointPercent} - ${currentPercentComplete} - ${secondPointPercent}`);
        if (firstPointPercent <= currentPercentComplete && secondPointPercent >= currentPercentComplete) {
            MythicProgBar.CompleteByGame();
        }
    }

    MythicProgBar.Progress = function(data) {
        clearTimeout(cancelledTimer);
        // $('.skill-check').hide();

        $("#progress-label").text(data.label);

        $(".progress-container").fadeIn('fast', function() {
            $("#progress-bar").stop().css({"width": 0, "background-color": "rgba(0, 0, 0, 0.75)"})
                .animate(
                    {
                        width: '100%'
                    },
                    {
                    speed: 100,
                    easing: 'linear',
                    duration: parseInt(data.duration),
                    complete: () => { onComplete() },
                    progress: (anim, progress, remainingMs) => {
                            currentAtMs = data.duration - remainingMs
                        },
                }, 'linear');
        });
    };

    function onComplete() {
        if (isSkillCheck) {
            $("#progress-label").text("FAILED");
            $("#progress-bar").stop().css( {"width": "100%", "background-color": "rgba(71, 0, 0, 0.8)"});
            $('#progress-bar').removeClass('cancellable');
            $.post('http://mythic_progbar/skillCheckFailed', JSON.stringify({}));
            cancelledTimer = setTimeout(function () {
                $(".progress-container").fadeOut('fast', function() {
                    $("#progress-bar").css("width", 0);
                });
            }, 1000);
        } else {
            $(".progress-container").fadeOut('fast', function() {
                $('#progress-bar').removeClass('cancellable');
                $("#progress-bar").css("width", 0);
                $('.skill-check').hide()
                $.post('http://mythic_progbar/actionFinish', JSON.stringify({}));
            });
        }
    }

    MythicProgBar.ProgressCancel = function() {
        $("#progress-label").text("CANCELLED");
        $("#progress-bar").stop().css( {"width": "100%", "background-color": "rgba(71, 0, 0, 0.8)"});
        $('#progress-bar').removeClass('cancellable');

        cancelledTimer = setTimeout(function () {
            $(".progress-container").fadeOut('fast', function() {
                $("#progress-bar").css("width", 0);
                $('.skill-check').hide()
                $.post('http://mythic_progbar/actionCancel', JSON.stringify({
                    })
                );
            });
        }, 1000);
    };

    MythicProgBar.CompleteByGame = function() {
        // let audio = new Audio('./sounds/win.mp3');
        // audio.volume = 0.001
        // audio.play();

        if (isSkillCheck) {
            $.post('http://mythic_progbar/skillCheckPassed', JSON.stringify({}));
            $("#progress-label").text("PASSED");
            $("#progress-bar").stop().css( {"width": "100%", "background-color": "rgba(59,153,0,0.8)"});
        } else {
            $.post('http://mythic_progbar/actionFinish', JSON.stringify({}));
            $("#progress-label").text("FAST FORWARD");
            $("#progress-bar").stop().css( {"width": "100%", "background-color": "rgba(59,153,0,0.8)"});
        }

        cancelledTimer = setTimeout(function () {
            $(".progress-container").fadeOut('fast', function() {
                $('#progress-bar').removeClass('cancellable');
                $("#progress-bar").css("width", 0);
                $('.skill-check').hide()
            });
        }, 100);
    };

    MythicProgBar.CloseUI = function() {
        $('.main-container').fadeOut('fast');
        $('.skill-check').hide()
        clearInterval(interval);
        isSkillCheck = false
    };
    
    window.addEventListener('message', function(event) {
        switch(event.data.action) {
            case 'mythic_progress':
                MythicProgBar.Progress(event.data);
                break;
            case 'mythic_set_game':
                MythicProgBar.SetGame(event.data);
                break;
            case 'mythic_try_game_hit':
                MythicProgBar.TryGameHit(event.data);
                break;
            case 'mythic_progress_cancel':
                MythicProgBar.ProgressCancel();
                break;
        }
    });
});