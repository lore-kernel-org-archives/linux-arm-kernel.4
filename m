Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D843F606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 00:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1U81Kti3;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h1sJNk0y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6MbADn505QBr7VWegQW68Bv7f/hrrQJTBJ9au0Y29No=; b=1U81Kti3AMhcpo
	stOp6b725reymQ0qp4o+QFPuV67a0+m3lO3+K/TPj6u7PxPhikUTbynUw+cu5dyjZyrfdPRnVmKKU
	gK6ovWdn26c5JIg/4g/jaNWdFObbPaQm1JnlMPOS7SBM55VFK2jYyPb+aZHHkw33QPZxhEsYyEJ+O
	6SsNmQ2ieSIPGm2cAEAbT067AzWZg993WWDSkVPXSlfhqSyNa8d2LZ0YH+kfLYHwHuji1eWrBPRzD
	/ql1cRQIA6P6IEs4wl1Nagpyu539lPCib0Y01nWB35r4LaaMYGvVDzUiaBUCSl2rD5dhD/OLOxE7W
	7Auwpjt/ktH3thr3Ka1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNV6-0000000BfwL-0CEk;
	Thu, 26 Nov 2026 00:38:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNUe-0000000BfhM-27bt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 00:37:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E982F6015B
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 00:37:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C0541F000C4;
	Thu, 26 Nov 2026 00:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795653463;
	bh=6MbADn505QBr7VWegQW68Bv7f/hrrQJTBJ9au0Y29No=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=h1sJNk0y4wXdpnPmLBP4VRrkMCTqxe+PyuNu0XJNsA3gHAtFqZgmPjLGM7kZvfpRT
	 Zudpwv34wgTQMtp5JKssghDurcZ6z8MVimVk/iQGsQflnqriLsjchUq+k3MbuCGn4D
	 AuSw7/YxgAFhqZVfsiASa/QtM2jjCI0TTzdzpNmnzdBKnqaBxhKOI/Y0Fp47SCEPkf
	 L3nifwud4YOJmt9Nb4tbnX5k4fvQNsdXSTUFtvyhq2MBgMK6iHWfHaBSGlkNCTD3sY
	 0xM89BuMagjdGQoIRsKjRrTiqoQHLNg8VASB3VbLt6lLVjXEQm79reozNuT5B+d+UE
	 Af+WsN3GceaqQ==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Nov 2026 01:37:20 +0100
Subject: [PATCH 16/20] ARM: dts: nomadik: Correct the camera I2C unit
 address
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-ux500-dts-after-powerdomains-v1-16-791cd62d8870@kernel.org>
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

The camera node has reg = <0x10>. Match its node name to that address
to fix the I2C bus warning exposed by the controller node rename.
Found with W=1 CHECK_DTBS=1.

Fixes: 09e02f4d1d3b ("ARM: nomadik: add I2C devices to the device tree")
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/st/ste-nomadik-stn8815.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/ste-nomadik-stn8815.dtsi b/arch/arm/boot/dts/st/ste-nomadik-stn8815.dtsi
index f635af262d96..4eba7c943368 100644
--- a/arch/arm/boot/dts/st/ste-nomadik-stn8815.dtsi
+++ b/arch/arm/boot/dts/st/ste-nomadik-stn8815.dtsi
@@ -728,7 +728,7 @@ i2c-1 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&i2c1_default_mux>, <&i2c1_default_mode>;
 
-		camera@2d {
+		camera@10 {
 			   compatible = "st,camera";
 			   reg = <0x10>;
 		};

-- 
2.56.1


