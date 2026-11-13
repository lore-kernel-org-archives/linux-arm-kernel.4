Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC324606A8AF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 16:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mTim6d+P;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cPzVMMHC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ElhyKJTPLC9sa0kKw8UjgPt6BJk/sHWMBZUKNWMIGmY=; b=mTim6d+PdqH96nVUg0sNnGyHlQ
	SMZ7bshpHrSha3wed1QRmOjRMtq6Up0XFRL4/UjvpkfGE0OhTEH4i/CCEvaUBx/WUf+vVy9vj6rdY
	0ry5gQNWw5jEj6ShK/VNA32ikGr2IjOFTVOEP2/+hFVo6hMDNwTKYY8Ai93aZqE6AYjXN8nTAvHVk
	exdCrWLg52+EsXqF0xyYMhFV9AJVfb7Nc7rAvDPi9+239fjn/g9lpUtbB38PUM3CJzhRxfEPemv8U
	b06bF6uM6HywPG4cloOFCPhjC/X74Ts1y8160AYIjTCSvMhiUCOtExELJvCfqh0uClsZY5F8Upt4a
	lS8yiFtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRuIu-0000000DZMZ-1u5D;
	Fri, 13 Nov 2026 16:39:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRuId-0000000DZA5-1NtY;
	Fri, 13 Nov 2026 16:38:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D0425467B3;
	Fri, 13 Nov 2026 16:38:50 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794587930;
	b=eCYk3kRts2hW0rqi5yY2hpCbcLTG5nvM096uMPAI9Ci3XgC0haaMYQ5eMK5R3Hi5xrX1
	 TnZA5uXxjrYC6v73dBryKGovSCAkj2QdVLOaLAZrAMTk77SIE9yF0YuUNz9kXT5m/czW9
	 +O7t2CWodgxLGBVxp2g8DGmvtrJY+pWFNu8iXAPiAGLZ0D86R0AqG1M9LJqZVm7GpvtKD
	 r0xxcR5FztZO3zZUOACcQXckCV8X0sm2exwCmLXpMaN8yX0yTxj6WHPbKdppJ+mntO7xW
	 ZEvOo1gQ7pVNbYghM7C6dCn5qsa7TvSaLWmuOvmkiqhQhszGl2mPLJ0SqtAzSh8EXcg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794587930;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ElhyKJTPLC9sa0kKw8UjgPt6BJk/sHWMBZUKNWMIGmY=;
	b=u2vsrZeiTDfp4MBXxadgC9c6swTVf559ctO5UmpH6cepz/XxNKnnFP3kc6yYADt8hh7J
	 KN/gWe3KBvrFvQGRUVr4FPoqzbWyiTgDKSiV5Pn2Bi7BFCdwmykYzqa/KJMvQ/UcFFCu0
	 qK3g9Gr7j03WFE32gRgZX5wP25Q5M7nvgThCkmKmwf9reTYoZZiNWPGo8vJvZVWjq52z6
	 SKJ8mxSXCpqT3EbRBPXm6FJ2O7otGXJ7M6pJJW6qpUgyXzvDh2gf8NellZ4S9tQcNb8lV
	 JvCoeb3WEM25kNm1myaRhnFFbsuWlRJNjTkbqMkgHr24ewHxcOR0mkQMXfhydK9as8A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0D29F1F000C7;
	Fri, 13 Nov 2026 16:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794587930;
	bh=ElhyKJTPLC9sa0kKw8UjgPt6BJk/sHWMBZUKNWMIGmY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=cPzVMMHCyn+OFwhkw9aBWgxP3MJW3ucNQ66BKerP0uCRbp17X5SsigzIRb7P+o12E
	 0VfqfHb0et6Hy0XooG3qhN93pMse1dOxerVVBO4ObkRl31Oy5aYuTnw1dZyOeneYo/
	 Qe3/g1jTwEk+HPyDOGvyL43r8CmTbUiUplVI/goHU5uI8A5qBccbq+p12V0MRsPkE1
	 iWfjhONG45Uy6mDOfYkDaHagFH/p3YR/bCjwMVfplATrahGzzcJE3ENojwQMjsxPJh
	 O6rjTOI/4L2tPBW7o65813zDf+wAjBJEfYT0SQIY0tEHSkjXTTlDVVlvjUsUeW6gWJ
	 rt3r4wu9LB9hg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8CD6A4999A;
	Fri, 13 Nov 2026 16:38:48 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Fri, 13 Nov 2026 16:38:49 +0000
Subject: [PATCH 3/9] dt-bindings: soc: rockchip: grf: Allow a clock for the
 RK3588 PHP GRF
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261113-mmu600-php-v1-3-231196049a3b@gmail.com>
References: <20261113-mmu600-php-v1-0-231196049a3b@gmail.com>
In-Reply-To: <20261113-mmu600-php-v1-0-231196049a3b@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 David Wu <david.wu@rock-chips.com>, Damien Le Moal <dlemoal@kernel.org>, 
 Niklas Cassel <cassel@kernel.org>, Serge Semin <fancer.lancer@gmail.com>, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, 
 Pranjal Shrivastava <praan@google.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev, 
 Shawn Lin <shawn.lin@rock-chips.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794587927; l=998;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=B5gD6Ma73MQyMzaxyEvJStUcX9v8sHv/gtVo98dAf/c=;
 b=YT0aXhYrbKWY8wlrkZK/hEcyepwr4yg+gW6WEGC5ZSfHukSI3V4Bwa9sgPmHU73BoKkP5Tvm5
 /1hLXK4TftNA5gYYm+6NtnDIiiU7hbtYOagZcGdymdVu2rJRlg28B67
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
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
Reply-To: aiyengar1990@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Arun Iyengar <aiyengar1990@gmail.com>

The RK3588 PHP GRF is clocked from pclk_php_root, which is gated when
no PHP peripheral holds it. Allow the clock, so the syscon regmap
enables it.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
index e94c83d7c138..2525eb51f13b 100644
--- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
+++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
@@ -321,8 +321,16 @@ allOf:
         - clocks
 
     else:
-      properties:
-        clocks: false
+      if:
+        not:
+          properties:
+            compatible:
+              contains:
+                const: rockchip,rk3588-php-grf
+
+      then:
+        properties:
+          clocks: false
 
 examples:
   - |

-- 
2.55.0



