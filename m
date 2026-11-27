Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D33606A335
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 07:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GN4+cPAq;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VRbApfej
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GdqQ/1stdbLe7LW/q2pTltSdWQOOet/MTXZ5U6MTyic=; b=GN4+cPAqtBfUzA
	szpfAAjx6J5DWCRzV/61pfkXgynr0sUL++X8LcSY7U5UHQFGHnlrHztTHg6QyKtPo2/eA0xmV5EPZ
	kV002+axi5Fvyl4M/CtOSNP6uVrlWXgsxQJBqJTkC8q6lx7528+DofWJzNxCgNFfLE2YJUpyBdfaq
	ZJJt3e7p+DbptGudk51gxHqx0HJdmFm/uYvQMnjBXzOXY5OTcmHlaJNTCztOreRomYm9ibKh1rF07
	EVpfOzzrUDR00tJ/9pzJzeWbvpK7rvEjemiPxm3noCwCquckYNZQrQ7UAcSeVa2SB/V2p3jRJdPgM
	UCDM8MXpk3LkEmlWbn9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqge-0000000FBet-0BfD;
	Fri, 27 Nov 2026 07:48:04 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqgY-0000000FBYO-0FbT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 07:47:59 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-3861d608cdcso985565eec.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 23:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795765677; x=1796370477; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GdqQ/1stdbLe7LW/q2pTltSdWQOOet/MTXZ5U6MTyic=;
        b=VRbApfejxzcXzy/xv2Lg+XQL1e9kCDqxeb3OJZTbYgDqSmumNyuq5EPWujGxpYetnk
         54Ar2qCSPDHXzOgoa3XpUeCbVNdlIc3jIqCi+U6fYnilu93KDg4ZIrGK5HfRjnqU4lOz
         g8vgepwG8qSdkXuOtljBNmQdFB60QFGUrdqOEcXY2UJyfiwpxExw2Rrks+JXypMo3kUY
         6/6itjW/qx+CeYZtMgWgj+Gij+OmnRDQZrPL1EBVgKTrJo/h+pX++c25X5S5eg8Sbh0F
         11lKtwcYKQySsImn2kQ+8czz9I6SDd2/+dyAj34FO9MdcwOQE8ORBoxhqCWqSubloPui
         h/2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795765677; x=1796370477;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GdqQ/1stdbLe7LW/q2pTltSdWQOOet/MTXZ5U6MTyic=;
        b=jhXY2ZXwN6ufEj1EP2mpDsga0HWsHCtI71EfmVw+KQHGAfmYtbSU3mjZhSxrquyagG
         LUS4biMPnz5EyjqZbVuW1xTuSBjJ+pQ0rsgz3x81xvnVk9+KUVfkhGY/cTFm5x72olm8
         w+svXmr7KfvzaoFdx/o08SHvlmVApBFOmZchFlhRFt+tKIOQBZcEq5ZbjLA4iPtoGkUg
         ddci9rEWswKFctdNsNSlM7E0rQdPhzR9IF+c1YvkpZKt06UC5cvtCidP3gSDyNqjVPe0
         Fa/LA7gKa0kxswJt2fSbhxxTa2JfQOzSntM9scliakaWL/EvHtZ632D2oUgORjm86jhi
         NVlA==
X-Forwarded-Encrypted: i=1; AL+hErG8iSwHtbBdy9jurbJXsfy4mPuVJY45fsdaVmE+eLnTMQC2ZpMvwJ7byIqDdSAFVvbGI9xiKrGJas3TyEHds87u@lists.infradead.org
X-Gm-Message-State: APuU4Z81MA+sK3f+WVZOINsPJsHu4Y0bEfqGtY8PDbp5UrUwWf6LCsId
	vKs0CdGnPdMHglLD/5LxvD1UDFxAOh4kmEnXlGijtz6rKtw5MBstFOHk
X-Gm-Gg: AZFdTZc75MnacwXOOTuDC4b5aa3voqbvzvQJ/YcLf4xTJ364cnu/+vdb63ILYTsboKJ
	BrxcDzgUMS+nePbU7T92hgl6NLy5G/YenQE3+RwNTBHqlsvaik/r5+YANPXbb4JLdle8LYyxuFJ
	V7OnkqAYjGzMXxeR0xKYJ3U2e5l6QQpfnwU2Zn4mWuSYqyaz+E501WuU3M/ZpBX5PgRR3O0Wesy
	VnY6GHOTcdyb7atsLSHK+VQp2ZqngyyAa1uI/7ZGiqeIb6nJ9laIo/RZj9Fx0I2KG7Mhc2FJiiW
	lKcnoLmaYHm8XK74ITg34I+ONXLd7BP4JNOJPBXFuXdpIXPf047P6grNJVkSUMS4pkPhrDeYPF3
	TKGC8A+c6NrmjGjH1F2QHu91fVSXpKZHjSvbi3rdFOgZ1g2ypuSFzr7y3H695/05ZRidQNvJhEw
	/rnCIg8C9sGfPDbW8zT4WbtXeFtiR93m+SsQp6C8y+yGWtZ/C4oMN02BjRfLUBisqqb5DD0rmIt
	SYQv3fJSjxnrAk30J5E1RogNMKXD6Ny16HElWWj6mWZKjtlUqb1HLk7kocSXoFiCNW+aMnk5ffs
	WUUJfl5KBQuwXzY5BywiLylmqSnI9q6OumNEfVYGM13TfMAujyqcM3YMGa2y4OKLXCY/aEZjWog
	vt0fDXkZPSLkTw7L1ttCd
X-Received: by 2002:a05:7300:1c24:b0:384:a0cb:a6d0 with SMTP id 5a478bee46e88-3856de58f7fmr38384098eec.1.1795765676382;
        Thu, 26 Nov 2026 23:47:56 -0800 (PST)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm68098252eec.15.2026.11.26.23.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:47:55 -0800 (PST)
From: Jason Yang <jason98166@gmail.com>
Date: Fri, 27 Nov 2026 15:47:38 +0800
Subject: [PATCH v8 2/9] dt-bindings: phy: rockchip,rk3588-mipi-dcphy:
 Select TX or RX, add phy-type
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-dcphy-rx-v1-v8-2-9ddfef99221d@gmail.com>
References: <20261127-dcphy-rx-v1-v8-0-9ddfef99221d@gmail.com>
In-Reply-To: <20261127-dcphy-rx-v1-v8-0-9ddfef99221d@gmail.com>
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
 Quentin Schulz <quentin.schulz@cherry.de>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jason Yang <jason98166@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795765664; l=3039;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=7rrdQlfrdWzd6vh0XG1BVzWjWRFX5AHNt9d46Qfby9k=;
 b=PJpEud+ez2q0GsXQjeTCuSxtX3j8zOIr53Jy9X+9FVnl1qhWLNzk1uuIUPCxn7Wem/kCpfd8Y
 YUX34ypgZ07D1PGVlQgKmasrZrBAoNlnEImfVm9qQyVU7lLJNtOmv1F
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_234758_170200_24FD62F9 
X-CRM114-Status: GOOD (  12.95  )
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
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
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


