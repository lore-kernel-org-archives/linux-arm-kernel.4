Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2B3606A33D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 08:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NEDYZ3iZ;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lxUhxJiu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yl3B8wwACC0gEnAcEi/cuKG4GHHYZ1RZckwVjmBrJlc=; b=NEDYZ3iZF0kN/X
	U2kg5tEnGgkyHPimFqVOOvCiVWiCKmZftVJLeAb8C9GSj8T3MlX0ereQBf0OcJT/tZGgoJslQwdm6
	qnQTJ/Y1HimxQ1tSI1m6mn+v2LicNxGCoOQHcCIcszsbhXwkszSn25vAPznzEaQ2LwNCdP+yHYoSG
	rIuNA7FIfVz630c6+QgF8gjooyU+KiqV6/LW9Y1UDYRleFGsh/qzG9eynnO4CVsFHazmb6/cCJ57g
	V3CtdSRWH08nV8HdgXOv19/8VL++hwJAy3vOxCFjcqF0RwrHb7S9+dA5r0TntzLGKrFDLxFPk9zqA
	DTpyx7zjRt8fmT5H9Jdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQh3r-000000034a7-4Bqk;
	Tue, 10 Nov 2026 08:18:36 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQh3j-000000034TP-0Xna
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 08:18:32 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-36ca32a0faeso160658eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 00:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794298706; x=1794903506; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yl3B8wwACC0gEnAcEi/cuKG4GHHYZ1RZckwVjmBrJlc=;
        b=lxUhxJiu+FVeZW2RePL/5pxJyl3xaZ1m7dYhp7KGtjN9xGdPhluQ7HSBVAtdxYPjmI
         kzWeIdJ5PQ9IuswfNHBpyWqxRsdDBN5zKo8DYnwktIHOacYDytL/v5pSNti4sJfOd8J/
         JtT6ZkAhHO1mr/f6vnoSpXn9GZzJOVZs4gFL6ZMzvImYGPZ8EYkpNanKaD6WE2gbN4VL
         uPMVNWztHCKascCVBsngufh+5QTBmOFmZdymlxlrozEgHO6C8z29P/lXReyFyuXWpNZs
         WTRJKFA9+YWeR6dQBAPwQxRHX8ApJz7VH5SYhr7QBT3RrGsF3W7RuCRrNLoDNAA8Tv0t
         SWuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794298706; x=1794903506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yl3B8wwACC0gEnAcEi/cuKG4GHHYZ1RZckwVjmBrJlc=;
        b=sqfNVZlLifVCAdEPBRiWLpKi78Xmsbp0mSlhkGbKSdM508oCDrAdHOHMrQq/ftVMcg
         Ar/R/DtDtEG/n/ZVvxFkiprJa0GnU5yGcQR1dfO5dSN348wD+7aXnFyxqG9lGCyOXMqh
         Usvkz7hsCvN9i3FTXSwEgtRonMnj0wxb/wrMy0NGjNx5Nd9MWblcCaluaydbmsu14OUM
         uq4VgiJqsVFRkBwHPgAXqC1XT5mw4PW4JpaGwg+znIW8eGC66SEIS4P6+33DemAuN4Tc
         Fuk9pxpeadWpKUcOQEx6MacYLOUHSHdMAVAlPJNWHdG7HdFCWFhnRVOXWGZ1ji41p0sY
         fmAQ==
X-Forwarded-Encrypted: i=1; AL+hErG1IXTxJW9y+YPuEetjs8/vVn3y2XaC90O7ZRer5VzEQSCZwbv803oJhxJbdhMzRTMfgPVASfEmMX6pxyOjUvEp@lists.infradead.org
X-Gm-Message-State: APuU4Z9RBjqb/JpuqtNERAY/ZuElQG4sC2/e/v+2T1yB0L1QWGvpMlnG
	tvTZsdE1PwsSAwzYTw6Q3CF6vGzl59JqqLlwjpTAbmnNZCiiFai3eEjE
X-Gm-Gg: AYBFou16iuKueJ0oKR4c35JqbyoIwwye9Zxs6J7lbqUPUNF5yaF1WR2+Gbz+IeNLWT8
	2DfsfHj0RL/IXnEj0CIbI2kEjs4h0/KY39pPNAQe22kXiwMYwZl1Xd4Fb1mVSEgUjx5+KrTMfAS
	xSp0sdB6Hn5hkMAM/oUsmWLzB+YhiN2Ts/WMtBjkKsSnT622kUqpM1YqHrKVIG+GNsQNnbOlv/7
	iW9PnNV0xurbtY4Stx+hftMIaLbXwKFVDr6VXhy0bOa1radHgdl6LNkR8s1+BDdzgWku5gUKGRz
	pZTfV9EV3JDJoBkpMYt7Z9/4ohbULfrsUKw1UOQgEkHzXpv7X9OpJQILKl1R/V9k64DaOw1vj1+
	acOo7T+9nbzJbyzImx+xkFzmZauAmIfTi+w0HzJ8vFJxuLndSwbXsBiQOxzUVTZ4lrPGmb9C/04
	J0cSeK+DWlcGNvZx3U0BZT1oYqzRCXyhG4DCsWScvIzK7cMEHQIVYEfLy0lGHD35wN7OUYsOcj6
	qW5fkWPTNWpZT3LK/blckp9bhPoD9nA1RhxZFQRpmoPpDfaQj8NGLzvVEGTFbmqaWQgIo6cWVnW
	9TxdwJLcuatH0BIaak6ctK5vTkYEryiVrYzShzeIH7g4/msp7mIWpUaJDb2n
