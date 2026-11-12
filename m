Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE54606A8B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 15:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ORJi6VOn;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=JgLJYFbv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=JQbdPYCtgf+mZVsh4EgiPcZ0AL/VdRiVcT7T0GlFqyI=; b=ORJi6VOnUnDLitrB3IHm7Vb788
	lj65dEVd0bhN49aYehds6SCTaI8/9DLls0tAdn8RDlfBNSZSfKY+kDU2/ORkjtB3Gu2KwQDnxDWSm
	hrKKTbGJsJSUkWLGebDKMmOuDqKkwea+4vayGLjLSpX8QzEDGGuTwY8S4rJu3Zh3gizCrIuyxeNzC
	kRySn4gH7dnkfYPpL19C/OxFFdDmcLYa8WXlxs7Ubh47Bd3Jt2QQbgU043u1tzY0iSNIeHPCgeRoC
	sxCwQo+DAIc2iR46ldg2NPU7EAaILOubV1ZNRKAxPDmr2zaIPTmzF/VsQ5vE7PSIQ159Y/rVI+LcR
	1B2kOL9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWUU-0000000APco-1fdl;
	Thu, 12 Nov 2026 15:13:30 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWUS-0000000APaU-0FFF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 15:13:29 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id F0BB523134;
	Thu, 12 Nov 2026 16:13:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794496406;
	bh=JQbdPYCtgf+mZVsh4EgiPcZ0AL/VdRiVcT7T0GlFqyI=; h=From:To:Subject;
	b=JgLJYFbve/m3/xZLADbX68tj9p6tN3kaqRE+2XXZFlzio6oBrxgjfQJOcc4cZCQCr
	 wX13LtTTHbG2j3bDauFYe4hD35NHmX7178S2rnzN0Io68BF8+3JT8Ar4V+eDRXySAR
	 1mMvwzvhDpkdWp3WHsrINugZDaelG+2V9m+Hu3+0WN+066sY++QxrizQywXhZDlPJk
	 8vYHnmJ8bdJcdlhGTjeFN2LUMUc1fmGMUajzb6ijCuXpt1EZ+lYkGPilkINnYcuIF4
	 ynnRBohRM5m2zz2zhR0yWAY2agCNPaoZwRo4RBH4OaBre8N6pZQpNBAdlsG6AGydqu
	 9XL9PFoMmdkjw==
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
Subject: [PATCH v1 0/3] arm64: dts: ti: Add SPI aliases to Toradex Verdin and Aquila SoMs
Date: Thu, 12 Nov 2026 16:13:13 +0100
Message-ID: <20261112151317.178959-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_071328_265661_898DA1C5 
X-CRM114-Status: UNSURE (   8.15  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Toradex SoM families (Verdin, Aquila) define the interfaces available
to the carrier board and their numbering, SPI_1, SPI_2 and so on, as
part of the family pinout. The Linux SPI bus number is instead assigned
dynamically, so the bus number in sysfs and the spidev device name
depend on probe order and on which other SPI controllers a given
carrier board enables.

Add spiN aliases to the SoM dtsi files so the Linux bus number follows
the family interface numbering, zero-based like the existing
serial and can aliases: SPI_1 is spi0, SPI_2 is spi1. SPI controllers
that are not part of the family pinout, such as the one connecting only
the on-module TPM, get no alias.

Francesco Dolcini (3):
  arm64: dts: ti: k3-am62-verdin: Add SPI alias
  arm64: dts: ti: k3-am62p-verdin: Add SPI alias
  arm64: dts: ti: k3-am69-aquila: Add SPI aliases

 arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi  | 1 +
 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi | 1 +
 arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi  | 2 ++
 3 files changed, 4 insertions(+)

-- 
2.47.3


