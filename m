Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA71606A337
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 10:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Jwmx3bL/;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=Q6mJxVPH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=HRyaekjRkhNgArIFD/le5my/BFv/PKpDbGvsEYtTGa8=; b=Jwmx3bL/vZrlDwBJ+yS7ZxY+wb
	laSu0zxsgoG8ssMmz5WlCIF4BO3f+D/oI5E6+CrsdZbkX2GHW0E6ZvGgKFKaSoTpTNwKNyMx7S8Qw
	bFYqrkyJB34M8AcjXVk50w/mkUPEULDd2Aj2Xshe+Er/cUkJztqvfOaLYDZjgPM1Gvc8bVbPPoPAy
	DCQMKiFYIDgWnKTQFbAd/kYLvftJKj+rsm2jk4MOORXuyAjsgfgv1T3TSaFsdzijA6b6Yl5xo1vpw
	IuqMnHoW2EBpLfNJ5doFxx5e9oYnUAfFzO08C7CBG9/JbGinaEHCJ6d70LWkSRCu11jJH1FyjNa21
	6cB9f0zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWssW-0000000FVv9-1c2I;
	Fri, 27 Nov 2026 10:08:28 +0000
Received: from watt.d-silva.org ([119.15.109.137] helo=www.nmnhosting.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWssM-0000000FVoO-2LaV;
	Fri, 27 Nov 2026 10:08:20 +0000
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 3EDE24C963;
	Fri, 27 Nov 2026 21:08:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795774088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HRyaekjRkhNgArIFD/le5my/BFv/PKpDbGvsEYtTGa8=;
	b=Q6mJxVPHh2FEeguOcRqFUb6Ccq295M2PG6f727IicOeWjkvIgCTJp+gPUBNyltccfgzPm/
	Ko2p6mz7dWIVgYt0fD6FfqTlyfsKCR4541MnO2vNeLnztFR0tB+dR5xZJwcyUq7HnbTNT9
	qbLxE4LqY2OpnmITno9syPKkVEl3b5A3WwjtBJxV10EksrK9+FqYwC2haNN4SO0vD+u3JM
	DeTVKFJZ3Xvs4huXk3IpheQ2YTvQOKK8gQQV8+bI9yx2cEE6TETUT7yABH9ttAGmdBpSWd
	d6682GcQkWg21LpTejeh9rMWSpgDermBmsvPHnO5HzE8GUeBcDk5tFndIK0WRw==
X-GPT-Reason: legitimate. This is a technical software patch notification
	(Linux kernel development) which perfectly matches the recipient's
	personal/business profile (alastair@d-silva.org). The message
	contains specific technical details (Allwinner A733 USB support),
	links to a reputable domain (lore.kernel.org), and follows a standard
	development workflow with no signs of marketing, urgency, or phishing.
From: Alastair D'Silva <alastair@d-silva.org>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH 0/6] Add Allwinner A733 USB 2.0 host support
Date: Fri, 27 Nov 2026 21:08:02 +1100
Message-ID: <20261127100808.2292229-1-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_020818_751373_B70A3E96 
X-CRM114-Status: UNSURE (   7.26  )
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

This series adds USB 2.0 host support (USB PHY, EHCI, and OHCI) for the
Allwinner A733 (sun60i-a733) SoC and enables USB1 on the Xunlong OrangePi
4 Pro. USB 3.0 (DWC3, u2phy, ComboPHY) is left for a separate series.

Expected result: the A733 USB 2.0 PHY, EHCI, and OHCI host controllers
probe without clk_ignore_unused, enable the USB1 VBUS regulator, and
enumerate USB 2.0 devices with full DMA transfers.

Tested on the Xunlong OrangePi 4 Pro with a USB 2.0 hub and a SanDisk
Ultra Fit flash drive (up to 32.0 MiB/s sequential reads via dd).

Prerequisites (on top of linux-next next-20261125):
- arm64: dts: allwinner: add A733 SoC description
  https://lore.kernel.org/r/20261126172253.1097838-2-andre.przywara@arm.com
- arm64: dts: allwinner: Add Xunlong OrangePi 4 Pro support
  https://lore.kernel.org/r/20261127065343.1449675-1-alastair@d-silva.org

Alastair D'Silva (6):
  dt-bindings: phy: allwinner,sun50i-a64-usb-phy: Add Allwinner A733
  dt-bindings: usb: generic-{ehci,ohci}: Add Allwinner A733
  clk: sunxi-ng: a733: Mark mbus-msi-lite2 clock as critical
  phy: allwinner: sun4i-usb: Add Allwinner A733 support
  arm64: dts: allwinner: sun60i-a733: Add USB 2.0 host nodes
  arm64: dts: allwinner: sun60i-a733-orangepi-4-pro: Enable USB 2.0 host

 .../phy/allwinner,sun50i-a64-usb-phy.yaml     |  24 ++++
 .../devicetree/bindings/usb/generic-ehci.yaml |   1 +
 .../devicetree/bindings/usb/generic-ohci.yaml |   1 +
 .../allwinner/sun60i-a733-orangepi-4-pro.dts  |  31 +++++
 .../arm64/boot/dts/allwinner/sun60i-a733.dtsi |  82 ++++++++++++
 drivers/clk/sunxi-ng/ccu-sun60i-a733.c        |   3 +-
 drivers/phy/allwinner/phy-sun4i-usb.c         | 119 +++++++++++++-----
 7 files changed, 229 insertions(+), 32 deletions(-)

base-commit: 9437046953b2fb3bf55b36582450ea0267df82a7
prerequisite-patch-id: 0279f281cd59cf54bceee39b0fa4d0b6a7b87c48
prerequisite-patch-id: 309a5a3ca5b216915907263dea7024263abf1d1c
prerequisite-patch-id: 55e543b9854c7ae2fa86969233d05ccadd3792e9
-- 
2.53.0


