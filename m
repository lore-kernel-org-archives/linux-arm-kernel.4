Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB7F606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 00:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Wv4lN4kf;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ceOlNlAI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RJJEKth71su8ijwD4sLTXvMtrVDCPMMgyByFqaz/oQo=; b=Wv4lN4kfD8rBDv
	gcYPZY8OpNcPDoWMXXDcEqpDzQopnLJNif8JcSBR9Mf28rl4z1yQ9hCCViIYWSaDj9aRajk8yyLcx
	/qBuhov2zkzAPrdVjRLD3qumwRus7jlIpKf9jmD6cL6lV6YG30lCf51Nr4wKDlmHVCKj825RHbNCe
	TwM2NvSo0pWZIHW9fxiJvkO6/YByW2mLl9LAUCAc+vIbSnd/uSPIuj9iuFrLJBLXUN3ITawCiK7Dx
	/Lx4UIZj5LOh1nCkFfEPDzkHLSLlmFEeWe/QWTTz8PwhXcXQEGv19pBM8KFxYFB+lIv1ZlZErzIHL
	5tZfy/g2dfS2/hr7tkmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNV3-0000000BfrU-0EFQ;
	Thu, 26 Nov 2026 00:38:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNUP-0000000BfXa-05Yv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 00:37:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7771C6015B
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 00:37:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B61411F000CA;
	Thu, 26 Nov 2026 00:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795653448;
	bh=RJJEKth71su8ijwD4sLTXvMtrVDCPMMgyByFqaz/oQo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ceOlNlAI8jWcjtj0pVBLJ8Bzek+JpTtDXZt63v+2R1xAN8ZOEssdxGrCJi05A9EO2
	 YO8kh43KPPrFMfnncFAAFXjnbEAC8Rmslasm1rGevYhlLxORzZKkASP+CbQG1nZ0uu
	 V7igDm3urcAVWLi6HPLqE+vgUi4tm8BxkjW6blwH5jK3qNMLF0oGvb5gcsdmlVvhSX
	 PaoeXMJDLQM3DaVGZx+pMRFbeYvg+mkuInWxamLVZlDz3kb5WF5NmCVKuIw5Mbzhfx
	 X97cUOSMcrcv1IfLIb2AHT5loluhb+83suglhqUpN6A6yj6gZxekJW8RsVmrnxh9vf
	 shpzaARuU69kg==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Nov 2026 01:37:13 +0100
Subject: [PATCH 09/20] ARM: dts: ux500: Remove unused IIO channel
 inheritance on Janice
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-ux500-dts-after-powerdomains-v1-9-791cd62d8870@kernel.org>
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

The current-sense-shunt provider has no child consumers that inherit
its channels. Drop io-channel-ranges, which is not part of its binding.
The proximity sensor references this provider directly. Found with
CHECK_DTBS=1.

Fixes: 78894adedd87 ("ARM: dts: ux500: Add a device tree for Janice")
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts
index 1ab09e8d8d2d..f0ccf370710f 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts
@@ -321,7 +321,6 @@ gp2a_shunt: current-sense-shunt {
 		io-channels = <&gpadc 0x07>;
 		shunt-resistor-micro-ohms = <15000000>; /* 15 ohms c:a */
 		#io-channel-cells = <0>;
-		io-channel-ranges;
 	};
 
 	/* Bit-banged I2C on GPIO196 and GPIO197 also called "TOUCHKEY_I2C" */

-- 
2.56.1


