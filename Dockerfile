FROM jekyll/jekyll:3.7.3 as builder
MAINTAINER ome-devel@lists.openmicroscopy.org.uk

RUN id
COPY src src
#RUN install -o jekyll -d src/_site && cd src && jekyll build .
RUN install -o jekyll -d /build-site && \
    cd src && \
    jekyll build . --destination /build-site


######################################################################
FROM library/nginx:1.13.11-alpine
COPY --from=builder /build-site /usr/share/nginx/html/
