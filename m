Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D497606A332
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 17:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2fdPlOIp;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=lV/STT9l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=zdQCpGaqkRp6x/x58XyJ1tSRsHAfUx3qThyEUIIDCA8=; b=2fdPlOIpJOPOvOh0gT476iv5WV
	K9GoFoqzHPzqAxcm2GgW8mHtOU5JMVnU4qp4wMAxBO+pEeT4XC/ihTyTtKIxXbwwcT02m2A7ZEzQ5
	mTlpe0uTb/T5uNFR9qwPEPx0woMhrFoPOzAbqrfMCjmA6NK9WneIRsOY+e2CFE+Vm2rBq3bkVdwgN
	EvHzwQNfgJCTTa1+GJ3LFJ9Q2o0qU/2DlStKRPPgIZ6zuiy2+KCM3eOsR1xeW4bZfAE5sS/1pFwtv
	WFCp8KnBrtB3Clo1lk/j6yLUXeIRWfVaSzDKVHbXXInCheaqtNTQ4mQPLbt5yF9TI4XmXZxU58tkL
	8dcvkQ5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVBEC-00000001Q88-3mYs;
	Sun, 22 Nov 2026 17:19:48 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVBE8-00000001Q6z-45Tc
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 17:19:47 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 95BE923508;
	Sun, 22 Nov 2026 18:19:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1795367979;
	bh=zdQCpGaqkRp6x/x58XyJ1tSRsHAfUx3qThyEUIIDCA8=; h=From:To:Subject;
	b=lV/STT9lTgqGHaTrDFn+NryN+hq+GkUAAKri4PeWFaaq4jYsBnJnZqi0pD/QlMSim
	 ZLc0F2rXjameysaoC9UjJps1vv8fVtZO582i6NFvjMETeQfEyo946NL/bm3DHBB2Rf
	 Hf8JeF/EiqFOaKfba3+lNgezAIOxCmWHAqXnztVK9O1QPv1KFdX3vgERtcp3j+aKPW
	 /m05SR//UkfnY47jjET3pxjFMiWJ13VQlSAmIGWmpNhD98m/81MJFp1zmURAaCR3Yt
	 +5Z3FqPr5xC8L7R/60TqZVVgpZ3FL+1EmUQg5YsPos0Q5i/7sutU/5g7x97Q5Xlfem
	 OtB/UF4dSVDaQ==
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
Subject: [PATCH v1 0/2] arm64: dts: freescale: imx9[135]-toradex-osm-dev: Fix SDIO_B interface
Date: Sun, 22 Nov 2026 18:19:27 +0100
Message-ID: <20261122171931.295307-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_091946_066176_382FE0B9 
X-CRM114-Status: UNSURE (   8.92  )
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

On the OSM Development Board, OSM SDIO_B goes to the M.2 Key E slot for
a Wi-Fi/Bluetooth module. The slot has no card detect signal, its supply
is not software controlled, and the SDIO_B signals are fixed at 1.8V.

This was noticed from an anomalous interrupt rate on an idle system:
with the slot empty, mmc2 fired about 45 interrupts per second, because
the empty slot was polled every second.

Describe the slot as non-removable, keep the module powered in suspend,
and add the fixed 1.8V I/O supply, on both the OSM iMX93/iMX91 and the
OSM iMX95 variants of the board.

Francesco Dolcini (2):
  arm64: dts: freescale: imx93-imx91-toradex-osm-dev: Fix SDIO_B
    definition
  arm64: dts: freescale: imx95-toradex-osm-dev: Fix SDIO_B definition

 .../boot/dts/freescale/imx93-imx91-toradex-osm-common.dtsi     | 1 +
 .../boot/dts/freescale/imx93-imx91-toradex-osm-dev-common.dtsi | 3 +++
 arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dts        | 3 +++
 arch/arm64/boot/dts/freescale/imx95-toradex-osm.dtsi           | 1 +
 4 files changed, 8 insertions(+)

-- 
2.47.3


