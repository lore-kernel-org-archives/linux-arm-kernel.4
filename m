Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DF0606A334
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 13:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CXzSzQXw;
	dkim=pass (2048-bit key) header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ODUDfBNj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=H0L8NY5KvCN7Y6Y0k6z0RIGpvtUytxSeGPbkleqES2c=; b=CXzSzQXwP8wH7vTWaHz6wGqo+A
	k1n77hslG7J9wRigbgWFkL5W2GRR7V5v9DFP68DJ59qwIszeU8Tl7MC2npbt5go9HjAwNPJn+7Ydm
	238yKrj2VAx5LFfalogpNQcJUMGjQsao3WuMAWRlF9z91TdN+ZeQEUBrjTtrshLo6DViETPQzUP6Q
	q3yj/NrznLyGHTHi04DbJVvt1+dwSjfRXy6XSxYiAzipAGi0dnQQd90/J90QyTz6yG2VaeUNwcntq
	05di6iNuGiaPa9/2l7KqDgdfQzLCYf9bp4WqEVk+F2fehsamvi3edCW/8mJA5L0JP7ME5rBklKf61
	lnDJ+RlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8QS-00000006ooM-3kob;
	Wed, 11 Nov 2026 13:31:44 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8QP-00000006onS-03aM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 13:31:43 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4b7252a32c8so34043755e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 05:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20260707.gappssmtp.com; s=20260707; t=1794403899; x=1795008699; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H0L8NY5KvCN7Y6Y0k6z0RIGpvtUytxSeGPbkleqES2c=;
        b=ODUDfBNj4HgxToZ+5GjyWkzphRmVBtzT66SljF5bXuZUkWVLniT7OBpgg9gwR8cwrI
         cMJyQHs9qnKHJDbHnQiIUx01Jvxn+VJHlbBVFyWYr2O6iMYPv7Xt4MbCZ0GOUIEXjLTF
         +LE0lZSP7/L3gavmg/geUZnD9fr3X5heD+C3ZywLem0ikvhDBm+U2o0M0UODanIpN/7e
         NN/l1l/ZDtTNfsT7zFUVqF9DDLhx+LGjCEu1zdTV1J+ZdENoE7L2su+Dpofa/YLHmmKs
         8rMYpqj4wb24HtdIa8fy88kIYdoGhBeYyKP4ttWSvbIriNpYakZJUhEDtKu0bOps1AG2
         gNSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794403899; x=1795008699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H0L8NY5KvCN7Y6Y0k6z0RIGpvtUytxSeGPbkleqES2c=;
        b=SFhNDjB/4FFbBg9S73cpRSQ6nyp2l0p2+7YzuhdmMGedirZi74C4x+xWidiLepnmQK
         ji/g3A6W3ylngx1jDPGm7fgBKz77k5y5N+z4OaqgyNLy1yIQL+c60SKpNMGzSdDyrxUH
         MBcl9TqTg54xgL0HifkBinLN9wl3o+1jCeDE1C9OAgfktUqeQ6k8PHpCda4jgE6qw9HZ
         pd+eWzAE9iGT0uTQq+G2nBLZy0gHRvVMH6SVBcd8R5mU6TjpMW2TQCNVapKz7xquqcKx
         FXnEZZKwZVBsgr0m0MY21K0fAsbWTt4e3LOOWOeFgAsd27+4iWKOkyf8b8H0inB4kva2
         5xPA==
X-Forwarded-Encrypted: i=1; AL+hErGG5mIiih4v7W7cA2ZBrlo/malkKgt36FNT3dy48gtwBXUZk/XQvOkqGkJoN+0mkznko0ezYnaDY1tPGPt0kpya@lists.infradead.org
X-Gm-Message-State: APuU4Z+Zwxk035Gne/cD/mUSyngV2B3YZY933Ue3qbc2nSkRBqUTUwFq
	JWn50CcXpQhO6fRW7GElOwDO8LETZA2R/7yM13OTZPl+O2JPvU7nyFJu/cXQD4TOzTQ=
X-Gm-Gg: AYBFou07quan6Mbd0zo9ubb8Nzzqx74h9g6VB4tmGOD7hZ8dXihMWA24UI0JnPyaHow
	92vbjpsKD9bf/eXsXOH9LcAlD3Vsv5S/F+DCcrK2lAnGCEAvXWnxdTBsGTgQUTlkyRIM3fPO9xU
	J7fU3TIIdfHMEpoX9KS5ym1N9dYJIX4DLa4OCd8YFjGvMzdRL+0QLGuBPpnFgYv6nxVGNPUbKur
	pkvGGpbBMfEugaRl8t2z7t4gG5VW0BhyCIQ+x3uXLCuUnTq1aUxOpoJkc6VXxR7g11eHX5BAiGY
	CAD8KLJ7m5DcWZ1PuF6KuBlZR1a5yQOMH4lrT03L1BySk1mLnr6Vt9B0qcGhkZQruMGiFk26B0J
	eIIG+cmmg1t4eXUOqJWVxREMyM+anxztbQX4XB+WH53deBofFMc6zWGi+63hP56viRyhAdpNa7A
	NVDjn0omh0mzrlB+AAAsQJu9Hk5Px9dk2RhZS4CDnBUD9jZH3sPxe5gtPoYq4l5vv+zh5ZBaxEF
	PHqbYE6MG82J1+Qa8NBpNNoOhALMNuP7W8azbwyUaiuW/bpU5kW4eCRdcCgcSeTsWZGwyOtPa+x
	cDVXdOoAlT/Zg0yndvDhI8QJm/qeABt/tw3KM7wUz2hreNiSItzgCsb3wG88yChsq6Zcuxfv7e3
	vAzYntP3mVQ==
