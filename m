Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F72606A339
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 15:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=epKvr5BT;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=EzyZIlwT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Ixcj6PNq9GxugAmLZbG5bwGiWeCce+wGaPCQOB8zgAE=; b=epKvr5BTSfAdYl
	ipozmkwypINpIATC/t9yRdpNGgwmPAsKyYozX/gZdg+CAYbQDO+lYIgW+KbJ0mL7J/Z6RQrp0C81N
	l0yhWHkBy09+pgb33DAsQEBVOaINi+E88uofReqvXn4A2VEiA32BEQ5q0p8LrhamjzX3VPVt67/HM
	UF+LQhQxG4gjQBWCwCXERWLPqaeClzHQY2OmQVsMA7Kg9huq8yg0twPoUfCkOdfWzTUWDPfneRvbp
	yL7hpmhjok/+pIXGMIhVec1qcipc5Vf20SmaepwPLC/NHdVVJI4hn3gUxSQeBtV0IiET3Tkob4pjh
	TTNDN+f7bbR+JuaZyAEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWKY-0000000ANUe-2wbl;
	Thu, 12 Nov 2026 15:03:14 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWKD-0000000ANE5-03o6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 15:02:54 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id B91E423217;
	Thu, 12 Nov 2026 16:02:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794495771;
	bh=Ixcj6PNq9GxugAmLZbG5bwGiWeCce+wGaPCQOB8zgAE=; h=From:To:Subject;
	b=EzyZIlwT/mow0+EAlGqUhjrokW4rsCObajWVJXNA2QkM/m+z0BFHrRzVGYlxdikMp
	 hBmQHsu6uUZtEM27h4mrO07vWglFckUbcimpKBDm7UYXCIQOmEOV7AREUkcrcSuHSo
	 3wN7d1VEtLxOrUfll1iJDxNpylABcPMKDyUsExdn/aA0E3tDZrTiaCzqFAdQwCDjz9
	 U5fKxDKf4RxwaJM+GtLfCpMl7xhP4dvugByup3BOogf84IGz0Lc/OCZIpU2ZyHaOA1
	 KuH0Hr4ef12gZ3m4/e3b+qVnC+TI4/Af37mOXtkInNh72EQm4I+kUF5lJIfQ+p0X4n
	 gWavjqiGVrdGw==
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
Subject: [PATCH v1 11/11] arm64: dts: freescale: imx95-toradex-osm: Add SPI aliases
Date: Thu, 12 Nov 2026 16:02:33 +0100
Message-ID: <20261112150236.164850-12-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261112150236.164850-1-francesco@dolcini.it>
References: <20261112150236.164850-1-francesco@dolcini.it>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_070253_241557_B4FFF68B 
X-CRM114-Status: UNSURE (   9.61  )
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

The OSM specification defines the module interfaces and their naming,
SPI_A and SPI_B being the SPI buses available to the carrier board,
implemented by lpspi4 and lpspi1 on Toradex OSM iMX95.

Without aliases the Linux SPI bus numbers are assigned dynamically and
can change with the carrier board or probe order. Add spi0 and spi1
aliases so the bus numbers in sysfs and the spidev names follow the
OSM interface order, SPI_A being spi0 and SPI_B spi1.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx95-toradex-osm.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-osm.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-osm.dtsi
index 8eb7ea4ed9ee..dc2ef7035246 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-osm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-osm.dtsi
@@ -30,6 +30,8 @@ aliases {
 		serial2 = &lpuart5;
 		serial3 = &lpuart3;
 		serial4 = &lpuart2;
+		spi0 = &lpspi4;
+		spi1 = &lpspi1;
 		usb0 = &usb2;
 		usb1 = &usb3;
 	};
-- 
2.47.3


