Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C197E60A5BE0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 15:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FYo2yrhQ;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=c7I/zUH7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xmvLJrJyELZb8cY10zo4EC4FD4F0vTo2mGwICJdRtTs=; b=FYo2yrhQhru0iF
	MX8XlDRhDqgGapdb7UOWnXNXOWfdclAg3rYFl05RM5XR0s4bEql02jgdXnPaXtc84Ry/qf0eRbzez
	vJdft1G3Uucx8YOnEy9tKP+Jj3QHZG5F20XvHr//kl8GulZsdPuZV3VG3/sFJV+pddCjMynh2cKLw
	eAxdzOHjWxm1W+DHTUtNvYNfkRcFtcjvYAGSbgEjhaiJbpSnzGee3ewFyVJDgBwCqtTkwD6RuY4MP
	yYpVnuQA+dfclWhfE0FdVCvc5mKe3johEykxs7qR4MwoCbXgtCn4f7CDxJXGtResjadKi9hfk6wMK
	U7hDPQ0M5nUe5lb/wisQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWKB-0000000ANE2-2WaC;
	Thu, 12 Nov 2026 15:02:51 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWK6-0000000AN9h-31t9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 15:02:49 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 7F57C231B8;
	Thu, 12 Nov 2026 16:02:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794495765;
	bh=xmvLJrJyELZb8cY10zo4EC4FD4F0vTo2mGwICJdRtTs=; h=From:To:Subject;
	b=c7I/zUH7MjMR/q5YU6UvGZnrGGIprzYpeurMv9G7Bap6bMXnKYNs7ZqX0tYpboPlj
	 EibT5JkQWwT5ks/z34vci6AV3xNxzXrrw7F/nLVe+6hIIM9rxFqOQ0oKG1k+3iPBcp
	 XwBdDFhs7NAi+74QpkyQKXGbmJfT0DnSEZKRp45TC34GbTtAL535MZGG32YHJdbvzt
	 VAtZvI9uSmVMeCnSpcnEGsi00S1NUNNvdfSFi6llz3eLm84mId4rpHguwIvZNmxfUS
	 DV77FCj+z6V+WITVZl5W+R+xnk2SLosQhLLOPJCyf3YlM17GknaBywzGy0jlLQe7uy
	 luyHsFpYsKd+g==
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
Subject: [PATCH v1 03/11] arm64: dts: freescale: imx95-verdin: Add SPI alias
Date: Thu, 12 Nov 2026 16:02:25 +0100
Message-ID: <20261112150236.164850-4-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261112150236.164850-1-francesco@dolcini.it>
References: <20261112150236.164850-1-francesco@dolcini.it>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_070247_001583_BB67E643 
X-CRM114-Status: UNSURE (   9.16  )
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
implemented by lpspi6 on Verdin iMX95.

Without an alias the Linux SPI bus number is assigned dynamically and
can change with the carrier board or probe order. Add a spi0 alias so
the bus number in sysfs and the spidev name follow the Verdin interface
numbering, zero-based with SPI_1 being spi0.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx95-verdin.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx95-verdin.dtsi
index d13b395e98ca..d239fecd53c5 100644
--- a/arch/arm64/boot/dts/freescale/imx95-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-verdin.dtsi
@@ -32,6 +32,7 @@ aliases {
 		serial2 = &lpuart1;
 		serial3 = &lpuart2;
 		serial4 = &lpuart6;
+		spi0 = &lpspi6;
 		usb0 = &usb2;
 		usb1 = &usb3;
 	};
-- 
2.47.3


