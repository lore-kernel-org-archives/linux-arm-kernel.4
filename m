Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BBE606A331
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 15:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KmIV3v/8;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=PGWszLJo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bXxxB3rqDxEKVhGVu6wJYN3vPgjqaFYKkpwYR+FN2mI=; b=KmIV3v/8UsxUp/
	8+WSO9kBPBZhRHj6VUX7EBQLr7gixh0PAf9gkltlPbRBEL3KZ1GTsLy8FBdBs/dU/tsPdCcb4aRQJ
	L6Gcwq9QqKTqfda/FAFAgQuZiC+ge1ZFBnMcaprOEo0jJ4238Br8X/UvMkZruYGHO9W2lG9wDXGAL
	Viylry3k1oe5xFYdBl4pQ3ubXMLNP1mY2Mxi6Hh0qSMNteFlX38sak+hsYWv/oN5AaQq6zO4kqzpZ
	MRIox06WVYymOrWGBQiquUxPoCARv8e2z6uuK9xpQIu6/6zfAwkECr3/0v+vUin7+hnSB5NSxlUlc
	p/Ysy/fkTkhsmGnvRvng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWKX-0000000ANSK-3R2J;
	Thu, 12 Nov 2026 15:03:13 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWKB-0000000ANBr-28VK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 15:02:53 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 4F715231C8;
	Thu, 12 Nov 2026 16:02:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794495769;
	bh=bXxxB3rqDxEKVhGVu6wJYN3vPgjqaFYKkpwYR+FN2mI=; h=From:To:Subject;
	b=PGWszLJosj/uFqQOFJlsqGur2rZMyu8pzg+1+dnGZEh6wmR19owa0QBJInmlJU+uU
	 DaqpHQu4cT4CfWQk+2BTR04oiUbwinSfI0FoGEGakXRH1RZjQPMteNUufL5o7UAhEh
	 Tju8vNZeLieSvv13yxKH7BCYMw4u3mv4w4L3aayDq3Di9A5ODYlGLydCZ7UH9zt42H
	 oM4vFWOXKmHdZ4SLEVscKmhMKJZ7YIUKyb/SYH/05O/eBpzc06o7h9s2bTbS6DxgGL
	 NrQU7aI1nwo1Hrp75ElA4uFOlB93QPqqfS/4wuvksR1ntIUeVgYOtc5sqdeBKSpVdy
	 GBu8T29HgGQhw==
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
Subject: [PATCH v1 09/11] arm64: dts: freescale: imx93-imx91-lino-common: Add SPI aliases
Date: Thu, 12 Nov 2026 16:02:31 +0100
Message-ID: <20261112150236.164850-10-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261112150236.164850-1-francesco@dolcini.it>
References: <20261112150236.164850-1-francesco@dolcini.it>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_070251_758303_6A795A3E 
X-CRM114-Status: UNSURE (   9.18  )
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

The Lino family pinout defines the SoM interfaces and their numbering,
SPI_1 and SPI_2 being the SPI buses available to the carrier board,
implemented by lpspi8 and lpspi1 on Lino iMX93 and iMX91.

Without aliases the Linux SPI bus numbers are assigned dynamically and
can change with the carrier board or probe order. Add spi0 and spi1
aliases so the bus numbers in sysfs and the spidev names follow the
Lino interface numbering, zero-based with SPI_1 being spi0.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx93-imx91-lino-common.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-imx91-lino-common.dtsi b/arch/arm64/boot/dts/freescale/imx93-imx91-lino-common.dtsi
index f8f13f785860..787df739ea55 100644
--- a/arch/arm64/boot/dts/freescale/imx93-imx91-lino-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-imx91-lino-common.dtsi
@@ -29,6 +29,8 @@ aliases {
 		serial1 = &lpuart7;
 		serial2 = &lpuart1;
 		serial3 = &lpuart2;
+		spi0 = &lpspi8;
+		spi1 = &lpspi1;
 		usb0 = &usbotg1;
 		usb1 = &usbotg2;
 	};
-- 
2.47.3


