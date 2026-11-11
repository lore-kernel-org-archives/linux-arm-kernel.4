Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E07060A2606
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 08:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FPHAPxCc;
	dkim=pass (2048-bit key) header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=WsiOc40V
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=6d9NY4/sGebTASwnIbgSwLkcj0rsBaL9wxhXAF9kunQ=; b=FPHAPxCc6RD1bb1Cw09PWb990U
	cDvUiYe4UEdV6dNqcr7ws/N6YTU2LSVhPDGa6jb3BwZoJsB6wZzUUYUFlunavie0ZCueRIg0AvDGX
	LjlgvPYXgFHZ5xRrkxjrMFkJf4D8JUb4vjfNVWCWFPs/SJpycju20TvRy63srUfzOcouUDrS3c+Kr
	WJ3WEcsZM/bIJnwpOsFimtLZB9ZEsp/tT/0DSU0zkPNayRPMDnc2laJSnpemsyoqIfn1Ub8w61oTT
	m78y4WpHH1bQ7/y0rUxw0+2YdaTAcsUVB0Xt1JgUwiZsZ/Md6djgQsgWEkCpXCA5wBC/vEjGmkPUT
	6lwGeyXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR3SC-000000060bK-3YmC;
	Wed, 11 Nov 2026 08:13:12 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR3S9-000000060Zt-06iv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 08:13:11 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a208d93758so30926135e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 00:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20260707.gappssmtp.com; s=20260707; t=1794384786; x=1794989586; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6d9NY4/sGebTASwnIbgSwLkcj0rsBaL9wxhXAF9kunQ=;
        b=WsiOc40V8JI58F7SrKkQ4FtFRcB7dlZG5JbUDe5g3JoDkk5kfAuoH76u9ESHjhU8iK
         WommkcXTmP8DcY8Lj+5I4b4wBNXpQUvIEloNoD/V6qewWU1wUuC3Q/5LmeyE+YII8v3e
         5F6XO4TyAnvAc0SE3EU6unJ5ydg60mf4wRD7x4kguxuIgZwF5gm7wi8DxW3/Tdb7YjFG
         ySc+G+6QQR1pFc02L8qYl0XHxerHkYogFYL0vU6XCRTVebRUL9SU12EbxXq6mUM+ApvU
         gRvuJzkTPjc+2OebTAImPXaELJprPk7Xm0tR7XJAnBuyZ7Z/KfMGprEpY6vSiRM3JX2F
         YCuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384786; x=1794989586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6d9NY4/sGebTASwnIbgSwLkcj0rsBaL9wxhXAF9kunQ=;
        b=B/T+sOMvb+qPUEoofee08u1KF5jUYnJpwNnzMn+9yGyHNGXNIKbKtQupLDswbm4Ljs
         YQ2mdIq6WTDyXfDsoZIiVJyq3r0cj3KrdfWKVU3zh6YHV+hx1qnXLvt4rqmI5jfjy8JG
         maPAAwGnq17fflI/whZ0Hdmo+nnGljvdsutFxWW54X84KV5amK2hrYhiFhaiBtRA2Hw6
         Pha/gAiW21ngCVzVjwIf95TBbTTkw6Yua4s5BPg0GVz5OipE9Q0B1cIswOa1VNq+vt60
         2ANyumZjK4pbRs0kTErYGCZLOHWqiXD5v5W0WU72ySS4KgBLMd0lP9EUnwZjbq4tlQ53
         wYLQ==
X-Forwarded-Encrypted: i=1; AL+hErGxubp9jX9Df4T0YGSHt76CXnuINaTFG0R+kWdAspdXAVa7MO36eazyCFcX3LKRXK2XECLw+yKkKeXK0Z/qGRz5@lists.infradead.org
X-Gm-Message-State: APuU4Z8IUboTZHbURmESflKvlun0e3G6P2xxKtucQ8hZzq/Xu193Ans5
	3Aj34G9DYLYeJcwuZLtbb63YDr2VQ5JVibXOAmGjq5BBuo2d1HVCJwU25VcHzNdZ1wU=
X-Gm-Gg: AYBFou1ooCUS4hh4b7e4RjrBHsLICBeyUpCRYA/ygBcWfYv37xjGodZtp4H3ratbJS5
	X26l3HyoOXKPJc2xFItLMJgTDp8gsbVx6rQyQcdDKmW3KKkSRcZYjqEhrgR3X96HcS34azNfpTe
	Lqfbaf9XNiqHx1A672oqqr726QFWNlibcg618IPR1zwcygMQyS9cDx+UmfyNXfm/WdiE2mLw9Y2
	co4L1Ik4u+eElNFPIBRZT9j0FmhENLZZUpi8V/01aRjC9k4BhmH3EkfPylICI8VU0nGKAOaIH7q
	vx1JYHE45ZoIpV7cnMeWi2YLMGRQHmT8j3LIiJpE9Drrab3rqC68B8qCmlQBmsgTpyvjBqUZspS
	qS+upI6Ec7sACCCWT2+UqAxa5gS6XM5bO4hbqK9wd94ln57p3dfo1nVD/kzyAFJoyEv0qTghglB
	D5SJbjnv5sFzCCXsnnHEg21HQKy8vLILbrsdtvfmV0ZJRT8vAjAJL4suo7/FawPjmEWaE78eknR
	o4m1BvZBt/cTnmUkbxcVINRY1tXYr8nUY3qeKk8aS5AA0VBWM+tLi4oaxwQg8gKT6xNvXy+iokO
	0edUeaSaz1lGeyjb/b9E6LgPPUbqWwZs7J8oFnmsHOs6tYvWiQIPliYEqa1TicYkNV304hybvh0
	nzTWgsdBzSA==
X-Received: by 2002:a05:600c:6214:b0:4b5:d95c:2378 with SMTP id 5b1f17b1804b1-4ba0939815cmr24681275e9.34.1794384786446;
        Wed, 11 Nov 2026 00:13:06 -0800 (PST)
Received: from frobdeb.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02242bd9sm113233815e9.15.2026.11.11.00.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:13:05 -0800 (PST)
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
Cc: Jessica Zhang <jesszhan0024@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Alexander Forsch <alexander.forsch@bytesatwork.ch>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] arm64: dts: freescale: Add support for bytesatwork byteDEVKIT i.MX93
Date: Wed, 11 Nov 2026 09:11:45 +0100
Message-ID: <20261111081150.950272-1-frank.obergfell@bytesatwork.ch>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_001309_371722_58BB597D 
X-CRM114-Status: GOOD (  12.69  )
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
 MAINTAINERS                                                   |   7 +
 arch/arm64/boot/dts/freescale/Makefile                        |   1 +
 arch/arm64/boot/dts/freescale/imx93-bytedevkit.dts            | 449 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx93-byteengine.dtsi           | 199 ++++++++
 arch/arm64/boot/dts/freescale/imx93.dtsi                      |  34 ++
 drivers/gpu/drm/panel/panel-ilitek-ili9806e-core.c            |   4 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9806e-dsi.c             | 158 ++++++
 10 files changed, 863 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-bytedevkit.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-byteengine.dtsi

