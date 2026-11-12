Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBC160A5BE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 15:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z4mptTXP;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=X7LVK5kk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=VmOEUIJPJDASl4ZFrq/9SlrqtTD/ZswAL2tmbUhdyxc=; b=z4mptTXPIUgX7ZT8KmOR4JH2oO
	1l6TwhoMabh6Im5oZyU9I7aO0nmpbcO6dHQ2UKd3RdVJaOBqnZ8D+gi8GIVa+eggApaC9PMG9i3UN
	VNB39oaJGCBJR6i9s6dZhcLKSgVaHS7vYq7LeOn/Xkv5WEt6CBiWcTj6ZNpJZOqDBSWKas5U0gQFf
	PqMS6/UaUT9fwddsb0CZJFgcIQBJqqhUbvSaYQ98Ts9FHf8Rph8PfwHhqSGZdM1IS5Mv1mgZPY47P
	5PpccTiWMmXgqROCXgdWXgcRA5+ZTTyHKAGuXH31dziQAn4Grl3lDVJihmtOkzvIELVRe0gtMiNdr
	8InWfstQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWKA-0000000ANBu-1CXu;
	Thu, 12 Nov 2026 15:02:50 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWK5-0000000AN9L-3gLa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 15:02:48 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 5964523134;
	Thu, 12 Nov 2026 16:02:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794495762;
	bh=VmOEUIJPJDASl4ZFrq/9SlrqtTD/ZswAL2tmbUhdyxc=; h=From:To:Subject;
	b=X7LVK5kkEba8xp4QvzDBuhojZAndEQ8oFOJo4ksiuKn1rg1QnLjZODWtY6IpBMFeF
	 Ii51fNppyR6A1HxUjzIsp23pJhZ4oJ8hJ7dtVZOiwjNg4oepVTq5X75SfkEND9h+Us
	 scF7N4sEN/f2dUgDPtJjGxCNlV9EY2fa5WWARA5fwk+h99s7R74GH67zW0AlcS6nWA
	 rs9TLh8KS7hBt3rnL53j753v9CAXo2S4SQzz48qiiOWSBNBczUCmLmP3f5EDhrNQDb
	 PSBJs/tsKBqOlOXrHrj1e7saDBAMa4CpVryP7BbRVGFoABZERECp8wG3QL0GXdTOg/
	 Rpnr1BH7EPlNw==
From: Francesco Dolcini <francesco@dolcini.it>
To: Francesco Dolcini <francesco.dolcini@toradex.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-bsp@toradex.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 00/11] arm64: dts: freescale: Add SPI aliases to Toradex SoMs
Date: Thu, 12 Nov 2026 16:02:22 +0100
Message-ID: <20261112150236.164850-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_070246_578462_4C6775DF 
X-CRM114-Status: GOOD (  10.31  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Toradex SoM families (Verdin, Apalis, Colibri, Aquila, Lino) and the
SMARC and OSM standards define the interfaces available to the carrier
board and their numbering or naming as part of the module pinout. The
Linux SPI bus number instead follows the SoC dtsi aliases where they
exist (i.MX8MM, i.MX8MP, i.MX8QM, i.MX8QXP) or is assigned dynamically
(i.MX91, i.MX93, i.MX95), so the bus number in sysfs and the spidev
device name do not match the module interface.

Add spiN aliases to the SoM dtsi files so the Linux bus number follows
the module interface numbering, zero-based like the existing
serial and can aliases: SPI_1 is spi0 and SPI_2 is spi1, SMARC SPI0 and
SPI1 map directly, OSM SPI_A is spi0 and SPI_B is spi1, the single
Colibri SPI is spi0. Where the SoC dtsi already gives the same
controller another alias, that inherited alias is deleted so each
controller carries a single one. SPI controllers that are not part of
the module pinout get no alias of their own.

Francesco Dolcini (11):
  arm64: dts: freescale: imx8mm-verdin: Add SPI alias
  arm64: dts: freescale: imx8mp-verdin: Add SPI alias
  arm64: dts: freescale: imx95-verdin: Add SPI alias
  arm64: dts: freescale: imx8x-colibri: Add SPI alias
  arm64: dts: freescale: imx8mp-toradex-smarc: Add SPI aliases
  arm64: dts: freescale: imx95-toradex-smarc: Add SPI aliases
  arm64: dts: freescale: imx95-aquila: Add SPI aliases
  arm64: dts: freescale: imx8-apalis: Add SPI aliases
  arm64: dts: freescale: imx93-imx91-lino-common: Add SPI aliases
  arm64: dts: freescale: imx93-imx91-toradex-osm-common: Add SPI aliases
  arm64: dts: freescale: imx95-toradex-osm: Add SPI aliases

 arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi          | 3 +++
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi             | 2 ++
 arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi      | 2 ++
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi             | 1 +
 arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi             | 5 +++++
 arch/arm64/boot/dts/freescale/imx93-imx91-lino-common.dtsi   | 2 ++
 .../boot/dts/freescale/imx93-imx91-toradex-osm-common.dtsi   | 2 ++
 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi              | 2 ++
 arch/arm64/boot/dts/freescale/imx95-toradex-osm.dtsi         | 2 ++
 arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi       | 2 ++
 arch/arm64/boot/dts/freescale/imx95-verdin.dtsi              | 1 +
 11 files changed, 24 insertions(+)

-- 
2.47.3


