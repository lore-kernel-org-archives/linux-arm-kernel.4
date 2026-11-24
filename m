Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7324606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 12:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KnHpNDR/;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=TDnxcTga
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Zv+4EZiS26DlNQvyzNgd6gBATMlT9+EPJ9YBCykQ2Tc=; b=KnHpNDR/uvC1R0TLBf/y2DSINu
	QQcLMtwoIpIahZwsdFrB20001aZASYxjx/QSL31aEZfPazul+ewBswqAp4nkymj9F5CXaujNawbAK
	tjTn0thbxTAF5lRlzegUL3RaTGvXBhAFBOAQadOpWDl3HRrQCuJY3GbXjD3f6HSLuWqayKeUBlx2d
	6FicRfPHpzJSNHHW1uWime5gGg6HeBFS20gVzK8audLYV8QzH7tlG0zcXuEYUq/mXBtu+LBGxmTTY
	CrquAGlXotI05jKQYdfqDAXGDivOAQEACOJtHt6+gO6w+TLOruM54skQrJWwONxL6/MqODjorolZx
	rDhCMchQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVpqr-00000006XBy-1TBa;
	Tue, 24 Nov 2026 12:42:25 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVpqn-00000006X9c-1g4N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 12:42:24 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 6A8E91F953;
	Tue, 24 Nov 2026 13:42:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1795524134;
	bh=Zv+4EZiS26DlNQvyzNgd6gBATMlT9+EPJ9YBCykQ2Tc=; h=From:To:Subject;
	b=TDnxcTga3xZelYo8999jovrWI15ICGB01YV4Jxpapnz2pw+JaGX7Ibjm7zpAPg8dB
	 7OgyRpVvV3ONvCRWn/pp+RQvrUdTbDxxPsW56Xw5piqvnxAl2b9eP+a2sIa6sNKVqa
	 GrbSWo8/CPX7a0nhlV/fzHSXq82p0HM7OCcw5QYfZNSfBur4ABIAc0L71bX2MP7Aag
	 jz0mQugUIJjgEPlDIakozpAnXqRoI1Xb9J6cMNFpJkDZtcUp2xrS47inSfjEh916Rg
	 msmie2oRTj6ser5VKD7+eqa8XmLbKLzMJ3x5jF0ODR4XpluuxDY5sYkF8ZXylH1chz
	 EzRudXy8FoD3A==
From: Francesco Dolcini <francesco@dolcini.it>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kiryl Shutsemau <kas@kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-coco@lists.linux.dev,
	kvm@vger.kernel.org
Subject: [PATCH v1 0/2] arm64: dts: ti: Add tdx vendor prefix to display overlays
Date: Tue, 24 Nov 2026 13:42:03 +0100
Message-ID: <20261124124207.199382-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_044222_498313_E06E7ADD 
X-CRM114-Status: UNSURE (   6.68  )
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

Add a "tdx" vendor prefix to the Toradex display accessory overlays of
the Verdin AM62 and Aquila AM69, and a "-v1"/"-v2" suffix to the
Capacitive Touch Display 10.1" LVDS ones.

The overlay names are the Toradex product names of the accessories, and
a product name is unique only together with its vendor. After a long
discussion with the NXP i.MX maintainer on the Apalis iMX6 overlays [1],
we agreed to add the "tdx" vendor prefix, the same way third-party
accessories on Toradex boards already carry theirs, e.g. "rpi" in
k3-am625-verdin-rpi-display-2-7in.dtso. The Toradex display overlays in
the NXP i.MX directories already use the new names.

The same accessories are used across Toradex SoMs from different SoC
vendors, so renaming the existing overlays is the best way to give
users a consistent experience: one accessory has one name, whatever
the SoM, and the vendor prefix leaves no doubt about the product
supported by the overlay file.

[1] https://lore.kernel.org/all/20261026111149.GA46946@francesco-nb/

