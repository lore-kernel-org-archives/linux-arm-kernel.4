Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F309606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 00:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yRpbngUl;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D4UKR7bk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=iQcrj1Z2D+KwDkNPYJVOt1V3xyTIYQC8SvlCMLqwpNY=; b=yRpbngUlhvfPrs
	PKWLqVzhcY5luLTvpBSTkt+HQkc/qvCKCKdSMzJkWurMojYlfz5IQ3xrUqPgfQ9ssSE/QXkZ7mNSs
	Bg4kFwQ2gSANh8r4HOaicyb4QFl0Sa/MwbA0rFs3R3CZLtUBsYiMI2eXJkD0QB+otrIvsXVRbhGtZ
	4DuWwL6qPnC97QbsfBprmS3xv6vOko7gBvW+Hew+3U8r7wS8fVPsRVxo2Bj9pZ5yizoEEa0WDAzvi
	1IQlUSqen/LeFzyROsH87WAApwjsZIguXShZex/tOAFIaENY0pBy7xzRXT1ekUwz5y6BIG15fvAq3
	1OjsPOtQUJX0Sbby4Ovg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNUI-0000000BfSR-2A1c;
	Thu, 26 Nov 2026 00:37:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNU9-0000000BfQp-2pmJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 00:37:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E39186015B
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 00:37:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08D861F000CA;
	Thu, 26 Nov 2026 00:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795653432;
	bh=iQcrj1Z2D+KwDkNPYJVOt1V3xyTIYQC8SvlCMLqwpNY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=D4UKR7bkFGHa7kEy45fz4yvZkdvxllWbdC74JjxPanQ1ARsdWYNmIvzTi5ZIIGT+Z
	 zWL1/u9yJTcUftztIhgZnmrq7gxprv+FJiRA7N8viMbQhiscPqTh5PaP/i1iGkadNA
	 CU2DT5tZ2nL0JVXp3ouS4+w8GvicpZ94hP3wPsxLl913M12++QQi3u7gY9DGl0Au/U
	 NaIa1m87MXm2lEIrK8Fqb5YDIJBB20cs9Tulo8g2wPQ7VmMNUYNRoen7IT0ULbV1II
	 gOwkzWmOuH+PzzKUy8UjplSR+4xyNrFOaGb4tgdZbHX9XPe3G3QJTv/pH6WzIuDNcn
	 IT/yskqw+3T+A==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Nov 2026 01:37:05 +0100
Subject: [PATCH 01/20] ARM: dts: ux500: Give memory nodes their unit
 address
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-ux500-dts-after-powerdomains-v1-1-791cd62d8870@kernel.org>
References: <20261126-ux500-dts-after-powerdomains-v1-0-791cd62d8870@kernel.org>
In-Reply-To: <20261126-ux500-dts-after-powerdomains-v1-0-791cd62d8870@kernel.org>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.16.0
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

The root-node schema rejects memory nodes without a unit address.
Name the memory banks after their first address, zero, on the HREF,
Snowball and Nomadik boards. Found with CHECK_DTBS=1.

Fixes: d1b8bfa342ca ("ARM: ux500: Create a DTS hierarchy for ST-Ericsson's HREF boards")
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/st/ste-href.dtsi            | 2 +-
 arch/arm/boot/dts/st/ste-nomadik-stn8815.dtsi | 2 +-
 arch/arm/boot/dts/st/ste-snowball.dts         | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/st/ste-href.dtsi b/arch/arm/boot/dts/st/ste-href.dtsi
index 3150e1d2f656..a85b2c352c69 100644
--- a/arch/arm/boot/dts/st/ste-href.dtsi
+++ b/arch/arm/boot/dts/st/ste-href.dtsi
@@ -8,7 +8,7 @@
 #include "ste-href-family-pinctrl.dtsi"
 
 / {
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x20000000>;
 	};
diff --git a/arch/arm/boot/dts/st/ste-nomadik-stn8815.dtsi b/arch/arm/boot/dts/st/ste-nomadik-stn8815.dtsi
index 4d37c5fb553c..b90c15352c13 100644
--- a/arch/arm/boot/dts/st/ste-nomadik-stn8815.dtsi
+++ b/arch/arm/boot/dts/st/ste-nomadik-stn8815.dtsi
@@ -9,7 +9,7 @@ / {
 	#address-cells = <1>;
 	#size-cells = <1>;
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x04000000>,
 		    <0x08000000 0x04000000>;
diff --git a/arch/arm/boot/dts/st/ste-snowball.dts b/arch/arm/boot/dts/st/ste-snowball.dts
index 1607bfbd9f56..3b629dd7f798 100644
--- a/arch/arm/boot/dts/st/ste-snowball.dts
+++ b/arch/arm/boot/dts/st/ste-snowball.dts
@@ -12,7 +12,7 @@ / {
 	model = "Calao Systems Snowball platform with device tree";
 	compatible = "calaosystems,snowball-a9500", "st-ericsson,u9500";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x20000000>;
 	};

-- 
2.56.1


