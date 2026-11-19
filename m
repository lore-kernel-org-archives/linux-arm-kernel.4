Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3B2606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 16:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tGluv3/W;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hae0IY6Y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=G96VJts1v3/6sj9M5CAvHWlJcDFh4oPkNZ60e98HLbE=; b=tGluv3/WN7krvpjgNzUsKqf55S
	Wg77jyujjbbUq8UXJh5Q9McOl1oDN2NCGt3nsDz7jnARjLgBftsqgQC0lOz0W0riTgVWE2GVdzkdP
	nNNbGif8jsdF/pNPK7zQ3CahaWFTa7Zq7pMbwUKANpGPsKexnoYNwM/OPkVhTqrg41IXOaFctzlt6
	aN6TBg21UURkzthPH2ejjDn53W8Z0gR3eebBM5vheN99R/K5cwdaTI4EzsDmxkQk3j86Ws/DUC+Mp
	Qi/eOLkPrT8MxogrT3LhnJm7NLppiY75+11emrhTRZ8P+EwjWbFTi0AHRgNb6nruS1N1Ecf3NkmWs
	bcJLMjOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU4Zp-0000000CZOp-0Rad;
	Thu, 19 Nov 2026 16:01:33 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU4ZR-0000000CZGP-1xQU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 16:01:10 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so25924695e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 08:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795104067; x=1795708867; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G96VJts1v3/6sj9M5CAvHWlJcDFh4oPkNZ60e98HLbE=;
        b=hae0IY6Yjxj7eTulMS1V0g87uxGTM9S6SoLCsGh1PbNUluw6sWR7p2p7FLYvbXOk66
         uowzcMMqf+ql1BjNyfl9QAe+f/cK1/dFcVa+V4dvljB3T3S/m7fYUwNjYRq+SZQIIbYX
         r6FOnepLO4UbUGm/gUSshxvAuAtlrVTTv8wcnCa2YsP7bLFfGNAbogXowrxeZ6jbkp/p
         Dkcf3H1Nx0fqZaMWbH0MTIH7QbbW3kl08BclJPkqQcXX3pJYNhVonyYOU6m5Iwovs9dq
         p6tT+Bj1EdHrvtSoTtwWKEi637I+404Tc3t7Lk4ODOkGsebfVBbqUVtHc+xE+bBhzmK0
         IPfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795104067; x=1795708867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G96VJts1v3/6sj9M5CAvHWlJcDFh4oPkNZ60e98HLbE=;
        b=z58uX7mQ8yHTHz7gdURu3bMucL9nGc5VMhwV4Jj/Oftp3x0wv090yUQ9Rfyxucty5U
         /DFDKfbFW6SL2hRZql7wvX2okGi+CYO/dFu2remY7uvpSW5voNa4YMnyY3UbOzeL0R0P
         ZD0wZkD2C1CHHW+mmDPaW5EmS4lXb3VEB69GYrp5P+niJ2n/YR/wKXif16IRrlUyIvXY
         3wa+UWBEMLtDBo3JaJm0B1tzh6ERZxaGJ48/zPquNC0x14vrXQQmgT2v8+4/N72/o20U
         li2Mycng6+eHIlHDVyjaH14oqNvXKNG7/lN4udYqkh4hXWI4G/vLvFkjo9dPIbDXvE9M
         zOxg==
X-Forwarded-Encrypted: i=1; AL+hErHJkwzkcbz4wqkr26vtWLQ28iZRHULnAsM/17wKVvHwzEFgzXGayPZBFT0HBDGl7aJOgL/LF7WcRFF+XW9ZyQg1@lists.infradead.org
X-Gm-Message-State: APuU4Z9s2u7DjiCr0qJ6HoVQVub01OrqH7U+Eh4SiRToktQwQ39NNaLe
	OhBcUz+JHO2HPJCAJD88PgPSy8nWBIY1zvR65BVEv6NcrVl6XPs0deH9
