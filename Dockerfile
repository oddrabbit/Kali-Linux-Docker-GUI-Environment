FROM kalilinux/kali-rolling

RUN apt-get update
RUN apt-get --yes --force-yes dist-upgrade
RUN DEBIAN_FRONTEND=noninteractive apt-get install --yes --force-yes kali-desktop-xfce xorg xrdp
RUN sed -i 's/port=3389/port=3389/g' /etc/xrdp/xrdp.ini
RUN sudo /etc/init.d/xrdp start
RUN adduser kali
RUN echo -e "[Allow Colord all Users]\nIdentity=unix-user:*\nAction=org.freedesktop.color-manager.create-device;org.freedesktop.color-manager.create-profile;org.freedesktop.color-manager.delete-device;org.freedesktop.color-manager.delete-profile;org.freedesktop.color-manager.modify-device;org.freedesktop.color-manager.modify-profile\nResultAny=no\nResultInactive=no\nResultActive=yes" | tee /etc/polkit-1/localauthority/50-local.d/45-allow-colord.pkla

CMD ["bash"]
