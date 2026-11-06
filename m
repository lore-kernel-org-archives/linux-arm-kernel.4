Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B4D606A330
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 16:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VeUI3xPE;
	dkim=pass (1024-bit key, unprotected) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=l2n3Ww+q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=A0ueZbdutXIDB8BlM9vO73ShuZrV78krDehdwtiPnNo=; b=VeUI3xPEQpMlto
	lR7L0Jk150qx+Q65R3UJ87X37T/Kitc08qKj9JBZkgGfOaZ6SyFKRD8biZi6qOk3cNbvuu1KMw25e
	JzDWWbg5UBj3LDjGkMduOwjbFaoKnevq0t25zBtWp/ivWJvZ2Cx01i35ZECv4Md3CGyguJc3lEC9N
	SWh6g5NfT8/Q8kCzsPgFMCBw5eqr4D9b+lhu+FsH0XNn59GhH9ujtYW/5sdlNVFg8WcDc+RFYy+Uw
	FmfQZ8rM1uDXPgM6dKHf7/p5C6c4ooWLmk54qniYAjoswkQDbtzsuZSMBjz3fdjIs9aNjcpOGQfxu
	Sh6All3VIYIeLYbdFRBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPNEt-0000000D8H9-0XHv;
	Fri, 06 Nov 2026 16:56:31 +0000
Received: from mail.cyberchaos.dev ([2a0f:4ac0::3a11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPNEq-0000000D8Fm-1AlO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 16:56:29 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1793984183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A0ueZbdutXIDB8BlM9vO73ShuZrV78krDehdwtiPnNo=;
	b=l2n3Ww+qMYNYZnEOl5MJWYsGjh1k96ytz6u9g4ni081Vo8swU0V3TjT4zeR884wrnHLIbT
	L6wQIghEjnV8IFPqT9hJL+zyUX2xS+2gclgG7XQA81Rt6QgQpvdJt4nRXnkJPrBi73Ugat
	myq0U/+TBBL2ilWJv/L6bl9AL0+Ni3Y=
Date: Fri, 06 Nov 2026 17:56:14 +0100
Subject: [PATCH v2 2/4] arm64: dts: apple: t8132: Fix blank-lines-related
 dt-check-style issues
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-apple-dts-m4-dt-style-check-v2-2-1e715e80b066@cyberchaos.dev>
References: <20261106-apple-dts-m4-dt-style-check-v2-0-1e715e80b066@cyberchaos.dev>
In-Reply-To: <20261106-apple-dts-m4-dt-style-check-v2-0-1e715e80b066@cyberchaos.dev>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Yureka Lilian <yureka@cyberchaos.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_085628_550350_685F2937 
X-CRM114-Status: UNSURE (   9.94  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This fixes `dt-check-style --mode=strict` issues related to blank lines
in the t8132 device tres.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 arch/arm64/boot/dts/apple/t8132-j604.dts  | 1 +
 arch/arm64/boot/dts/apple/t8132-j713.dts  | 1 +
 arch/arm64/boot/dts/apple/t8132-j715.dts  | 1 +
 arch/arm64/boot/dts/apple/t8132-jxxx.dtsi | 1 +
 arch/arm64/boot/dts/apple/t8132.dtsi      | 8 ++++++++
 5 files changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8132-j604.dts b/arch/arm64/boot/dts/apple/t8132-j604.dts
index c4be915cb33a..93076cd923a9 100644
--- a/arch/arm64/boot/dts/apple/t8132-j604.dts
+++ b/arch/arm64/boot/dts/apple/t8132-j604.dts
@@ -19,6 +19,7 @@ / {
 
 	led-controller {
 		compatible = "pwm-leds";
+
 		led-0 {
 			pwms = <&fpwm1 0 40000>;
 			label = "kbd_backlight";
diff --git a/arch/arm64/boot/dts/apple/t8132-j713.dts b/arch/arm64/boot/dts/apple/t8132-j713.dts
index e1fc5d47f487..892a3812bc65 100644
--- a/arch/arm64/boot/dts/apple/t8132-j713.dts
+++ b/arch/arm64/boot/dts/apple/t8132-j713.dts
@@ -19,6 +19,7 @@ / {
 
 	led-controller {
 		compatible = "pwm-leds";
+
 		led-0 {
 			pwms = <&fpwm1 0 40000>;
 			label = "kbd_backlight";
diff --git a/arch/arm64/boot/dts/apple/t8132-j715.dts b/arch/arm64/boot/dts/apple/t8132-j715.dts
index 2672914ea76c..212d194bd1ae 100644
--- a/arch/arm64/boot/dts/apple/t8132-j715.dts
+++ b/arch/arm64/boot/dts/apple/t8132-j715.dts
@@ -19,6 +19,7 @@ / {
 
 	led-controller {
 		compatible = "pwm-leds";
+
 		led-0 {
 			pwms = <&fpwm1 0 40000>;
 			label = "kbd_backlight";
diff --git a/arch/arm64/boot/dts/apple/t8132-jxxx.dtsi b/arch/arm64/boot/dts/apple/t8132-jxxx.dtsi
index 9882ea3f85e6..b0c5d71943b6 100644
--- a/arch/arm64/boot/dts/apple/t8132-jxxx.dtsi
+++ b/arch/arm64/boot/dts/apple/t8132-jxxx.dtsi
@@ -26,6 +26,7 @@ framebuffer0: framebuffer@0 {
 			reg = <0 0 0 0>; /* To be filled by loader */
 			power-domains = <&ps_disp_fe>, <&ps_dptx_phy>;
 			/* Format properties will be added by loader */
+
 			status = "disabled";
 		};
 	};
diff --git a/arch/arm64/boot/dts/apple/t8132.dtsi b/arch/arm64/boot/dts/apple/t8132.dtsi
index 58805c6ab002..6d070306e29a 100644
--- a/arch/arm64/boot/dts/apple/t8132.dtsi
+++ b/arch/arm64/boot/dts/apple/t8132.dtsi
@@ -24,18 +24,23 @@ cluster0 {
 				core0 {
 					cpu = <&cpu_e0>;
 				};
+
 				core1 {
 					cpu = <&cpu_e1>;
 				};
+
 				core2 {
 					cpu = <&cpu_e2>;
 				};
+
 				core3 {
 					cpu = <&cpu_e3>;
 				};
+
 				core4 {
 					cpu = <&cpu_e4>;
 				};
+
 				core5 {
 					cpu = <&cpu_e5>;
 				};
@@ -45,12 +50,15 @@ cluster1 {
 				core0 {
 					cpu = <&cpu_p0>;
 				};
+
 				core1 {
 					cpu = <&cpu_p1>;
 				};
+
 				core2 {
 					cpu = <&cpu_p2>;
 				};
+
 				core3 {
 					cpu = <&cpu_p3>;
 				};

-- 
2.56.0


