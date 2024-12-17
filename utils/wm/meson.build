inc_xcb += include_directories('.')

f_check += []
h_check += []

dep_int_wm = [xcb]

src = files(
)

lib = library('xcb-wm', src,
  include_directories: inc_xcb,
  dependencies: dep_int_wm,
  version: '0.0.0',
  install: true,
)

wm = declare_dependency(
  link_with: lib,
  include_directories: inc_xcb,
)

pkg.generate(lib,
  name: '',
  description: '',
  version: '',
  requires: 'xcb',
)