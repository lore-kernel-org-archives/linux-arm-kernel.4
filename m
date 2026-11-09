Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FBD60A5BC6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 15:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wLe9isff;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=BgCACKZd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=iYFxYy4y/RCp8PCPpnknYT8Me8VloobFASIGXdtsvUA=; b=wLe9isffSyoy/O
	SfxHq323MITr7Hm3EyBbA6nOU9/FjDVtMLEczLMm2DqZJeEXN2sqWS0QtuZHayY6jgfb8lTSA14Xy
	JXEIIyTfau+tOgKB7vEJLjodILJIrjJdxjCZKedvh4x7F9DguV97VD0ZXDSVfS9xhYsOqoHTJ6SmR
	qZUKAZ7IPPdZROCKMTltcvprdkuNGn/ZQlda0Wey8Zc2GZqW0i4un/bpx50qNbiSNn0buNosxLXVS
	bAqJKNOWXKl9SMv7lLOowGT/0ZNDasnurdCwIk9pKEkI0Ki1WycU9HuxOQVAryL6mw7S3dJWo8mpK
	x5ATZpqtEdSg323UIIhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRl8-0000000163n-0A8M;
	Mon, 09 Nov 2026 15:58:14 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRl0-000000015xl-03xG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 15:58:09 +0000
Received: from francesco-nb.. (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id F03CE26665;
	Mon,  9 Nov 2026 16:57:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794239879;
	bh=iYFxYy4y/RCp8PCPpnknYT8Me8VloobFASIGXdtsvUA=; h=From:To:Subject;
	b=BgCACKZdgA43Rrj5O5wlbP1UTKAKVLnARW1cb4iY0UQ79gZvemqC5K/yua1QBUG0f
	 9yR0+zh4vQIXmGd7WNW3W8IFc+kq0sfR8h/9x0OJGD3rjd/c+vwHYLRjQwz0EF2a6A
	 vjxGEYoqUfuLHIT080/THXyhTMTgwa1KcmQTQmxU9K3PUSCU4JezU+wHUQeYXp0f9l
	 MuuwFfF5cDudhBJyKH7dHLS6cIXa+S4znLPmLBEcIH3sgnJGFiYsr/5K0WEtYL4gu0
	 dL4rJ2Sqw338DL9D98b6G3Am6VRW1XbqHTSaH1DxXUQz9gD52AUubj95gHV/AR6eeP
	 wXMK+Vo4uCiRA==
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
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-bsp@toradex.com,
	x86@kernel.org,
	linux-coco@lists.linux.dev,
	kvm@vger.kernel.org
Subject: [PATCH v2 1/8] ARM: dts: imx7d-colibri-emmc: Enable the VGA DAC
Date: Mon,  9 Nov 2026 16:57:41 +0100
Message-ID: <20261109155751.475875-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109155751.475875-1-francesco@dolcini.it>
References: <20261109155751.475875-1-francesco@dolcini.it>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_075806_996096_948E41AF 
X-CRM114-Status: GOOD (  11.77  )
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

From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>

On the Colibri Evaluation Board and Aster carrier board, the BL_ON signal
on SODIMM 71 controls the active-low power-save input of the ADV7125 VGA
DAC. The VGA overlay does not drive this signal, leaving the DAC disabled.
The monitor receives the sync signals but displays a black image.
On the Iris carrier board, the DAC power-save input is pulled high
so the missing GPIO configuration does not prevent the VGA output from
working.

Add the pinctrl configuration and an active-high enable GPIO to the VGA
bridge so that the simple-bridge driver takes the DAC out of power-save
when enabling the output.

Fixes: cc6c96f0bdd7 ("ARM: dts: imx7d-colibri-emmc: Add VGA overlay")
Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v2: no changes
---
 arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-vga.dtso | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-vga.dtso b/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-vga.dtso
index cda214c13876..363c0c2cc43e 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-vga.dtso
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-vga.dtso
@@ -12,9 +12,14 @@
 /dts-v1/;
 /plugin/;
 
+#include <dt-bindings/gpio/gpio.h>
+
 &{/} {
 	vga-encoder {
 		compatible = "dumb-vga-dac";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_bl_on>;
+		enable-gpios = <&gpio5 1 GPIO_ACTIVE_HIGH>;
 
 		ports {
 			#address-cells = <1>;
-- 
2.47.3


