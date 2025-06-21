#! /bin/sh
bepo="
input {
    kb_layout = fr
    kb_variant = bepo
    kb_model =
    kb_options = ctrl:nocaps
    kb_rules =

    follow_mouse = 1
    sensitivity = 0.7 # -1.0 - 1.0, 0 means no modification.

    touchpad {
        natural_scroll = false
    }
}

gestures {
    workspace_swipe = true
}

device {
    name = 
    sensitivity = 0.9
}"

fr="
input {
    kb_layout = fr
    kb_variant = 
    kb_model =
    kb_options = ctrl:nocaps
    kb_rules =

    follow_mouse = 1
    sensitivity = 0.7 # -1.0 - 1.0, 0 means no modification.

    touchpad {
        natural_scroll = false
    }
}

gestures {
    workspace_swipe = true
}

device {
    name = 
    sensitivity = 0.9
}"

us="
input {
    kb_layout = us
    kb_variant = 
    kb_model =
    kb_options = ctrl:nocaps
    kb_rules =

    follow_mouse = 1
    sensitivity = 0.7 # -1.0 - 1.0, 0 means no modification.

    touchpad {
        natural_scroll = false
    }
}

gestures {
    workspace_swipe = true
}

device {
    name = 
    sensitivity = 0.9
}"

currentlayout=$(cat /home/user/.config/script/currentlayout)

if [ $currentlayout = "fr-bepo" ]; then
    echo "$fr" > /home/user/.config/hypr/input.conf
    echo "fr" > /home/user/.config/script/currentlayout
elif [ $currentlayout = "fr" ]; then
    echo "$us" > /home/user/.config/hypr/input.conf
    echo "us" > /home/user/.config/script/currentlayout
else
    echo "$bepo" > /home/user/.config/hypr/input.conf
    echo "fr-bepo" > /home/user/.config/script/currentlayout
fi
