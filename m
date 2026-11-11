Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24911606B7BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 18:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LcEIHXQR;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pAL9ZMRd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3p1f8Yec85jLXGY1wQELmw04hKpnMA5OmY/Vm2aQaMI=; b=LcEIHXQRbFeLLu
	2mZNGbJzRDNO3317z5X1S2CsuExJUV2MeLTeqNn3QQGJvqBnIxFpX76mrSTDal895YfVhFhI6+23U
	l+8FZbFCNeICHQn8XCR8MN3jNwJKLQZOg0OCmrZxGrK29Ic9nHsUL/P8/dqH5WZXfBvTdNWSrntzX
	QlF/PhtL+Nz6Owv3CmAa21hhh61wyIL9hkXBIwle28vYwYwBAXnPFwT95SkJ7tpAX8z2XMtsnn+G8
	WfcG1khfemdwslTf4T1LxGnAgVc8Oj29T/2zrWoHNI+Lde53YzyLG36YRtOIKwr8vTBiNYFeDgpWN
	6/ZZfVTber9LhGR175xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRCva-00000007OCp-1zd5;
	Wed, 11 Nov 2026 18:20:10 +0000
Received: from mail-oo2-x0a.google.com ([2607:f8b0:4864:31::a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRCvV-00000007O88-0Ery
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 18:20:07 +0000
Received: by mail-oo2-x0a.google.com with SMTP id 46e09a7af769-820ff812cd8so875218a34.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 10:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794421204; x=1795026004; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3p1f8Yec85jLXGY1wQELmw04hKpnMA5OmY/Vm2aQaMI=;
        b=pAL9ZMRdfTC9hc4GMdNllLyoynEHa/YcGoInZXy/sMi7jv+zzLnGDk8LCc+cUoIkRc
         Zqb12VvIF6Itq9eYNMn/UDWSLqOTFzGPAQeC4q3qRzN9rdZUONP5TJ3uQ7dHJoWKAHCR
         0/T5JpLG4AgvIPHfCgk6BM+lTn/H3b9ns+HabdJng2Bt/dBEwFN6RLRUpez5flsOMmxM
         znDs0t3vO5uKy8YioWeFO6jL4yEJcYfsfyeQU4MsCT6++qazM0hNN1vofr9DNy8oUPxi
         jYISo1yXMGPwN5/q1Gpe1IWZ0m5yi8ToGueOBnf9WSP8zv3GTHgjBguG/b2a6q8pIsoY
         yi3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794421204; x=1795026004;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3p1f8Yec85jLXGY1wQELmw04hKpnMA5OmY/Vm2aQaMI=;
        b=vf5LYJ7mcwFZ3g0GjWfG2C1xoH7ySEtc7pgomCYeHxps7FiNW3+yMXWI9ftGeCbA/y
         uZNnNbo9xaj3OPplI+9w4WOxGzkm0Xlt74uH1FrzVxdGG5vlTEFxvbSeDlZqT1JP2l8S
         y7av3ozxHhOmGSH2Iocvh7taVU3tWd4knDM+D7aArw/C9yJPacpt3HRJI+EaVfXfkRyK
         G8039daw24H4iZwxCfK0Vo4qfsDL0r7IVZDGFoHdGOocpqg0Tp+zy79sI4Y0yKbzoqlq
         m9c9O/HnlApuwblZEzZID3EcCgEpr0q+oaPt73iHRwse/Pf2dzUVAxra7ISDmjao5DpI
         IHHA==
X-Forwarded-Encrypted: i=1; AL+hErFzw+WV69lgZMpDwRWGafujc/SdNiOAerGDpa6kS7Raz2YrC79Vt6A69FgkUbEpVh9Di/mHPaZIoPOfwMYAPoW5@lists.infradead.org
X-Gm-Message-State: APuU4Z/iEl5liIsqpU2sEB1F7oBBYYoiwvjU2+hFH2DPURZ89+MGKlMX
	dVc13yQZACB0RWY4TYdqzmKnlY2gD9xFVDLLxGtaLnJBGSkIIFUKRGpS
X-Gm-Gg: AYBFou2HqvYNBnhAl9kG5F2ylBSPKVwTecRd96JG1Mhqz+DY890KRdS0SNnaYbKBLUF
	e6V7k0mgZvt6qcQPkYIDa8ZR0IuBQDjID6YZKTNF9DZGaq9HVyKQ09L0R5EBAUupduoa0nYwRZI
	Gnp2nVzNgiHlazV65GVhC+eahMalM4gKVP1ssERZ9ci3/hccryzb0hNsvfMjxkBMuLloRiaK6H8
	MS0Or3hAg+R4VI7E93t1Be9mDO4v57CwUbXdkERaj3dopdEDSZKZD13v+z9uo0y1CMJoriFdnvB
	rHhj08K6idfA8RxuJ5+x8VC39TI3apkbjZ2PLvDsOhp50BAYRa6zhiErkA/7TjpRoTKvZqBDGC7
	ogshP9yv/gO0xcjzNhrrbVUkze3vTs5iPwhiKg2LoGjfTfyx26m9SfggYtfhUtbmIjUoT8COnTv
	15c2A0PPLvkqwk94LcrKWYB5wsIsyGN6Lav7GRCh84ylOS7GlGJ5RgPy8vDUUy+ItSZyjKlb97V
	qb3zf7ST+nxzYfkdSI52TT+/nBUP/2zhfTJEL7i8JPGGlcpKc4N6AysJ13c5PC7WutYAgtV2Z9d
	eMM2FA0BMmOMmuIOIr4GQFuzABoxC04jH7OV5wMokYaGfblIS4vP9SDpUx8DTbkzQHoqtXzWW5d
	LihAy+l+YGSUjCbL4wUY=
X-Received: by 2002:a05:6830:2e07:b0:81b:864b:7f02 with SMTP id 46e09a7af769-860f25e9047mr4277570a34.2.1794421203737;
        Wed, 11 Nov 2026 10:20:03 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcb5f847sm4824708a34.8.2026.11.11.10.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:20:03 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Wed, 11 Nov 2026 12:19:52 -0600
Subject: [PATCH 3/5] arm64: dts: mediatek: mt8173: Add the keypad
 controller
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-3-77b47cdea702@gmail.com>
References: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-0-77b47cdea702@gmail.com>
In-Reply-To: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-0-77b47cdea702@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794421198; l=1040;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=XWTgqrmP7rORvhppkX5O4ecuuFFQiKCRGXT4o7Blnls=;
 b=3naZYMrXC7w2FeYZunhhVF3fjUGhFJRhyC1EwGqndsw2Uvt/Vy4tRBxmpspeKTjgLQIaHzQBL
 G+jVqjThFk8AXAHg/aysmbransIpv4bPfqEkl6CtjrE6Nmuidatej3H
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_102005_136484_B0771169 
X-CRM114-Status: GOOD (  10.21  )
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

The MT8173's keypad controller is register-compatible with the MT6779's.
Describe it, disabled, for boards to enable with their key map.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 2ecdea33672e..61261fe643ab 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -555,6 +555,16 @@ pwrap: pwrap@1000d000 {
 			clock-names = "spi", "wrap";
 		};
 
+		keyboard: keyboard@10010000 {
+			compatible = "mediatek,mt8173-keypad",
+				     "mediatek,mt6779-keypad";
+			reg = <0 0x10010000 0 0x1000>;
+			interrupts = <GIC_SPI 154 IRQ_TYPE_EDGE_FALLING>;
+			clocks = <&infracfg CLK_INFRA_KP>;
+			clock-names = "kpd";
+			status = "disabled";
+		};
+
 		cec: cec@10013000 {
 			compatible = "mediatek,mt8173-cec";
 			reg = <0 0x10013000 0 0xbc>;

-- 
2.56.0


