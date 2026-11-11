Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CD76070091
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 19:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vo22qnTw;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=boxGcIGU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Gg8Z3g5whr4qOTZSmsNEegQVriNO3ujPVFMlRk++Be4=; b=vo22qnTwg3+hQj
	QJL9dpzZrrU0PHnuYmumEFimKqsLl+vR3xN4uZqYO0WsEo8oI1bDzM4UuAEiiBAm8w0InHGniS6Mu
	YJM84lBMKNZapvzccbAy3d0hxCR76SCQeL4/eYgdfJV3nmZPy4Ac00aHFcWrM9PkJLQNEt0y47iAO
	++ZEiXTj2oBXqM6TwPLg/BGmldkQgDHEG9UyC2pg4b2GzJTGHACezdsak7PFMkc+IzzqmZHW0IR5n
	sRmrUCiF8x6Q0tLJxxdP78qjDG99lP5yZgXiHKeV2QBOPAaHdadbtbU57YztAgR1NOiO0rTxPciIT
	uC9C4LQ4rLjA2444FaWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xREBN-00000007XWX-1GHP;
	Wed, 11 Nov 2026 19:40:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xREBL-00000007XVb-0wgo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 19:40:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6B07865515;
	Wed, 11 Nov 2026 19:40:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C44581F00A09;
	Wed, 11 Nov 2026 19:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794426030;
	bh=Gg8Z3g5whr4qOTZSmsNEegQVriNO3ujPVFMlRk++Be4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=boxGcIGUIxsxUMoseU1zCR37pL1tKnYZIr9z2mFRKP/yDB58+klYq9Leqk5mw3whx
	 j2/6f31VFgGLAk55mWala/nHSvr7cjg085glh8tRjndGcXLfbT7DzfDODeEg/270Rz
	 q+PqvxuZAX5CAT9cXQURWxmIMQQqABN1235df8vLtmLN1MlnzcvuwOq+JTmU6FYIs5
	 N3m0JId1q8S8DHh54z+GqtT6ifGDEN2lpokE6Jtn4Vb+yCaeK28UOAcJFXTzaGQ2H/
	 nEMeglx93zjXHbqsO8OnF/e6t4d6Nd9N5nYA4jnOsEMR+RQfgowsFknqQJ/qe/cGT6
	 /FsKIiDH4aslQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Wed, 11 Nov 2026 13:40:13 -0600
Subject: [PATCH 03/12] arm64: dts: hisilicon: Add specific syscon
 compatibles
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-dtbs-hisi-v1-3-6c9f5f80716c@kernel.org>
References: <20261111-dtbs-hisi-v1-0-6c9f5f80716c@kernel.org>
In-Reply-To: <20261111-dtbs-hisi-v1-0-6c9f5f80716c@kernel.org>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guodong Xu <guodong.xu@linux.dev>, 
 Wei Xu <xuwei5@hisilicon.com>
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

Add specific compatibles for HiSilicon syscon nodes HiKey reboot mode,
Hi6220 media NOC ADE, HIP06/HIP07 SerDes, and DSA CPLD syscon.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts | 3 ++-
 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts    | 3 ++-
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi         | 2 +-
 arch/arm64/boot/dts/hisilicon/hip06.dtsi          | 2 +-
 arch/arm64/boot/dts/hisilicon/hip07.dtsi          | 4 ++--
 5 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
index 27fb08d348c9..acecd2dfeeba 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
@@ -56,7 +56,8 @@ ramoops@32000000 {
 	};
 
 	reboot-mode-syscon@32100000 {
-		compatible = "syscon", "simple-mfd";
+		compatible = "hisilicon,hi3660-reboot-mode",
+			     "syscon", "simple-mfd";
 		reg = <0x0 0x32100000 0x0 0x00001000>;
 
 		reboot-mode {
diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
index 2d304efe081d..229116477f1d 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
@@ -69,7 +69,8 @@ linux,cma {
 	};
 
 	reboot-mode-syscon@5f01000 {
-		compatible = "syscon", "simple-mfd";
+		compatible = "hisilicon,hi6220-reboot-mode",
+			     "syscon", "simple-mfd";
 		reg = <0x0 0x05f01000 0x0 0x00001000>;
 
 		reboot-mode {
diff --git a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
index 61eaa7f8c1c9..21eb268b5731 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
@@ -294,7 +294,7 @@ acpu_sctrl: acpu_sctrl@f6504000 {
 		};
 
 		medianoc_ade: medianoc_ade@f4520000 {
-			compatible = "syscon";
+			compatible = "hisilicon,hi6220-medianoc-ade", "syscon";
 			reg = <0x0 0xf4520000 0x0 0x4000>;
 		};
 
diff --git a/arch/arm64/boot/dts/hisilicon/hip06.dtsi b/arch/arm64/boot/dts/hisilicon/hip06.dtsi
index 3d7285e6700e..823cd314dd32 100644
--- a/arch/arm64/boot/dts/hisilicon/hip06.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hip06.dtsi
@@ -450,7 +450,7 @@ pcie_subctl: pcie_subctl@a0000000 {
 		};
 
 		serdes_ctrl: sds_ctrl@c2200000 {
-			compatible = "syscon";
+			compatible = "hisilicon,hip06-serdes-ctrl", "syscon";
 			reg = <0 0xc2200000 0x0 0x80000>;
 		};
 
diff --git a/arch/arm64/boot/dts/hisilicon/hip07.dtsi b/arch/arm64/boot/dts/hisilicon/hip07.dtsi
index d175e242ee96..b815c1fff6ea 100644
--- a/arch/arm64/boot/dts/hisilicon/hip07.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hip07.dtsi
@@ -1229,7 +1229,7 @@ dsa_subctrl: dsa_subctrl@c0000000 {
 		};
 
 		dsa_cpld: dsa_cpld@78000010 {
-			compatible = "syscon";
+			compatible = "hisilicon,hip07-dsa-cpld", "syscon";
 			reg = <0x0 0x78000010 0x0 0x100>;
 			reg-io-width = <2>;
 		};
@@ -1240,7 +1240,7 @@ pcie_subctl: pcie_subctl@a0000000 {
 		};
 
 		serdes_ctrl: sds_ctrl@c2200000 {
-			compatible = "syscon";
+			compatible = "hisilicon,hip07-serdes-ctrl", "syscon";
 			reg = <0 0xc2200000 0x0 0x80000>;
 		};
 

-- 
2.53.0