X-Received: by 2002:a05:701b:4594:20b0:1a1:9106:cfff with SMTP id a92af1059eb24-1b3ba7b302emr828418c88.2.1794298705356;
        Tue, 10 Nov 2026 00:18:25 -0800 (PST)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc14sm5236759c88.12.2026.11.10.00.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 00:18:24 -0800 (PST)
From: Jason Yang <jason98166@gmail.com>
Date: Tue, 10 Nov 2026 16:18:05 +0800
Subject: [PATCH v6 2/9] dt-bindings: phy: rockchip,rk3588-mipi-dcphy:
 Select TX or RX, add phy-type
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-dcphy-rx-v1-v6-2-d681ba20b36a@gmail.com>
References: <20261110-dcphy-rx-v1-v6-0-d681ba20b36a@gmail.com>
In-Reply-To: <20261110-dcphy-rx-v1-v6-0-d681ba20b36a@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Guochun Huang <hero.huang@rock-chips.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jason Yang <jason98166@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794298691; l=2929;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=xQ6WaPuBjE54d5cF8BexwENmzZIHniJK629BNNCMNF4=;
 b=X7MYhiVj8tskEvqzZbwBYXtP4KTQ0kMGiYW4eHf31wARRGAJfwayNHMoayBu8o+H23PJZRJTA
 7Suk9JEi68TAzp65I59DtI/ekqH0WZiIvBnu9ESCzffERUmKEIgD32g
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_001827_206162_F5960AF3 
X-CRM114-Status: GOOD (  13.70  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Samsung MIPI D-/C-PHY block on RK3588 and RK3576 has a transmitter
for DSI and a receiver for CSI-2, and the DSI host and the CSI-2 host
can use the transmitter and the receiver at the same time. The single
cell of this binding selects the mode and refers to the transmitter, so
the receiver cannot be described.

Change the cell to select the transmitter or the receiver. The
transmitter and the receiver cannot operate in different modes [1], so
the optional phy-type property of the PHY node sets the mode for the
whole block, D-PHY by default:

	/* the MIPI DSI host, driving the transmitter */
	phys = <&mipidcphy0 PHY_DIRECTION_TX>;

	/* the MIPI CSI-2 host, driving the receiver */
	phys = <&mipidcphy0 PHY_DIRECTION_RX>;

For C-PHY the consumers stay the same and the PHY node gets:

	phy-type = <PHY_TYPE_CPHY>;

Existing DTs on a newer kernel: PHY_TYPE_DPHY and PHY_TYPE_CPHY remain
valid as deprecated values. They select the transmitter and imply
phy-type = <PHY_TYPE_DPHY> or <PHY_TYPE_CPHY> respectively, so nothing
changes for them.

New DTs on an older kernel: an ABI break. The older kernel ignores
phy-type and takes any cell value as the mode of the block. A DSI node
with PHY_DIRECTION_TX therefore gets no display, and a CSI-2 node with
PHY_DIRECTION_RX gets no camera.

[1] RK3588 TRM: section 22.1 (overview): "The TX and RX only support
    operate in the same PHY mode."

Suggested-by: Michael Riesch <michael.riesch@collabora.com>
Link: https://lore.kernel.org/r/94d47cab-10c6-4ec3-84a0-3bddc9d67f5f@collabora.com
Signed-off-by: Jason Yang <jason98166@gmail.com>
---
 .../bindings/phy/rockchip,rk3588-mipi-dcphy.yaml       | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
index c8ff5ba22a86..1ea21ab203ba 100644
--- a/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
@@ -22,11 +22,23 @@ properties:
   "#phy-cells":
     const: 1
     description: |
-      Argument is mode to operate in. Supported modes are:
-        - PHY_TYPE_DPHY
-        - PHY_TYPE_CPHY
+      Argument defines whether receiver or transmitter PHY is used.
+        - PHY_DIRECTION_TX
+        - PHY_DIRECTION_RX
+
+      PHY_TYPE_DPHY and PHY_TYPE_CPHY are deprecated. They select the
+      transmitter and imply phy-type = <PHY_TYPE_DPHY> or <PHY_TYPE_CPHY>
+      respectively. Use PHY_DIRECTION_TX and phy-type instead.
+
       See include/dt-bindings/phy/phy.h for constants.
 
+  phy-type:
+    description: D-PHY (default) or C-PHY mode
+    enum:
+      - 10 # PHY_TYPE_DPHY
+      - 11 # PHY_TYPE_CPHY
+    default: 10
+
   clocks:
     maxItems: 2
 

-- 
2.43.0


