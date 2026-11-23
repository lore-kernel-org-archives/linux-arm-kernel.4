Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616E1606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 12:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4+nlI3l0;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xhjtcNpV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YQ8N9lrkCBm6g5O+8A22MhXclICDJr3w2WLdfhFanRo=; b=4+nlI3l0l7XO8W
	9TyNa2ypUBjDM1Ly4bN/u5D3gCn3Es1cSZyUp2G12xExiMNfTVBqX1hqLOKDX6PydLNlYf8Upw5gS
	d5GmONzD6fLHVaZ4lQqMXiLREtqvPARbbMxaW1DgXCzEWA3ilaoRjihJv4ZsnrTzIqAS36gISdkII
	EodQZnEyRHwGqp4Gq2KnejLwEN17wKJzpNCWUkH4b5nY8dTDm8kLgS145A2bW83AVsJbXiToFMYKJ
	QhPgnhOYpbv+ams+vQXBTumfL4gneByjFinpNx9M2h5WqJ6IoM5uI30n0kP6d7/q68zkbH4iWTU+G
	P3HlowNr2VKbBDqjWh1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVS4q-000000036rQ-0AQ4;
	Mon, 23 Nov 2026 11:19:16 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVS4c-000000036dS-3ikv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 11:19:05 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-c4d427836e9so434739466b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 03:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432741; x=1796037541; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YQ8N9lrkCBm6g5O+8A22MhXclICDJr3w2WLdfhFanRo=;
        b=xhjtcNpVL1+7E0Se6oCnT0KcQPo5nXJ5We+u/oLKGIRwFO3ilKRxhHq/xnPUYkra2n
         R6G4Sa0DDE1dlIOGp8kJR0TQ/qDPKLtxxTqqHaoDsrIOw3Ak22tk1OBOLsOxSYT6NfoA
         jaJkdUdJXfjfxTaA6oXUzNn52Uf9Z06UV21lWzYIv21bDZgDzmySh3298FDr3JGs0K1v
         l+tSeLBQw4XiOkAQTNHXmyqwLpKwWP7RxSjF39ZZTR4PRVORLe1YUxgGTlRyeHqHMxzr
         NjZ4+VtqBfAs4JWOo4IhBJB14qIUk+VNNbzvnQOkrrbVwAgl9xqGxLitUDSD0qlyksEH
         Yf2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432741; x=1796037541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YQ8N9lrkCBm6g5O+8A22MhXclICDJr3w2WLdfhFanRo=;
        b=NBFMdy4W/dJN6ZiF7tvnJO+yJ4HO8n/eE/DRllDlIboKRIGJjSvto4iY/NWr1BBuxs
         aI8IortnsmEg1vq40w2aI9F4+GgldwtWrYCayg+3BYyZeC1ZBlLVgx0xVGjY/5Sb6IY0
         7uRFBkw6BWvvrryCqrOZJVs3zWHwUlSPZCYuoHa3vzO00NOwXFukg5M50Of6h66gt8w3
         bMLDa6LD4cCXLBVMRjilyqAaAwYOpuMPe+VrfPEptCDN5fUfJVfLwEmJzmUDCSH97gy9
         o8Lk2+8xx138S3Yl3STrt1x7F32eAsjStjdbH2b6pRH/W9ulbqQ3yeZ/mD10BHG4L6Wi
         PKMg==
X-Forwarded-Encrypted: i=1; AL+hErEqYxhb6axy7AXl/jHRo5mzgrp2q5vYvR9pFsvYGtpCByUqhKUFz3Ayf8GW+THunwfCGA3F4pecYGFY5LeVlLHv@lists.infradead.org
X-Gm-Message-State: APuU4Z+gFKve33rLrtFMJl+iU+O/OQZyz6rLPiqGG2jFr7t81d0n0dgL
	247oV2OzXcGCSpC0Dxw1c+xO8Ndk0x7bHa/6NS24DKfICW9fC2J/ODwx
X-Gm-Gg: AZFdTZfi9qF6mI/blKuHrsPugaUq+4tKitDj7fKWD4itEs3XQzzj609bngshmCbnat3
	m0OBdsXk+tBUjcRz+jTh//I0Jupet0MMJyjP1MhkHDlo3JZP+7TSi0cl/cJS1epT8XlIxKGLhD+
	0gmFg6+K2Ho+9K/sM0L49whmmNuV/0iI7/ko2LrSioTi1Ct2a2CoZQWGq4yAiEu2bD0ex16Z+7Y
	36fhGTUeu9BI/XOn2zu8xjNmzSgVh2d5VlWn9BOuAKnUDpVbXRXCF+sFMsSjRfj6nlsW48Jxjxc
	f7IlnOct9hmj9P3jaxoulW8rtUT9F7h5V/H7U1ryIMEc8ASRKVLwo9Y/yn7INv/EmZF5Ucpkqat
	XIHRGBLRk3yT5z974QzYsg6CAR5Xs+Eb1x591XRKRq6oyNx7y6I4DeCRjq4CY0xjGSKoo5X5Hnj
	rtRzAUSFBwJXnIhC57Vs99u/cLdyBLcLq5uFpYovTlPpcUN63ZSuw5TVOzU31HuAq1qFpueNErJ
	9NoCGccjHSgHGZVXorwNgn06oR5/KEMM2z/uZnURKSJCe4swLDdHjBWCqrZoAmFcuHl0+w4X+dd
	2/8fOBvNps+2IE9JymGShZMBn3g6rqDP10ub3jepqEygJ/J3R86D6js0zwE1C/3OEw==
X-Received: by 2002:a17:907:3e1c:b0:c51:53bb:8d70 with SMTP id a640c23a62f3a-c5153bb8ed8mr586385266b.16.1795432740595;
        Mon, 23 Nov 2026 03:19:00 -0800 (PST)
Received: from [10.120.183.232] ([50.7.123.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc679bsm392442266b.63.2026.11.23.03.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:19:00 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Date: Mon, 23 Nov 2026 14:18:34 +0300
Subject: [PATCH v3 1/7] dt-bindings: arm: mediatek: Add MT6895 and Xiaomi
 Poco X4 GT
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-initial-mt6895-v3-1-95c46597e63d@gmail.com>
References: <20261123-initial-mt6895-v3-0-95c46597e63d@gmail.com>
In-Reply-To: <20261123-initial-mt6895-v3-0-95c46597e63d@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org, 
 phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Alexander Letuchiy <asalde.le1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_031902_976900_9015E240 
X-CRM114-Status: GOOD (  10.55  )
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the compatible for the MediaTek MT6895 (Dimensity 8000/8100) SoC,
along with the Xiaomi xaga board based on it, which is sold as Xiaomi
Poco X4 GT, Redmi Note 11T Pro/Pro+ and Redmi K50i.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 26f096587631..13e5c31cecba 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -72,6 +72,10 @@ properties:
               - archermind,mt6797-x20-dev
               - mediatek,mt6797-evb
           - const: mediatek,mt6797
+      - items:
+          - enum:
+              - xiaomi,xaga
+          - const: mediatek,mt6895
       - items:
           - enum:
               - bananapi,bpi-r64

-- 
2.56.0


