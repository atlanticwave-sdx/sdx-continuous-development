# -*- coding: utf-8 -*-
#
# This software may be modified and distributed under the terms
# of the MIT license.  See the LICENSE file for details.

# Base Image
FROM flask

# set work directory
RUN mkdir -p /app
WORKDIR /app

# add app
COPY ./container-app/ /app/

ENTRYPOINT ["./gunicorn.sh"]
