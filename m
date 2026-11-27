Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D013606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 10:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PLmk/NBk;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=EOz/mUod
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gF3Bsu5rs/jn9aSqs3fra0yM0c4EjWfoKhWHUIYkMjg=; b=PLmk/NBkW7O+fA
	m2AaZyaBxZyHzIoZX8ARmWd88y9oYp2hMfc1LehQWFhjYduACMqWa/wPUGYp0YB90OyKBLQZuBfak
	AOc8QAHUzoIzEkYkO5KHAQRLUrWMxaWRF0cVgodQ7IJ1Wk0hMUWDB/ddBmE2YDG8CpNuv21DlP9h1
	EzXfdvJ/YfMpD6ynZ/XS9kSUGkh3CmDpQf1d/rydd0gSBP4ebTDNxGLmcLViPOSxwzU5d+nOKhXCq
	2W40c4ZYCAXehBcohzvH7mr894n7gRB7fbhno9C13uHC+9X7LoaOuxusVxw/RATU8jo5xii2y1I/d
	ipgLOAJGIUylKMd+AxAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWstM-0000000FWRN-2gCA;
	Fri, 27 Nov 2026 10:09:20 +0000
Received: from watt.d-silva.org ([119.15.109.137] helo=www.nmnhosting.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWssz-0000000FWCz-2aAp;
	Fri, 27 Nov 2026 10:08:59 +0000
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id A1F614C987;
	Fri, 27 Nov 2026 21:08:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795774129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gF3Bsu5rs/jn9aSqs3fra0yM0c4EjWfoKhWHUIYkMjg=;
	b=EOz/mUodfEY7o5dFFJYYi5p8ug8dn2IdhwIKmhpxtkGSTseTYKrpUL7N+geZ/vwv1MFw6r
	bCRpUG2txoYUzBS0B7OCdzIgCydddEYhsxS1ARjeFOfye30e48PG8q+fLmHWsSjN747o/X
	9IZymWkexF3JlOGPfGf5MLqiwpLScRMOdnrQ0bUF84KV/Bb04Quqwm/7uptRkiKpQAPKeO
	cD2R2/IObc0Kg4XNRzeE5aI2n/YVrSCDBBQeMQu88tbqJCvcLsBufo53qgyiVzwVafYJTz
	iLHKK+RcUZj9tyAGzgm2S7qyfTKd1j7ysZepI3AdQ8luW5PPS5H4ZPVDpPCtcA==
X-GPT-Reason: This is a legitimate technical communication. The
	email is classified as personal/technical as the sender
	(alastair@d-silva.org) perfectly matches the intended recipient's
	mailbox (alastair@d-silva.org). The content is a specific, non-promotional
	Linux kernel patch description regarding hardware configuration
	(Allwinner sun60i-a733) which aligns with the technical nature
	of the domain. There are no phishing indicators, no external URLs,
	and no urgency or marketing tactics present.
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
Subject: [PATCH 6/6] arm64: dts: allwinner: sun60i-a733-orangepi-4-pro: Enable USB 2.0 host
Date: Fri, 27 Nov 2026 21:08:08 +1100
Message-ID: <20261127100808.2292229-7-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127100808.2292229-1-alastair@d-silva.org>
References: <20261127100808.2292229-1-alastair@d-silva.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_020857_910682_217B4FAA 
X-CRM114-Status: UNSURE (   8.44  )
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

Add the 5V system supply and USB1 VBUS regulator (PB8), and enable usbphy,
ehci1, and ohci1 on the Xunlong OrangePi 4 Pro.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 .../allwinner/sun60i-a733-orangepi-4-pro.dts  | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733-orangepi-4-pro.dts b/arch/arm64/boot/dts/allwinner/sun60i-a733-orangepi-4-pro.dts
index 374287d962a8..327c996c7e7b 100644
--- a/arch/arm64/boot/dts/allwinner/sun60i-a733-orangepi-4-pro.dts
+++ b/arch/arm64/boot/dts/allwinner/sun60i-a733-orangepi-4-pro.dts
@@ -21,6 +21,28 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	reg_usb1_vbus: regulator-usb1-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "usb1-vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&reg_vcc5v>;
+		gpios = <&pio 1 8 GPIO_ACTIVE_HIGH>; /* PB8 */
+		enable-active-high;
+	};
+
+	reg_vcc5v: regulator-vcc5v {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc-5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+};
+
+&ehci1 {
+	status = "okay";
 };
 
 &hosc {
@@ -36,6 +58,10 @@ &mmc0 {
 	status = "okay";
 };
 
+&ohci1 {
+	status = "okay";
+};
+
 &r_i2c0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&r_i2c0_pl_pins>;
@@ -73,3 +99,8 @@ &uart0 {
 	pinctrl-0 = <&uart0_pb_pins>;
 	status = "okay";
 };
+
+&usbphy {
+	usb1_vbus-supply = <&reg_usb1_vbus>;
+	status = "okay";
+};
-- 
2.53.0


