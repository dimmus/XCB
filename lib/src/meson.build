inc_xcb += include_directories('.')

src = files(
    'xcb_conn.c',
    'xcb_out.c',
    'xcb_in.c',
    'xcb_ext.c',
    'xcb_xid.c',
    'xcb_list.c',
    'xcb_util.c',
    'xcb_auth.c',
)

src_ext = files(
    'xproto.c',
    'bigreq.c',
    'xc_misc.c',
)

if BUILD_COMPOSITE
    src_ext += files('composite.c')
endif

if BUILD_DAMAGE
    src_ext += files('damage.c')
endif

if BUILD_DBE
    src_ext += files('dbe.c')
endif

if BUILD_DPMS
    src_ext += files('dpms.c')
endif

if BUILD_DRI2
    src_ext += files('dri2.c')
endif

if BUILD_DRI3
    src_ext += files('dri3.c')
endif

if BUILD_PRESENT
    src_ext += files('present.c')
endif

if BUILD_GLX
    src_ext += files('glx.c')
endif

if BUILD_RANDR
    src_ext += files('randr.c')
endif

if BUILD_RECORD
    src_ext += files('record.c')
endif

if BUILD_RENDER
    src_ext += files('render.c')
endif

if BUILD_RESOURCE
    src_ext += files('res.c')
endif

if BUILD_SCREENSAVER
    src_ext += files('screensaver.c')
endif

if BUILD_SHAPE
    src_ext += files('shape.c')
endif

if BUILD_SHM
    src_ext += files('shm.c')
endif

if BUILD_SYNC
    src_ext += files('sync.c')
endif

if BUILD_XEVIE
    src_ext += files('xevie.c')
endif

if BUILD_XFREE86_DRI
    src_ext += files('xf86dri.c')
endif

if BUILD_XFIXES
    src_ext += files('xfixes.c')
endif

if BUILD_XINERAMA
    src_ext += files('xinerama.c')
endif

if BUILD_XINPUT
    src_ext += files('xinput.c')
endif

if BUILD_XKB
    src_ext += files('xkb.c')
endif

if BUILD_XPRINT
    src_ext += files('xprint.c')
endif

if BUILD_SELINUX
    src_ext += files('xselinux.c')
endif

if BUILD_XTEST
    src_ext += files('xtest.c')
endif

if BUILD_XV
    src_ext += files('xv.c')
endif

if BUILD_XVMC
    src_ext += files('xvmc.c')
endif

if BUILD_GE
    src_ext += files('ge.c')
endif