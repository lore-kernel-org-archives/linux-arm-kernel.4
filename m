Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E38606A337
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 15:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QDRfgF7C;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=oYHepFWK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=8wiql50cDD3qNYqOz1INc0Pqx78ED5IM9pXLG9SklOQ=; b=QDRfgF7C555C9MHQyLGMfUbYhB
	zi7Rn4jlf3UD2rLxmlptRVh6SJRJPDMQRMNAjxr3akSjKcqnqe7xBFphpn5FhxrTp+0sVkgM8PViW
	REn7qzvTLsCqqU3XIeifEzPgsz2D6Uo4ip6ytuewsDBf0yitoevBvhH2ZfzY2ct+HYWIM4C4xiI6U
	XuIyZZZJ2CD79qRE3yZ4S/qfi72wkDD66NFtgZqcnvycicBM6cjWJnUVSjh6v4qNV/UZBOt7lyog0
	GA877myb3GLvBrlZrZC42uPU+FXsiF0rDQXH0uizr/VkKwBLnUCb4DpjJY8fOsNXXXEL70K/guIUW
	80AhnJVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWQ9-0000000AOfV-2oIH;
	Thu, 12 Nov 2026 15:09:01 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWQ7-0000000AOeJ-2uww
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 15:09:01 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 3EF0F23161;
	Thu, 12 Nov 2026 16:08:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794496137;
	bh=8wiql50cDD3qNYqOz1INc0Pqx78ED5IM9pXLG9SklOQ=; h=From:To:Subject;
	b=oYHepFWKdUOJ+ttxcB7+HifK5JBgfu/7WJNTO8WVLzOG4OWjNbIO9h7ZzPPlSwo+O
	 QoS3aHp3ldFZIzN0wKRyijYAzCng9DShNGAnkvhPFBO2AKxkNPOAk1xunYmWVfXION
	 M3FjBLOFGeOnhKXoE/fu6tXov4lI+HGid5MmHTARU3hwmDyt41DvTcoxIwqBuZeiF3
	 kbub8KaetEHoq8SjwlJApaBFB1/ItSLVIygJFKtddleQUTyCoiI6HqjEhqFKLLiGgp
	 8qxOxfrfodYVy7N6VObQPmiG7bebwwYWPOVJ6peOhDf7XIA1atp88jIXHUj8PISX7l
	 xPjvC5CAk2kqw==
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
Subject: [PATCH v1 0/4] ARM: dts: imx: Add SPI aliases to Toradex Apalis and Colibri SoMs
Date: Thu, 12 Nov 2026 16:08:44 +0100
Message-ID: <20261112150849.177133-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_070859_939893_6DCA1D46 
X-CRM114-Status: UNSURE (   8.70  )
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

Toradex SoM families (Apalis, Colibri) define the interfaces available
to the carrier board and their numbering as part of the family pinout.
The i.MX6, i.MX6ULL and i.MX7 SoC dtsi files number the SPI
controllers in SoC order instead, so the Linux bus number in sysfs and
the spidev device name follow the SoC, not the SoM interface.

Add spiN aliases to the SoM dtsi files so the Linux bus number follows
the family interface numbering, zero-based: Apalis SPI1 is spi0 and
SPI2 is spi1, the single Colibri SPI is spi0. Where the SoC dtsi
already gives the same controller another alias, that inherited alias
is deleted so each controller carries a single one. Where the SoC
numbering already matches (Apalis iMX6, Colibri iMX6ULL) the alias
makes the mapping explicit at the SoM level.

Francesco Dolcini (4):
  ARM: dts: imx6qdl-apalis: Add SPI aliases
  ARM: dts: imx6qdl-colibri: Add SPI alias
  ARM: dts: imx6ull-colibri: Add SPI alias
  ARM: dts: imx7-colibri: Add SPI alias

 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi  | 2 ++
 arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi | 2 ++
 arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi | 3 ++-
 arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi    | 2 ++
 4 files changed, 8 insertions(+), 1 deletion(-)

-- 
2.47.3


