Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E57606C132
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 22:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cCipS7pT;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Geab3j7d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/sHEUsYL1fLrcDtxWkY+EanrRcanvkHZv8Egmu5dY54=; b=cCipS7pTyrlyAV
	Iacx9ap93Vrk0j4/LtWEilnDQg4cFow9NM6vCsv4xz4CtyMVO3eqP18vMratkQWND62yccCzsb4K9
	N26tSVVMZiIxXkiG0aPdNMAzLlvb5eWWt6BGhRUFJ3R4xspPCryF6mIjiM/N3WHh5KPgldg7Zuzt6
	9VoP+/XM7jqkbwahOgKIYyAHMbNkgz7Sb9w4BV5HVdo6rap0Ytco9l+9varCdWeg3FOaCNAQTU8GM
	iOG8GnN3AB3qZsJ1jgSBGpIwDTeZ4WVx2iCSL/NVXAXn5VTwqxVS3m++gRDYI7lV+3zWXpkzsSTl+
	UwbQJYIdh2oRhhJ7cHVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRH2G-000000080Gl-27zM;
	Wed, 11 Nov 2026 22:43:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRH2D-000000080EU-0GqX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 22:43:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 848676398F;
	Wed, 11 Nov 2026 22:43:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C5891F00A08;
	Wed, 11 Nov 2026 22:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794436996;
	bh=/sHEUsYL1fLrcDtxWkY+EanrRcanvkHZv8Egmu5dY54=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Geab3j7dU4DJKwXmvVey6M7rAvj3P5TjLmWO+PqqCSbYz6hLjS34N7PIRdFx5ixJ9
	 d6Vrlonzq7j6to9H1R8SV4jvj4v22jlxOsT7MAxh/2oC4iroLGqKZhJzrstJV2PIsT
	 UX27j5pqQgFDDP6yE4GNn8at1anpx603EySecb3dkCCxUkImysT2T2UmlkebN+AQ8v
	 KNKTggKoXfO73KibAefj5pT2wJA0WazLnRV7dY49Mc0wqcR1fB+UnuhQoFbTO6I6/Z
	 M2ye1Y6nXoH78a7OlvPBnbfrD2GYwDcRwtKE85T+aMTosN4sVgfGZ04vf5gGKDo6ah
	 caHpWztyqiBrw==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Wed, 11 Nov 2026 16:42:59 -0600
Subject: [PATCH 2/9] arm64: dts: marvell: Add AP806/CP110 syscon
 compatibles
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-dtbs-marvell-v1-2-938788aff3ae@kernel.org>
References: <20261111-dtbs-marvell-v1-0-938788aff3ae@kernel.org>
In-Reply-To: <20261111-dtbs-marvell-v1-0-938788aff3ae@kernel.org>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16-dev
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

Add specific compatibles for the AP806 and CP110 system-controller
syscon blocks that host pinctrl, GPIO, clock and thermal child nodes.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/marvell/armada-ap80x.dtsi | 6 ++++--
 arch/arm64/boot/dts/marvell/armada-cp11x.dtsi | 6 ++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-ap80x.dtsi b/arch/arm64/boot/dts/marvell/armada-ap80x.dtsi
index 40e146982921..0da13b2cd1fc 100644
--- a/arch/arm64/boot/dts/marvell/armada-ap80x.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-ap80x.dtsi
@@ -267,7 +267,8 @@ ap_sdhci0: mmc@6e0000 {
 			};
 
 			ap_syscon0: system-controller@6f4000 {
-				compatible = "syscon", "simple-mfd";
+				compatible = "marvell,ap806-system-controller",
+					     "syscon", "simple-mfd";
 				reg = <0x6f4000 0x2000>;
 
 				ap_pinctrl: pinctrl {
@@ -293,7 +294,8 @@ ap_gpio: gpio@1040 {
 			};
 
 			ap_syscon1: system-controller@6f8000 {
-				compatible = "syscon", "simple-mfd";
+				compatible = "marvell,ap806-system-controller",
+					     "syscon", "simple-mfd";
 				reg = <0x6f8000 0x1000>;
 				#address-cells = <1>;
 				#size-cells = <1>;
diff --git a/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi b/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
index 39599171d51b..9e365af19a0c 100644
--- a/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
@@ -225,7 +225,8 @@ CP11X_LABEL(rtc): rtc@284000 {
 		};
 
 		CP11X_LABEL(syscon0): system-controller@440000 {
-			compatible = "syscon", "simple-mfd";
+			compatible = "marvell,cp110-system-controller",
+				     "syscon", "simple-mfd";
 			reg = <0x440000 0x2000>;
 
 			CP11X_LABEL(clk): clock {
@@ -277,7 +278,8 @@ CP11X_LABEL(gpio2): gpio@140 {
 		};
 
 		CP11X_LABEL(syscon1): system-controller@400000 {
-			compatible = "syscon", "simple-mfd";
+			compatible = "marvell,cp110-system-controller",
+				     "syscon", "simple-mfd";
 			reg = <0x400000 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <1>;

-- 
2.53.0


