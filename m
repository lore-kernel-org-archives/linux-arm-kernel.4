Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912E6606A335
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 15:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XcUP0H/o;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=e+xOaV2Y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WXzyXPsawQzAas62KuytGi1NmXYvupw3UlaDFU2Owg4=; b=XcUP0H/oE1jsKQ
	Qm8aipd9nD/p/4T6p3HNkbPj9RoF4Dw482k9H8xJ4yWf4yvsZCuNw7zG4G5fuln6P75V8s82lpWW4
	zrjbm4BlowoWGdg+zbAEsUgiwPc3DKkjTX8t4NBhgNNMbfqiS0gVaz9M/RRWivkzGVsloQDYvilhc
	4lSKTEQ3N6KQsNDMoNoQ3STshfxny0N3jANvvWdSLD6lJ7YyNdOgGnhSXQs0pQXCFEqtZe+VhbCY2
	xLAH70E1s8Ea+yS+pMIfhB3c4hPYPOBXyE82JRPphEHTSHHI2EInIFia6GW7L6iQC5re2ZVptzj4l
	SGpZc2yOtrsviya5/XQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWQE-0000000AOhf-3zkM;
	Thu, 12 Nov 2026 15:09:06 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWQ8-0000000AOeL-33IV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 15:09:02 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 88E6B231B8;
	Thu, 12 Nov 2026 16:08:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794496139;
	bh=WXzyXPsawQzAas62KuytGi1NmXYvupw3UlaDFU2Owg4=; h=From:To:Subject;
	b=e+xOaV2Yn3fSU1ElQlbhub4LN2nOW/WuOUHPn4JLGSCYZKTEEYKOfTzm15DXD/XOo
	 9PvI8pfuxxxTQwJKox6EbKRls2EvYzg6MprHwrEWkVmSbUYrXXGAQNUfk3GAH8atkr
	 aDnMeWHBShRDnL+AUzVWL0P1jGppKoVlYhS1UJDZ8u+d8ovI7POq+6ixOPNwOf6tzk
	 uBayUXetUES9dX3rpa2V1vvgUvo+iaJLKxJgGQzP2hT0QGTvnv1beFqgsKr1E4Sgh9
	 08Inq2yM7v1VR1L6oyb12n+iv7NUISLaZeHA0Inqq39W4o/1bMgIDi6v1WUDHmtX4s
	 BR/zMkMyID+pA==
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
Subject: [PATCH v1 2/4] ARM: dts: imx6qdl-colibri: Add SPI alias
Date: Thu, 12 Nov 2026 16:08:46 +0100
Message-ID: <20261112150849.177133-3-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261112150849.177133-1-francesco@dolcini.it>
References: <20261112150849.177133-1-francesco@dolcini.it>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_070900_947176_0F2FF73E 
X-CRM114-Status: GOOD (  11.30  )
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

The Colibri family pinout defines the SoM interfaces, SPI being the
single SPI bus available to the carrier board, implemented by ecspi4
on Colibri iMX6.

imx6qdl.dtsi numbers ecspi4 as spi3, so the Linux bus number in sysfs
and the spidev name do not match the Colibri interface. Add a spi0
alias in the SoM dtsi and delete the inherited spi3, so ecspi4 is
bus 0 and carries a single alias. This replaces the spi0 alias
imx6qdl.dtsi gives to ecspi1, which is not used on Colibri iMX6.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi
index c9e539f83f80..0c5158e6be25 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi
@@ -16,6 +16,8 @@ aliases {
 		mmc1 = &usdhc1; /* MMC/SD Slot */
 		/delete-property/ mmc2;
 		/delete-property/ mmc3;
+		spi0 = &ecspi4;
+		/delete-property/ spi3;
 	};
 
 	backlight: backlight {
-- 
2.47.3


