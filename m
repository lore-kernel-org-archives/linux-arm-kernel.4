Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878A2606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 20:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pkCd6hqg;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=x6VOEvq3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XOx6J9QHFAsKuOFnB4I4H6oCEUTT94WpnmLj3jkDPUY=; b=pkCd6hqgfpnrIY
	m0Hcs7GsdBaJFqLvVoo442hSBKXPAuLNTOT3Gh4yIKDmA1vU8Em/SD50xgWIWqaweXbHHrrppr4jS
	Am/b0O3VuTTwKJijDb2A8NBmGXV3M09nc5ThNdZZMIMS9ilw1OW476UV//xpZc6YJZLrNE7iWtmmr
	Fr4TJNhwU/hOvtFzRa2CRa3gFgx77Wh6jiQ7wpA7JIwGPpldMU+1n6ow3RiA1nvUvsc09N+AfxsT3
	2MLwl9n1KaW+aipZRQONEAGtLdUlVqEvL+O8jRlwbHLgogTGkCX9+tG4GGftrzMItS4w/egEX87LT
	KqtbpSK8wueaBkyL/sug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWJJQ-0000000BE2P-2otR;
	Wed, 25 Nov 2026 20:09:52 +0000
Received: from watt.d-silva.org ([119.15.109.137] helo=www.nmnhosting.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWJJJ-0000000BE0O-49H2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 20:09:48 +0000
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 1A1E540963;
	Thu, 26 Nov 2026 07:09:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795637379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XOx6J9QHFAsKuOFnB4I4H6oCEUTT94WpnmLj3jkDPUY=;
	b=x6VOEvq3go3JNLHycFLj8+pWhe1zzcCpy8ZNCLGJcUkTm6vYc7who2oEtZsTWDr8U2TpHZ
	5NiFqIVyyHXMRNk9ZrNKoMaa25jFz8bI2T8HOumIO5b767nPr9cI5kfT45fDJqfknM/OkQ
	E3LBhThNBwkkr0hkpwtJHZy2GZ+zxUwYxcOEG6owU3xG+X0OwO2G1bbHkFAGirXZJYodh4
	Q6tq//JyZPd7sfZ888ZeAufpxPBTqBUlehLnuEbuCMZm0R/RpYbRAlrxvYDcAojYl0UNMG
	3YMB6sXktGH1YlgPqvp1GmoYGw+d64MIlfAcNNjlR7NjWjhZ+jmztZugwlcw4Q==
X-GPT-Reason: legitimate; this is a technical commit message or
	patch notification related to Linux kernel/hardware development;
	the mailbox (alastair@d-silva.org) matches the sender (alastair@d-silva.org);
	the content is a specific technical update regarding SPI0 NOR
	flash for Orange Pi 4 Pro hardware; there are no phishing indicators,
	urgency tactics, or suspicious links.
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
Subject: [PATCH 2/2] arm64: dts: allwinner: sun60i-a733-orangepi-4-pro: Enable SPI0 NOR flash
Date: Thu, 26 Nov 2026 07:09:27 +1100
Message-ID: <20261125200927.515136-3-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125200927.515136-1-alastair@d-silva.org>
References: <20261125200927.515136-1-alastair@d-silva.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_120947_093546_6AA6AB40 
X-CRM114-Status: GOOD (  10.25  )
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

Assisted-by: LLM
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


