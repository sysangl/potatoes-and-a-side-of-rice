var state = 0
mp.command('playlist-shuffle')

var commands = [
    'playlist-unshuffle',
    'playlist-shuffle'
]

function perform_action() {
    mp.command(commands[state])
    state = (state + 1) % commands.length
}

mp.add_key_binding('i','toggle-shuffle', perform_action)