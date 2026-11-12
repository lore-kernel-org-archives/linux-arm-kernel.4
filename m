Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEAF606A331
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 15:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FoaClrCi;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=nc15KgJy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4jpLVRFQoNAIkhODHr7p9v0q04cK4RF3HI8eq390V6s=; b=FoaClrCi60f4ZJ
	i9KWbXeWMVvM3NS/BR8AeUzcQAjEptSAgOqCzLPukcVnk2HNrCTnhcIHfYB3kya816NeQjLFCfpdh
	j7EdC+fRB+EXxNcawEVT3GYlwg9MTduWXf731vlRmnMtB+y9TZTAnhQGnZPbvpqCFySJpIHEYB7QR
	2ytgEk0guK4jOkRi62FH9rpRxFJRPZCzE5Y8W1nmJQFhKRP6lM1/q9sKcoIAz6UpFz6FDz9V8GgRZ
	CWcSarUqy1Jxw9GOMvQ7nXB7filRJAquebaR/enHb9BXV55/WCVjmFhQe2XLd11CtWhe7eknSeny/
	gS4tK874/EuZoeFL4Ytg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWKW-0000000ANQA-3zRZ;
	Thu, 12 Nov 2026 15:03:12 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWK9-0000000ANB1-2OFU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 15:02:50 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id EB0D1231CF;
	Thu, 12 Nov 2026 16:02:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794495767;
	bh=4jpLVRFQoNAIkhODHr7p9v0q04cK4RF3HI8eq390V6s=; h=From:To:Subject;
	b=nc15KgJyc2W4Ajnos0nO/8naGQVob/LefsLMxis0LP2PVxUaVozmHssDQt73bFwrs
	 H3ui8UH7oE06l/Ct/7NIABBQfviJtKBTHuUJNw+qcej/CDCgADZHpw951sQfGNUtL8
	 Vbu01JDxLJQjBmF4HCETiGKjOcaIgMQLdneVuToQYhqqwHm2sobH05fiRA4xjpLAF2
	 B/JFZRa5J41TliAj0YkBYrxOFSBMA0zgpDFUcfH4rqKNGk+ZaX6ij0M47qfUJA5hd+
	 KlAapECDnDK8gJpY/uuHaos5FMG3Ktk28bBNBprEP1eNu5LnR9/GQC4M5vumqhJ6Rv
	 amRvuBI6rmmhw==
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
Subject: [PATCH v1 06/11] arm64: dts: freescale: imx95-toradex-smarc: Add SPI aliases
Date: Thu, 12 Nov 2026 16:02:28 +0100
Message-ID: <20261112150236.164850-7-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261112150236.164850-1-francesco@dolcini.it>
References: <20261112150236.164850-1-francesco@dolcini.it>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_070249_804102_0CAA2369 
X-CRM114-Status: UNSURE (   9.80  )
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

The SMARC specification defines the module interfaces and their
numbering, SPI0 and SPI1 being the SPI buses available to the carrier
board, implemented by lpspi6 and lpspi4 on Toradex SMARC iMX95.

Without aliases the Linux SPI bus numbers are assigned dynamically and
can change with the carrier board or probe order. Add spi0 and spi1
aliases so the bus numbers in sysfs and the spidev names match the
SMARC interface numbering.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
index 671c4dce0a99..82e21986bf95 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
@@ -26,6 +26,8 @@ aliases {
 		serial2 = &lpuart6;
 		serial3 = &lpuart3;
 		serial4 = &lpuart5;
+		spi0 = &lpspi6;
+		spi1 = &lpspi4;
 	};
 
 	chosen {
-- 
2.47.3


