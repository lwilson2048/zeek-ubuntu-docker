#MIT License
#
#Copyright (c) 2020 Leena Wilson
#
#Permission is hereby granted, free of charge, to any person obtaining a copy
#of this software and associated documentation files (the "Software"), to deal
#in the Software without restriction, including without limitation the rights
#to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#copies of the Software, and to permit persons to whom the Software is
#furnished to do so, subject to the following conditions:
#
#The above copyright notice and this permission notice shall be included in all
#copies or substantial portions of the Software.
#
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
#SOFTWARE.

#This is a very basic install of the latest version of Zeek from their Ubuntu
#repository on Ubuntu 20.04. NOTE Postfix will need to be configured manually

FROM ubuntu:20.04
MAINTAINER Leena Wilson <lwilson2048@gmail.com>

#Install pre-requisites
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y wget gnupg2

#postfix needs configuration and asks for it during install

RUN sh -c "echo 'deb http://download.opensuse.org/repositories/security:/zeek/xUbuntu_20.04/ /' > /etc/apt/sources.list.d/security:zeek.list"
RUN wget -nv https://download.opensuse.org/repositories/security:zeek/xUbuntu_20.04/Release.key -O Release.key
RUN apt-key add - < Release.key
RUN apt-get update && apt-get install -y zeek zeekctl

#zeek is installed to /opt/zeek. Add the zeek bin to path
RUN echo "export PATH=\"\$PATH:/opt/zeek/bin\"" >> /root/.bashrc
