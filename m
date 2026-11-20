Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E0A606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 07:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0l3jqPXX;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KddBGkPR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6PV0I3fyfn8zBfMmYUBIzSZOXpy2iut4tvAaW/Eyfo4=; b=0l3jqPXXsjCPliFYEnUUVW8w9G
	baM81FCjwNtXOmFQA/uMFkvGbk9WfXuetjd12vwxmrOCCX9OzOyQIannUV+QZ0dyN8ALqpmGPW0J6
	/O2EOoKASPlfQLhyJytNxqiI6XKaFgK51mU/PzmJfVeXgEmxFDi2IXi6HVMGkLGE65r9Fvwx3O8Bb
	tm0TuLZ0MeO2pAlSdTQoo0Wbxx9fVxgTvfssXyf5n8F4i8fsexlrvv1/fjIrbvDBRu/bo4z39ljtt
	DhVBA+ag+zhqKcyqmBmyoRYvrOsOVxMnlhBnH9sTXoK0NU8kTFC+Pq43n5ogOs/S5p9/fEDM06wNy
	vkhZnDbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUIxF-0000000EDjc-2l7d;
	Fri, 20 Nov 2026 07:22:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUIwq-0000000EDel-0PVf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 07:22:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8295A46710;
	Fri, 20 Nov 2026 07:22:15 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795159335;
	b=3iOeObrae4QCEXCeupgh/QdJh+1MzlB6MXmVqG05wn2wYMTEB4h0FMkJLtAl1svMFalK
	 aETYIlLU/4rdehxXoSJJBUhjA1r9+okEURmweH+grGErFAhNcjQEbJqOikZHbTbe7gC/S
	 ZW7EOVDEHS3lpiGmUJH4Z4ND3rcnKRdws/5Qdy/UmcBpfktA1ug9bmpfa0G5LkuC3YqJy
	 9L29BW71NWUhe2m0o0ySOdxywPS43aOD5OBNbnUXKvSEG9nvHgYa6IEnclzvf32kDaKI/
	 Ap6Z0QYeqV8qZqfSlvnhnJvJLxx21trrM4lFeqIdSBGi8/JaiDIKgdREMVJyF4dmKvg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795159335;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=6PV0I3fyfn8zBfMmYUBIzSZOXpy2iut4tvAaW/Eyfo4=;
	b=V6s4PwZ6qj7VWnWLhkI+zEj8O8z6ssckMFjoFUFkeyUQKflxQuxBmDJf+6FhvQ5xDf8F
	 engFYUIQ7Asb2fjo5n2vsK/Smhwzd/LBC5hDpsRzT8zmQBSmINiEk0PAJm6BhlQKwJTQ8
	 vsoLc5EXuiOho5XzFHWCsu6nZnFJXysOS7NJbwBqA5jhZILBYGj75qNNFnvGfG3ZMSm8R
	 fV1+0c20YQSMNEREh7yEeOrACbQIthGdcUFjuhWA3U8ov1nNdvpo1wUYZb2omZb5BtUbb
	 CVAJ7FsOHTOYWaUtNJdS1pdOjxSTzy79avZvUaZ7LRNwjNTZJ+0sbeJ11SK1x03PRrQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 53DA31F000CF;
	Fri, 20 Nov 2026 07:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795159335;
	bh=6PV0I3fyfn8zBfMmYUBIzSZOXpy2iut4tvAaW/Eyfo4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=KddBGkPRtLiRVpVibud/8Iq5qIK0ridPFQO4uyysEJh/jxwo8nORV+0IImg3iV160
	 X3QbjI+Dw9RHM3SyZrv3K726NZ4baUoh1IO96XStkbqprgPn91Ha7qyQq14Ug8fNBL
	 fbQ/Gh6PnhNKjtjLm4+zcsf2O1WWYJJTJjuCxZbBKsc/3Bn7kNXCHKUiwle4EVgGRA
	 nPzPh1bb7visPTG7SPevrnjosmA2MJ6qRzrk38GRkSzDqoRHl6eaglq7w75SsKds4L
	 XVcV/RBxeah81p3lhx1qZKSZihPxUOurtufbMLpn2FQU0UOKQdm/7Ysr/A4Bb4gbw2
	 CKhW49QYSbgPw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D572A4975C;
	Fri, 20 Nov 2026 07:22:13 +0000 (UTC)
From: Rajan Yadav via B4 Relay <devnull+rajanyadav0307.gmail.com@kernel.org>
Date: Fri, 20 Nov 2026 01:22:14 -0600
Subject: [PATCH 2/4] dt-bindings: arm: sunxi: Add KickPi K5C
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261120-k5c-dt-v1-v1-2-d9681df67bc0@gmail.com>
References: <20261120-k5c-dt-v1-v1-0-d9681df67bc0@gmail.com>
In-Reply-To: <20261120-k5c-dt-v1-v1-0-d9681df67bc0@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Andre Przywara <andre.przywara@arm.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Rajan Yadav <rajanyadav0307@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795159332; l=1161;
 i=rajanyadav0307@gmail.com; s=20261103; h=from:subject:message-id;
 bh=I6vTUiLrsSlHBFAWdmnCYgV4zJVZLtmnTrmixiYpI3k=;
 b=ivPANXo15cQvw/pll2FSLMB+F0n4tBG0M/5PnBd34+VGKE4ZuaF0S5IqXfE3QqBq2Calcjhe5
 eZ93q4HzeKqAz9m66TJSwX3+ay9dM9EDtKE7xdq6G50kPZxVbAVnmQK
X-Developer-Key: i=rajanyadav0307@gmail.com; a=ed25519;
 pk=4ZPeiP5qrv2b44q/Obxi2koUS70Q6npbttJnpUoTlgg=
X-Endpoint-Received: by B4 Relay for rajanyadav0307@gmail.com/20261103 with
 auth_id=1391
X-Original-From: Rajan Yadav <rajanyadav0307@gmail.com>
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
Reply-To: rajanyadav0307@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Rajan Yadav <rajanyadav0307@gmail.com>

The KickPi K5C is a single board computer with an Allwinner A133 SoC,
2 GB of DDR3 DRAM, eMMC, an SD card slot, Gigabit Ethernet, a Wi-Fi/BT
module, USB host ports and a USB-C OTG port.

Add its compatible. Like the Teclast P80, it names the SoC as
allwinner,sun50i-a133.

Claude Code (Anthropic) drafted this change and its message; I
reviewed it and checked it with dt_binding_check.

Signed-off-by: Rajan Yadav <rajanyadav0307@gmail.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 7da84e2de74..b21205f327f 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -405,6 +405,11 @@ properties:
           - const: jesurun,q5
           - const: allwinner,sun4i-a10
 
+      - description: KickPi K5C
+        items:
+          - const: kickpi,k5c
+          - const: allwinner,sun50i-a133
+
       - description: Lamobo R1
         items:
           - const: lamobo,lamobo-r1

-- 
2.34.1



