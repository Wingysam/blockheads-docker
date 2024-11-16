FROM ubuntu:22.04

WORKDIR /blockheads
ADD https://web.archive.org/web/20240309015235if_/https://majicdave.com/share/blockheads_server171.tar.gz /blockheads/blockheads_server171.tar.gz

RUN apt-get update && \
    apt-get install software-properties-common -y && \
    add-apt-repository multiverse && \
    apt-get install libgnustep-base1.28 libdispatch0 patchelf -y && \
    tar -xzvf blockheads_server171.tar.gz && \
    chmod +x blockheads_server171 && \
    patchelf --replace-needed libgnustep-base.so.1.24 libgnustep-base.so.1.28 blockheads_server171 && \
    patchelf --replace-needed libobjc.so.4.6 libobjc.so.4 blockheads_server171 && \
    patchelf --replace-needed libgnutls.so.26 libgnutls.so.30 blockheads_server171 && \
    patchelf --replace-needed libgcrypt.so.11 libgcrypt.so.20 blockheads_server171 && \
    patchelf --replace-needed libffi.so.6 libffi.so.8 blockheads_server171 && \
    patchelf --replace-needed libicui18n.so.48 libicui18n.so.70 blockheads_server171 && \
    patchelf --replace-needed libicuuc.so.48 libicuuc.so.70 blockheads_server171 && \
    patchelf --replace-needed libicudata.so.48 libicudata.so.70 blockheads_server171 && \
    patchelf --replace-needed libdispatch.so libdispatch.so.0 blockheads_server171

ENTRYPOINT ["./blockheads_server171"]
