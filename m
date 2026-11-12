Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE9C60A2600
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 15:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EXkLGOVF;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=YTxFkgxX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LSomUVkxeVujxD12mjdTM3jadQF6RoOLSVeuHilCoqA=; b=EXkLGOVF36IJre
	mZtJy7YIBFZEVXbygD17w6IdogBb/AtWh8jNJLo412ymjGhVBKt9Y+bVLVcBetBIp8jUkTXEpbfsq
	b4DNpM+tYrr9lNDox+VWN4ieQvJUUIwea5y4IojrRCYzZD9vkpS80+6b2pem3bKvj7nVPorsICHN+
	YGcvLefuRzJA+10lJDp4FO2cwlf9cDI5YD7d3KGTPhy4ELJhPlahaS0Ywm+nZbmWb3v5CF+oW1wUM
	ZJ+hcd2ybg+Up4UtlozIPlODi96w+WNGoJYFiVeeOjsJnRRGbjKR6PZeu3yF1x+br/CdTrJeu7dqJ
	+kURWsYdCd/N3ua28PcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWUZ-0000000APf0-0Uqa;
	Thu, 12 Nov 2026 15:13:35 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWUT-0000000APb4-2XJ2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 15:13:31 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 8B1A0231B8;
	Thu, 12 Nov 2026 16:13:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794496407;
	bh=LSomUVkxeVujxD12mjdTM3jadQF6RoOLSVeuHilCoqA=; h=From:To:Subject;
	b=YTxFkgxXLJYTzVmoaE3Y8ZdRNwhcE+0bnXUhxmE7ugGEgr9NNCZU08aMVJYKWVPTI
	 EpcdEnyz92CyFjNORUosjzxmQ2LnHSEjdp8zPlgFHgmAiGY0or5hU8qHN/rhwNK8Q7
	 YDQu00wRhrJN1CEZo9oeTjhkSWsMl9AGqrXgw5tm3B+o/t8umK2PSw9VadTS6WmJbN
	 8aOCdagxv58zBVvlKYPR0bdEc9k+W3WNldWF/b6yIaPO5IFir9TRnorSbcCinXr1ey
	 iBSryktVJl1m0flXfq+KqrWa7Jbk/RozOBjaxZSer0a7jkHVqo0VByVMTFXtFum9fs
	 4RyNgREX6brxw==
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
Subject: [PATCH v1 3/3] arm64: dts: ti: k3-am69-aquila: Add SPI aliases
Date: Thu, 12 Nov 2026 16:13:16 +0100
Message-ID: <20261112151317.178959-4-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261112151317.178959-1-francesco@dolcini.it>
References: <20261112151317.178959-1-francesco@dolcini.it>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_071329_821618_2F46E751 
X-CRM114-Status: UNSURE (   9.59  )
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

The Aquila family pinout defines the SoM interfaces and their
numbering, SPI_1 and SPI_2 being the SPI buses on the connector,
implemented by main_spi2 and main_spi0 on Aquila AM69.

Without aliases the Linux SPI bus numbers are assigned dynamically and
do not match the connector names. Add spi0 and spi1 aliases so the bus
numbers in sysfs and the spidev names follow the Aquila interface
numbering, zero-based with SPI_1 being spi0. mcu_spi0 is internal to
the SoM with the TPM as its only device, and gets no alias.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi b/arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi
index b6854acee8fe..caedff90365d 100644
--- a/arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi
@@ -39,6 +39,8 @@ aliases {
 		serial1 = &wkup_uart0;
 		serial2 = &main_uart8;
 		serial3 = &mcu_uart0;
+		spi0 = &main_spi2;
+		spi1 = &main_spi0;
 		usb0 = &usb0;
 	};
 
-- 
2.47.3


