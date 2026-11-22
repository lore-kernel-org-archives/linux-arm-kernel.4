Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C19606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 17:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UARJvSg9;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=lmjnV4vT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QHSm4db2SlPaNtSU+7xYvDAThcu6VcPl6213mSjo+4Q=; b=UARJvSg9C8Zu10
	ICi1zPhkS3g2NLYnfv7P+1QJDu01B2mh16fWvRc49NM7B0sdWi9cpvBNJH6h2/FblG/Ht0qqczDgz
	uautKh6rg8KRSuSWzWdPtGqg5GGyVx9F0xI/DjU9J0bwXSnB3KDxOYvPH9PPHLeg4ElZaIh+kRWrL
	k+/4ossQV/ciFmqMGR6n1W+6SA1N6+EVVrYTLnvfxCaxIlTAlIrcwPz5B7peml4pfWJqoeEjqclCQ
	nl1XIajduF+u15mabkozVnrqwQBUalLUKycmex3wNZVSbL8e37Pkdu5RsbpwZ3YooimVo4B6l3lQC
	xvCMJ5JbW5b3NyX+A87Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVBEL-00000001Q95-0XuE;
	Sun, 22 Nov 2026 17:19:57 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVBE8-00000001Q73-46g3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 17:19:48 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 033A6270BC;
	Sun, 22 Nov 2026 18:19:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1795367980;
	bh=QHSm4db2SlPaNtSU+7xYvDAThcu6VcPl6213mSjo+4Q=; h=From:To:Subject;
	b=lmjnV4vTqfuqYvJWlYIRfcMM2+htrhFRHSqErruwLNPxFM3IgAoRHRA9zfimm4GSt
	 JDzt8pOMiF+qzLuuw48YswIaHnKJftXt3X0MKm4M24+NlHJYOhzk55UsvKqSAgWuwl
	 0eW39aS3PNl7CRuaBobmX8n4ZXWs8LXNfII8vqZODOQ5GZBR5G+LktrzyxLnxz9L5s
	 eiatNmqpPwJH9oBIIAhDGNaqIrOKmtUhsrVpfU+RqvPbrpdHNe8Qua4tJScqd6rDb0
	 k1AdCuQh5lHop0+9PY1SoIoYqaw7HF9y5xvTN6MWRhFS1NP/Y6q3VlsXQQReRvhDt4
	 FxvMjMNTM8MFw==
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
Subject: [PATCH v1 2/2] arm64: dts: freescale: imx95-toradex-osm-dev: Fix SDIO_B definition
Date: Sun, 22 Nov 2026 18:19:29 +0100
Message-ID: <20261122171931.295307-3-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261122171931.295307-1-francesco@dolcini.it>
References: <20261122171931.295307-1-francesco@dolcini.it>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_091946_065750_4D97DCF3 
X-CRM114-Status: GOOD (  10.88  )
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

On the OSM Development Board, SDIO_B goes to the M.2 Key E slot for a
Wi-Fi/Bluetooth module. The slot has no card detect signal and M.2
modules are not hot-pluggable. The slot supply is not software
controlled, so the module stays powered in suspend. The SDIO_B signals
are fixed at 1.8V, supplied by the on-module +V1.8 rail.

Describe the slot as non-removable, keep the module powered in suspend,
and add the fixed 1.8V I/O supply. Without this, the empty slot is
polled every second.

Fixes: 39be5a7e3ecc ("arm64: dts: freescale: Add Toradex OSM iMX95")
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dts | 3 +++
 arch/arm64/boot/dts/freescale/imx95-toradex-osm.dtsi    | 1 +
 2 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dts b/arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dts
index 24cc6d4d917a..bbb2010eecfe 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dts
@@ -401,5 +401,8 @@ &usdhc2 {
 
 /* OSM SDIO_B */
 &usdhc3 {
+	keep-power-in-suspend;
+	non-removable;
+
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-osm.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-osm.dtsi
index dc2ef7035246..ff44e8c71bf6 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-osm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-osm.dtsi
@@ -669,6 +669,7 @@ &usdhc3 {
 	pinctrl-1 = <&pinctrl_sdio_b>;
 	pinctrl-2 = <&pinctrl_sdio_b_200mhz>;
 	disable-wp;
+	vqmmc-supply = <&reg_1p8v>;
 };
 
 &wdog3 {
-- 
2.47.3


