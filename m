Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9C3606A6B1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 00:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y1cyByB/;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X5t6UAS+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xwLM987nQ+pFkVErQYOpzlmepQTE1jrmewNsyk4Hu1g=; b=Y1cyByB/8E4c9U
	6QhVKcE2bVE643FQtos2eW5u0tgTFrqF+8qNpQGa44DGhcFoQJjn0PvLlIxWM5b8lNKtb90yzq1dx
	OtbRXkNIgTVM5liw2cFHQJbM9LQKp26pRQzVPfLlc8wPfXK1hFsSRbzMyiZasC9ipGfDxO+8Be9WA
	kX22/QDvKaKh/TWM5rE/CJF5DLrHDZd7fVfGwDma+HiRUWmj2QaTlu/IHJP5dKt7pbem0PTOp4OR6
	X6JWvaxa5eDidKXMXpGzUSlUfUAjDfQFv2G4ozSNK4hckq6LdoLgDqxipUZ5TKtmYoAOUrDXrV9Pp
	25Fw0k9ORirSB79BBUBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYw9-0000000GV2n-2enH;
	Sat, 21 Nov 2026 00:26:37 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYw0-0000000GV0J-2Gwl
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 00:26:29 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-cde0daf3a2aso669951a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 16:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795220787; x=1795825587; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xwLM987nQ+pFkVErQYOpzlmepQTE1jrmewNsyk4Hu1g=;
        b=X5t6UAS+IIE2zV5tH7Oqq+qlZCVASDtiw1Yh/n1m1MDqokwHv78PB79YWi00vl9I00
         CKrXTXeOMnjWk3raQMg97N2xs0UDY+lNu/YlPO8eMdgGBCBmkm4hh8zKeItfxcLXaoKY
         hhT3eaIuOhOiWer4x4i56bfad/tmtjyPgDJXiPppr0xlz69mVeGMzGa/ucRH9VeRGiAb
         S90lOv2uvXdr4Jj7Mi/r2s3hSCssu+TfZwjEwhWeynaPxGHLt1q1+5h507mfaQ0y8qHt
         6ghyMTLQP+QTGtOeb1lgkD0u04YrZ9Bz6Xy8sbLA8ia6r0YdLd6c+dapX9rI8URiOIji
         PrUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795220787; x=1795825587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xwLM987nQ+pFkVErQYOpzlmepQTE1jrmewNsyk4Hu1g=;
        b=yLb+r9j32h4BYUiC7NP/I9UR0PpNiD31b4Gn3Qt3KkMl/KBBefc8GHfIorbkVdpxy3
         DWqEi7rQKNW+YtB27uDXhNkMhdsMolUZELJuUUXS/IDZYJgwG5r0cf66wWyiubnNwmXg
         fo5ELfh0c9p2oNhR/KYDDlV9EZV9VcFoC/NnCJHb6vSiWLS9339/IBFI+SoKXgBUowNr
         m81dZL23khq4KMnsDZQVFL9mFa8+/5xmyOlbhP+FJCY+5o/UoE5C4Ajyfiuz8XEC+Ydt
         byMKBfIZURLRV7OwY4HLfT2h2jGAXkd2401MP/6CDJ4Fqrwp9ZPgAal3IwjLeiQUVn9S
         NL+w==
X-Forwarded-Encrypted: i=1; AL+hErF7/ih1WXjbbDTSTJyN4xQevvIpI7R+i2qfUcrRNADh2aKr485iaLhTGj2K1jnAocHCoWGWERGsvsdvdL5M5SYF@lists.infradead.org
X-Gm-Message-State: APuU4Z+66VUn0BSmiupkOFrtJmYeg0ovV5/TAZHVtEqYLPHeDT+4yBPK
	RtPmR5S1db9w3GSFDlUMW00LJnGMu8IdD2ccaixGIigiE+77DP8IUCzH
X-Gm-Gg: AZFdTZfIZNlr6+A+6k3eZMxiJvSh/ZKn/PUUvkX/VPfD1Dek8XuftCHNYa91en9YUK+
	PBKh1qQ0AGCIUJjgRbQ4BFSl9c84c+vEGmWz88W7mes/Ecc7/gJFVaZ0194mf35Bm6GHOtaNQU6
	3SO+gNB1kerMqA4CyToEJoqL3u+YrQfYT79PUfK9RlASWnYvgIt9KwHEOnwpQl/6gcKw/EDuYix
	C/mAEPqQucAAq3CpLZ/YeDJn0sHzIuBy9sNv78SXzrzGhdQTw3/RUCNn9FpByawwBaMDw3znUC5
	pe5/7LWKm7QId51/mWZ9SRxjOWb8y2qrvO+eMtvnqPYaZE+rwkaD3kq1dvLkx+v38fpu+mcgCMg
	Ddo59L1sozpvW2pbeRnaqU5mMJn/pn4wDFFUV3MO1IXHwru5cH3vK0blydHs3beYczL9KOioIjQ
	mUA++lSTPFhIfzfIyqF1BTAQQ+1XFn+9yaHjHsNvzeUa9HpgQQ1R7YrXGmnUBQMe5rpFI1N+In/
	6P08J/hZSt5rzKrm/xWQbV+bLkaJHkYEYtOr5jOX5HudpUEO/eNUripplSyqzWy7XcMKbQyVK+O
	GEELXRhN5d9ymuCTlcn5osajpxk9FUfVRodIsrO/GxGTDQ+CCtNlRPrbEg2SnoQg92Vzl0ruZ3A
	+HSuEaGsLNyCX3dPrs4P9zwHuoBoM258eLPVfgvnd7PvGBj2PD+BUp/vPIDU9NBhEdmNCsDQikw
	NklA==
X-Received: by 2002:a17:90b:1dcd:b0:3b0:bd53:8e5d with SMTP id 98e67ed59e1d1-3b41cb3e4b9mr3659922a91.58.1795220787596;
        Fri, 20 Nov 2026 16:26:27 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm1925230a12.8.2026.11.20.16.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:26:27 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 03/22] ARM: dts: BCM5301X: N18U: specify switch
Date: Fri, 20 Nov 2026 16:25:43 -0800
Message-ID: <20261121002603.25254-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121002603.25254-1-rosenp@gmail.com>
References: <20261121002603.25254-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_162628_579479_611123ED 
X-CRM114-Status: UNSURE (   8.85  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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

Add labels to clarify which port is what.

Also set WAN MAC from nvram, which is offset by 1. Set in dts to avoid
having to handle this in userspace.

The port mapping is taken from OpenWrt.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../dts/broadcom/bcm47081-asus-rt-n18u.dts    | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dts b/arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dts
index 5874e6b606de..4ae4e2d00b7c 100644
--- a/arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dts
@@ -91,3 +91,40 @@ &gmac2 {
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
+
+&srab {
+	status = "okay";
+
+	ports {
+		port@0 {
+			label = "wan";
+
+			nvmem-cells = <&et0macaddr 1>;
+			nvmem-cell-names = "mac-address";
+		};
+
+		port@1 {
+			label = "lan1";
+		};
+
+		port@2 {
+			label = "lan2";
+		};
+
+		port@3 {
+			label = "lan3";
+		};
+
+		port@4 {
+			label = "lan4";
+		};
+
+		port@5 {
+			status = "disabled";
+		};
+
+		port@7 {
+			status = "disabled";
+		};
+	};
+};
-- 
2.56.1


