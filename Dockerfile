# Copyright (c) 2023 Kentyou.
#
# This program and the accompanying materials are made
# available under the terms of the Eclipse Public License 2.0
# which is available at https://www.eclipse.org/legal/epl-2.0/
# SPDX-License-Identifier: EPL-2.0
#
# Contributors:
#    Kentyou - Initial implementation
#

FROM eclipse-temurin:17-jre as amd64

FROM arm64v8/eclipse-temurin:17-jre as arm64

FROM arm32v7/eclipse-temurin:17-jre as arm

FROM $TARGETARCH as build

COPY target/classes /opt/sensiNact


EXPOSE 8082
VOLUME ["/opt/sensiNact/configuration", "/opt/sensiNact/log"]
ENTRYPOINT ["/opt/sensiNact/start.sh"]
