Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7440606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 18:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W8CF2eJg;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=ieOAYH0K
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=oZD/E2ws0gxQw7hvaJXLUZeaQXjcNhPide10/UOfvlI=; b=W8CF2eJgYAX+eBYxbP+qZSh6eJ
	uaNFXrToOKbNtLYhmLBv3lRh25jB2Socjmf6VWtiI8uvQycPrMqPPClRIcphDwkInAmPCgHC0wnOT
	PTm16cO58uDTwFMhEVHZZUpfLql4cUAm3m3wiHhb5S2cRbdIGOQd2rFLqUdNoXJ1PXepDxHOMrj/m
	zI7dZ8wHjJBkA0ik8v6HmA9/YdcYqKcPgy9tIeRXlM79tmXe567pp1fkdRHdHefIqzW6In8DiFIZw
	EpllRbY1ZzFnSsjTniqZBMaSAox7YqyD9sJ3S/aKdAquegoL7Rao94wTNTjOHMQ/WfNpcoDHZSGnZ
	BDjKyETA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQTmb-00000001RGB-2k2U;
	Mon, 09 Nov 2026 18:07:53 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQTmY-00000001RFH-3akK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 18:07:52 +0000
Received: from francesco-nb.. (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id 236531F92C;
	Mon,  9 Nov 2026 19:07:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794247668;
	bh=oZD/E2ws0gxQw7hvaJXLUZeaQXjcNhPide10/UOfvlI=; h=From:To:Subject;
	b=ieOAYH0KbEEXTsOEJuNOcy5xV6OAt9Q/H6DIYsjr1ULHhw7VmWBzzp4Ujgpeb6G+6
	 SvANWcy5z7Fkz+DxXMXqi6x96rAzr2uH6DqTe/MxtrJmzV+C1QmE1Ymgpqk877gecJ
	 dmHg0vL9grVz3DLnUWpiSIiKmmf6l0g5T24jtP6OKpkVbCQx+Z1qI1Gb2Pv58SCqcw
	 XXosCJeX4v7mfMx0o9J9oPPSgvBh5l12vJtrEyQY2e09NP5ypk/GqRljtQEl5ioEk7
	 ebhK11GGQ8mCSfFDtEVjR5UxbRpywvgExadUsMQQm9n/0DMDaFgio1sEvDog4LsZYf
	 W2vdQ5lfllJhQ==
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
Subject: [PATCH v1] arm64: dts: freescale: imx8mm-verdin: Fix I2C pinctrl group comments
Date: Mon,  9 Nov 2026 19:07:41 +0100
Message-ID: <20261109180742.537977-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_100751_059155_A32DAA36 
X-CRM114-Status: GOOD (  11.25  )
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

The comments above the pinctrl_i2c2 and pinctrl_i2c3 groups are
swapped: SODIMM 55/53 is Verdin I2C_2_DSI (i2c2) and SODIMM 95/93 is
Verdin I2C_4_CSI (i2c3), as the controller nodes already state.

Fixes: 6a57f224f734 ("arm64: dts: freescale: add initial support for verdin imx8m mini")
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
index 1ac9d000d415..88539253ed45 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
@@ -1031,7 +1031,7 @@ pinctrl_i2c1_gpio: i2c1gpiogrp {
 			<MX8MM_IOMUXC_I2C1_SDA_GPIO5_IO15		0x146>;	/* PMIC_I2C_SDA */
 	};
 
-	/* Verdin I2C_4_CSI */
+	/* Verdin I2C_2_DSI */
 	pinctrl_i2c2: i2c2grp {
 		fsl,pins =
 			<MX8MM_IOMUXC_I2C2_SCL_I2C2_SCL			0x40000146>,	/* SODIMM 55 */
@@ -1044,7 +1044,7 @@ pinctrl_i2c2_gpio: i2c2gpiogrp {
 			<MX8MM_IOMUXC_I2C2_SDA_GPIO5_IO17		0x146>;	/* SODIMM 53 */
 	};
 
-	/* Verdin I2C_2_DSI */
+	/* Verdin I2C_4_CSI */
 	pinctrl_i2c3: i2c3grp {
 		fsl,pins =
 			<MX8MM_IOMUXC_I2C3_SCL_I2C3_SCL			0x40000146>,	/* SODIMM 95 */
-- 
2.47.3


