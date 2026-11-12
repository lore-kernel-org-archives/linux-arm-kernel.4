Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF6260A3837
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 15:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bYAY/w8h;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=BL3AKPo9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0o7zFUtmx81DYiw+KDuH3A0I0uPdMX8JtapZZwc/7S4=; b=bYAY/w8hRzC1WM
	W9FvV/2zpzoZ3Pesd7Btu6uQ9ZDeLUegtLvVOHo8uSkld26b5grZBmAjdScy/MEFVbDXdXwPU3hip
	hR/FA8mEXZe5Wksi/gz3y/hHuWwrMIrVwECtsjVpXDKyNm6WBxwt+U8S3QpqT6LMMM7zKvf8xshGW
	Vjkqdh+UAOnO5r6c4ecuqZ48ot1Y6VR4FwAkKOsD82S7XxFwqhENQoWnBt4qJDqghQWhA94uuzhCw
	XWjyqV954s2yZxUWUbNPS5xH/uHCdqo4e6iYL/T3fFJwvjsFLwPduYWnPl5tQzMY/ZJkLEOtfgSCR
	srn7MZ2I1SA8480J0XQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWKB-0000000AND5-0DYz;
	Thu, 12 Nov 2026 15:02:51 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWK5-0000000AN9M-3djr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 15:02:48 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 14D6523185;
	Thu, 12 Nov 2026 16:02:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794495763;
	bh=0o7zFUtmx81DYiw+KDuH3A0I0uPdMX8JtapZZwc/7S4=; h=From:To:Subject;
	b=BL3AKPo9yMyryBCX5BhmzfxiCyir9kfaobAaCP6Amp0Pxm+qNowYw+erMJ/59z+O0
	 rLSkJCbNhEOm3xca0cxc70ej/O0nihAygVT1pPKS/6bJONEWEx/2zCV8XDHWXRdlxh
	 Wjz5Ocn+HyPRArQV4z0pUU4VM88tilo6FhSE8HVeMcU0R+hwfXClPqoGbwXYv88NWQ
	 x7FJaMKST0ODaKsPfklZu6E5HfagLojO+xzOwgPHJML9oDcPRnnTc/QfoN+KEMeG6z
	 BiyuLsst0dFc04/575NpLgUdEkkunEg8J14LPFRKhpMw1tAHCM/+yXmUDrXsPXcdh2
	 N1xaS1nLN54uw==
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
Subject: [PATCH v1 01/11] arm64: dts: freescale: imx8mm-verdin: Add SPI alias
Date: Thu, 12 Nov 2026 16:02:23 +0100
Message-ID: <20261112150236.164850-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261112150236.164850-1-francesco@dolcini.it>
References: <20261112150236.164850-1-francesco@dolcini.it>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_070246_578496_9333D866 
X-CRM114-Status: GOOD (  11.09  )
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

The Verdin family pinout defines the SoM interfaces and their
numbering, SPI_1 being the SPI bus available to the carrier board,
implemented by ecspi2 on Verdin iMX8MM.

imx8mm.dtsi numbers ecspi2 as spi1, so the Linux bus number in sysfs
and the spidev name do not match the Verdin interface. Add a spi0
alias in the SoM dtsi and delete the inherited spi1, so ecspi2 is
bus 0, zero-based with SPI_1 being spi0, and carries a single alias.
ecspi3, internal to the SoM with the CAN controller and the TPM, keeps
the spi2 alias inherited from the SoC.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
index 1ac9d000d415..0369803a4d46 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
@@ -16,6 +16,8 @@ chosen {
 	aliases {
 		rtc0 = &rtc_i2c;
 		rtc1 = &snvs_rtc;
+		spi0 = &ecspi2;
+		/delete-property/ spi1;
 	};
 
 	/* Fixed clock dedicated to SPI CAN controller */
-- 
2.47.3


