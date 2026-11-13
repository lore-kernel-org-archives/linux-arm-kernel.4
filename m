Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D48606A323
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 14:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Tr4ZLT5i;
	dkim=pass (2048-bit key) header.d=0leil.net header.i=@0leil.net header.a=rsa-sha256 header.s=20231125 header.b=jL9lWTlT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=JISMoemaPJ+A8ZJRuo/Qvax8ybNMOj4BygXaLMB8GcQ=; b=Tr4ZLT5iCvGZbmFyRinMUWxb4I
	nlugEmMFQL8L/qN9Y2z3AMm1w2veN4aQ/qsV9qRE7xlSKvrD0sgN64HDe9I+wyH4+lzqSeScbRRGL
	XdB7bH78GBOIwmqOktFpkSOKOnLM9qQpw33n34Vxp++1Y+DYf8fzyrQB4TxYGyon7W7DAUNzY4r7Z
	DwL79GsVt3oRNpFkJ43blzo4ILKQOEBgQ2mq43yzVwzrHD+011PEDASK6H13iwvpTpZd+qwsR4LoH
	52WzQXDAbSdLuY3dED4SCSRjTsKs+fFpn3lTZ8i/pyTN7UXkAhmpMeIwB86zfbN20NbWe8kFivhfd
	E+j5uaaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRseE-0000000DFYY-2Nek;
	Fri, 13 Nov 2026 14:53:02 +0000
