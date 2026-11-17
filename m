Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21AC9606A338
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 09:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zJ6s1zBX;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AMBDjDnm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/KOAVv6apLichQ/OSMK32xkM/AZHKlMXP5BUywmr1vA=; b=zJ6s1zBXuog3EMj/H9qWVzUODM
	2lQKdjSBRevsOGNNrJSPJeRQ+QiZ3c00Tv349SG/sQkogUvaxcBP8A9v17E1dgq3JzljrhmjNLuzZ
	YuBVnAqx4x3EwySJewAfrqfCm8UKnD7M1G4nC5qidC5y4/29diCHusDTnW20T4xB2KBR5L91/iuc5
	+OlK1oifASrjM/Fqsvc1jo5Br2pfdRSGkF8vb8Z6fWoWZzXAfMRsP+korVp24faJ5D2Tt0LafUNhH
	Z5l88g5hpZUlYh3EvbmH6sENB8DNGbCj5Zz7x620ZtOd/yHTX+VcX5i6HlqJUEdc4T9+lMk+gw0Pz
	yVnr/NSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTF7P-000000050fy-3kKt;
	Tue, 17 Nov 2026 09:04:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTF7O-000000050fE-2EoZ;
	Tue, 17 Nov 2026 09:04:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C177B4496A;
	Tue, 17 Nov 2026 09:04:45 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794906285;
	b=K5aG3FPo4svlZZxwC3BHNUorlQ/CdodVEFGQMUdxy3h9R3I32DhSC2OiqpjaEdzq5Prz
	 AOejLnA2seTqF2n0xnWwyNhlR9PGADGxMSlVfo1GSo9mNb71Em95XCUSqi3iW9ApeKKG6
	 lm2HW02mRhYilFroIViwKui0JktB9fI1ZhejL4bFgnfKS8JeVCYWPzUjtI0Vzt+ROm1Tf
	 cHWKece80qWVxyGFQpygtId+xGEaxfBHptZ1TJWt2uPWPDBLVkvSj2dB1faxwCEOmlcdm
	 haqQKUkpPBHIx6gAQcnw3rFt5Po/Mkr1axi9Z8C2VqTJv5stlBn1PbfqLICZLVfcIVQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794906285;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=/KOAVv6apLichQ/OSMK32xkM/AZHKlMXP5BUywmr1vA=;
	b=NsNYaV6vSHvrkA7KL47EkwgPRppy8jHHyTaz/9pPtWxkpVs6Q4TrpUrvd3MHU6nmB+8u
	 zuLTd7xN54TXnPPo5iDql/T79q+XTcp3q7ov4GPJ0JeKj++fhVShoUS6h0SWn1s05zKEH
	 QZ51J11BjlrPTVeyZqWFLlmvGR7OQQCySqak1vSbJ/pe7OG2Q/RXnaNCID1MJdt1+V5/C
	 QhsilGgJgdlqIXTm29Q8sjYLKf6VEfKk+xymx5HxwvBszS5/qmI0mEIo+rUJ+0wa1b6Ra
	 QJD2yT4nL8b2g7NGBrAvIk0s6+q3ehZ9gQTMnhsGJhojxvCVmCDzaGOfR4i4/JLZK3g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DF77C1F000C5;
	Tue, 17 Nov 2026 09:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794906285;
	bh=/KOAVv6apLichQ/OSMK32xkM/AZHKlMXP5BUywmr1vA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=AMBDjDnmGFoKp+zjMyV1W6EV12YThZjexefuc2+ebAbaZSkLG0CTZGgvLDB0xpRp4
	 XeBEq3toa9Tp/Jhdma7AkX/gPNXDxWzbyUM3sRQ32bhtuBOlAg2dMz0vx5iuCswYRw
	 lM5OgKr6NcUMfCt5lYss3qy+VL1hZRcLYIfE01Crn6+ldEYf5ghhYZaTBC0tX7trA4
	 InlOu1Nhc2ywucRgLt8yCXv888XtLQU08QWuN+BnemQ3ObR/e1HIHQf4y5n976i2Pj
	 C2LNnu73j5wnQtiVZjwb6wzjwiQctA4LOPQTLeJSIEHA6iNJnNo9gvWmRR7zLT1oNd
	 Y0x7LtEn7er7w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6F6DF4A75E;
	Tue, 17 Nov 2026 09:04:44 +0000 (UTC)
