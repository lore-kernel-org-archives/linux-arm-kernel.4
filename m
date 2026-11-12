Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F32260A383A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 15:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OsgekeGm;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=hf9VL5zH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZlolI9vENTEl6C1rNaluT0xNLPmhG2Q3ZnlKVC/ytPQ=; b=OsgekeGm7wmrco
	/JqQCVxzS5GomXgqNsbm1+BP0FSm5iNdCXLPid5UOHeszTEtgCfrS++Vl6W9YBngda5+cpm1akxzr
	d+NPVjMlyWnGv8SRdkjLznrdjIGZSTK2k0jvaT70/anAnBh+mca/hUlq6Odc+cPdODVHbZdQZI+rx
	9rhhIKMxko3zWJkTbGW8JfYVeM1mgGohuHa98UjKApnMiw/DUOz5P+N8R4tA751bVOMp3uvesJqN/
	/hlHWuLA6IkjpYYZC5Quw8C0WG2Rhxh0O5HmeEaUREq+TQo1TRRK7/p8v8IbWOPHwn63aSqpIqAPA
	WzfynSBBQs+SA3N5XEJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWKB-0000000ANDg-1Vvh;
	Thu, 12 Nov 2026 15:02:51 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWK7-0000000AN9l-2rAL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 15:02:49 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 50DDE2316A;
	Thu, 12 Nov 2026 16:02:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794495766;
	bh=ZlolI9vENTEl6C1rNaluT0xNLPmhG2Q3ZnlKVC/ytPQ=; h=From:To:Subject;
	b=hf9VL5zHqWKbkMYu073oF0sO54UDfRzqxdjbI+Oacu/1Fhk4IbojbcW5Lw93OZIJ6
	 SF8qFUm5nXE3X9di6utHHX/xS7s5n1NhXkUl4fbEpLlyAyhX3w3ebpNPWmJikyMXaa
	 WSQhdUk19Bsa5WeB3cvMAm4RMy5bohFgTliqFkFLGX2bJLyvVSr7F6aekWru3mxr2L
	 IsCjQ3QcHvZzZGU+jZtnuLNwmnPfhu0fNFlnLXnQwqO/f+l7rIhOgNWaio/2kyirn5
	 jS8YEtshE6dxqAnR4agZvytoVyHowV3uR4YiWA8Xrgr8jb6lAlAnrRvzfoQRT2ylKh
	 Ym0/pxMC7D3vQ==
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
Subject: [PATCH v1 04/11] arm64: dts: freescale: imx8x-colibri: Add SPI alias
Date: Thu, 12 Nov 2026 16:02:26 +0100
Message-ID: <20261112150236.164850-5-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261112150236.164850-1-francesco@dolcini.it>
References: <20261112150236.164850-1-francesco@dolcini.it>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_070248_004842_65E27709 
X-CRM114-Status: GOOD (  10.38  )
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
single SPI bus available to the carrier board, implemented by lpspi2
on Colibri iMX8X.

imx8qxp.dtsi numbers lpspi2 as spi2, so the Linux bus number in sysfs
and the spidev name do not match the Colibri interface. Add a spi0
alias in the SoM dtsi and delete the inherited spi2, so lpspi2 is
bus 0 and carries a single alias.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi b/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
index 2415487d3a5d..8f04bc3decda 100644
--- a/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
@@ -6,6 +6,11 @@
 #include "dt-bindings/pwm/pwm.h"
 
 / {
+	aliases {
+		spi0 = &lpspi2;
+		/delete-property/ spi2;
+	};
+
 	backlight: backlight {
 		compatible = "pwm-backlight";
 		pinctrl-names = "default";
-- 
2.47.3