Francesco Dolcini (2):
  arm64: dts: ti: k3-am62-verdin: Add tdx vendor prefix to display
    overlays
  arm64: dts: ti: k3-am69-aquila: Add tdx vendor prefix to display
    overlays

 arch/arm64/boot/dts/ti/Makefile               | 120 +++++++++---------
 ...e-tdx-panel-cap-touch-10inch-lvds-v1.dtso} |   0
 ...e-tdx-panel-cap-touch-10inch-lvds-v2.dtso} |   0
 ...o-lvds-tdx-panel-cap-touch-10inch-v1.dtso} |   0
 ...o-lvds-tdx-panel-cap-touch-10inch-v2.dtso} |   0
 ...erdin-tdx-panel-cap-touch-10inch-dsi.dtso} |   0
 ...n-tdx-panel-cap-touch-10inch-lvds-v1.dtso} |   0
 ...n-tdx-panel-cap-touch-10inch-lvds-v2.dtso} |   0
 ...verdin-tdx-panel-cap-touch-7inch-dsi.dtso} |   0
 ...apter-tdx-panel-cap-touch-10inch-dsi.dtso} |   0
 ...dapter-tdx-panel-cap-touch-7inch-dsi.dtso} |   0
 ...o-lvds-tdx-panel-cap-touch-10inch-v1.dtso} |   0
 ...o-lvds-tdx-panel-cap-touch-10inch-v2.dtso} |   0
 ...quila-tdx-panel-cap-touch-10inch-dsi.dtso} |   0
 ...aquila-tdx-panel-cap-touch-7inch-dsi.dtso} |   0
 15 files changed, 60 insertions(+), 60 deletions(-)
 rename arch/arm64/boot/dts/ti/{k3-am625-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds.dtso => k3-am625-verdin-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v1.dtso} (100%)
 rename arch/arm64/boot/dts/ti/{k3-am625-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds-v2.dtso => k3-am625-verdin-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v2.dtso} (100%)
 rename arch/arm64/boot/dts/ti/{k3-am625-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso => k3-am625-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtso} (100%)
 rename arch/arm64/boot/dts/ti/{k3-am625-verdin-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso => k3-am625-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2.dtso} (100%)
 rename arch/arm64/boot/dts/ti/{k3-am625-verdin-panel-cap-touch-10inch-dsi.dtso => k3-am625-verdin-tdx-panel-cap-touch-10inch-dsi.dtso} (100%)
 rename arch/arm64/boot/dts/ti/{k3-am625-verdin-panel-cap-touch-10inch-lvds.dtso => k3-am625-verdin-tdx-panel-cap-touch-10inch-lvds-v1.dtso} (100%)
 rename arch/arm64/boot/dts/ti/{k3-am625-verdin-panel-cap-touch-10inch-lvds-v2.dtso => k3-am625-verdin-tdx-panel-cap-touch-10inch-lvds-v2.dtso} (100%)
 rename arch/arm64/boot/dts/ti/{k3-am625-verdin-panel-cap-touch-7inch-dsi.dtso => k3-am625-verdin-tdx-panel-cap-touch-7inch-dsi.dtso} (100%)
 rename arch/arm64/boot/dts/ti/{k3-am69-aquila-adapter-panel-cap-touch-10inch-dsi.dtso => k3-am69-aquila-adapter-tdx-panel-cap-touch-10inch-dsi.dtso} (100%)
 rename arch/arm64/boot/dts/ti/{k3-am69-aquila-adapter-panel-cap-touch-7inch-dsi.dtso => k3-am69-aquila-adapter-tdx-panel-cap-touch-7inch-dsi.dtso} (100%)
 rename arch/arm64/boot/dts/ti/{k3-am69-aquila-dsi-to-lvds-panel-cap-touch-10inch.dtso => k3-am69-aquila-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtso} (100%)
 rename arch/arm64/boot/dts/ti/{k3-am69-aquila-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso => k3-am69-aquila-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2.dtso} (100%)
 rename arch/arm64/boot/dts/ti/{k3-am69-aquila-panel-cap-touch-10inch-dsi.dtso => k3-am69-aquila-tdx-panel-cap-touch-10inch-dsi.dtso} (100%)
 rename arch/arm64/boot/dts/ti/{k3-am69-aquila-panel-cap-touch-7inch-dsi.dtso => k3-am69-aquila-tdx-panel-cap-touch-7inch-dsi.dtso} (100%)

-- 
2.47.3


