Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABF4606A334
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 07:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TAG6eYLe;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=emGWWdij
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AtXVbbErWYhfqAHbYerdgFucAGtzxEu/+zlU33IiXxQ=; b=TAG6eYLeFL0pOE1kzpF/Yc7yEv
	+fZdmVZdNzBiq0g5GM2Fmka6elTF/ssPiDaNY6Vicj3jq3x/A85H4LLXooM7kRbSc5LO7QWPzNu+f
	Y6PFMusq4/wNBrJ0iZpAeLqLOp8+KICFl+PyRayarKDGEgqgipD2yRF+p155S2/5v9VpQ6tdzhkVO
	Hy2uhKfeBUWloEbDWsRIlR10p+CUhRJkSJONlOPfk/nzGIJLly//kruun5O5BkPxURrG+JD84gab8
	cHqzRM+FVo3/4zdkm9tfa0DLMvNdCU9e2aAH62753NlfCJSmp3Hj4SynQPmvVo+QTZ+hLO68x3rxP
	l4BRRrqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPxHG-0000000Fmqr-1Pjb;
	Sun, 08 Nov 2026 07:25:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPxHA-0000000Fmnb-3hoZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 07:25:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 22DB46142E;
	Sun,  8 Nov 2026 07:25:16 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794122715;
	b=omFflpyjX7eZt1MCpUKpktc0XtBNVO8K4lUYA2zOcxKD8NQdduwB+cJlSnTKpDRktzPW
	 8DiewTvk2jMZbiMi/smH25zvMxc9kdn6KxbHxjOWBC6dfPUFOe5v4bIWpG2CqohPJ927s
	 Bkw9E/2oocNMv+4izLoSWkJfQ8WvLdEUA4S2hEZqzeyFtRJr5NzOSMyANuzTlAaShwiev
	 Y1tbYmcl0Trnm72V8ntPFwLI67O7Bf8bZFxkk1px6mPG2V2T2DvEzMTie9Y9uhnFo2YuX
	 twSU/NZmnpcDHtqAacpWM7YULsRcFdmzHeADtqEF/E/Mvf5hCAdU+SkR6XWptu9yzzA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794122715;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=AtXVbbErWYhfqAHbYerdgFucAGtzxEu/+zlU33IiXxQ=;
	b=CigEz+EwrgEs9EEyn+d4//l1V7NFmA7JRZuxEpvxhaOs9Lh47/VoKfrYKejHvNWqNF6v
	 jeRhWHCBAaNwGOJFg84oY9Bhxh3xgCVXwVLFDu4IMoVgIcORDGRo9O9UTb5gtGal3aRR6
	 dOECauQChdy4wln7rc4cRlIOSK7HtFVRRTDuXPESYLFg/ZYOMf30wrc/w4QBqIdB7uNJK
	 zk6wkWaRCebXC+wlmv3S+Gx6eu5YQCOHBsa+acqunq47DAtdJ6L9LSb4w54VmQEzOiK+t
	 0s0HTCeM86fKkNd4MhqaeHO7yKBzWpfSBkv5WT+iXi2s36GGnFf4E3MHs7Ttf6ENeAg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2FB881F008BF;
	Sun,  8 Nov 2026 07:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794122715;
	bh=AtXVbbErWYhfqAHbYerdgFucAGtzxEu/+zlU33IiXxQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=emGWWdijk358n+GFcJhMyuooIu3B7BYedloPYzBBirg+p5c3xyy7Rg6Dp0tP8Lz6h
	 mdqlt+sbWuz5ZfaeE96Z8x/nWlQU2/hVJwxaNOJcW6gMLz4R2BuFg+Smm3C1th5/N6
	 cHY8xXC7nSeXXMvA9QclWsacqNu9KEzCaP5MagvPY/XmRyk4VPXCbZQTB8we4OF9SM
	 7PZeNPfQ8pkEtXcaMPEy5LWmycIEAkcnJyobnL9Y/r9Zj4y9/C+HK4AA3v56TZZJIL
	 jZxgtqpaqLwCK2BdNLZ94KlBS0/SHcdYQeA6sgeFNwSYPfUywlbWwIRDJgIZtK4MbC
	 VO/Dxstj1nZ8w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 911F747E73;
	Sun,  8 Nov 2026 07:25:12 +0000 (UTC)
From: Michael Reeves via B4 Relay <devnull+michael.reeves077.gmail.com@kernel.org>
Date: Sun, 08 Nov 2026 07:25:13 +0000
Subject: [PATCH v5 8/8] arm64: dts: apple: Enable DockChannel HID on M2 and
 M3 laptops
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261108-b4-apple-mtp-keyboard-v5-8-e2c97b82669a@gmail.com>
References: <20261108-b4-apple-mtp-keyboard-v5-0-e2c97b82669a@gmail.com>
In-Reply-To: <20261108-b4-apple-mtp-keyboard-v5-0-e2c97b82669a@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
 Benjamin Tissoires <bentiss@kernel.org>, 
 Michael Reeves <michael.reeves077@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-input@vger.kernel.org, Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794122710; l=7011;
 i=michael.reeves077@gmail.com; s=20261107; h=from:subject:message-id;
 bh=zDBnGRKF6WdRKeYPVV1cRA9LKeT1joknp1YiOamAuYY=;
 b=7ih6zc2CRUNGW7YZSoHyM3WcE1c3TcQ48RNtmqYUpdjnnEIqMyrLYmtf5KlnK1OE7BIp2u85l
 +HtEF51PWMyDaJ0IrNrPn60Sw82yJPXZmYteimVwG23S1m6gcsvtCrA
