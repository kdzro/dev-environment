#!/usr/bin/env python3
import json
import subprocess

ICON_PLAYING = ""
ICON_PAUSED = ""
ICON_STOPPED = "ﱙ"
MAX_LENGTH = 35


def run_command(command):
    try:
        result = subprocess.run(
            command, shell=True, capture_output=True, text=True, check=True
        )
        return result.stdout.strip()
    except subprocess.CalledProcessError:
        return None


def format_time(microseconds):
    seconds = microseconds // 1000000
    minutes = seconds // 60
    seconds %= 60
    return f"{minutes:02d}:{seconds:02d}"


def get_spotify_info():
    output = {}
    player_status = run_command("playerctl --player=spotify status")

    if player_status is None:
        output["text"] = f"{ICON_STOPPED}"
        output["class"] = "stopped"
        output["tooltip"] = "Spotify não está rodando"
    else:
        artist = run_command("playerctl --player=spotify metadata artist")
        title = run_command("playerctl --player=spotify metadata title")
        album = run_command("playerctl --player=spotify metadata album")
        length_us_str = run_command("playerctl --player=spotify metadata mpris:length")

        display_text = f"{artist} - {title}"
        if len(display_text) > MAX_LENGTH:
            display_text = display_text[:MAX_LENGTH] + "..."

        tooltip = f"Álbum: {album}"
        if length_us_str and length_us_str.isdigit():
            duration = format_time(int(length_us_str))
            tooltip += f"\nDuração: {duration}"

        if player_status == "Playing":
            output["text"] = f"{ICON_PLAYING} {display_text}"
            output["class"] = "playing"
            output["tooltip"] = f"Tocando: {title}\n{tooltip}"
        elif player_status == "Paused":
            output["text"] = f"{ICON_PAUSED} {display_text}"
            output["class"] = "paused"
            output["tooltip"] = f"Pausado: {title}\n{tooltip}"

    return json.dumps(output)


if __name__ == "__main__":
    print(get_spotify_info())
