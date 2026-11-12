Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B38C60A6F5B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 15:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=O02ViINN;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=Xa5vaz5o
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KXzbwVgeJe386h0gFNBUQkQpzvuQHCSy5uyOrGQ03aI=; b=O02ViINNkf6EsK
	BlDdzqUbEfgMhXdL9v0pF6hLI6O914i7Ah6/1g6Bu93Zd17Ifiq1FEI0OUJ4YPlZoEetBQhitqmgn
	/yGlixqdmYzuv8HdSZuT2mOZBIL4Ck+ZFM1QXTwRXuxlWQHWHMMqtX0ezGV+Uvcf3qdeL/iEr+DCd
	2jiq6ozxBDAdm+/sWcRg1GMhAByMIpRhNL2TWyLw7N/j7nppfA91ZC8A6ZiLWMobDJLb4SMiJ7gmp
	to92GgnFQ5ZMEyxw8t5XsNWoyyPaANMaRkC3p8bxzBV4aTKzxRVRT4Zw0CKigZKbykt2VF8GmNKdX
	ZWrYsIPNYDahsu40a8qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWKA-0000000ANBP-0IVP;
	Thu, 12 Nov 2026 15:02:50 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWK6-0000000AN9g-06xi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 15:02:47 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id BF86623187;
	Thu, 12 Nov 2026 16:02:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794495764;
	bh=KXzbwVgeJe386h0gFNBUQkQpzvuQHCSy5uyOrGQ03aI=; h=From:To:Subject;
	b=Xa5vaz5o4BnRfPenmT3vg+cJX1NLnQzUelZqiGXuzAa0mDOhpl486CO/jn5ACJm36
	 ckh9Xwu2wkXfb4rXNhUAuFxvUoCjMbPANjJE9BzMw9ow64BJ2TVf/F2e8EUvnDdU4d
	 G0csLUWbTECM6asdYReLoBnFCj3jZyh7Iy75xEvmtbEav/8R6x3AoXZGO5mr5FkMaV
	 j/1s7itwLghR9+AbDi30yIHzY7Qyo20MQOPuHDpEs4lgQCArKZmuX5HE1S7x5U7a5f
	 djNNBwwC9UtaNtDDsQ/nN1E1XQu2hvlOBx9He1fLkSmxwxr+uM+DzoNmhRBrHGXjOR
	 3FG/ozHiBUHAQ==
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
Subject: [PATCH v1 02/11] arm64: dts: freescale: imx8mp-verdin: Add SPI alias
Date: Thu, 12 Nov 2026 16:02:24 +0100
Message-ID: <20261112150236.164850-3-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261112150236.164850-1-francesco@dolcini.it>
References: <20261112150236.164850-1-francesco@dolcini.it>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_070246_585173_10B3B3AB 
X-CRM114-Status: UNSURE (   9.42  )
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

The Verdin family pinout defines the SoM interfaces and their
numbering, SPI_1 being the SPI bus available to the carrier board,
implemented by ecspi1 on Verdin iMX8MP.

Without an alias the Linux SPI bus number is assigned dynamically and
can change with the carrier board or probe order. Add a spi0 alias so
the bus number in sysfs and the spidev name follow the Verdin interface
numbering, zero-based with SPI_1 being spi0. This replaces the spi0
alias imx8mp.dtsi gives to flexspi, Verdin QSPI_1, which gets a
dynamic bus number instead.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
index 6887d5555d30..ae8aba856240 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
@@ -18,6 +18,7 @@ aliases {
 		ethernet1 = &fec;
 		rtc0 = &rtc_i2c;
 		rtc1 = &snvs_rtc;
+		spi0 = &ecspi1;
 	};
 
 	backlight: backlight {
-- 
2.47.3


