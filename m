Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E299606A333
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 05:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z80Al4ZK;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=crAeXJrR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3ObCFUaPSZTRyf028wzpjWfhsH1G2ASH7OVZC8zOIUE=; b=z80Al4ZKce7R8D
	KOd5g5pMgLUlWcmpRcf1ClwNWPmXosEtIHm6fJhyW8sFvL9Z/d/6W6YEs5NlmdpFS1QhK5ifmEFEx
	QWRiNeZopSZANlD2gmicIuvfUWYalhk8OaPuELL7W9xpLpTfcUvoCjHeyHeMb6JkC4EhDF0/ZUGtH
	TGZ801Sbak7Lk6aUMlIF39aUZ/loz/i0WIMxJAFDBnPxPm4N/ks1oD2YwkLSZHmDzL+5T8DxgJr8X
	6HxR6HJFgLkuHplVSxdzOs5gTTTWRM91SsPMsEuP68geUmbb+Biu773BJ0uLLBqnPcFJ0jrFFaAzh
	qkjuusSv39JClOOU7JJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTYeJ-00000007nsh-3Ewx;
	Wed, 18 Nov 2026 05:56:03 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTYe8-00000007nhp-3oMe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 05:55:55 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-cd63b18598dso5855a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 21:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794981352; x=1795586152; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3ObCFUaPSZTRyf028wzpjWfhsH1G2ASH7OVZC8zOIUE=;
        b=crAeXJrRoN+BGdrvwZh0l3Nr1jHuOvy7TNM2bHtXc/EhPRqaFCHv+T1lVVZ27drOXw
         oLRhg7s3+AkFg7VHqqduP5F+zlI9yWUZP/s1CLtNrTdC5SxMuYHVDaPX0dfeuTTFTFBE
         ULhyQTVN6MhrXtgxpNmeJlVPJ1fEs8TAcITtzJxrIeSPrO/QQ7pch5Zv60j+q2/2C81Q
         +m36q2WS8Js8j60Ds673ILl4hC40MxgF2ryJudjBFpMn75ms7O+3Yq7nJIVVTBEeWZH9
         KjMWYH16NJTiHp/S7CrCfG6ELnsLao3x8bQtZERSu7PtQn0TpteE+ILuIFA7ZbIV0jUg
         Um9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981352; x=1795586152;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3ObCFUaPSZTRyf028wzpjWfhsH1G2ASH7OVZC8zOIUE=;
        b=EDMWEakXopMJFIRf1gn8XLaraVGSJK7yk3itPwmpgy6SQSzCRGz3ylcjPdEZJy2Bbz
         ucfDua111EUpi408peJQhoGFI3c8tg4KfsB9ms/U4TCknqkp6D1F7YjmA26SkDCPwC+Q
         skcXbf47tNxxyOnbGf27HjQomFT3IPz5v0FI0IQdzeZjJLV6Lqs2R6Y440vAg9BFiXjI
         eBPoKH2sEkqt3qMwBEuwukaoMf6UdOuRcCK6tu/nLOOeJOuTGMIzE9jmjSrMdLKlKuu+
         awTyNFl2kuRoznTokwIYNaEtZZWf/jexJEKPr7BgjT3cPh8ksO3UrbpPodG/5MxMtNRo
         7t9A==
X-Forwarded-Encrypted: i=1; AL+hErH9dvnFWeZyb5lJN4mXEmVopNPA8wfqj9tPxxcgrPshygmdX6P1JLQxwe2JUX08TJ9Qbv4G2j+AUO4B8DK0noLd@lists.infradead.org
X-Gm-Message-State: APuU4Z9D3A657agNhosMrSZWL+SkidAQ1l7GRxuR52VrzvyVGuZbIMxa
	28ii3lzdD6wXo/5CdCyd3LMHC4zlQUJgfrSWYt5bTNkkZfKOYtFnITNZ
X-Gm-Gg: AYBFou0nL2mP0FxJlIO3QM19EO0LZLLW6upriR2EhD9xitl3DDxJcL8XQQkx+PkwQ+T
	BmdnCL8xOyxh1egCqzg16QXrIVSREi9XwvKImyHmmSXSW1+8l4Jn0gUNRPAeGe/qYns8eSaTFum
	wv3VJCtvjXvfgLA94uayh/qNTVtEaFq73+jZLXj83bGs/kLhpYZ5yjV9fZtiP88idwXGYvrGLt0
	CD+pQ847f6CzOYW7bT/TOgxOEYCUrHwdhxHcecUVs23fLl+FVGacxTJf25b63Z4Ijp9s7BwCr2v
	7pZu/aGK3fJZZZFyUF3Ww/rPi6pm+sOWiWVH+yt1KVBPXaFO0IA0Y1NxLK1Z7Hcx3QfG5ktMCd3
	239O/EXJ400mMoRLJpziLEOMl0pknDIu52hqfZ7das/Zp2XTywgNvZn7Wj892PTVaoG9bD4985O
	GeSaAz240MU/sm/o6X1k91exlrSiS2cEhRrAaaKfFfldDvhqgGQtp7nFxEG4k9N1TfxibzDWUWA
	1TsQShyOmDaMezLj9LBIpmUhzoC27cWxEzbIdK4e+hA7EVXS92lV4gkhJvl6qOVnqo5lZvxAFG9
	jTfaQMLNyq4RkftPVqT9XsLreeSIXZK99ZCnQ8M9zqmycPo2mgU9POQyfmhN8YEanRf1DSPOlbb
	h0z+zF8uoHL4xqiuIulLVXhNyENHvcZKLExmb4jsttQ==
X-Received: by 2002:a05:6a00:a603:b0:8a0:8822:e6b1 with SMTP id d2e1a72fcca58-8c5d2e60c9fmr1601116b3a.3.1794981351549;
        Tue, 17 Nov 2026 21:55:51 -0800 (PST)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5ca5bf959sm569563b3a.20.2026.11.17.21.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:55:51 -0800 (PST)
From: Jason Yang <jason98166@gmail.com>
Date: Wed, 18 Nov 2026 13:55:15 +0800
Subject: [PATCH v7 2/9] dt-bindings: phy: rockchip,rk3588-mipi-dcphy:
 Select TX or RX, add phy-type
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-dcphy-rx-v1-v7-2-8de1adac3a74@gmail.com>
References: <20261118-dcphy-rx-v1-v7-0-8de1adac3a74@gmail.com>
In-Reply-To: <20261118-dcphy-rx-v1-v7-0-8de1adac3a74@gmail.com>
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
 linux-kernel@vger.kernel.org, Jason Yang <jason98166@gmail.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794981338; l=3151;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=4LpfXZ3K6xdqCmT0IpRxZdhbTlUKsH209mqyN39qYpE=;
 b=lBTRLbvf8g7lFsWQAbxZKLjxuc/2yXGEWDu1UJGcBC5a/HMuX/Btm1Jo9VvetaGhtS3KECTo5
 ezqJngNtDq9Cd+GGb6mB2i2L89PSeZdSEkBXCM3f/ahZf6JJcL71/8y
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_215553_021013_0F49A0D5 
X-CRM114-Status: GOOD (  13.28  )
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
Tested-by: Quentin Schulz <quentin.schulz@cherry.de> # RK3588 Tiger CSI1 2-lane IMX219, CSI0 2-lane OV5675+DSI
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


