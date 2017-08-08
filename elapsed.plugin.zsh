humanize_duration() {
  awk '
        function hmTime(time,   stamp) {
            split("h:m:s:ms", units, ":")
            for (i = 2; i >= -1; i--) {
                if (t = int( i < 0 ? time % 1000 : time / (60 ^ i * 1000) % 60 )) {
                    stamp = stamp t units[sqrt((i - 2) ^ 2) + 1] " "
                }
            }
            if (stamp ~ /^ *$/) {
                return "0ms"
            }
            return substr(stamp, 1, length(stamp) - 1)
        }
        {
            print hmTime($0)
        }
    '
}

_elapsed_preexec() {
    _timer=$(date +%s)
}

_elapsed_precmd() {
    [[ -z "$_timer" ]] && return

    local now
    now=$(date +%s)
    _elapsed=$(($now - $_timer))
    unset _timer
}

P9K_ELAPSED_BG_COLOR="black"
P9K_ELAPSED_ALARM_HIGH_COLOR="red"
P9K_ELAPSED_ALARM_LOW_COLOR="gray"

prompt_elapsed() {
    [[ -z "$_elapsed" ]] && return

    local humanized result_color
    if [[ $_elapsed -ge 10 ]]; then # if below 10 don't show
        humanized=$(echo $((_elapsed * 1000)) | humanize_duration)

        if [[ $_elapsed -ge 60 ]]; then
            result_color=$P9K_ELAPSED_ALARM_HIGH_COLOR
        else
            result_color=$P9K_ELAPSED_ALARM_LOW_COLOR
        fi

        "$1_prompt_segment" "$0" "$2" "${P9K_ELAPSED_BG_COLOR}" "${result_color}" "${humanized}" ''
        # ^ kP         icon  ^    ^kP  ^ bg color                ^ fg color        ^ text         ^ icon
    fi
    unset _elapsed
}

add-zsh-hook precmd _elapsed_precmd
add-zsh-hook preexec _elapsed_preexec
