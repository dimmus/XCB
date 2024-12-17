inc_xcb += include_directories('.')

f_check += []
h_check += []

src = files(
  'xproto.xml',
  'bigreq.xml',
  'composite.xml',
  'damage.xml',
  'dbe.xml',
  'dpms.xml',
  'dri2.xml',
  'dri3.xml',
  'ge.xml',
  'glx.xml',
  'present.xml',
  'randr.xml',
  'record.xml',
  'render.xml',
  'res.xml',
  'screensaver.xml',
  'shape.xml',
  'shm.xml',
  'sync.xml',
  'xc_misc.xml',
  'xevie.xml',
  'xf86dri.xml',
  'xf86vidmode.xml',
  'xfixes.xml',
  'xinerama.xml',
  'xinput.xml',
  'xkb.xml',
  'xprint.xml',
  'xselinux.xml',
  'xtest.xml',
  'xv.xml',
  'xvmc.xml',
)

lib = library('xcb-proto', src,
  include_directories: inc_xcb,
  version: '0.0.0',
  install: true,
)

xcbproto = declare_dependency(
  link_with: lib,
  include_directories: inc_xcb,
)

pkg.generate(
  name: 'XCB Proto',
  description: 'X protocol descriptions for XCB',
  version: '1.17',
)

# if HAVE_XMLLINT
# check-local:
# 	$(XMLLINT) --noout --schema $(srcdir)/xcb.xsd $(srcdir)/*.xml
# endif