X-Gm-Gg: AYBFou3+lWepfIR4/KCgzcL1+hutpbXf1Nwf7otoQz6Ahje3le723fO+3w2OTlz2ZmP
	Ui8lap03qAbkbPyh59csJjAmb4+blDt5GgaAMjoo2LiGkBBQFUyIeiR3lYql3+Qx1rFyINS8fbI
	11qIf9/p3PcgVb2IsDZE3ladU785ChOPBZ/Jl9ydHf1HcgnJNR5GcZbVl6F/XLNgoNiF5BqUpmG
	oNqLqZFWcvofmxL4dPE7COfkWVBWDWd1vN+Ngi876FDwLfWFdFHjhOjBdqj6RmmcebLr/wn02rU
	n4ClaOCFs6EvGKKUaIbS1tmnpIvHS5P6y3cIYGtEIOHdq+P40ACIMRpLkPFmOZTO9lYYb7cAuea
	tT4W5qhLteP8mblwZDGnHvI68opt4zujfEM2LXtf1vdnHJXjL7+a8LQR/0EmEbukMQx49KNkl9X
	SdFeEUlpohNkU5hx/9R2x3F7RC3YrxZ6YorjtHw8sLEba/NRDN56sukR9CH+xVR9bXItzt4FlOs
	6Ih7hW1af/wrwYrPJSuwYuefQ5IDJESOCIqYJwjZpfxljS9qWr2HbB2IZwtAiHP2UVfklxzwLB2
	QK8vF+dcxEqBWGFAb9f2266ijBvjz150zE/abAvChMabBhpEg5Wv+0S08QVsTgPoaT+zrJ/qgef
	aeVZd1eRUGFTJ9oWFwF44xCiziIQYFFD+6wIs1Vjk5GA8tXyq/0Ez5xU=
X-Received: by 2002:a05:600c:4f0d:b0:4bb:6f41:399f with SMTP id 5b1f17b1804b1-4bb7da2ba1bmr145169935e9.24.1795104066898;
        Thu, 19 Nov 2026 08:01:06 -0800 (PST)
Received: from Lord-Beerus.station ([93.146.104.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm323784f8f.44.2026.11.19.08.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:01:06 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v3 0/2] arm64: dts: freescale: imx93-var: Add Cortex-M33 configurations
Date: Thu, 19 Nov 2026 17:00:52 +0100
Message-ID: <cover.1795103362.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_080109_536169_08FC668B 
X-CRM114-Status: GOOD (  13.27  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds Cortex-M33 overlays and combined DTBs for DART-MX93 on
Sonata and VAR-SOM-MX93 on Symphony.

The first patch extracts the existing DART-MX93 remoteproc configuration
into a common include without changing the resulting DTB. The second adds
the M33 variants, reserving the peripherals used by the firmware and
keeping dependent devices disabled. Remoteproc and MU1 are then enabled
only through the M33 overlays.

Changes in v3:
- Split the common configuration extraction and the M33 overlays into two
  patches
- Use "reserved" for peripherals assigned to the M33 firmware; keep
  "disabled" for dependent devices.

Changes in v2:
- Enable cm33 and MU1 only through the M33 overlay on DART-MX93.

Patch 2 uses the following binding and driver commits, already in
linux-next:

- ebb21cc5d1c0 ("dt-bindings: remoteproc: imx_rproc: Document
  memory-region-names to avoid implicit ABI")
- 8396089f91fa ("remoteproc: imx_rpoc: Use memory-region-names to avoid
  implicit ABI")

Validation used the remoteproc binding update and cebd1c0961d8
("dt-bindings: gpio: vf610: fix clock requirements per SoC"), which fixes
pre-existing GPIO schema errors. The base and M33 DTBs build and pass
schema validation.
No hardware testing was performed.

Stefano Radaelli (2):
  arm64: dts: freescale: imx93-var: Extract common Cortex-M33
    configuration
  arm64: dts: freescale: imx93-var: Add Cortex-M33 configurations

 arch/arm64/boot/dts/freescale/Makefile        |  9 +++
 .../dts/freescale/imx93-var-common-m33.dtsi   | 24 ++++++++
 .../freescale/imx93-var-dart-sonata-m33.dtso  | 55 +++++++++++++++++++
 .../dts/freescale/imx93-var-dart-sonata.dts   |  2 +-
 .../boot/dts/freescale/imx93-var-dart.dtsi    | 14 -----
 .../freescale/imx93-var-som-symphony-m33.dtso | 50 +++++++++++++++++
 6 files changed, 139 insertions(+), 15 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-dart-sonata-m33.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-som-symphony-m33.dtso


base-commit: 33adc96ac217d6e95b7c44ac383c19ca4ae2ff52
-- 
2.47.3


