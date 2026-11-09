Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4C4606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 16:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z3FVznND;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=rsXCNE0r
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BuAz2H6S6BQoz6NjweVUggSmY7ai2732ogYbCwWyPfE=; b=z3FVznND1k/8KB
	EY9ABYme5ojeqqumHL5dRcwxTSv65LiOnHqXsBbRlPZXRiTLRo9Z2/v+0lAgNLtcem6t15ruWOgyF
	+1AyoM4+lo8M0lBZTeEb/2laxqyQ/SIExWpD25OZNOoCFHaSZaqW+IHkx8uYq/zv/H8j1BCO8gcFs
	6dvBCBFyWEaDDfN+2pCx/MSahijLYMA0PYKO+6L4HIjU+Rm65M0AnRpZFNLYiZdT5Eqv1aFDDFprL
	BtRYbpH2Zbc4SX6vYAtf0mXlwJe6bScIbMrPBAKuawws8qPp1zrPgpl/StgAK0vhfYVo8aOzbkjVM
	6FM/Ow6TYAUrC1NQZrFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRl8-0000000164E-0iiP;
	Mon, 09 Nov 2026 15:58:14 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRl0-000000015xy-0Z3M
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 15:58:09 +0000
Received: from francesco-nb.. (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id A922026667;
	Mon,  9 Nov 2026 16:58:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794239881;
	bh=BuAz2H6S6BQoz6NjweVUggSmY7ai2732ogYbCwWyPfE=; h=From:To:Subject;
	b=rsXCNE0rkdnKoDDFlEX/4Yu7l9U/tawRTDXC6I2kIqgu8i7sT06EySLR9Wwd+tlEr
	 14xfo1tUmy/vsrbHq0qdkQ+iWv6+4VhzENcYW0uUVdpxP7E1ZA5OD5NWA/9WhQSpeV
	 MyUvaTFPZTC75BDiO9YJjYgduSdyRbZ7zsB4xjPHQRhP8qRzM46LTZg0dyuJOdzu3K
	 NaLYUfKETuaSCqj4N46fPhWJyNbDfIEH6QiXOVUl+74I9/7wzxWAM14R916nYqlFop
	 1UWJph9fZkDeN/ezH9Q+BvGj/rHQ8HgH650kp2WPZ7f14byXq53m3vTSJtHV0P4VVN
	 ZnYZpWIeCw5Ow==
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
Subject: [PATCH v2 3/8] ARM: dts: imx7d-colibri-emmc: Add tdx vendor prefix to display overlays
Date: Mon,  9 Nov 2026 16:57:43 +0100
Message-ID: <20261109155751.475875-4-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109155751.475875-1-francesco@dolcini.it>
References: <20261109155751.475875-1-francesco@dolcini.it>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_075806_996397_DA0A80DB 
X-CRM114-Status: UNSURE (   9.33  )
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

The Toradex Capacitive Touch Display 7" Parallel and Resistive Touch
Display 7" Parallel are Toradex accessories, and the overlay names are
their product names. A product name is unique only within its vendor:
"panel-cap-touch-7inch-parallel" on its own reads as a generic panel
description and could just as well name another vendor's display.

Prefix the accessory with its vendor, "tdx", as is already done for
third-party accessories on Toradex boards, e.g. "rpi" in
k3-am625-verdin-rpi-display-2-7in.dtso. The combined DTBs are renamed
accordingly.

Link: https://lore.kernel.org/all/20261026111149.GA46946@francesco-nb/
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v2: new patch
---
 arch/arm/boot/dts/nxp/imx/Makefile            | 30 +++++++++----------
 ...p-touch-7inch-parallel-touch-adapter.dtso} |  0
 ...c-tdx-panel-cap-touch-7inch-parallel.dtso} |  0
 ...c-tdx-panel-res-touch-7inch-parallel.dtso} |  0
 4 files changed, 15 insertions(+), 15 deletions(-)
 rename arch/arm/boot/dts/nxp/imx/{imx7d-colibri-emmc-panel-cap-touch-7inch-parallel-touch-adapter.dtso => imx7d-colibri-emmc-tdx-panel-cap-touch-7inch-parallel-touch-adapter.dtso} (100%)
 rename arch/arm/boot/dts/nxp/imx/{imx7d-colibri-emmc-panel-cap-touch-7inch-parallel.dtso => imx7d-colibri-emmc-tdx-panel-cap-touch-7inch-parallel.dtso} (100%)
 rename arch/arm/boot/dts/nxp/imx/{imx7d-colibri-emmc-panel-res-touch-7inch-parallel.dtso => imx7d-colibri-emmc-tdx-panel-res-touch-7inch-parallel.dtso} (100%)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index f22abbd01434..c05cc9ff782d 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -424,21 +424,21 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
 	imx6ulz-14x14-evk.dtb \
 	imx6ulz-bsh-smm-m2.dtb
 
-imx7d-colibri-emmc-aster-panel-cap-touch-7inch-parallel-dtbs := \
+imx7d-colibri-emmc-aster-tdx-panel-cap-touch-7inch-parallel-dtbs := \
 	imx7d-colibri-emmc-aster.dtb \