X-Received: by 2002:a05:600c:6214:b0:4b5:d95c:2378 with SMTP id 5b1f17b1804b1-4ba0939815cmr42149525e9.34.1794403898734;
        Wed, 11 Nov 2026 05:31:38 -0800 (PST)
Received: from frobdeb.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498363df7a5sm11089358f8f.37.2026.11.11.05.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:31:37 -0800 (PST)
From: Frank Obergfell <frank.obergfell@bytesatwork.ch>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Michael Walle <mwalle@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Alexander Forsch <alexander.forsch@bytesatwork.ch>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/5] arm64: dts: freescale: Add support for bytesatwork byteDEVKIT i.MX93
Date: Wed, 11 Nov 2026 14:31:14 +0100
Message-ID: <20261111133119.1063210-1-frank.obergfell@bytesatwork.ch>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_053142_107133_AC2426AD 
X-CRM114-Status: GOOD (  13.16  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series introduces support for the bytesatwork byteENGINE i.MX93
System on Module (SoM) and the carrier board byteDEVKIT.
It also adds display support for the integrated Youritech et050fw01-kt
MIPI-DSI panel by extending the existing ILI9806E panel driver.

Changes in v3:
- Patches 1 & 4:
  - Added Reviewed-by tag from Daniel Baluta.
- Patch 5:
  - Added imx mailing list (imx@lists.linux.dev) to MAINTAINERS entry.
  - Moved controller activation (&lpi2c2, &mu1, &mu2, &usdhc1, &wdog3) from
    imx93-byteengine.dtsi to imx93-bytedevkit.dts.
  - Removed unused LVDS backlight (lcd_bl), disabled lpi2c1 node, and unused
    LVDS pinctrl groups.
- Patches 2 & 3:
  - No changes.

Changes in v2:
- Patch 1:
  - Use specific panel part number (youritech,et050fw01-kt) instead of generic controller name.
  - Elaborate commit message with vendor description, panel resolution and dimensions.
- Patch 2:
  - Update compatible string and function names to match youritech,et050fw01-kt.
  - Fix commit subject formatting and commit message.
- Patch 3:
  - No changes.
- Patch 4:
  - Drop standalone SoM compatible entry from fsl.yaml (only bootable board combinations allowed).
  - Fix typo in commit message ("byteDEVKIT carrier board").
- Patch 5:
  - Update panel compatible string to youritech,et050fw01-kt.
  - Invert GT911 GPIO polarity to GPIO_ACTIVE_HIGH to fix address strapping and reset.
  - Assign pinctrl_usb2 to reg_usb2_vbus and add vbus-supply to usbotg2.
  - Add disable-over-current to usbotg1 and usbotg2.
  - Move panel reset GPIO into dedicated pinctrl_panel_reset group on panel@0.
  - Standardize Ethernet PHY node names to ethernet-phy@... and use tx-fifo-depth.
  - Replace underscores in pinctrl node names with hyphens.
  - Rename tca6418e node to generic gpio@34.
  - Consolidate devkit devicetrees into single imx93-bytedevkit.dts.

Frank Obergfell (5):
  dt-bindings: display: panel: ilitek,ili9806e: Add Youritech et050fw01-kt
  drm/panel: ilitek-ili9806e: Add support for Youritech et050fw01-kt panel
  arm64: dts: freescale: imx93: Add MIPI DSI controller node
  dt-bindings: arm: fsl: Add byteENGINE i.MX93 platforms
  arm64: dts: freescale: Add support for bytesatwork i.MX93

 Documentation/devicetree/bindings/arm/fsl.yaml                |   7 +
 .../devicetree/bindings/display/panel/ilitek,ili9806e.yaml    |   1 +
 Documentation/devicetree/bindings/vendor-prefixes.yaml        |   4 +
 MAINTAINERS                                                   |   8 +
 arch/arm64/boot/dts/freescale/Makefile                        |   1 +
 arch/arm64/boot/dts/freescale/imx93-bytedevkit.dts            | 415 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx93-byteengine.dtsi           | 185 +++++++++
 arch/arm64/boot/dts/freescale/imx93.dtsi                      |  34 ++
 drivers/gpu/drm/panel/panel-ilitek-ili9806e-core.c            |   4 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9806e-dsi.c             | 158 ++++++
 10 files changed, 816 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-bytedevkit.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-byteengine.dtsi

