Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65267606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 07:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TV1xoC2S;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PBHaF9A9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uFMjLNndPE2hSZg1IrxVDy7d2EmfKGeBiqo/gCRC8g8=; b=TV1xoC2SYAZci3DbnbfPeAR7jB
	fqRR8TGoED4UGNflK7EDh6NFArGB2AauyVl/XJZYsThAL7M/qB3YRskeLT98h9HHr00gGomAxrMu5
	5lPY674Ity4hvaMrpOolEPE/R/WzVBp3NLRPBp+MeSNa68BzlT2wqVonHVVBwSMmCfROM+SdJn5u0
	LqilL7cECIfEivupIX6mwNY2RalbdxD6Rusede3+Ko1HpS6/fBoa5kpMkh27ASlAW/gaYZlvaW7Rz
	DEyMe1EcSIPQU3zemeiFfo+jH5TNNCpoptytibAh2l7cFe4bRk1uzgkxHxEhR7j7wcaPPerCbUZqa
	2G/W2lOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSrJE-00000001Qqv-0eQi;
	Mon, 16 Nov 2026 07:39:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSrJD-00000001QpS-00i5;
	Mon, 16 Nov 2026 07:39:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8E33B439F8;
	Mon, 16 Nov 2026 07:39:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794814762;
	b=IEr4PcEydCMew3Z7aXmUG2qFl/0HZJRnFmQix/M4Dclxzlp2EfkcFgUOZQ9CZPzaMvEI
	 3kApeA1lyAJAkwHBkyTTGGfzRE06+oEFfJQQy23CI4t6drUFx2dPmRB7hBAZYRHEhMhmZ
	 bRKrftprclpum5ROm64uDu4XEZ7BfssTR2qczbSEQVBjmUxUrunvP8nfi6qhIenxWoaEX
	 zicDaON91BpYq/wFUOgJBkUOM8kRy3LohVddDS2e8RlqvxKeXEcNChcsqWoSNSI3LI3WR
	 gHM/vRf/YQbhQbiq6XX98q4lCuQJ3NHDXbs6QB8V+Hyd5GfdaSBxdnrDR6+aq80yW5g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794814762;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=uFMjLNndPE2hSZg1IrxVDy7d2EmfKGeBiqo/gCRC8g8=;
	b=woyXANDGhV+KfCxs37cmreR34ItkwdHifwMAzCfVarKhARy4+s7uPwYgd+mrWTiNNUc1
	 4L9QWkfPw5yArgOsRp+VLrrHexcSmQVkppN+PflHc8nE+9boHKuOJ9NdBkaRfMgsxide2
	 foNARF/eCCX+9TBk+Y6JDewWhqVleHxy751ivTwG/5KKroU8YcrCAjTIcgzcdsj1gqzuk
	 YTxW2uoEEDI2Q+P44WlGoKyskE3N9coE0effLZFNzVZaaIZyMyYI4jOogZxwQiTeaPdmS
	 KYaHP9dhFlCyhA4l8HRig5Jd4pC3KSfQOTqKrwEcbB5gm73jwRvfxnDUHIDO6upoXlg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4ADD41F000C4;
	Mon, 16 Nov 2026 07:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794814762;
	bh=uFMjLNndPE2hSZg1IrxVDy7d2EmfKGeBiqo/gCRC8g8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=PBHaF9A9H85RU9qqhVTMNUsYnrhkMoaO1zU8bc33o8yIhNKWfJjENP2eVhLmWUDWH
	 /JgIxq8Xb4Ilh26T5Lrv900XC37SA1NZ2GH46Dt4+kSJEq5lIjkqA/MV4PixqznznN
	 ZxqdZsGvvdfuUuZr3kQTynMnCuaIJOWs0sxXqWXsjxJgSTi1QF6NWq9yIjQKQuvgeo
	 TyfhAdP2bwLjQl7gM9zAxcmz6rRIFS1oeWc16aO1fcdU8F7JXN5vQ4zqjwU6EHOV07
	 GPbqWbf2zB550plpyzt1C39oiQsno4Ze6G/oO2/7WilKbgkLY51SLxjSacJfq2eMeR
	 wNoSBgEBq173w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id BD8064A371;
	Mon, 16 Nov 2026 07:39:20 +0000 (UTC)
From: Cunhao Lu via B4 Relay <devnull+1579567540.qq.com@kernel.org>
Date: Mon, 16 Nov 2026 15:39:14 +0800
Subject: [PATCH net-next v3 1/2] dt-bindings: net: rockchip-dwmac: Add
 RK3572
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261116-add-board-ok3572-c-net-v3-1-a957fdcd9c7a@qq.com>
References: <20261116-add-board-ok3572-c-net-v3-0-a957fdcd9c7a@qq.com>
In-Reply-To: <20261116-add-board-ok3572-c-net-v3-0-a957fdcd9c7a@qq.com>
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
 linux-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794814757; l=2920;
 i=1579567540@qq.com; s=20261015; h=from:subject:message-id;
 bh=9X/mZiSA5jyMtUsqAtAfx0rl2X8abEMLp5i4XTgwPa0=;
 b=wH5xOzdBZxT/5VRr5XLL3M3qt9J56QsDvaqyh9NkKpCorcn2oXeNTo7FY69mSA6mGJ6W1Plou
 X3ZO2gwTakMDnpSNTYe6B2nubHZYEy2F6SF+vcls2FpeUZ2KR7fbkBv
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



