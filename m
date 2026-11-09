Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563DD6082BC1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 12:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=000x5le0;
	dkim=pass (2048-bit key) header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=PbbjIWJ7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ovhJqwiGS9k51qlnCtIasc39GdwQ5iWAHEWL5fIwMpY=; b=000x5le03STC2FDsHn5e/n5lDU
	gQzrd2HHId639SU5uPkm+LTdh3nodFPf396lXKHRKheObar2jqp/KqjjbPzcMP+nJIy2zYMlluQlA
	BCHUeunlxKj4unanFGuQkEngaKLO5RDtum06UO11Y38Fx6GMkaa2lVFeA2CmGircrbGEIy9GcPUbf
	n1KOT0bacf4OJ+M8dOaH4ijWjmlHz2qWESdEsur6zci2Pe+1vqmbfSqlLPrhfgtRhFr+M85g3P8nM
	E5BKdeZQfePZP7xSK+aPAcbsJp3bBJg/rHjowi5bievMP8l/u9RWshA2A8Z2BQ89FhDhXMjti7Te0
	1Sa1raTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQOPM-00000000ei1-2tGZ;
	Mon, 09 Nov 2026 12:23:32 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQOPJ-00000000ehR-1b1g
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 12:23:31 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so7836585e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 04:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20260707.gappssmtp.com; s=20260707; t=1794227007; x=1794831807; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ovhJqwiGS9k51qlnCtIasc39GdwQ5iWAHEWL5fIwMpY=;
        b=PbbjIWJ7QdnHId46wy7/GsXSaKnXADAoE5O8X98TqHW5/JUqq5pZmxqhWwfQ7rQMuC
         zaeTVOpvuuLiRuOaeInP+2ibR5YqCqeDsNw7ofixBbRmKM6WQ89dpvOpVsFhWM4nSV6F
         +8F9WpNMrvHR7cEx4uQNMH/0d/b9VsFQOO3s24qJUdPDvAKninjRKkZtwAPgEZZvZ7XC
         lTX79ysZoqorde8FcF+4Ksqg1UDLSRSwynTm7i3KZD4TWAvSC4K8f05R3dH+VtRFckHS
         DwHj78v4kj3LhEXOUGH4whRThexIacUV7kXYieHcVVSLpO3wei4E7BwK1jsDdV67ixNO
         qqrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794227007; x=1794831807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ovhJqwiGS9k51qlnCtIasc39GdwQ5iWAHEWL5fIwMpY=;
        b=QN2yRHISVnYQeh/JfnDHvu7A1/3FshAEh0j8QZAG3tLCKy0ylkTBwagy49urHg2dCX
         eiy73xkUpZaXMz7dgGwd4ZGGkZ78CaavXZwJv9hgB/uYx4owzJ6xQ4BXeyZSuHhKbuHb
         oZlWTVJxE7tLajkHIehXKkuQITbB6n0SkAje0Z22/Fk3W4qDMHp7g1qINpZ+uIJOU1il
         Vh/tZO3ChzdmdKasfkPSnj9QAX6gYHfx4bm50BLsTTH93g2HyNuEXHI190QdZgJF52wA
         ScJg598NUv1bQTzKss4C2OwLm91TJ0RMuILI1z8n5WAe61x+C+Fy/OysPnXL721urSV1
         2vfA==
X-Forwarded-Encrypted: i=1; AL+hErEsNetluUqPD+276wBVDXfNBJzsXkT5aFAoHaXlDHVcsvsOvTdtnxDGVWIKQT/+hLNhXMPGcL21jompF6m4faja@lists.infradead.org
X-Gm-Message-State: APuU4Z/BQkRFkwlglXCfqr1DW90cAqWdY2ahzfxYdHgijz8OqvXKSGXs
	w+R4Ri1SWr06bGwha72UElCW1IWs45tJyKQRloBUsFUKTOYyTvT2ZB53w6jAZqNFvYo=
X-Gm-Gg: AYBFou1rvOFaQCjYbEJAcIcR/p5zhzKXcGj0hG40IfZHor3aVwpfLpRnEGZBhE+sZrz
	Mb7pXLOBgaMEPh8bSKsdpeEhlJ3JuE16+RB4pK99ihOJSZ6LBIP02VoLM+l2fCW+r7S7Apcfufx
	hvm5aUIwPEkElK0yh5fJteTagr7PV7BlWU6gQ7ovb5EdAnUaDHsVmo021Frjk7QxomrZnw8+TgL
	JxDeIyyOw8HcX8e1oEZbP0xxum+JeJJoKSC7j50JXNIPXHqdLEn/T5pRw0UiXYm3eZRSczvVGX9
	lfrrT6reWEHjreJ98ajvuUPhEYWH8Ul6gW2rCjgsJTwG0tBeDs5RrS3EcBJ7ny8Gw7ZpdHKd90N
	qkqOgxRIOqGyFKyUjzA7bytFax+57lFM0GEhvdMxpUfwepBL08VAz/+eomt8rRIV8lSnR3Ylc5l
	OjV02Ui0BSkeNhw80ihK292YSEOMqiOjKaMkx+tuCQ1Ff61ji02kPNrzlKkw5IXvmMY/nRCMtpO
	a5geQANnagF/K6Y4beCUwopPxPZVXP3HnXP9fWaa9WvJl5dKtJOSNDV9ZPji2xzWap+E9mVI0cV
	OEjQ0jYjD0btB97yuKDvVBTSfPl6WcSJahpadgWpVVlcQbk7x3/O4WUY+xVpTnhL/pJVXh5/qRe
	YYKAos0d/HQ==