From: Cunhao Lu via B4 Relay <devnull+1579567540.qq.com@kernel.org>
Date: Tue, 17 Nov 2026 17:04:35 +0800
Subject: [PATCH net-next v4 1/2] dt-bindings: net: rockchip-dwmac: Add
 RK3572
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261117-add-board-ok3572-c-net-v4-1-4e9da569395a@qq.com>
References: <20261117-add-board-ok3572-c-net-v4-0-4e9da569395a@qq.com>
In-Reply-To: <20261117-add-board-ok3572-c-net-v4-0-4e9da569395a@qq.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 David Wu <david.wu@rock-chips.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Cunhao Lu <1579567540@qq.com>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew@lunn.ch>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794906282; l=2963;
 i=1579567540@qq.com; s=20261015; h=from:subject:message-id;
 bh=nFnIN3lO+XTZBGs+5YkcYP0f6N9wWK6y8Seywzr6SIY=;
 b=9SYat9LnbqGPUNHGpDhwc31lg+NnzZ77J6S1DEukr/EOu1//Vw0YmjkuSvvCcmc8QipZbYxnI
 nPcSmU3Ut6dB42rJvdSt77yYeE3veNyUVKM/ntNNFBiimWPApyTMexl
X-Developer-Key: i=1579567540@qq.com; a=ed25519;
 pk=sUTWrzlIwT4C7ctjNfVZAzzg0G7QUn2XxRGpYsw4RtM=
X-Endpoint-Received: by B4 Relay for 1579567540@qq.com/20261015 with
 auth_id=1177
X-Original-From: Cunhao Lu <1579567540@qq.com>
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
Reply-To: 1579567540@qq.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Cunhao Lu <1579567540@qq.com>

Add the rockchip,rk3572-gmac compatible with the snps,dwmac-4.20a
fallback and require rockchip,php-grf.

Mark tx_delay and rx_delay as deprecated and disallow them for RK3572
so new designs do not use the legacy delay properties.

Signed-off-by: Cunhao Lu <1579567540@qq.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
Changes in v3:
- Deprecate tx_delay and rx_delay and disallow them for RK3572.

Changes in v2:
- Add RK3572 to the shared Synopsys compatible list for consistency.
---
 Documentation/devicetree/bindings/net/rockchip-dwmac.yaml | 15 +++++++++++++++
 Documentation/devicetree/bindings/net/snps,dwmac.yaml     |  1 +
 2 files changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
index e8dda1961ab3..d7b7bb008235 100644
--- a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
@@ -27,6 +27,7 @@ select:
           - rockchip,rk3506-gmac
           - rockchip,rk3528-gmac
           - rockchip,rk3568-gmac
+          - rockchip,rk3572-gmac
           - rockchip,rk3576-gmac
           - rockchip,rk3588-gmac
           - rockchip,rv1108-gmac
@@ -54,6 +55,7 @@ properties:
               - rockchip,rk3506-gmac
               - rockchip,rk3528-gmac
               - rockchip,rk3568-gmac
+              - rockchip,rk3572-gmac
               - rockchip,rk3576-gmac
               - rockchip,rk3588-gmac
               - rockchip,rv1126-gmac
@@ -112,6 +114,7 @@ properties:
     minimum: 0
     maximum: 0x7F
     default: 0x30
+    deprecated: true
 
   rx_delay:
     description: Delay value for RXD timing.
@@ -119,6 +122,7 @@ properties:
     minimum: 0
     maximum: 0x7F
     default: 0x10
+    deprecated: true
 
   pcs-handle:
     description:
@@ -141,11 +145,22 @@ required:
 allOf:
   - $ref: snps,dwmac.yaml#
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3572-gmac
+    then:
+      properties:
+        rx_delay: false
+        tx_delay: false
+
   - if:
       properties:
         compatible:
           contains:
             enum:
+              - rockchip,rk3572-gmac
               - rockchip,rk3576-gmac
               - rockchip,rk3588-gmac
     then:
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 2c4842404bf6..80d3b43e2889 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -94,6 +94,7 @@ properties:
         - rockchip,rk3506-gmac
         - rockchip,rk3528-gmac
         - rockchip,rk3568-gmac
+        - rockchip,rk3572-gmac
         - rockchip,rk3576-gmac
         - rockchip,rk3588-gmac
         - rockchip,rv1108-gmac

-- 
2.34.1



