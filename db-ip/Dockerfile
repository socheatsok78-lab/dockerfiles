ARG DATE=2025-07

FROM --platform=$BUILDPLATFORM busybox AS download
ARG DATE
ADD https://download.db-ip.com/free/dbip-asn-lite-${DATE}.mmdb.gz /dbip-asn-lite.mmdb.gz
RUN gunzip /dbip-asn-lite.mmdb.gz
ADD https://download.db-ip.com/free/dbip-city-lite-${DATE}.mmdb.gz /dbip-city-lite.mmdb.gz
RUN gunzip /dbip-city-lite.mmdb.gz
ADD https://download.db-ip.com/free/dbip-country-lite-${DATE}.mmdb.gz /dbip-country-lite.mmdb.gz
RUN gunzip /dbip-country-lite.mmdb.gz

FROM --platform=$BUILDPLATFORM scratch AS asn-lite
COPY --from=download --link /dbip-asn-lite.mmdb /

FROM --platform=$BUILDPLATFORM scratch AS city-lite
COPY --from=download --link /dbip-city-lite.mmdb /

FROM --platform=$BUILDPLATFORM scratch AS country-lite
COPY --from=download --link /dbip-country-lite.mmdb /
