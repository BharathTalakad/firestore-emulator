ARG GCLOUD_SDK_VERSION=261.0.0

FROM google/cloud-sdk:$GCLOUD_SDK_VERSION

RUN apk add --update --no-cache openjdk8-jre &&\
	gcloud components install cloud-firestore-emulator beta --quiet

VOLUME /opt/data

EXPOSE 8081

ENTRYPOINT ["gcloud", "beta", "emulators", "firestore", "start", "--host-port=0.0.0.0:8081"]
