Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E22606A88B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 15:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EgHxcPE3;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=iKGqdZ+/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pHY2Uuseo/Jj08uOzuHqoVYzJM4L4mvUnlsbTZ8f4LA=; b=EgHxcPE3dyYNrT
	c2F07OwpCRVrmXaLGg4qkNxXIMoBHHpyPgn3z3IvZnAAEICQJY6mjmwm7fpNl/Z9A5mGKLziHo/2z
	XG91z1TEs/MTctbzf1W5Jb4OYJQo8yklN0NKvW40DU+vOacpCT1ghQ3ftRaYgv/XMZdJd3SdrVfUI
	sOa16UzYM1HRHXe7Zz6ZwBmMHwfmjE37qCWoE1tfNPHNLyhs3g8fsbuFQUZHfQchuboJY2HC4/0Qp
	cY2/LuCPAgFsLXSlcP+LONwyWOpOcPpfvu/D0am+qG/HB+GIA95QpH1S1E2BRQFaOIZVHXSvH5FW/
	tS5e8cztwH072wK2gn/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWKX-0000000ANRH-25us;
	Thu, 12 Nov 2026 15:03:13 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWKA-0000000ANBI-338I
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 15:02:52 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 7AAA023211;
	Thu, 12 Nov 2026 16:02:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794495769;
	bh=pHY2Uuseo/Jj08uOzuHqoVYzJM4L4mvUnlsbTZ8f4LA=; h=From:To:Subject;
	b=iKGqdZ+/7OJ+sXnCPIRbjDsNy2ruzCEiVX5HdsVE18shrGiXPpiKFHU5rKkoIE9Lk
	 H4TR4ZVlu3an394nP8WYhKGLDY16SqPbdW/OSlcn7S7wTtIFfT2xwRcaDeJnvpfHIi
	 hV5EeMwut2HlpbpaDFMkFua/ceI3zCZiq4HLkGyWFN4WBzmSMdEZL1SQSvXwzYyH2F
	 qfKHavk2zhx76yiMQQJk3c5QC0sZFO7Igz4rhtzbMCmaErMwuYKufEBSLva1boHdUa
	 3eOf+ni5xT90i6RoRupI2ezxpXhnWOXTSxs2RFLSAGgW/gZH5e7zYiM/RF/c7Tjkec
	 ZDXRGP7GNzwfA==
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
Subject: [PATCH v1 08/11] arm64: dts: freescale: imx8-apalis: Add SPI aliases
Date: Thu, 12 Nov 2026 16:02:30 +0100
Message-ID: <20261112150236.164850-9-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261112150236.164850-1-francesco@dolcini.it>
References: <20261112150236.164850-1-francesco@dolcini.it>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_070250_949713_C3F37A01 
X-CRM114-Status: UNSURE (   9.71  )
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

The Apalis family pinout defines the SoM interfaces and their
numbering, SPI1 and SPI2 being the SPI buses available to the carrier
board, implemented by lpspi0 and lpspi2 on Apalis iMX8.

imx8qm.dtsi numbers lpspi0 as spi0 and lpspi2 as spi2, so SPI2 does
not match the Apalis numbering. Add spi0 and spi1 aliases in the SoM
dtsi, zero-based with SPI1 being spi0, and delete the inherited spi2,
so lpspi2 is bus 1 and carries a single alias.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
index 64604f91d567..806f5a8a51c8 100644
--- a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
@@ -8,6 +8,9 @@
 / {
 	aliases {
 		ethernet0 = &fec1;
+		spi0 = &lpspi0;
+		spi1 = &lpspi2;
+		/delete-property/ spi2;
 	};
 
 	chosen {
-- 
2.47.3


