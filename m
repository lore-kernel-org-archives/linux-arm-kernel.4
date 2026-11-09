Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AAE760A5BC1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 15:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kbMXoFPk;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=wKvuv12L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=r3N87t7rpgxXMLe+tyGoCO5FBIgPlIswbKigTqDeBMY=; b=kbMXoFPkGVgv5WBPmnch8QfTtW
	DlPfD0w4M8Zw5VuGZNd772p6jkOEXqSuRsoCXXyi7W95tXr++rxHul32YnllUvkeq8WkkB0ePEGqK
	sAouiAauNRtwft0HTuja8KbD3jYpBnMTICzV3uc8LgFZayhKRbnqtYN334bsheKPBGOrdZwnvFvu7
	xAaeZsXw9AH+AytpYn7tKNYWICZYR9IXVkw08O6xhlaTo+NzCUprEF1B1ImUE435GjX06Il+5sL5I
	b7pg3x1nVmtyqpGD9/Mo+klhbKj77uQN+NSEbfRprA3EFBz/F0B4hL7b4YXjrfR3BxcRJ7R8O3Xie
	WmaP+Wtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRl8-0000000164l-1fBP;
	Mon, 09 Nov 2026 15:58:14 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRl0-000000015xh-0gz8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 15:58:09 +0000
