
# collapsed directory
_fishy_collapsed_wd() {
    local color="%{$fg_no_bold[cyan]%}";
    local directory="$(pwd | perl -pe '
        BEGIN {
            binmode STDIN,  ":encoding(UTF-8)";
            binmode STDOUT, ":encoding(UTF-8)";
            }; 
        s|^$ENV{HOME}|~|g; s|/([^/.])[^/]*(?=/)|/$1|g; s|/\.([^/])[^/]*(?=/)|/.$1|g')";
    local color_reset="%{$reset_color%}";
    echo "${color}${directory}${color_reset}";
}


# git
ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[white]%}‹git:"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$reset_color%}%{$fg_bold[red]%} ✘%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$reset_color%}%{$fg_bold[green]%} ✔%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_ADDED="%{$reset_color%}%{$fg_bold[red]%} ✚%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$reset_color%}%{$fg_bold[red]%} ✹%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$reset_color%}%{$fg_bold[red]%} ✖%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$reset_color%}%{$fg_bold[red]%} ➜%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$reset_color%}%{$fg_bold[red]%} ═%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$reset_color%}%{$fg_bold[red]%} ✭%{$reset_color%}"

function update_git_status() {
    GIT_STATUS=$(git_prompt_info);
}

function git_status() {
    echo "${GIT_STATUS}"
}

# command
function update_command_status() {
    local arrow="";
    local color_reset="%{$reset_color%}";
    local reset_font="%{$fg_no_bold[white]%}";
    if $1; 
    then
        arrow="%{$fg_bold[red]%}>%{$fg_bold[yellow]%}>%{$fg_bold[green]%}>";
    else
        arrow="%{$fg_bold[red]%}>>>";
    fi
    COMMAND_STATUS="${arrow}${reset_font}${color_reset}";
}

update_command_status true;

function command_status() {
    echo "${COMMAND_STATUS}"
}

# command execute after
precmd() {
    # last_cmd
    local last_cmd_return_code=$?;
    local last_cmd_result=true;
    if [ "$last_cmd_return_code" = "0" ];
    then
        last_cmd_result=true;
    else
        last_cmd_result=false;
    fi

    # update_git_status
    update_git_status;

    # update_command_status
    update_command_status $last_cmd_result;

    # output command execute after
    # output_command_execute_after $last_cmd_result;
}

# set option
setopt PROMPT_SUBST;

# prompt
PROMPT='$(_fishy_collapsed_wd) $(command_status) ';
RPROMPT='$(git_status)'
