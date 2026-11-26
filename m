Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAD7606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 00:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZelCNON+;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GO76wfnB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uCqQ+e2A1NSqg+Cb3ruSWJSajTRoedCcfCDAuv5jYok=; b=ZelCNON+NAvI+6
	AYoAUEj7I9u/pxXrGVwP9OA4tgUtTQrBhn2fPu+Rg62xXpeBWm7Zv28VPxhZKY66ULxqNIxaZl/qr
	AvzZBarIpgin9Cu2iy5brXUNee6RK8riLIZV1GXX9PBaFu30upk64vrVpSKCAg+16/wUMnsotep7G
	XCHqCik4Z8i+B7guWZcSQ+kVDKwN3AoekFUx27WcKYvkn4IcFX2IppDk9Fc1IHRuW4pZ41cCRXnMV
	7XBfmACFGI7taXOrIovKdIoNvN1cKGVJ3LQ0kS48vSd2VVhkU3ccWs3wNy1NHPGvC9v1duJXY0Lus
	obSvMIUeeAH3QmsWuS8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNUI-0000000BfTQ-48DZ;
	Thu, 26 Nov 2026 00:37:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNUH-0000000BfSD-00Lv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 00:37:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B6992438ED
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 00:37:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 607F51F000D4;
	Thu, 26 Nov 2026 00:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795653440;
	bh=uCqQ+e2A1NSqg+Cb3ruSWJSajTRoedCcfCDAuv5jYok=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=GO76wfnBp4lwY1+jwCImQidvNjsXOE8td0gn6QqOYfL15AcvAT/ywR7VJE/nduV15
	 GpaPqnbLa0G5J0m/9MJ23Kv9Eovg5qJMaYyaEdySObNTc3qzUINEhuA+M6RcI1d5Ek
	 qLG6lvYaG9Ph3nj69HlGPeOYiqO91bqGEqHxkiDNP3rCveEvMtffJf9pGZ+eEnTIM4
	 5408sDnOsnCt+GKnGbOqhRyJ8BVNRD/GkvgJjSULNPNa6Udb84d6wpVJSg4yURYwwC
	 QTQ9NNyIv80Sembonnb0FT7M1hgqzy/CPt2xAI3lZlLJctUO3MN2MlkgOEHiQcG//e
	 xAPLzf8mhcPSA==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Nov 2026 01:37:09 +0100
Subject: [PATCH 05/20] ARM: dts: ux500: Use the standard battery chemistry
 property
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-ux500-dts-after-powerdomains-v1-5-791cd62d8870@kernel.org>
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

The simple-battery binding uses device-chemistry. Replace the unused
battery-type property so the power supply core can read the chemistry.
Found with CHECK_DTBS=1.

Fixes: be3a60a94390 ("ARM: dts: ux500: Switch battery nodes to standard")
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/st/ste-href.dtsi    | 2 +-
 arch/arm/boot/dts/st/ste-snowball.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/st/ste-href.dtsi b/arch/arm/boot/dts/st/ste-href.dtsi
index a85b2c352c69..459f82134d03 100644
--- a/arch/arm/boot/dts/st/ste-href.dtsi
+++ b/arch/arm/boot/dts/st/ste-href.dtsi
@@ -15,7 +15,7 @@ memory@0 {
 
 	battery: battery {
 		compatible = "simple-battery";
-		battery-type = "lithium-ion-polymer";
+		device-chemistry = "lithium-ion-polymer";
 	};
 
 	thermal-zones {
diff --git a/arch/arm/boot/dts/st/ste-snowball.dts b/arch/arm/boot/dts/st/ste-snowball.dts
index 3b629dd7f798..2e2f787871ed 100644
--- a/arch/arm/boot/dts/st/ste-snowball.dts
+++ b/arch/arm/boot/dts/st/ste-snowball.dts
@@ -19,7 +19,7 @@ memory@0 {
 
 	battery: battery {
 		compatible = "simple-battery";
-		battery-type = "lithium-ion-polymer";
+		device-chemistry = "lithium-ion-polymer";
 	};
 
 	thermal-zones {

-- 
2.56.1