-	imx7d-colibri-emmc-panel-cap-touch-7inch-parallel.dtbo
+	imx7d-colibri-emmc-tdx-panel-cap-touch-7inch-parallel.dtbo
 
-imx7d-colibri-emmc-iris-v2-panel-cap-touch-7inch-parallel-dtbs := \
+imx7d-colibri-emmc-iris-v2-tdx-panel-cap-touch-7inch-parallel-dtbs := \
 	imx7d-colibri-emmc-iris-v2.dtb \
-	imx7d-colibri-emmc-panel-cap-touch-7inch-parallel.dtbo
+	imx7d-colibri-emmc-tdx-panel-cap-touch-7inch-parallel.dtbo
 
-imx7d-colibri-emmc-eval-v3-panel-cap-touch-7inch-parallel-touch-adapter-dtbs := \
+imx7d-colibri-emmc-eval-v3-tdx-panel-cap-touch-7inch-parallel-touch-adapter-dtbs := \
 	imx7d-colibri-emmc-eval-v3.dtb \
-	imx7d-colibri-emmc-panel-cap-touch-7inch-parallel-touch-adapter.dtbo
+	imx7d-colibri-emmc-tdx-panel-cap-touch-7inch-parallel-touch-adapter.dtbo
 
-imx7d-colibri-emmc-eval-v3-panel-res-touch-7inch-parallel-dtbs := \
+imx7d-colibri-emmc-eval-v3-tdx-panel-res-touch-7inch-parallel-dtbs := \
 	imx7d-colibri-emmc-eval-v3.dtb \
-	imx7d-colibri-emmc-panel-res-touch-7inch-parallel.dtbo
+	imx7d-colibri-emmc-tdx-panel-res-touch-7inch-parallel.dtbo
 
 imx7d-colibri-emmc-aster-vga-dtbs := \
 	imx7d-colibri-emmc-aster.dtb \
@@ -460,20 +460,20 @@ dtb-$(CONFIG_SOC_IMX7D) += \
 	imx7d-cl-som-imx7.dtb \
 	imx7d-colibri-aster.dtb \
 	imx7d-colibri-emmc-aster.dtb \
-	imx7d-colibri-emmc-aster-panel-cap-touch-7inch-parallel.dtb \
+	imx7d-colibri-emmc-aster-tdx-panel-cap-touch-7inch-parallel.dtb \
 	imx7d-colibri-emmc-aster-vga.dtb \
 	imx7d-colibri-emmc-iris.dtb \
 	imx7d-colibri-emmc-iris-vga.dtb \
 	imx7d-colibri-emmc-iris-v2.dtb \
-	imx7d-colibri-emmc-iris-v2-panel-cap-touch-7inch-parallel.dtb \
+	imx7d-colibri-emmc-iris-v2-tdx-panel-cap-touch-7inch-parallel.dtb \
 	imx7d-colibri-emmc-iris-v2-vga.dtb \
 	imx7d-colibri-emmc-eval-v3.dtb \
-	imx7d-colibri-emmc-eval-v3-panel-cap-touch-7inch-parallel-touch-adapter.dtb \
-	imx7d-colibri-emmc-eval-v3-panel-res-touch-7inch-parallel.dtb \
+	imx7d-colibri-emmc-eval-v3-tdx-panel-cap-touch-7inch-parallel-touch-adapter.dtb \
+	imx7d-colibri-emmc-eval-v3-tdx-panel-res-touch-7inch-parallel.dtb \
 	imx7d-colibri-emmc-eval-v3-vga.dtb \
-	imx7d-colibri-emmc-panel-cap-touch-7inch-parallel.dtbo \
-	imx7d-colibri-emmc-panel-cap-touch-7inch-parallel-touch-adapter.dtbo \
-	imx7d-colibri-emmc-panel-res-touch-7inch-parallel.dtbo \
+	imx7d-colibri-emmc-tdx-panel-cap-touch-7inch-parallel.dtbo \
+	imx7d-colibri-emmc-tdx-panel-cap-touch-7inch-parallel-touch-adapter.dtbo \
+	imx7d-colibri-emmc-tdx-panel-res-touch-7inch-parallel.dtbo \
 	imx7d-colibri-emmc-vga.dtbo \
 	imx7d-colibri-eval-v3.dtb \
 	imx7d-colibri-iris.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-panel-cap-touch-7inch-parallel-touch-adapter.dtso b/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-tdx-panel-cap-touch-7inch-parallel-touch-adapter.dtso
similarity index 100%
rename from arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-panel-cap-touch-7inch-parallel-touch-adapter.dtso
rename to arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-tdx-panel-cap-touch-7inch-parallel-touch-adapter.dtso
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-panel-cap-touch-7inch-parallel.dtso b/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-tdx-panel-cap-touch-7inch-parallel.dtso
similarity index 100%
rename from arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-panel-cap-touch-7inch-parallel.dtso
rename to arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-tdx-panel-cap-touch-7inch-parallel.dtso
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-panel-res-touch-7inch-parallel.dtso b/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-tdx-panel-res-touch-7inch-parallel.dtso
similarity index 100%
rename from arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-panel-res-touch-7inch-parallel.dtso
rename to arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-tdx-panel-res-touch-7inch-parallel.dtso
-- 
2.47.3


