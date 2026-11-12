Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FEA606A8BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 15:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oFMejLCJ;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=CCvRtxCk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jlU5/5neDI2ROEOJFaNZJZxxYu3+Y8IWX3cY6QrT4RA=; b=oFMejLCJMbvAVK
	6UnbYbNCNOQqTrr5zCvsaLXTkCbNWL9fc/NVHr8TLKLm5EgzyhVmmzLapgJLOnBhi/TLjUix+K8kl
	HrakwYO3B9WZgK38onOorsTLMFXDKL+se10twTDQ8ksAJmj95TGPm5O8EH1AKdU3ZC2IO5592rX0G
	Q7cpkVhcvQCH3ELt1dBNB0Chv7zrVhIjp9tzPQA25Dys29QbAGXfZoBflFLmWKopr5sqdciae2Z8y
	a9hsbevtNVS/T1NnkYe0Gs4cAnismBvf1NDxsw5tTmkF2+Y6lkUy5v3PfJuT4Fu9aSKtDbbWaD4tl
	yCzf76+CaukcQLU0ahjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWUY-0000000APeF-2nCR;
	Thu, 12 Nov 2026 15:13:34 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWUS-0000000APag-2SZ1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 15:13:30 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 86A9C23185;
	Thu, 12 Nov 2026 16:13:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794496406;
	bh=jlU5/5neDI2ROEOJFaNZJZxxYu3+Y8IWX3cY6QrT4RA=; h=From:To:Subject;
	b=CCvRtxCkOc1xkVU7VUIor9yaHtzWfy7wLAVj6+MoX8YQecmN2jWkLnsjggK3UfHl9
	 wscTdB4n+nnU6auHE1nNv2zqUoIlklACGUOJiPcuaiGAj5om43niH7gGCMjJJ2CCAS
	 GOc8M3nEn35NH7LNkxqHoplvYmHOFrobaVBzkoNtDVtWDoibHSiBJFsttMFazd4DXN
	 Ka7+rN+L47x8oksFv0vfCNrjjpSj6OaTowQKrRBTc1BFEZzOvdZYbhQYkqcrugDKrb
	 GYso2hwEzthcHNNNroAr5x9Q1hvKvhWpg3SNLL7KJwI2Ew0mDDf5rDqCAAdlrg3fbs
	 pIx+LwJvVjgVg==
From: Francesco Dolcini <francesco@dolcini.it>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/3] arm64: dts: ti: k3-am62-verdin: Add SPI alias
Date: Thu, 12 Nov 2026 16:13:14 +0100
Message-ID: <20261112151317.178959-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261112151317.178959-1-francesco@dolcini.it>
References: <20261112151317.178959-1-francesco@dolcini.it>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_071329_038578_537FD010 
X-CRM114-Status: UNSURE (   8.54  )
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
numbering, SPI_1 being the SPI bus on the SODIMM connector, implemented
by main_spi1 on Verdin AM62.

Without an alias the Linux SPI bus number is assigned dynamically and
can change with the carrier board or probe order. Add a spi0 alias so
the bus number in sysfs and the spidev name follow the Verdin interface
numbering, zero-based with SPI_1 being spi0.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
index 77e6885555fb..3317da6c8457 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
@@ -38,6 +38,7 @@ aliases {
 		serial2 = &main_uart0;
 		serial3 = &mcu_uart0;
 		serial4 = &main_uart5;
+		spi0 = &main_spi1;
 		usb0 = &usb0;
 		usb1 = &usb1;
 	};
-- 
2.47.3


