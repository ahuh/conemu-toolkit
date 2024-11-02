-- Register Oh My Posh custom prompt for Clink
load(io.popen('oh-my-posh init cmd --config "%CONEMU_TOOLKIT_PATH%\\posh\\themes\\ahuh-conemu.json"'):read("*a"))()