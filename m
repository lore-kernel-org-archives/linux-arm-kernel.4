Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FA0606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 15:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SPPgtqw2;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=oJRTTFCJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2uOiyb+Q8M216uUXx952IJn6ffOrIl5bI86rzJ70cYk=; b=SPPgtqw2sA7gkR
	KFf986VZtnRQZq5AJlB6m1vGMOk5i+yJDCh4AetNUGzQ3jiihYzLtpF9LFk49LiPTQeZ9ckWDS3mt
	lYyUp/1cpe9F2cYtGNw1ovC/FwG1KoatyZq8SI42MpJlHXu++zWT8e/lawBNYxK9aGq+91waXtyLK
	l+fF7Iy/iJcQ+ZsFXtyB5E1JFiYdt3SjOXxB8MyT85yfKAE6XmNhM9wIKzu9IJVp9OPXihiFOLoc1
	3tk5aIiyr/oe3r0iE7F5rrugF85L3whcl1yViiZ6EQ7M75mTRRugi+49xa8L3M01aWQ9uyXt7f5Zl
	vVFQBBKaRGBNW3PxDLpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWKX-0000000ANQw-1JVy;
	Thu, 12 Nov 2026 15:03:13 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWKA-0000000ANB8-1Eij
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 15:02:52 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id AA0AA231D8;
	Thu, 12 Nov 2026 16:02:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794495768;
	bh=2uOiyb+Q8M216uUXx952IJn6ffOrIl5bI86rzJ70cYk=; h=From:To:Subject;
	b=oJRTTFCJ6ymHL57mF0t61n2pua8y/wVHTmyEMXPEHHX7I5kmswZOYVGWFkPjELho5
	 YVRa/DhbTS9ujQm3TbWT2JDlUWVZItbRhBfVMecxXZ3Dw+bdrfCCF5yM+WARy2tJZg
	 ceK2ZDk0jtQghiz2IWNmxQ7RL5P7Wj9r2uCs8DCKwSxavfDRp8+VaQ3hOBAvCdEW8M
	 7Q0EzYvQRImUbpHo/fPT14OPTQAM13dKEr7/7tLq1S0E0N6nXQBMzUvnPH4ulvgLr5
	 aMuGb4un+s8R5B6Jcc26UwDH/cdUAZPsLiryFlt5NfMx+gycheEJy/gUkkyI3xv94o
	 8XzoTBLMBTqGg==
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
Subject: [PATCH v1 07/11] arm64: dts: freescale: imx95-aquila: Add SPI aliases
Date: Thu, 12 Nov 2026 16:02:29 +0100
Message-ID: <20261112150236.164850-8-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261112150236.164850-1-francesco@dolcini.it>
References: <20261112150236.164850-1-francesco@dolcini.it>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_070250_679569_482CCDAF 
X-CRM114-Status: UNSURE (   9.17  )
X-CRM114-Notice: Please train this message.
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

The Aquila family pinout defines the SoM interfaces and their
numbering, SPI_1 and SPI_2 being the SPI buses available to the carrier
board, implemented by lpspi6 and lpspi4 on Aquila iMX95.

Without aliases the Linux SPI bus numbers are assigned dynamically and
can change with the carrier board or probe order. Add spi0 and spi1
aliases so the bus numbers in sysfs and the spidev names follow the
Aquila interface numbering, zero-based with SPI_1 being spi0.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi b/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
index a1870f7b2eca..e7c20dfffd34 100644
--- a/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
@@ -31,6 +31,8 @@ aliases {
 		serial1 = &lpuart7;
 		serial2 = &lpuart1;
 		serial3 = &lpuart2;
+		spi0 = &lpspi6;
+		spi1 = &lpspi4;
 		usb0 = &usb3;
 		usb1 = &usb2;
 	};
-- 
2.47.3