Received: from smtp-190d.mail.infomaniak.ch ([185.125.25.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRse4-0000000DFJn-2IS1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 14:53:01 +0000
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jR0bz1GJ5zFyD;
	Fri, 13 Nov 2026 15:52:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1794581566;
	bh=JISMoemaPJ+A8ZJRuo/Qvax8ybNMOj4BygXaLMB8GcQ=;
	h=From:Subject:Date:To:Cc:From;
	b=jL9lWTlTj2LSNGIVzqoVi/FnsPoEY6VNERsK9g9UpjRXFaHggeFLGPGMV9rPxRLke
	 5/XDU8CCIl493IrexBsWghRLvTF+26K6qNs41+wmxfuSj0ZHGttC4iG7SQ9qR4N9iC
	 QxHaodYvvdIKh/sKcBw7Qy8W9VyknZwJlLAJ5FqVu1QIzpPsKsQW7yTsqb/HCTFKyL
	 1Wo9df24ELl5U4HGpIx8k8VrA0rTgc/LreGK25FR9rFuNOq/T4upnY72QYaAL5ot6v
	 glzrFykSYzOBmGGlrCscOSJc3ulLewASefHUj8vVvopHjOf4zKrPtx2kZRg7iSZiPu
	 xlJXRjWCTdceg==
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4jR0bx2SqwznH1;
	Fri, 13 Nov 2026 15:52:45 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Subject: [PATCH v2 0/2] arm64: dts: rockchip: enable OV9281 CAM0 and CAM1
 on RK3588 Jaguar
Date: Fri, 13 Nov 2026 15:52:22 +0100
Message-Id: <20261113-jaguar-cam0-cam1-v2-0-3e9377e3c882@cherry.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/2WOwQqDMBBEfyXsuSlJiil46n8UD+tm1QjVdqNSE
 f+9qIUeehmY4TEzCySWyAlytYDwFFPsO8iVOymgBruadQyQK3DGeWtsplusRxRN+DCbWB2IjKs
 yf/Ue4aTgKVzF9155Lw6fxrJlGraeLyH8GmOKww9rYhp6mfcjk93SY9Ma9785WW00XRArClhmI
 dyoYZH5HBiKdV0/8SiSsNcAAAA=
X-Change-ID: 20261015-jaguar-cam0-cam1-dcc02f56766a
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.17-dev
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_065253_118268_BF0DD4C1 
X-CRM114-Status: GOOD (  14.16  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-23.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RK3588 Jaguar has two proprietary camera connectors, P14 and P15. This
adds support for the only camera module we currently have for this
connector.

The camera module has a 2-lane OV9281 camera sensor, an IMU, a
magnetometer and an EEPROM.

We have new camera modules based on an OV13850 that should be coming up
soon, hence why I made the support into their own separate DTSO instead
of directly integrating them in the main DTS.

Known issues:
- lis2mdl driver currently doesn't support being instantiated twice, so
  only one magnetometer will show up, if the two cameras modules are
  connected,
- OV9281 test patterns (no upstream support) returns broken patterns,
  see discussion on IRC
  https://libera.catirclogs.org/linux-rockchip/2026-11-02, the image I
  get without the test pattern *looks* okay to my non-expert eyes. In
  any case, it's unlikely to be an issue in the Device Tree,

Image capture test:
  #!/usr/bin/env bash

  set -o pipefail
  set -eux

  CAM=$1
  COLORFMT=$2
  SIZE=$3

  if [ "$COLORFMT" = "GREY" ] || [ "$COLORFMT" = "Y8" ]; then
  	MEDIACTLFMT="fmt:Y8_1X8/$SIZE field:none colorspace:raw xfer:none"
  	BITDEPTH=8
  else
  	MEDIACTLFMT="fmt:Y10_1X10/$SIZE field:none colorspace:raw xfer:none"
  	BITDEPTH=10
  fi

  if [ "$CAM" = "P14" ]; then
  	MEDIACTL_SENSOR="ov9281 2-0060"
  	MEDIACTL_RKCIF="rkcif-mipi2"
  	MEDIACTL_CSIRX="dw-mipi-csi2rx fdd30000.csi"
  else
  	MEDIACTL_SENSOR="ov9281 7-0060"
  	MEDIACTL_RKCIF="rkcif-mipi4"
  	MEDIACTL_CSIRX="dw-mipi-csi2rx fdd50000.csi"
  fi

  for dev in /sys/class/video4linux/video*/; do
  	if [ "$(cat "$dev/name")" != "$MEDIACTL_RKCIF-id0" ]; then
  		continue
  	fi
  
  	VIDEODEV=$(basename "$dev")
  	break
  done

  media-ctl -d 0 --set-v4l2 "'$MEDIACTL_SENSOR':0 [$MEDIACTLFMT]"
  media-ctl -d 0 --set-v4l2 "'$MEDIACTL_RKCIF':0 [$MEDIACTLFMT]"
  media-ctl -d 0 --set-v4l2 "'$MEDIACTL_CSIRX':0 [$MEDIACTLFMT]"
  # Name the file a format YUView can recognize automatically
  /root/yavta/build/yavta -f"$COLORFMT" -s$SIZE -c1 -n1 /dev/$VIDEODEV -Fframe-#_${SIZE}_${BITDEPTH}b_yuv400.yuv

With yavta[1] and checked with YUView[2] as gstreamer doesn't seem[3] to
have support for Y10.

Ran:
 - ./test-cam.sh P14 Y8 1280x800
 - ./test-cam.sh P15 Y8 1280x800
 - ./test-cam.sh P14 Y10 1280x800
 - ./test-cam.sh P15 Y10 1280x800

Pictures look decent to me.

Wrote random data to the EEPROMs and read it back identical.

Moved the cameras, accel and gyro raw sysfs values changed.

Magnetometers tested individually, with small magnet, raw values
changed.

I've not tested IIO buffers and/or the various interrupts.

[1] https://git.ideasonboard.com/camera/yavta
[2] https://github.com/IENT/YUView
[3] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/work_items/3738

Light dependency on
https://lore.kernel.org/linux-media/20261102-v4l-y8-y10-csi-vicap-v2-0-0a4149d96dae@cherry.de/
for it to actually work (no impact on binding or device tree).

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Changes in v2:
- removed unneeded bus-type property in the camera's endpoint node,
- rename cam0_p14/cam1_p15 node names to cam0-p14/cam1-p15 to follow the
  DT spec recommendations,
- added pinctrl for LSM6DSR's CS and SA0 pins to guarantee the state of
  the bootstrapping pins which control the I2C device address and
  I2C/SPI operating mode,
- Link to v1: https://patch.msgid.link/20261102-jaguar-cam0-cam1-v1-0-c3aafcdab5dd@cherry.de

---
Quentin Schulz (2):
      arm64: dts: rockchip: enable OV9281 CAM0 P14 on RK3588 Jaguar
      arm64: dts: rockchip: enable OV9281 CAM1 P15 on RK3588 Jaguar

 arch/arm64/boot/dts/rockchip/Makefile              |   7 ++
 .../dts/rockchip/rk3588-jaguar-p14-ov9281.dtso     | 120 +++++++++++++++++++++
 .../dts/rockchip/rk3588-jaguar-p15-ov9281.dtso     | 119 ++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts     |  36 ++++++-
 4 files changed, 281 insertions(+), 1 deletion(-)
---
base-commit: 233ebf31c98e1d7185d12d1ff332f3354f4950f5
change-id: 20261015-jaguar-cam0-cam1-dcc02f56766a

Best regards,
--  
Quentin Schulz <quentin.schulz@cherry.de>


