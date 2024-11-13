local prev_dir = ""

local MAVEN_GOALS = {
    "pre-clean",
    "clean",
    "post-clean",
    "install",
    "validate",
    "initialize",
    "generate-sources",
    "process-sources",
    "generate-resources",
    "process-resources",
    "compile",
    "process-classes",
    "generate-test-sources",
    "process-test-sources",
    "generate-test-resources",
    "process-test-resources",
    "test-compile",
    "process-test-classes",
    "test",
    "prepare-package",
    "package",
    "pre-integration-test",
    "integration-test",
    "post-integration-test",
    "verify",
    "install",
    "deploy",
    "pre-site",
    "site",
    "post-site",
    "site-deploy",
    "archetype:generate",
    "dependency:tree",
    "exec:exec",
    "help:active-profiles",
    "help:all-profiles",
    "help:describe",
    "help:effective-pom",
    "help:effective-settings",
    "help:evaluate",
    "help:expressions",
    "help:help",
    "help:system",
    "plugin:help",
    "versions:display-dependency-updates",
    "versions:display-plugin-updates"
}

local function table_contains(tbl, value)
    for k,v in pairs(tbl) do
        if (v == value) then
            return true
        end
    end
    return false
end

local function colorize_maven_goals(arg_index, word, word_index, line_state, classifications, user_data)
    if table_contains(MAVEN_GOALS, word) then
        classifications:classifyword(word_index, "n")
    end
end

-- Initialize the argmatcher.
-- v1.3.12 and higher receive a command_word parameter as well, which is the
-- word in the command line that matched this argmatcher.
local function init_profiles(argmatcher, argindex)
    profiles = {}
    map = {}
    for line in io.popen("mvn help:all-profiles 2>nul"):lines() do
        local m = line:match("Profile Id: ([a-zA-Z0-9-_]+)")
        if m then
            if map[m] == nil then
                -- Prevent duplicates in profiles
                map[m] = 1
                table.insert(profiles, m)
            end
        end
    end
    profiles["loopchars"] = ","
    profiles["nowordbreakchars"] = ","
    return profiles
end

-- This function has the opportunity to reset and (re)initialize the argmatcher.
local function ondelay_init_profiles(argmatcher, command_word)
    local dir = os.getcwd()
    if prev_dir ~= dir then             -- When current directory has changed,
        prev_dir = dir                  -- Remember the new current directory,
        argmatcher:reset()              -- Reset the argmatcher,
        argmatcher:addarg({ delayinit=init_profiles }) -- And re-initialize it.
    end
end

local function register(argmatcher, command_word)
    argmatcher
    :addflags({"-am", "--also-make"})
    :addflags({"-amd", "--also-make-dependents"})
    :addflags({"-B", "--batch-mode"})
    :addflags({"-b", "--builder"} .. clink.argmatcher())
    :addflags({"-C", "--strict-checksums"})
    :addflags({"-c", "--lax-checksums"})
    :addflags({"-D", "--define"} .. clink.argmatcher())
    :addflags({"-e", "--errors"})
    :addflags({"-emp", "--encrypt-master-password"} .. clink.argmatcher())
    :addflags({"-ep", "--encrypt-password"} .. clink.argmatcher())
    :addflags({"-f", "--file"} .. clink.argmatcher():addarg(os.globfiles("*.xml")))
    :addflags({"-fae", "--fail-at-end"})
    :addflags({"-ff", "--fail-fast"})
    :addflags({"-fn", "--fail-never"})
    :addflags({"-gs", "--global-settings"} .. clink.argmatcher():addarg(os.globfiles("*.xml")))
    :addflags({"-gt", "--global-toolchains"} .. clink.argmatcher():addarg(os.globfiles("*.xml")))
    :addflags({"-h", "--help"})
    :addflags({"-l", "--log-file"} .. clink.argmatcher():addarg(os.globfiles("*.xml")))
    :addflags({"-llr", "--legacy-local-repository"})
    :addflags({"-N", "--non-recursive"})
    :addflags({"-npr", "--no-plugin-registry"})
    :addflags({"-npu", "--no-plugin-updates"})
    :addflags({"-nsu", "--no-snapshot-updates"})
    :addflags({"-ntp", "--no-transfer-progress"})
    :addflags({"-o", "--offline"})
    :addflags({"-P", "--active-profiles"} .. clink.argmatcher():setdelayinit(ondelay_init_profiles))
    :addflags({"-pl", "--projects"} .. clink.argmatcher())
    :addflags({"-rf", "--resume-from"} .. clink.argmatcher())
    :addflags({"-q", "--quiet"})
    :addflags({"-s", "--settings"} .. clink.argmatcher():addarg(os.globfiles("*.xml")))
    :addflags({"-t", "--toolchains"} .. clink.argmatcher():addarg(os.globfiles("*.xml")))
    :addflags({"-T", "--threads"} .. clink.argmatcher():addarg({1, 2, 3, 4, 5, 6, 7, 8, 9}))
    :addflags({"-U", "--update-snapshots"})
    :addflags({"-up", "--update-plugins"})
    :addflags({"-v", "--version"})
    :addflags({"-V", "--show-version"})
    :addflags({"-X", "--debug"})
    :addflags({"-DskipITs"})
    :addflags({"-DskipTests"})
    :addflags({"-Dmaven.test.skip=true"})
    :addarg(MAVEN_GOALS)
    :setclassifier(colorize_maven_goals)
    :loop(1)
    :nofiles();
end

-- Add custom args completions for mvn launcher
local p = clink.argmatcher("mvn")
:setdelayinit(register)