X-Developer-Key: i=michael.reeves077@gmail.com; a=ed25519;
 pk=ykwkLcuByJYb/cdLc2UuoYP03pIzwrscEZg30+4tJL8=
X-Endpoint-Received: by B4 Relay for michael.reeves077@gmail.com/20261107
 with auth_id=1442
X-Original-From: Michael Reeves <michael.reeves077@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: michael.reeves077@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Michael Reeves <michael.reeves077@gmail.com>

Enable the MTP mailbox, DART, DockChannel mailbox, and HID transport on
the M2 and M3 laptop device trees using this internal input path.

Add a keyboard alias and enable DockChannel HID on each machine so the
transport can expose the internal keyboard.

Co-developed-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
---
 arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi | 24 ++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t603x-j514-j516.dtsi | 19 +++++++++++++++++++
 arch/arm64/boot/dts/apple/t8112-j413.dts       | 19 +++++++++++++++++++
 arch/arm64/boot/dts/apple/t8112-j415.dts       | 19 +++++++++++++++++++
 arch/arm64/boot/dts/apple/t8112-j493.dts       | 21 ++++++++++++++++++++-
 arch/arm64/boot/dts/apple/t8122-j504.dts       | 22 ++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8122-j613.dts       | 22 ++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8122-j615.dts       | 22 ++++++++++++++++++++++
 8 files changed, 167 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi b/arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi
index 0e806d8ddf81..98d58b340aee 100644
--- a/arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi
+++ b/arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi
@@ -16,6 +16,12 @@
 
 #include "t600x-j314-j316.dtsi"
 
+/ {
+	aliases {
+		keyboard = &mtp_hid;
+	};
+};
+
 &framebuffer0 {
 	power-domains = <&ps_disp0_cpu0>, <&ps_dptx_phy_ps>;
 };