X-Received: by 2002:a05:600c:1d05:b0:4a1:811c:8078 with SMTP id 5b1f17b1804b1-4b963c7585cmr73754505e9.26.1794227006810;
        Mon, 09 Nov 2026 04:23:26 -0800 (PST)
Received: from frobdeb.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597652ca7sm10500318f8f.39.2026.11.09.04.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 04:23:25 -0800 (PST)
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
	linux-kernel@vger.kernel.org,
	Frank Obergfell <frank.obergfell@bytesatwork.ch>
Subject: [PATCH 0/5] arm64: dts: freescale: Add support for bytesatwork byteDEVKIT i.MX93
Date: Mon,  9 Nov 2026 13:22:45 +0100
Message-ID: <20261109122250.720757-1-frank.obergfell@bytesatwork.ch>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_042329_730727_24661948 
X-CRM114-Status: GOOD (  12.91  )
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
System on Module (SoM) and the carrier boards byteDEVKIT v1.0 and v2.0[cite: 59, 60].
It also adds display support for the integrated Youritech ILI9806E
MIPI-DSI panel by extending the existing ILI9806E panel driver[cite: 56, 57].

Overview of the series:
- Patch 1: Documents the vendor prefix for Youritech and adds the compatible
  string to the Ilitek ILI9806E panel binding[cite: 56].
- Patch 2: Extends the ILI9806E core and DSI driver with init sequence,
  display timings, burst mode, and supplies for the Youritech panel[cite: 57].
- Patch 3: Adds the MIPI-DSI controller node and the bidirectional OF-graph
  link to the LCDIF in imx93.dtsi[cite: 58].
- Patch 4: Documents the bytesatwork vendor prefix and DT bindings in fsl.yaml
  for the byteENGINE and byteDEVKIT platforms[cite: 59].
- Patch 5: Adds the Devicetrees for the byteENGINE SoM and byteDEVKIT v1.0/v2.0
  carrier boards[cite: 60].

Subsystem / Merging notes:
Patches 1 and 2 target the DRM subsystem (dri-devel / drm-misc)[cite: 56, 57].
Patches 3, 4, and 5 target the Freescale/ARM SoC tree (Shawn Guo)[cite: 58, 59, 60].
They are submitted together to provide full context for the hardware support.

Testing:
- Validated on physical hardware (bytesatwork byteDEVKIT v1.0 and v2.0).
- Passed `make dt_binding_check` without warnings[cite: 56, 59].
- Passed `make CHECK_DTBS=y` for both target DTBs[cite: 60].
- Passed `./scripts/checkpatch.pl` on all patches[cite: 56, 57, 58, 59, 60].

Frank Obergfell (5):
  dt-bindings: display: panel: ilitek,ili9806e: Add Youritech ILI9806E
  drm/panel: ilitek-ili9806e: Add support for Youritech ILI9806E panel
  arm64: dts: freescale: imx93: Add MIPI DSI controller node
  dt-bindings: arm: fsl: Add byteENGINE i.MX93 platforms
  arm64: dts: freescale: Add support for bytesatwork i.MX93

 Documentation/devicetree/bindings/arm/fsl.yaml                |  12 +
 .../devicetree/bindings/display/panel/ilitek,ili9806e.yaml    |   1 +
 Documentation/devicetree/bindings/vendor-prefixes.yaml        |   4 +
 MAINTAINERS                                                   |   8 +
 arch/arm64/boot/dts/freescale/Makefile                        |   2 +
 arch/arm64/boot/dts/freescale/imx93-bytedevkit-v1-0.dts       | 459 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx93-bytedevkit-v2-0.dts       | 441 +++++++++++++++++
 arch/arm64/boot/dts/freescale/imx93-byteengine.dtsi           | 199 ++++++++
 arch/arm64/boot/dts/freescale/imx93.dtsi                      |  34 ++
 drivers/gpu/drm/panel/panel-ilitek-ili9806e-core.c            |   4 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9806e-dsi.c             | 158 ++++++
 11 files changed, 1321 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-bytedevkit-v1-0.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-bytedevkit-v2-0.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-byteengine.dtsi

