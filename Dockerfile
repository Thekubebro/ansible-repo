FROM alpine:latest
LABEL maintainer "Coleman Word <colemanword@gmail.com>"

RUN builddeps=' \
		python-dev \
		py2-pip \
		musl-dev \
		openssl-dev \
		libffi-dev \
		gcc \
		' \
	&& apk --no-cache add \
	ca-certificates \
	python \
	py-paramiko \
	py-yaml \
	py-jinja2 \
	py-httplib2 \
	git \
	$builddeps \
	&& pip install --upgrade pip \
	&& pip install \
		ansible \
		six \
	&& apk del --purge $builddeps
RUN git clone https://github.com/Thekubebro/ansible-repo.git && cd ansible-repo

ENTRYPOINT [ "ansible-playbook" ]
