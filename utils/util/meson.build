inc_xcb += include_directories('.')

f_check += []
h_check += []

dep_int_cursor = [xcb]

src = files(
)

lib = library('xcb-cursor', src,
  include_directories: inc_xcb,
  dependencies: dep_int_cursor,
  version: '0.0.0',
  install: true,
)

cursor = declare_dependency(
  link_with: lib,
  include_directories: inc_xcb,
)

pkg.generate(lib,
  name: '',
  description: '',
  version: '',
  requires: 'xcb',
)