Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22769606A339
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 15:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wEOhOO2z;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=elmq5Boc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ylShe8HWjM2yCOaQXzQ0NGIXs6JPh3EhfmIe6mjqzT4=; b=wEOhOO2z2CeIZT
	BD5eZbRnc82SVhtLyYSqkKfKSPV/tee/jVqDQ9dSjd5pIYWY0TdwuDGKpqRMeWPtFC/GQtj5OG9T4
	+T962EIhhnwyWlVPVrPMosLWJPmkIl6I5Oia6dVfcG3RZiDdz896N9qqUSAP7f+JgInOFoA4ReS6U
	k0fpAiBWm+l5FiKuFfd9Zdjz4ZJ0rAjDOTvfAa44G690aiVfDzTCA0NxEiC2ZZ0kNrp9jxoFs5S8l
	KbGIxsBeuD7QUY2e6DC8vtBrHsEPEGvlGzzO0lMuch+pzmWVck3nSNO9B3xMiQBTYlwruMsjqyy3S
	RN2isrL2BSFO1QdvVjqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWKX-0000000ANQP-0Uux;
	Thu, 12 Nov 2026 15:03:13 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWK9-0000000ANB0-2O6W
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 15:02:51 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 29323231D6;
	Thu, 12 Nov 2026 16:02:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794495766;
	bh=ylShe8HWjM2yCOaQXzQ0NGIXs6JPh3EhfmIe6mjqzT4=; h=From:To:Subject;
	b=elmq5Boc7mSXRw2ZQTiTmd30m7eQsb+OS2hWtcZ3oiz63c3BMJw6Ny+x37NSYjkS2
	 HF6vSxQgq3QmAa8WS6c7SKtA7lid9km6+jkAhIvgIBQ3+NIsXWqG75noYVFdloh8cX
	 Qjgio6U/oIqyJ303sYJA/9OM+5hY2HxK15lUkzn3vMtVuZtKQvExV9JWFApgdnRc6t
	 S5kcx+wF2wnSPrzK5aNRjfw1hbBphVXPUS2RvLS+LU3azIBx8J6Gfz+WwvaQxAT3b0
	 MnLXDAORdGORQp5WctvByzVuwgYCSbTf9PbvNvjGqkxqZh1pUrPVzTD5g7ORnEycPV
	 qem1R07MpJf8g==
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
Subject: [PATCH v1 05/11] arm64: dts: freescale: imx8mp-toradex-smarc: Add SPI aliases
Date: Thu, 12 Nov 2026 16:02:27 +0100
Message-ID: <20261112150236.164850-6-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261112150236.164850-1-francesco@dolcini.it>
References: <20261112150236.164850-1-francesco@dolcini.it>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_070249_805686_7C45B8AD 
X-CRM114-Status: GOOD (  10.42  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Francesco Dolcini <francesco.dolcini@toradex.com>

The SMARC specification defines the module interfaces and their
numbering, SPI0 and SPI1 being the SPI buses available to the carrier
board, implemented by ecspi1 and ecspi2 on Toradex SMARC iMX8MP.

Without aliases the Linux SPI bus numbers are assigned dynamically and
can change with the carrier board or probe order. Add spi0 and spi1
aliases so the bus numbers in sysfs and the spidev names match the
SMARC interface numbering. This replaces the spi0 alias imx8mp.dtsi
gives to flexspi, which is not used on Toradex SMARC iMX8MP.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
index eb8b9db7e3cd..f3d21d788b85 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
@@ -20,6 +20,8 @@ aliases {
 		serial1 = &uart4;
 		serial2 = &uart2;
 		serial3 = &uart3;
+		spi0 = &ecspi1;
+		spi1 = &ecspi2;
 	};
 
 	chosen {
-- 
2.47.3


