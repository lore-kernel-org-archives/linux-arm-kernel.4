Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A830606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 03:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LjQ7gDhm;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ys13Dghj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zO0YA7WUWXAZgmomCawg3kayi310uedvbvLHcZGxBZA=; b=LjQ7gDhmfP1TopaUrKAQZtt7Io
	RhUjVuDjfpTildUQkpz+RjR62obD2bHxT7WEKVP2E4sojWDB4ly8eNy9cw57VfjnmL+nqH3NAw5hy
	CKXWSOxZheJ+gbyvTfwxc3cU+A9pR6Q9ncL/1MPQ6zfI28MMGV+tnyOFZL9MwOeguQU1Rm8gVvkUO
	2evaVQukruWfvYF+Ne12Bzl//f+qOq9twZCY7DG9lL1t+dcalj4r6JgxfaXioJDYmFtGmavEjp80A
	30LDK/eBbvNG4mrHcXYV3cgcdOVKhNa0S8A4QCTAuyIlWYlPivrCPrUAN9iZlwnI/gxUjv3cBg3Qi
	DhAuBJJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVKPF-00000002AfX-3vOE;
	Mon, 23 Nov 2026 03:07:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVKPA-00000002AcZ-0ZZJ;
	Mon, 23 Nov 2026 03:07:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DE7E844D50;
	Mon, 23 Nov 2026 03:07:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795403263;
	b=aOvKemtA4bQ7wgC1mKkyxyYG6STU5J4Vn/edEO6DqM+oAgWU5pjjcmYhPcrOerX1s1f6
	 tX5RV3Ia8RyATENHd7LsCvhvbHaSygjYUXTAowfCACVpWXDwke1VkpkdltKF5cBoredMW
	 pQeSaIRWwwSQlCoGqa0fOkLp1m/LwfXuFZCOY5vu+KSycN1IiD1Ees2XpnReQcVh1uS/Z
	 L7Mlp1ZP5qcAKPgo8YWn/l3zUF+3yht3QIQPok16uOCrGbqlp6fZmngvFcp81TCjKaooa
	 IlqZyGbyYuiHymxAcuffW7qrNqMcHuek+TGdCIQRsDvYOTFfdmCpqERtdF0zFA9Tpzw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795403263;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=zO0YA7WUWXAZgmomCawg3kayi310uedvbvLHcZGxBZA=;
	b=qqZ2t4rRklX8mQre71wrC8wdLizlqYyWfERcV6a+2r+/UlOt03gXFfbyinejj5St0v1Y
	 XGGfzlSAevfXUbyFWLPeQTx94uZ988Bq5vLzQBtx21/Hohy7LegrmoQuWB9CGSy71nf7H
	 4o+ot8Sup9vQoLxA0j/VKVFJeqe4LSORXIAKQPqzk+TOg3SS+fXh4ZQHa5EW51l/s5EmU
	 3TWZMtSJIQ+j5DbPwjAONuY8zz4kmBcsQpQrMqK+B0YU0lG1u45vt571NcDcc9Nk4Sk3y
	 dfjF1xqR5t4M3KJHT0lEMwgsixDb8S0vEr1JY8OKI6k5hHxnnxcbBi6P9KCrV2X9B6g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9EB3A1F0093C;
	Mon, 23 Nov 2026 03:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795403263;
	bh=zO0YA7WUWXAZgmomCawg3kayi310uedvbvLHcZGxBZA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Ys13DghjVDfT7oefNqnMl/pZIjS1ZK/qyhoxaO0DLuM6r08bkh8nlXAgdgTueqH5U
	 EcIxvVXgM1mUtBg9MmWnJNCMxORDPWDzBOjDvNjVcABJNFR/DIqlAtDOWuerNv9mO+
	 HxXeAiZLBI0Q2B62601jlNvw1b8Iy9Gn8d6YefmMkkULy4EKh2hSy+CEBkQ2X96bfw
	 JB6+vWT4l4J3KDD0dqsngS1g3uUZdXKNYXnJlNGMyJxk9cC1VkHyjeoBsroKhi1zA3
	 iqrTUuoOOqE/qEZRePDhhumDysK4sTMkM95sqRBlBC60kOvTNxZtO1RFLxBz8ziwph
	 p1SO9roNL9cWg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2C0F94C308;
	Mon, 23 Nov 2026 03:07:33 +0000 (UTC)
From: Cunhao Lu via B4 Relay <devnull+1579567540.qq.com@kernel.org>
Date: Mon, 23 Nov 2026 11:07:27 +0800
Subject: [PATCH net-next v5 1/2] dt-bindings: net: rockchip-dwmac: Add
 RK3572
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261123-add-board-ok3572-c-net-v5-1-8ec9012b578f@qq.com>
References: <20261123-add-board-ok3572-c-net-v5-0-8ec9012b578f@qq.com>
In-Reply-To: <20261123-add-board-ok3572-c-net-v5-0-8ec9012b578f@qq.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795403251; l=3013;
 i=1579567540@qq.com; s=20261015; h=from:subject:message-id;
 bh=iKMYPtTxUePu3pZnxvEMniYbCZ7tgRVNF5E2Fo/FU0U=;
 b=URxNSNcO4SUxUR7SwO2KSiPd4fPNS/TjxH+XIn9+KS6NAatVP/BUjiUIBzw06w656ykHdRuaF
 0gZybEww8Y+CTIciWZMvyDFORMJR0/1flFgEFUnMNjsU4Z+BdLrxK0q
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
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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
index ddfc32ba29cb..69d88a9b1925 100644
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



