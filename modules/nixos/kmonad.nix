{ config, lib, pkgs, spec, ... }:

{
   services.kmonad = {
   enable = true;
   keyboards = {
     "usb-04f3_USB_Keyboard-event-kbd" = {
       device = "/dev/input/by-id/usb-04f3_USB_Keyboard-event-kbd";
       config = ''
(defcfg
  input  (device-file "/dev/input/by-id/usb-04f3_USB_Keyboard-event-kbd")
  output (uinput-sink "My KMonad output")
  cmp-seq ralt    ;; Set the compose key to `RightAlt'
  cmp-seq-delay 5 ;; 5ms delay between each compose-key sequence press
  fallthrough true
  allow-cmd true
)

;; https://en.wikipedia.org/wiki/British_and_American_keyboards#/media/File:KB_United_States-NoAltGr.svg
(defsrc
  esc  f1   f2   f3   f4   f5   f6   f7   f8   f9   f10  f11  f12        ssrq slck pause
  grv  1    2    3    4    5    6    7    8    9    0    -    =    bspc  ins  home pgup  nlck kp/  kp*  kp-
  tab  q    w    e    r    t    y    u    i    o    p    [    ]    ret   del  end  pgdn  kp7  kp8  kp9  kp+
  caps a    s    d    f    g    h    j    k    l    ;    '    \                          kp4  kp5  kp6
  lsft 102d z    x    c    v    b    n    m    ,    .    /    rsft            up         kp1  kp2  kp3  kprt
  lctl lmet lalt           spc                 ralt rmet cmp  rctl       left down rght  kp0  kp.
)

(defalias
  vim  (tap-next-release esc (layer-toggle capsvim)) 
  lft  (tap-next-release lsft (layer-toggle shifted))
  rft  (tap-next-release rsft (layer-toggle shifted))
  agr  (tap-next-release ralt (layer-toggle altgr))  
  aft  (tap-next-release (around ralt lsft) (layer-toggle altgrshift)) 
  mpr  (tap-next-release lmet (layer-toggle super))  
  spr  (tap-next-release lmet (layer-toggle supershifted))
  sp1  M-S-1
  sp2  M-S-2
  sp3  M-S-3
  sp4  M-S-4
  sp5  M-S-5
  sp6  M-S-6
  sp7  M-S-7
  sp8  M-S-8
  sp9  M-S-9
  sp0  M-S-0
  mbc  M-bspc
  sbc  M-S-bspc
  srt  M-S-ret
  mgv  M-grv
  sgv  M-S-grv
  mbl  M-\\
  sbl  M-S-\\
  st   (around lshift tab)
  clt  C-left
  crt  C-right
  ü    #(ralt " u)
  ö    #(ralt " o)
  ä    #(ralt " a)
  Ü    #(ralt " U)
  Ö    #(ralt " O)
  Ä    #(ralt " A)
)

(deflayer base
  esc  f1   f2   f3   f4   f5   f6   f7   f8   f9   f10  f11  f12        ssrq slck pause
  ^    1    2    3    4    5    6    7    8    9    0    ß    ´    bspc  ins  home pgup  nlck kp/  kp*  kp-
  tab  q    w    e    r    t    z    u    i    o    p    \\   +    ret   del  end  pgdn  kp7  kp8  kp9  kp+
  @vim a    s    d    f    g    h    j    k    l    [    {    #                          kp4  kp5  kp6
  @lft <    y    x    c    v    b    n    m    ,    .    -    @rft            up         kp1  kp2  kp3  kprt
  lctl @mpr lalt           spc                 @agr rmet cmp  rctl       left down rght  kp0  kp.
)

(deflayer shifted
  esc  f1   f2   f3   f4   f5   f6   f7   f8   f9   f10  f11  f12        ssrq slck pause
  °    !    "    §    $    %    &    /    \(   \)   =    ?    `    bspc  ins  home pgup  nlck kp/  kp*  kp-
  @st  Q    W    E    R    T    Z    U    I    O    P    |    *    ret   del  end  pgdn  kp7  kp8  kp9  kp+
  caps A    S    D    F    G    H    J    K    L    ]    }    '                          kp4  kp5  kp6
  lsft >    Y    X    C    V    B    N    M    ;    :    \_   rsft            up         kp1  kp2  kp3  kprt
  lctl lmet lalt          S-spc                 ralt rmet cmp  rctl       left down rght  kp0  kp.
)

(deflayer super
  esc  f1   f2   f3   f4   f5   f6   f7   f8   f9   f10  f11  f12        ssrq slck pause
  @mgv M-1  M-2  M-3  M-4  M-5  M-6  M-7  M-8  M-9  M-0  M-ß  M-´  @mbc  ins  home pgup  nlck kp/  kp*  kp-
  tab  M-q  M-w  M-e  M-r  M-t  M-z  M-u  M-i  M-o  M-p  M-\  M-+  M-ret del  end  pgdn  kp7  kp8  kp9  kp+
  caps M-a  M-s  M-d  M-f  M-g  M-h  M-j  M-k  M-l  M-[  M-{  @mbl                       kp4  kp5  kp6
  @spr M-<  M-y  M-x  M-c  M-v  M-b  M-n  M-m  M-,  M-.  M--  rsft            up         kp1  kp2  kp3  kprt
  lctl lmet lalt           spc                 @agr rmet cmp  rctl       left down rght  kp0  kp.
)

(deflayer supershifted
  esc  f1   f2   f3   f4   f5   f6   f7   f8   f9   f10  f11  f12        ssrq slck pause
  @sgv @sp1 @sp2 @sp3 @sp4 @sp5 @sp6 @sp7 @sp8 @sp9 @sp0 ?    `    @sbc  ins  home pgup  nlck kp/  kp*  kp-
  tab  M-Q  M-W  M-E  M-R  M-T  M-Z  M-U  M-I  M-O  M-P  M-|  M-*  @srt  del  end  pgdn  kp7  kp8  kp9  kp+
  caps M-A  M-S  M-D  M-F  M-G  M-H  M-J  M-K  M-L  M-]  M-}  @sbl                       kp4  kp5  kp6
  lsft M->  M-Y  M-X  M-C  M-V  M-B  M-N  M-M  M-;  M-:  M-\_ rsft            up         kp1  kp2  kp3  kprt
  lctl lmet lalt           spc                 ralt rmet cmp  rctl       left down rght  kp0  kp.
)

(deflayer altgr
  esc  f1   f2   f3   f4   f5   f6   f7   f8   f9   f10  f11  f12        ssrq slck pause
  _    _    _    _    _    _    ¬    {    [    ]    }    \\   _    bspc  ins  home pgup  nlck kp/  kp*  kp-
  tab  @    _    _    _    _    _    _    _    _    _    @ü   ~    ret   del  end  pgdn  kp7  kp8  kp9  kp+
  caps _    _    _    _    _    _    _    _    _    @ö   @ä   _                          kp4  kp5  kp6
  @aft |    _    _    _    _    _    _    _    _    _    _    rsft            up         kp1  kp2  kp3  kprt
  lctl lmet lalt           spc                 ralt rmet cmp  rctl       left down rght  kp0  kp.
)

(deflayer altgrshift
  esc  f1   f2   f3   f4   f5   f6   f7   f8   f9   f10  f11  f12        ssrq slck pause
  _    _    _    _    _    _    _    _    _    _    _    _    _    bspc  ins  home pgup  nlck kp/  kp*  kp-
  tab  _    _    _    _    _    _    _    _    _    _    @Ü   ~    ret   del  end  pgdn  kp7  kp8  kp9  kp+
  caps _    _    _    _    _    _    _    _    _    @Ö   @Ä   _                          kp4  kp5  kp6
  lsft _    _    _    _    _    _    _    _    _    _    _    rsft            up         kp1  kp2  kp3  kprt
  lctl lmet lalt           spc                 ralt rmet cmp  rctl       left down rght  kp0  kp.
)

(deflayer capsvim
  _    _    _    _    _    _    _    _    _    _    _    _    _          _    _    _
  _    _    _    _    end  _    _    _    _    _    home _    _    _     _    _    _    _    _    _    _
  _    _    @crt _    _    _    _    _    _    _    _    _    _    _     _    _    _    _    _    _    _
  caps _    _    _    _    _    left down up   rght _    _    _                         _    _    _
  _    _    _    _    _    _    @clt _    _    _    _    _    _               _         _    _    _    _
  _    _    _              _                   _    _    _    _          _    _    _    _    _
)
         '';
     };
   }; 
	# Modify the following line if you copied nixos-module.nix elsewhere or if you want to use the derivation described above
	# package = import /pack/to/kmonad.nix;
  };
}
