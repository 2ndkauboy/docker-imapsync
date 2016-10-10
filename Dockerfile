FROM ubuntu

RUN apt-get update -y && apt-get install -y \
    build-essential \
    git \
    libauthen-ntlm-perl \
    libcrypt-ssleay-perl \
    libdigest-hmac-perl  \
    libfile-copy-recursive-perl \
    libio-compress-perl \
    libio-socket-inet6-perl \
    libio-socket-ssl-perl   \
    libio-tee-perl          \
    libmodule-scandeps-perl \
    libnet-ssleay-perl      \
    libpar-packer-perl      \
    libreadonly-perl        \
    libterm-readkey-perl    \
    libtest-pod-perl        \
    libtest-simple-perl     \
    libunicode-string-perl  \
    liburi-perl             \
    cpanminus

RUN git clone https://github.com/imapsync/imapsync.git

RUN mkdir -p imapsync/dist && cd imapsync && cpan -i Data::Uniqid JSON::WebToken Mail::IMAPClient Parse::RecDescent Test::MockObject && make install

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /tmp/LOG_imapsync

ENTRYPOINT ["imapsync"]