Received: from francesco-nb.. (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id 29B6426662;
	Mon,  9 Nov 2026 16:57:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794239878;
	bh=r3N87t7rpgxXMLe+tyGoCO5FBIgPlIswbKigTqDeBMY=; h=From:To:Subject;
	b=wKvuv12Lgl0Lp7WVZrkuWV0q+WgXOfjxmJMsjTpLytkKqdbcUl/kMpoVFSyfhxlDd
	 9gtu+weUURdk+Fh8084MwFYRd9oMIaUS0HD/3qiK/Mr02rmRLGfbhLzoWUJwRJjpK4
	 lmY9f6yGi7T9OWGQ/RLiK73WuC7BgKOjFESkd+86Wm8dFImN3B6t03dT9P5HbjwGug
	 RZdDH76en8sDjcg7b3CMAceUGkR/jfnxy0LVH0502kgUK993IRiwddwvXGBU7N7VXC
	 gKKK1DDfR/iVxNj9wxg3Pz2u+1+BbYpKhLdcQQytGDKowFhjns4JDKgsNH6+N7/uEu
	 cgEL6Nxvm5sKw==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Kiryl Shutsemau <kas@kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-bsp@toradex.com,
	x86@kernel.org,
	linux-coco@lists.linux.dev,
	kvm@vger.kernel.org
Subject: [PATCH v2 0/8] ARM: dts: imx6ull-colibri-emmc: Add DPI display and VGA overlays
Date: Mon,  9 Nov 2026 16:57:40 +0100
Message-ID: <20261109155751.475875-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_075806_985113_242FBA0C 
X-CRM114-Status: GOOD (  14.75  )
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

Add device tree overlays for the Toradex display accessories on the
Colibri iMX6ULL eMMC parallel RGB LCD interface, mirroring what was
recently merged for the Colibri iMX7 eMMC:

 - Capacitive Touch Display 7" Parallel, touch on the 10-way Capacitive
   Touch Interface connector (Iris v2, Aster)
 - Capacitive Touch Display 7" Parallel, touch through the Capacitive
   Touch Adapter (Eval v3)
 - Resistive Touch Display 7" Parallel (Eval v3)
 - VGA output through a non-programmable video DAC (Aster, Eval v3,
   Iris, Iris v2)

The panel, backlight and LCDIF part of each overlay is identical between
the two modules, both using the same LCDIF binding and labels. Instead
of duplicating it, each patch moves that part out of the corresponding
Colibri iMX7 eMMC overlay into a dtsi shared by the two modules and
includes it from both. Only the Atmel MaxTouch wiring, the conflicting
PWM channels and the BL_ON pinctrl and GPIO driving the VGA DAC power-save
input stay in the SoC specific overlays. The shared files follow the
imx6ul-imx6ull-*.dtsi naming already used in the same directory.

The overlay names are the Toradex product names of the accessories, and
a product name is unique only together with its vendor. Following the
discussion on the Apalis iMX6 overlays [1], the Toradex accessories get
a "tdx" vendor prefix, the same way third-party accessories on Toradex
boards already carry theirs, e.g. "rpi" in
k3-am625-verdin-rpi-display-2-7in.dtso.

Patches 1 and 2 are fixes and come first, so they can be backported
without the rename. Patch 1 (from Emanuele) drives the VGA DAC power-save
input through the BL_ON signal, without it the Eval and Aster carrier
boards show a black image. Patch 2 adds the Colibri iMX7 eMMC touch
adapter and resistive touch .dtbo to dtb-y, as they were built only as a
dependency of the combined DTBs and never shipped by dtbs_install.
Patch 3 adds the tdx vendor prefix to the existing Colibri iMX7 eMMC
display overlays. Patch 4 aligns the Colibri iMX6ULL backlight
brightness levels with the Colibri iMX7 ones, the LED driver of the 7"
displays turns off below roughly 15% duty cycle and only the three
highest of the current levels produced a visible image.

[1] https://lore.kernel.org/all/20261026111149.GA46946@francesco-nb/

v2:
 - add patch 3, tdx vendor prefix for the Colibri iMX7 eMMC display
   overlays
 - add the tdx vendor prefix to the new Colibri iMX6ULL display
   overlays, the shared dtsi and the combined DTBs
v1: https://lore.kernel.org/all/20261001174924.3831455-1-francesco@dolcini.it/

Emanuele Ghidoli (1):
  ARM: dts: imx7d-colibri-emmc: Enable the VGA DAC

Francesco Dolcini (7):
  ARM: dts: imx7d-colibri-emmc: Add missing touch display overlays to
    dtb-y
  ARM: dts: imx7d-colibri-emmc: Add tdx vendor prefix to display
    overlays
  ARM: dts: imx6ull-colibri: Align backlight brightness levels with
    Colibri iMX7
  ARM: dts: imx6ull-colibri-emmc: Add Toradex Capacitive Touch Display
    7" Parallel
  ARM: dts: imx6ull-colibri-emmc: Add Toradex Capacitive Touch Display
    7" Parallel with Touch Adapter
  ARM: dts: imx6ull-colibri-emmc: Add Toradex Resistive Touch Display 7"
    Parallel
  ARM: dts: imx6ull-colibri-emmc: Add VGA overlay

 arch/arm/boot/dts/nxp/imx/Makefile            | 73 +++++++++++++++----
 ...ap-touch-7inch-parallel-touch-adapter.dtso | 46 ++++++++++++
 ...mc-tdx-panel-cap-touch-7inch-parallel.dtso | 31 ++++++++
 ...mc-tdx-panel-res-touch-7inch-parallel.dtso | 16 ++++
 .../dts/nxp/imx/imx6ull-colibri-emmc-vga.dtso | 24 ++++++
 .../arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi |  4 +-
 ...ri-tdx-panel-cap-touch-7inch-parallel.dtsi | 29 ++++++++
 ...i-tdx-panel-res-touch-7inch-parallel.dtsi} |  8 +-
 .../dts/nxp/imx/imx6ull-imx7-colibri-vga.dtsi | 61 ++++++++++++++++
 ...p-touch-7inch-parallel-touch-adapter.dtso} | 16 +---
 ...c-tdx-panel-cap-touch-7inch-parallel.dtso} | 16 +---
 ...mc-tdx-panel-res-touch-7inch-parallel.dtso | 16 ++++
 .../dts/nxp/imx/imx7d-colibri-emmc-vga.dtso   | 49 ++-----------
 13 files changed, 299 insertions(+), 90 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-colibri-emmc-tdx-panel-cap-touch-7inch-parallel-touch-adapter.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-colibri-emmc-tdx-panel-cap-touch-7inch-parallel.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-colibri-emmc-tdx-panel-res-touch-7inch-parallel.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-colibri-emmc-vga.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-imx7-colibri-tdx-panel-cap-touch-7inch-parallel.dtsi
 rename arch/arm/boot/dts/nxp/imx/{imx7d-colibri-emmc-panel-res-touch-7inch-parallel.dtso => imx6ull-imx7-colibri-tdx-panel-res-touch-7inch-parallel.dtsi} (77%)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-imx7-colibri-vga.dtsi
 rename arch/arm/boot/dts/nxp/imx/{imx7d-colibri-emmc-panel-cap-touch-7inch-parallel-touch-adapter.dtso => imx7d-colibri-emmc-tdx-panel-cap-touch-7inch-parallel-touch-adapter.dtso} (90%)
 rename arch/arm/boot/dts/nxp/imx/{imx7d-colibri-emmc-panel-cap-touch-7inch-parallel.dtso => imx7d-colibri-emmc-tdx-panel-cap-touch-7inch-parallel.dtso} (86%)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-tdx-panel-res-touch-7inch-parallel.dtso

-- 
2.47.3


