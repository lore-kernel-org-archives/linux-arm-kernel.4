Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FAE606A324
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 07:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JJ1FsI9z;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=tQv692Ii
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=k3KnFF+jQuMamSCMGRM4IiQplf2ksxu6lK+S7xvE/bE=; b=JJ1FsI9zkpzliJ
	eHgRZKYqcz2WElYQOzZG7F6d73hO21ClsyPhwzvOhGyelt5UUKTqW+46b04cmeblLwZ0r/eBmMCH6
	BvEuTVhvuJS1rCTKvx89Es9OH/jDmlOv/aIO0lOjXGUwAv6KBwCjYjWJBNUC2B2CpwOAzg0xArB3C
	pTyRKygIoxVsXi6rzDXrWkdj3KKqWxk3jSh38MXs1MuytS3uhiMMVmfmD+WZ/I70LikxjNrkY9G22
	lYHuHIH8x4wv0Qsua+NoQLiRtkEXNr0VNKwDRbOvH2vcMFao5rC2XVcQYbwhp3FtdNnQdNafRiV8U
	W+2NutlYpT/QPW1+PGVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWphO-0000000F4Vz-1QWP;
	Fri, 27 Nov 2026 06:44:46 +0000
Received: from watt.d-silva.org ([119.15.109.137] helo=www.nmnhosting.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWph7-0000000F4Pl-0DAL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 06:44:30 +0000
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id A439E4C94C;
	Fri, 27 Nov 2026 17:44:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795761861;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k3KnFF+jQuMamSCMGRM4IiQplf2ksxu6lK+S7xvE/bE=;
	b=tQv692IiFOuy8Kf1yAEFScRgiuExVeO67dldVyYPJrCyDhthgPchtpKsRs7XjAamsIUgjX
	fp6E3dR88Zgyr100OkD7XrgplKwSvjqFooEzyoJL7uIC4fRd6Xfw68+53EoQxFt2hc1oIZ
	PRLbo3tMxe3gJiftDVpSwePELvvolyZzfJ3LBGO7JbohGbK0pdr1bjRoKDuDqU6IAswc58
	e7J7HE/ZLptNf+lObCLP9yZhAiATmWlnvBm9fgVPaLVKmaHMgJJBWsB/gd8HrBlyQVBP6i
	5rcrG3ujeTcMFw3wupZOPCGYB6jxrYtWvUVKCB478oozqJfRTbXv6sS9lquVzg==
X-GPT-Reason: This is a legitimate personal/technical communication.
	The mailbox (alastair@d-silva.org) matches the sender's identity
	(alastair@d-silva.org) perfectly, and the content is a standard
	Linux kernel-style patch for an "Orange Pi" hardware device. There
	are no signs of phishing, no external links, no urgency/scare tactics,
	and the technical nature of the "arm64: dts" subject line is consistent
	with developer activity.
From: Alastair D'Silva <alastair@d-silva.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH v2 2/2] arm64: dts: allwinner: sun60i-a733-orangepi-4-pro: Enable SPI0 NOR flash
Date: Fri, 27 Nov 2026 17:44:08 +1100
Message-ID: <20261127064408.1344250-3-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127064408.1344250-1-alastair@d-silva.org>
References: <20261127064408.1344250-1-alastair@d-silva.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_224429_644769_B850403B 
X-CRM114-Status: UNSURE (   9.20  )
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

Enable the SPI0 controller and onboard JEDEC SPI NOR flash on Orange
Pi 4 Pro, supplied by AXP318W BLDO1 (1.8 V).

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 .../allwinner/sun60i-a733-orangepi-4-pro.dts  | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733-orangepi-4-pro.dts b/arch/arm64/boot/dts/allwinner/sun60i-a733-orangepi-4-pro.dts
index df70967264ed..92f31bf9f64d 100644
--- a/arch/arm64/boot/dts/allwinner/sun60i-a733-orangepi-4-pro.dts
+++ b/arch/arm64/boot/dts/allwinner/sun60i-a733-orangepi-4-pro.dts
@@ -34,6 +34,10 @@ &mmc0 {
 	status = "okay";
 };
 
+&pio {
+	vcc-pc-supply = <&reg_bldo1>;
+};
+
 &r_i2c0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&r_i2c0_pins>;
@@ -56,6 +60,13 @@ reg_dcdc2: dcdc2 {
 				regulator-boot-on;
 			};
 
+			reg_bldo1: bldo1 {
+				regulator-name = "vcc-1v8-io";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+
 			reg_dldo1: dldo1 {
 				regulator-name = "vcc-sd";
 				regulator-min-microvolt = <3300000>;
@@ -76,6 +87,19 @@ reg_swout2: swout2 {
 	};
 };
 
+&spi0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi0_pc_pins>, <&spi0_cs0_pc_pin>;
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <50000000>;
+		vcc-supply = <&reg_bldo1>;
+	};
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pb_pins>;
-- 
2.53.0


