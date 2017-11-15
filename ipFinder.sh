#!/usr/bin/env bash

############################################################################
## Copyright (c) 2017 Demosthenes Koptsis <demosthenesk@gmail.com>
## All right reserved.
##
## Permission is hereby granted, free of charge, to any person obtaining
## a copy of this software and associated documentation files (the
## "Software"), to deal in the Software without restriction, including
## without limitation the rights to use, copy, modify, merge, publish,
## distribute, sublicense, and/or sell copies of the Software, and to
## permit persons to whom the Software is furnished to do so, subject to
## the following conditions:
##
## The above copyright notice and this permission notice shall be
## included in all copies or substantial portions of the Software.
##
## THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
## EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
## MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
## NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
## LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
## OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
## WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
##
############################################################################

############ SETTINGS #################
EMAIL="my-email@gmail.com"
SUBJECT="Your home WAN IP"
SMTP_SERVER="smtp.gmail.com:587"

#CHANGE USERNAME BEFORE FIRST USAGE
USERNAME="my-email@gmail.com"

#CHANGE PASSWORD BEFORE FIRST USAGE
PASSWORD="xxxxxx"
#######################################

#### DO NOT CHANGE AFTER THIS LINE ####
IP=$("$(/usr/bin/env dig)" +short 'myip.opendns.com' '@resolver1.opendns.com')

"$(/usr/bin/env sendemail)" -l email.log \
-f "${EMAIL}" \
-u "${SUBJECT}" \
-m "${IP}" \
-t "${EMAIL}" \
-s "${SMTP_SERVER}" \
-o 'tls=yes' \
-xu "${USERNAME}" \
-xp "${PASSWORD}"

