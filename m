Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1B8606A336
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 14:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QsoOQ2TB;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=chrI8hpd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=de0OenvYtC9EcJ6k97P7EWscdeX36hwem4HnssW40LQ=; b=QsoOQ2TB+eX5pJD8UR2j1ZwhPy
	hdez/Mn1A4RSq2RC90cSf7wMQ+O8V9SVhTXu4UVlwN2KKJgo7HqVVSiccGD1lDN7ulsEiKwkeJDfh
	rs8QR8DoY8s3mxJWwBIG7RDj+jEa4TjJn4SfPatycUpkm5lLA7HJWpfeCY3IBJ56UARpYOhHwv/MQ
	9oBIemVT82ZHKLTtNo0mWwljEPJzFXphJPv1eNCGAawJVzA87+KaNMNR/6o/XLrrBDuhCysMgnigz
	JwASMOZ6z1CutV9zvcsBl7j3tCLWucdqeYYV1jI7TdwUjMNTfkQNcPbYAGEVZNEvzMRmUsCHb0HYu
	UTjYDJig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxU8-00000002mIH-0CYA;
	Mon, 16 Nov 2026 14:15:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxU5-00000002mHw-2dmf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 14:15:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 29AEA43A07;
	Mon, 16 Nov 2026 14:15:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C17031F000C4;
	Mon, 16 Nov 2026 14:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794838501;
	bh=de0OenvYtC9EcJ6k97P7EWscdeX36hwem4HnssW40LQ=;
	h=From:To:Cc:Subject:Date;
	b=chrI8hpdPn4zacL284Mok86ddOiXlRj+ZeHafq0jBQxh7o4Ge8ML0ezRTdSYbZiI2
	 93N8LqkbT+QJDLfGiyLTKc8OTqYPYh6JSFDQC/tzoyDx6Ql7SYPla8cvqRXre1xtAZ
	 4JRCDb3Lre+6jaFArguhmWWr+Q1/3alrlKZm9X/ND3FFKsQDnLY1tTuCZVp1enfWpa
	 Y8gXE+Yr8nqYr+RQOlAhV/deipLXorAf7cAkChPiXd3mF+lj8Js77XOC7tfiwqspeb
	 vqkrCa+MhTjnX/+xY+wBZ4b5kGVpoqEmdATsZmmPGlzuZE2EKgkBMAqBSfmnrcMBVT
	 9RbijJuWsEU4Q==
From: Jisheng Zhang <jszhang@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/8] net: stmmac: add SL2610 ethernet support
Date: Mon, 16 Nov 2026 21:54:34 +0800
Message-ID: <20261116135442.4827-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This series add SL2610 ethernet support. First of all, introduce
the mdio demultiplexer, then add the stmmac glue layer, finally
touch dts.

NOTE: this series depends on the sl2610 SoC support series which
is still under review:
https://lore.kernel.org/linux-arm-kernel/20261115102401.3520-1-jszhang@kernel.org/

Jisheng Zhang (8):
  dt-bindings: net: Add MDIO demultiplexer
  net: mdio: Add MDIO demultiplexer driver
  dt-bindings: net: Add Synaptics SL2610 DWMAC
  net: stmmac: Add glue layer for Synaptics SL2610 SoC
  dt-bindings: soc: synaptics: Allow SL2610 mux controller children
  soc: synaptics: Populate SL2610 system controller DT children
  arm64: dts: synaptics: Add SL2610 Ethernet nodes
  arm64: dts: synaptics: Enable Ethernet on SL2619 RDK

 .../devicetree/bindings/net/mdio-demux.yaml   | 102 ++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 .../bindings/net/syna,sl2610-dwmac.yaml       |  75 +++++
 .../soc/synaptics/syna,sl2610-soc-syscon.yaml |  10 +
 MAINTAINERS                                   |   2 +
 arch/arm64/boot/dts/synaptics/sl2611.dtsi     |  41 +++
 arch/arm64/boot/dts/synaptics/sl2619-rdk.dts  |  77 +++++
 arch/arm64/boot/dts/synaptics/sl2619.dtsi     |  36 +++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../net/ethernet/stmicro/stmmac/dwmac-syna.c  | 116 +++++++
 drivers/net/mdio/Kconfig                      |  12 +
 drivers/net/mdio/Makefile                     |   1 +
 drivers/net/mdio/mdio-demux.c                 | 298 ++++++++++++++++++
 drivers/soc/synaptics/sl2610-syscon.c         |  10 +-
 15 files changed, 791 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/mdio-demux.yaml
 create mode 100644 Documentation/devicetree/bindings/net/syna,sl2610-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-syna.c
 create mode 100644 drivers/net/mdio/mdio-demux.c

-- 
2.55.0


