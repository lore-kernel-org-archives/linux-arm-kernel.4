Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C2C606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 17:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WMrhLDYT;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=dmS9OfdF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=woGd+T14iFaDXtJWDc2tcaqs++Bm20facx5pAtjkDig=; b=WMrhLDYTn3gUB/
	IOTgYgZWI6XgkyDxA/n/+IXUnuDua9MHQ1Wfxq/Blla6D6as0UWYKc3403KYTt73uxt58ILhUtDs7
	M0MkfSkNB0wdINBS841nwXIVtkLw45p3koCWqw/yWhPaaJGSrnrEjkz5JbpKUd8lUKNqeDxPGemNB
	Ccbtb7j0Ki+bW+1tOfpd+gIVVZwd6Dok5izWHuHjJHJPie4R4stSf286Z1Rqa7hyvSWrdjCMhc0Cl
	op/aPXRBkrRvYERZbiShe70eN9RDLGxD+IYTpHZAwPJZZWxjm9AJSEfuh/TJEsGIBQuQgkLOoD/+S
	UIoF/UQCJvGuAnpihFdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVBEL-00000001Q8v-01op;
	Sun, 22 Nov 2026 17:19:57 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVBEA-00000001Q70-0WOm
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 17:19:48 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 4894E270BA;
	Sun, 22 Nov 2026 18:19:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1795367979;
	bh=woGd+T14iFaDXtJWDc2tcaqs++Bm20facx5pAtjkDig=; h=From:To:Subject;
	b=dmS9OfdFg0a5UHzCXkfkYZwE2wiK9MjJeWob9RtMcaX/7D05PTUPCvL6AButrnBpy
	 50sgkGX8L9tDhZXv9FUDqn8NFtnk3zlQHnWkEV9P4nlhZ3Hfpobvr42tYX0ywYtVdw
	 ghtMmnh2whRRwn10/AwzeUEvAaluQK+CnR9xvzAgQdbVhBtD/DlzWnFTgE+Y2mCilD
	 QOKVLu2lem4/jXmp8v3JC3X1TMxZEtqPh8V5cPf0scWpIOKSKOLAOFoIQi9jB4X6hR
	 KrUswsSLmg0/GTdi24EY4aCoAupLpkyIAxsbeOu9pfoV9j4pHLWToT34blyD49/5WX
	 OD+UqVAxc3ESQ==
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
Subject: [PATCH v1 1/2] arm64: dts: freescale: imx93-imx91-toradex-osm-dev: Fix SDIO_B definition
Date: Sun, 22 Nov 2026 18:19:28 +0100
Message-ID: <20261122171931.295307-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261122171931.295307-1-francesco@dolcini.it>
References: <20261122171931.295307-1-francesco@dolcini.it>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_091946_524533_C9D85230 
X-CRM114-Status: GOOD (  10.92  )
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

On the OSM Development Board, SDIO_B goes to the M.2 Key E slot for a
Wi-Fi/Bluetooth module. The slot has no card detect signal and M.2
modules are not hot-pluggable. The slot supply is not software
controlled, so the module stays powered in suspend. The SDIO_B signals
are fixed at 1.8V, supplied by the on-module +V1.8 rail.

Describe the slot as non-removable, keep the module powered in suspend,
and add the fixed 1.8V I/O supply. Without this, the empty slot is
polled every second.

Fixes: e8a8c86875f4 ("arm64: dts: freescale: Add Toradex OSM iMX93")
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 .../boot/dts/freescale/imx93-imx91-toradex-osm-common.dtsi     | 1 +
 .../boot/dts/freescale/imx93-imx91-toradex-osm-dev-common.dtsi | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-common.dtsi b/arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-common.dtsi
index f6fd64176893..d273f4bfb96b 100644
--- a/arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-common.dtsi
@@ -517,6 +517,7 @@ &usdhc3 {
 	pinctrl-1 = <&pinctrl_sdio_b>;
 	pinctrl-2 = <&pinctrl_sdio_b>;
 	disable-wp;
+	vqmmc-supply = <&reg_1v8>;
 };
 
 &wdog3 {
diff --git a/arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-dev-common.dtsi b/arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-dev-common.dtsi
index 61a0f49f198b..41bc471329eb 100644
--- a/arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-dev-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-dev-common.dtsi
@@ -316,5 +316,8 @@ &usdhc2 {
 
 /* OSM SDIO_B */
 &usdhc3 {
+	keep-power-in-suspend;
+	non-removable;
+
 	status = "okay";
 };
-- 
2.47.3


