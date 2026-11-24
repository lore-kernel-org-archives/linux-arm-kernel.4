Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941E2606A329
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 20:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ILMd3rtm;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GFYGq/YA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TGvJrzvCh1u0+GAaV49qFLIoqLbmbUrKt8bVmtDQlCE=; b=ILMd3rtmw6mJHo
	2CTGL1Vo31g+t4LojDp6AZ3N2s2yP5/gw9aDmT3kuMDYwVY3ZOMpz2wD3nLAIu4TxCA0jHwruyd4x
	QTu7nmizAy0XAx2Is+VFyMiG4J5ZvYnM37ECHVEgfbtcrKMKn1VSV7D4j/GeWvQ7SWhL4oQz82pvk
	/ydF543qG8pGUYJ4EcoU2OiYchwCmfeiIGhO0MVsPy5Ws7iJlB6dGhflEbtFATjlqFYpIQ7KmEhTM
	ck0fs5q/W/s4yKyjOptzuDSMIiU6DLUSwH3g/7kEFiI/CSHFAFz/xmR5GD/q5Chnp5QNIVjYrrGsC
	Qpb69z8Snsg7RLmELU5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxQX-00000007lc2-3BhT;
	Tue, 24 Nov 2026 20:47:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxQN-00000007lXJ-1kY4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 20:47:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D5DF642D5F;
	Tue, 24 Nov 2026 20:47:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6313F1F00A01;
	Tue, 24 Nov 2026 20:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795553254;
	bh=TGvJrzvCh1u0+GAaV49qFLIoqLbmbUrKt8bVmtDQlCE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=GFYGq/YAizb7UeGqMtk8Xyq7JkWWqA5fW9TI3aHJMgQanOyHIhKqfiUpbDpF2SqpF
	 /Om4xUokzC4uF81OtXb/unyAi8aYFmxFEihetk5B5QIHTkm/waeYz9ReA3hxlbLQoa
	 COoSBL/sYCNOO4xWqh/d3JNU4c32iGJeobcmafHd9obwcNh1Tl7VmMMXYG8gfVxKDi
	 DX787oIrCtAVoffPCMnzuyiBqtt0uSpjzd7PQ2tR2JMtiL6RvhZrQpBzHyNytIUvI2
	 E9kMDCuvK6rcMsFfLWbvaAraFmN1ky/8A75hD00WlW4OWYIxvQbwI/Yz9zI2qXG3tJ
	 J8pOILYjIgugw==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 24 Nov 2026 14:46:35 -0600
Subject: [PATCH v2 2/9] arm64: dts: marvell: Add AP806/CP110 syscon
 compatibles
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-dtbs-marvell-v2-2-663009a769da@kernel.org>
References: <20261124-dtbs-marvell-v2-0-663009a769da@kernel.org>
In-Reply-To: <20261124-dtbs-marvell-v2-0-663009a769da@kernel.org>
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
v2:
 - Update compatibles to avoid old legacy ones
---
 arch/arm64/boot/dts/marvell/armada-ap80x.dtsi | 6 ++++--
 arch/arm64/boot/dts/marvell/armada-cp11x.dtsi | 6 ++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-ap80x.dtsi b/arch/arm64/boot/dts/marvell/armada-ap80x.dtsi
index 40e146982921..ce9821d73aaf 100644
--- a/arch/arm64/boot/dts/marvell/armada-ap80x.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-ap80x.dtsi
@@ -267,7 +267,8 @@ ap_sdhci0: mmc@6e0000 {
 			};
 
 			ap_syscon0: system-controller@6f4000 {
-				compatible = "syscon", "simple-mfd";
+				compatible = "marvell,ap806-syscon",
+					     "syscon", "simple-mfd";
 				reg = <0x6f4000 0x2000>;
 
 				ap_pinctrl: pinctrl {
@@ -293,7 +294,8 @@ ap_gpio: gpio@1040 {
 			};
 
 			ap_syscon1: system-controller@6f8000 {
-				compatible = "syscon", "simple-mfd";
+				compatible = "marvell,ap806-syscon",
+					     "syscon", "simple-mfd";
 				reg = <0x6f8000 0x1000>;
 				#address-cells = <1>;
 				#size-cells = <1>;
diff --git a/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi b/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
index 39599171d51b..6f05614b0641 100644
--- a/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
@@ -225,7 +225,8 @@ CP11X_LABEL(rtc): rtc@284000 {
 		};
 
 		CP11X_LABEL(syscon0): system-controller@440000 {
-			compatible = "syscon", "simple-mfd";
+			compatible = "marvell,cp110-syscon",
+				     "syscon", "simple-mfd";
 			reg = <0x440000 0x2000>;
 
 			CP11X_LABEL(clk): clock {
@@ -277,7 +278,8 @@ CP11X_LABEL(gpio2): gpio@140 {
 		};
 
 		CP11X_LABEL(syscon1): system-controller@400000 {
-			compatible = "syscon", "simple-mfd";
+			compatible = "marvell,cp110-syscon",
+				     "syscon", "simple-mfd";
 			reg = <0x400000 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <1>;

-- 
2.53.0


