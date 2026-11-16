Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D39A606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 14:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fCHTEU9I;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=bM2egM1P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=oElFm/yj2o3LRHDrA9VBkjg9/gf3iwVC8tnrYXPGEtY=; b=fCHTEU9I/3yS8KXvwJBxGoiKMv
	asDmnpPNqRTyEBcMYJ6tCXFkloOU8+YEOwshv6p1QoCKP3cu/IRiQcced4ko59n8IyPKpDgQ5ZjHX
	QNPFgN98ueaoYeB+f3UhzSSxFeHpkDVDo5OsY4QRItkPPTMlAf1YUHIhjASdjpEXYaDivSlN/JT7x
	yRFYqjazRsksqAOkarmcSIQBFd+1e1j7GMcdF0MHRr3oM/CSssRUVWBT4VnmQQ/iiyl/80tYYO2Bo
	EjiDoOgY8F6ZTVPxC3PjxjpWFEoMkBOtDQ52T+W937bzYvUqtxNPvwY61OW+7bAnwcJJDrGR+ujSY
	zOVYPsAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxin-00000002sZs-3MvA;
	Mon, 16 Nov 2026 14:30:13 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxik-00000002sWL-0A7M
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 14:30:12 +0000
Received: from dude04.red.stw.pengutronix.de (dude04.red.stw.pengutronix.de [IPv6:2a0a:edc0:0:1101:1d::ac])
	(Authenticated sender: relay-from-dude04.red.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 2382720059B;
	Mon, 16 Nov 2026 15:30:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794839402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oElFm/yj2o3LRHDrA9VBkjg9/gf3iwVC8tnrYXPGEtY=;
	b=bM2egM1PsJ6ui+EYrbwMd/MGeBJQrXZMVba9q4erp8UXUAkyuKuF/R+vRZONyam4Rtyfmy
	39SXrCn00xVz8fzfBSkOkTK8GPAjUjSCzEsVM3YbbvUzPZY0k8jcFlSBwGuETIbN5OL9/F
	IjgaPxmhn7hvtY2j7DadlA80JvkUQeG3jvOvJifeZjAaqIVGJw0xOTy2Z5nHMJ/IJDnPGb
	SQivj4RQTVKt5O+ieLj/77ZzrzjjhC3MWPFX3CX71xtHmCkDaGS8RyhLKTMfeX5yZMdy/9
	UZAfEC3p/YlLUrMep5dp5Z68KAmuYVCvW/87OQ8b2L29lNF70DuYUaS99k9WlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794839402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oElFm/yj2o3LRHDrA9VBkjg9/gf3iwVC8tnrYXPGEtY=;
	b=eIQ9LwT4ieKpgMveJnSzLLGvXbyTn2kfSNuOt7ZPLfH6LUMLEeXcRYIed4kk9RpraTOpa6
	Cgd3QVvx9XVwdi98oAa0EFA/ptyoUzJREkJz5c31DSslYI02lZzHdPR11SzOojS2JdPw0z
	pGCpDH7e8FS3WWeYIBj/UlsoCFD4+Ztb51SKbtwA57bCEiINy6iPkd+9gwjVj8wZWd+Saj
	aBTCyMTiGPPdTvNBvChxMl+N6x1si7y8EYFbzeacJGwijlggjxypa1GgcwyuxHsb3HfHZZ
	9lqss8IhrsqdOs/aL5/u1dGz6ndQ/crdjnI/AvG88/ryIx/6efl4cW/bebMoOg==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794839402; a=rsa-sha256;
	cv=none;
	b=CiCNMn6J9bOGe2ECG93EpnChs2AHhFZHCJ+N3GdC4ng485kr69z8sIPDJIhnNnJUFMVh5I
	NQbCkdAFbQW50yq/0IHkXWh7TdbURVHTFTtBtLbTLw6aLY12iNRtvvolzJ+dhjTOY4Q5RF
	gfP8jH+ACg1TUb/3VvvPfOyG0Lpg41C3ZxW4h9vb+SUxEhFfYMDZeRa0duHhlE0O3zrs2S
	NbT32RDx1MtTr4XaJ2fyw8Yo6mdCYbh9e0YS/qEWOEtEU0MnVNlwLAmgmBlRRNdJ214Il+
	LgnAPMd4nxRrIywjRuzPsYyQc+YcQKUVGJylfDUcPSy8GgsbrdVDBlX7xvjA0Q==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-dude04.red.stw.pengutronix.de smtp.mailfrom=rhi@pengutronix.de
Received: by dude04.red.stw.pengutronix.de (Postfix, from userid 1059)
	id 17688380329; Mon, 16 Nov 2026 15:30:02 +0100 (CET)
From: Roland Hieber <rhi@pengutronix.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: Roland Hieber <rhi@pengutronix.de>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH] arm64: dts: imx8mp-skov: fix input supply properties
Date: Mon, 16 Nov 2026 15:29:09 +0100
Message-ID: <20261116142912.3011357-2-rhi@pengutronix.de>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_063010_652022_2B98DA17 
X-CRM114-Status: UNSURE (   9.26  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.9 (/)
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

The nxp,pca9450c node used the non-standard 'vin-supply' binding until now.
Upstream commit 4c33cef58965eb655a0a ("regulator: pca9450: link regulator
inputs to supply groups") added support for 'in*-supply' bindings, so move
to this standardized binding to fix errors on boot:

  nxp-pca9450 0-0025: Failed to create device link (0x180) with supplier
    regulator-5v-p for
    /soc@0/bus@30800000/i2c@30a20000/pmic@25/regulators/LDO1

Suggested-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Signed-off-by: Roland Hieber <rhi@pengutronix.de>
---
 arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
index 5453e590f64f..1c97f2c2873a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
@@ -275,13 +275,16 @@ pmic@25 {
 		pinctrl-0 = <&pinctrl_pmic>;
 		interrupts-extended = <&gpio1 3 IRQ_TYPE_EDGE_RISING>;
 		priority = <200>;
+		inl1-supply = <&reg_5v_p>;
+		inb13-supply = <&reg_5v_p>;
+		inb26-supply = <&reg_5v_p>;
+		inb45-supply = <&reg_5v_p>;
 
 		regulators {
 			reg_vdd_soc: BUCK1 {
 				regulator-name = "VDD_SOC";
 				regulator-min-microvolt = <850000>;
 				regulator-max-microvolt = <850000>;
-				vin-supply = <&reg_5v_p>;
 				regulator-boot-on;
 				regulator-always-on;
 				regulator-ramp-delay = <3125>;
@@ -291,7 +294,6 @@ reg_vdd_arm: BUCK2 {
 				regulator-name = "VDD_ARM";
 				regulator-min-microvolt = <850000>;
 				regulator-max-microvolt = <1000000>;
-				vin-supply = <&reg_5v_p>;
 				regulator-boot-on;
 				regulator-always-on;
 				regulator-ramp-delay = <3125>;
@@ -303,7 +305,6 @@ reg_vdd_3v3: BUCK4 {
 				regulator-name = "VDD_3V3";
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
-				vin-supply = <&reg_5v_p>;
 				regulator-boot-on;
 				regulator-always-on;
 			};
@@ -312,7 +313,6 @@ reg_vdd_1v8: BUCK5 {
 				regulator-name = "VDD_1V8";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
-				vin-supply = <&reg_5v_p>;
 				regulator-boot-on;
 				regulator-always-on;
 			};
@@ -321,7 +321,6 @@ reg_nvcc_dram_1v1: BUCK6 {
 				regulator-name = "NVCC_DRAM_1V1";
 				regulator-min-microvolt = <1100000>;
 				regulator-max-microvolt = <1100000>;
-				vin-supply = <&reg_5v_p>;
 				regulator-boot-on;
 				regulator-always-on;
 			};
@@ -330,7 +329,6 @@ reg_nvcc_snvs_1v8: LDO1 {
 				regulator-name = "NVCC_SNVS_1V8";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
-				vin-supply = <&reg_5v_p>;
 				regulator-boot-on;
 				regulator-always-on;
 			};
@@ -339,7 +337,6 @@ reg_vdda_1v8: LDO3 {
 				regulator-name = "VDDA_1V8";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
-				vin-supply = <&reg_5v_p>;
 				regulator-boot-on;
 				regulator-always-on;
 			};
@@ -348,7 +345,6 @@ reg_nvcc_sd2: LDO5 {
 				regulator-name = "NVCC_SD2";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <3300000>;
-				vin-supply = <&reg_5v_p>;
 				regulator-boot-on;
 				regulator-always-on;
 			};