@@ -43,3 +49,21 @@ &wifi0 {
 &bluetooth0 {
 	compatible = "pci14e4,5f72";
 };
+
+&mtp_mbox {
+	status = "okay";
+};
+
+&mtp_dart {
+	status = "okay";
+};
+
+&mtp_dockchannel {
+	status = "okay";
+};
+
+&mtp_hid {
+	status = "okay";
+	apple,has-stm;
+	hid-country-code = <0>;
+};
diff --git a/arch/arm64/boot/dts/apple/t603x-j514-j516.dtsi b/arch/arm64/boot/dts/apple/t603x-j514-j516.dtsi
index bbee373044f9..555c160e6bd7 100644
--- a/arch/arm64/boot/dts/apple/t603x-j514-j516.dtsi
+++ b/arch/arm64/boot/dts/apple/t603x-j514-j516.dtsi
@@ -21,6 +21,7 @@ / {
 	chassis-type = "laptop";
 
 	aliases {
+		keyboard = &mtp_hid;
 		serial0 = &serial0;
 	};
 
@@ -67,3 +68,21 @@ &serial0 {
 &fpwm0 {
 	status = "okay";
 };
+
+&mtp_mbox {
+	status = "okay";
+};
+
+&mtp_dart {
+	status = "okay";
+};
+
+&mtp_dockchannel {
+	status = "okay";
+};
+
+&mtp_hid {
+	status = "okay";
+	apple,has-stm;
+	hid-country-code = <0>;
+};
diff --git a/arch/arm64/boot/dts/apple/t8112-j413.dts b/arch/arm64/boot/dts/apple/t8112-j413.dts
index 7ccfceb08093..04a394abf479 100644
--- a/arch/arm64/boot/dts/apple/t8112-j413.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j413.dts
@@ -20,6 +20,7 @@ / {
 
 	aliases {
 		bluetooth0 = &bluetooth0;
+		keyboard = &mtp_hid;
 		wifi0 = &wifi0;
 	};
 
@@ -93,3 +94,21 @@ &fpwm1 {
 };
 
 #include "hwmon-laptop.dtsi"
+
+&mtp_mbox {
+	status = "okay";
+};
+
+&mtp_dart {
+	status = "okay";
+};
+
+&mtp_dockchannel {
+	status = "okay";
+};
+
+&mtp_hid {
+	status = "okay";
+	apple,has-stm;
+	hid-country-code = <0>;
+};
diff --git a/arch/arm64/boot/dts/apple/t8112-j415.dts b/arch/arm64/boot/dts/apple/t8112-j415.dts
index fdc3409d2e07..ae28c75e8f97 100644
--- a/arch/arm64/boot/dts/apple/t8112-j415.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j415.dts
@@ -20,6 +20,7 @@ / {
 
 	aliases {
 		bluetooth0 = &bluetooth0;
+		keyboard = &mtp_hid;
 		wifi0 = &wifi0;
 	};
 
@@ -93,3 +94,21 @@ &fpwm1 {
 };
 
 #include "hwmon-laptop.dtsi"
+
+&mtp_mbox {
+	status = "okay";
+};
+
+&mtp_dart {
+	status = "okay";
+};
+
+&mtp_dockchannel {
+	status = "okay";
+};
+
+&mtp_hid {
+	status = "okay";
+	apple,has-stm;
+	hid-country-code = <0>;
+};
diff --git a/arch/arm64/boot/dts/apple/t8112-j493.dts b/arch/arm64/boot/dts/apple/t8112-j493.dts
index 7cea5c594810..8e29872ce907 100644
--- a/arch/arm64/boot/dts/apple/t8112-j493.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j493.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0+ OR MIT
 /*
- * Apple MacBook Pro (13-inch, M1, 2022)
+ * Apple MacBook Pro (13-inch, M2, 2022)
  *
  * target-type: J493
  *
@@ -24,6 +24,7 @@ / {
 	 */
 	aliases {
 		bluetooth0 = &bluetooth0;
+		keyboard = &mtp_hid;
 		touchbar0 = &touchbar0;
 		wifi0 = &wifi0;
 	};
@@ -149,3 +150,21 @@ touchbar0: touchbar@0 {
 
 #include "hwmon-laptop.dtsi"
 #include "hwmon-fan.dtsi"
+
+&mtp_mbox {
+	status = "okay";
+};
+
+&mtp_dart {
+	status = "okay";
+};
+
+&mtp_dockchannel {
+	status = "okay";
+};
+
+&mtp_hid {
+	status = "okay";
+	apple,has-stm;
+	hid-country-code = <0>;
+};
diff --git a/arch/arm64/boot/dts/apple/t8122-j504.dts b/arch/arm64/boot/dts/apple/t8122-j504.dts
index e60ec3039196..05ae01262c85 100644
--- a/arch/arm64/boot/dts/apple/t8122-j504.dts
+++ b/arch/arm64/boot/dts/apple/t8122-j504.dts
@@ -18,6 +18,10 @@ / {
 	compatible = "apple,j504", "apple,t8122", "apple,arm-platform";
 	model = "Apple MacBook Pro (14-inch, M3, 2023)";
 
+	aliases {
+		keyboard = &mtp_hid;
+	};
+
 	led-controller {
 		compatible = "pwm-leds";
 
@@ -35,3 +39,21 @@ led-0 {
 &fpwm1 {
 	status = "okay";
 };
+
+&mtp_mbox {
+	status = "okay";
+};
+
+&mtp_dart {
+	status = "okay";
+};
+
+&mtp_dockchannel {
+	status = "okay";
+};
+
+&mtp_hid {
+	status = "okay";
+	apple,has-stm;
+	hid-country-code = <0>;
+};
diff --git a/arch/arm64/boot/dts/apple/t8122-j613.dts b/arch/arm64/boot/dts/apple/t8122-j613.dts
index 40274a983849..c6070cc4aa42 100644
--- a/arch/arm64/boot/dts/apple/t8122-j613.dts
+++ b/arch/arm64/boot/dts/apple/t8122-j613.dts
@@ -17,6 +17,10 @@ / {
 	compatible = "apple,j613", "apple,t8122", "apple,arm-platform";
 	model = "Apple MacBook Air (13-inch, M3, 2024)";
 
+	aliases {
+		keyboard = &mtp_hid;
+	};
+
 	led-controller {
 		compatible = "pwm-leds";
 
@@ -34,3 +38,21 @@ led-0 {
 &fpwm1 {
 	status = "okay";
 };
+
+&mtp_mbox {
+	status = "okay";
+};
+
+&mtp_dart {
+	status = "okay";
+};
+
+&mtp_dockchannel {
+	status = "okay";
+};
+
+&mtp_hid {
+	status = "okay";
+	apple,has-stm;
+	hid-country-code = <0>;
+};
diff --git a/arch/arm64/boot/dts/apple/t8122-j615.dts b/arch/arm64/boot/dts/apple/t8122-j615.dts
index 61833f6d019b..71bf2949d8a6 100644
--- a/arch/arm64/boot/dts/apple/t8122-j615.dts
+++ b/arch/arm64/boot/dts/apple/t8122-j615.dts
@@ -17,6 +17,10 @@ / {
 	compatible = "apple,j615", "apple,t8122", "apple,arm-platform";
 	model = "Apple MacBook Air (15-inch, M3, 2024)";
 
+	aliases {
+		keyboard = &mtp_hid;
+	};
+
 	led-controller {
 		compatible = "pwm-leds";
 
@@ -34,3 +38,21 @@ led-0 {
 &fpwm1 {
 	status = "okay";
 };
+
+&mtp_mbox {
+	status = "okay";
+};
+
+&mtp_dart {
+	status = "okay";
+};
+
+&mtp_dockchannel {
+	status = "okay";
+};
+
+&mtp_hid {
+	status = "okay";
+	apple,has-stm;
+	hid-country-code = <0>;
+};

-- 
2.56.0



