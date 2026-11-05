# Local builds of blog.phast.sh. GitHub Pages builds `main` on its own;
# these targets are for previewing before a push. Gems install into vendor/bundle,
# not the system Ruby.

.PHONY: install build serve clean

# Install the gems GitHub Pages uses, pinned by the Gemfile.
install:
	bundle config set --local path vendor/bundle
	bundle install

# Build the site into _site/.
build: install
	bundle exec jekyll build

# Serve at http://localhost:4000, rebuilding on every change, drafts and future posts included.
serve: install
	bundle exec jekyll serve --drafts --future

# Remove the build output and caches.
clean:
	rm -rf _site .jekyll-cache .jekyll-metadata .sass-cache
