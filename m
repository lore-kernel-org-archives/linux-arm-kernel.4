Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477FA606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 12:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u3VL4jSH;
	dkim=pass (2048-bit key) header.d=dh-electronics.com header.i=@dh-electronics.com header.a=rsa-sha256 header.s=dhelectronicscom header.b=uOGHznIT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=n//DTZBcx/4hfvqlbxCdXzZBUWO1eReKPjxq+SXr1Kk=; b=u3VL4jSHd432L3rsvniQAYy3Iq
	uXhx/9CjuRAKwQYgUaH73FOvnRywQzueAdr33cE57TyF4QkkeGlZx6Uy8jC6i3Yehq+exdWrc+Aw5
	BjYJy3bW9lR2bj1iiPNwTtBTcywAs4Dn1201oRz/5eCIwtMREUYeGfI/f/wXZMMv+KSipC2+3VzQB
	ET3RTdbF+8zMQIoWnRuUcS8l3c1x0L5C2uvZIn+krt+F1HhQiM+hnSQohDfMOwGrzga6n6N3G0+Bq
	qMi5io9vMOueTKlnXZTpaB6i6kKMjOw14gcTxgcrU1s3OChv1a8mM5Jc1fSMyPtqW0uC8azkLrIDk
	zyMtUwYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWCFb-00000009r8t-1jor;
	Wed, 25 Nov 2026 12:37:27 +0000
Received: from mx3.securetransport.de ([2a01:4f8:c0c:92be::1])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWCFW-00000009r7G-15TZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 12:37:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
	s=dhelectronicscom; t=1795610213;
	bh=n//DTZBcx/4hfvqlbxCdXzZBUWO1eReKPjxq+SXr1Kk=;
	h=From:To:CC:Subject:Date:From;
	b=uOGHznITf9fa4EOweyKuhzhXoiR7raT+f1wfVZIv7Pn8kfHdrayQ/PkxCsarQI2xj
	 2lwuxw8hmWNs2KjuASIizA3apdopog14vFgks+zWWu0EcIvRzFRIbaazufQfKzEwYa
	 0rfyqUc4MZUHRgom5hMHhvPXUzAtazGEL5gn+gcXhTLZ5IxOwBGnN3Sn0MXnHlGeAx
	 nlwuIY1Nh0XVHxZNzxaSB+cRCLqplkkPWPOCRZ2ylo+3AHMQOu5MXce5bi4iYaCF7U
	 krgEo8ZQdRtJEHX3cqkeZGoAIzHDRniLmiHhWd5EgzR8Rtqo1NCkOK5OONOBxo/X6Y
	 lMK8oZPI4W5fA==
From: Christoph Niedermaier <cniedermaier@dh-electronics.com>
To: <linux-arm-kernel@lists.infradead.org>
CC: Christoph Niedermaier <cniedermaier@dh-electronics.com>, Pascal Zimmermann
	<pzimmermann@dh-electronics.com>, Conor Dooley <conor+dt@kernel.org>, Fabio
 Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Marek Vasut <marex@nabladev.com>, Rob Herring
	<robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	<kernel@dh-electronics.com>, <devicetree@vger.kernel.org>,
	<imx@lists.linux.dev>
Subject: [PATCH] ARM: dts: imx6ull-dhcom: Change eMMC pin configuration
Date: Wed, 25 Nov 2026 13:35:20 +0100
Message-ID: <20261125123520.6040-1-cniedermaier@dh-electronics.com>
X-klartext: yes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_043722_539780_4D6EC4B6 
X-CRM114-Status: GOOD (  10.74  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Pascal Zimmermann <pzimmermann@dh-electronics.com>

Tests have shown that, with the current pin configuration of the
eMMC (usdhc2 interface) read errors can occur with a certain
type of eMMC chips. Tests conducted with all eMMC chip types
used in the DHCOM i.MX6ULL SoM showed that there were no issues
with the pin configuration currently used in the U-Boot. That is
why this configuration is being adopted in Linux as well.

Co-developed-by: Pascal Zimmermann <pzimmermann@dh-electronics.com>
Signed-off-by: Pascal Zimmermann <pzimmermann@dh-electronics.com>
Co-developed-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Signed-off-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Marek Vasut <marex@nabladev.com>
Cc: Pascal Zimmermann <pzimmermann@dh-electronics.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: kernel@dh-electronics.com
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
---
 .../boot/dts/nxp/imx/imx6ull-dhcom-som.dtsi   | 22 +++++++++----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-dhcom-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-dhcom-som.dtsi
index a74f5273f9b3..97d4de84b2ac 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-dhcom-som.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-dhcom-som.dtsi
@@ -568,17 +568,17 @@ MX6UL_PAD_GPIO1_IO05__GPIO1_IO05	0x120b0
 
 	pinctrl_usdhc2: usdhc2-grp {
 		fsl,pins = <
-			MX6UL_PAD_NAND_RE_B__USDHC2_CLK		0x10069
-			MX6UL_PAD_NAND_WE_B__USDHC2_CMD		0x17059
-			MX6UL_PAD_NAND_DATA00__USDHC2_DATA0	0x17059
-			MX6UL_PAD_NAND_DATA01__USDHC2_DATA1	0x17059
-			MX6UL_PAD_NAND_DATA02__USDHC2_DATA2	0x17059
-			MX6UL_PAD_NAND_DATA03__USDHC2_DATA3	0x17059
-			MX6UL_PAD_NAND_DATA04__USDHC2_DATA4	0x17059
-			MX6UL_PAD_NAND_DATA05__USDHC2_DATA5	0x17059
-			MX6UL_PAD_NAND_DATA06__USDHC2_DATA6	0x17059
-			MX6UL_PAD_NAND_DATA07__USDHC2_DATA7	0x17059
-			MX6UL_PAD_NAND_ALE__USDHC2_RESET_B	0x17059 /* SD2 Reset */
+			MX6UL_PAD_NAND_RE_B__USDHC2_CLK		0x1f019
+			MX6UL_PAD_NAND_WE_B__USDHC2_CMD		0x1f019
+			MX6UL_PAD_NAND_DATA00__USDHC2_DATA0	0x1f019
+			MX6UL_PAD_NAND_DATA01__USDHC2_DATA1	0x1f019
+			MX6UL_PAD_NAND_DATA02__USDHC2_DATA2	0x1f019
+			MX6UL_PAD_NAND_DATA03__USDHC2_DATA3	0x1f019
+			MX6UL_PAD_NAND_DATA04__USDHC2_DATA4	0x1f019
+			MX6UL_PAD_NAND_DATA05__USDHC2_DATA5	0x1f019
+			MX6UL_PAD_NAND_DATA06__USDHC2_DATA6	0x1f019
+			MX6UL_PAD_NAND_DATA07__USDHC2_DATA7	0x1f019
+			MX6UL_PAD_NAND_ALE__USDHC2_RESET_B	0x1f019 /* SD2 Reset */
 		>;
 	};
 };
-- 
2.30.2


