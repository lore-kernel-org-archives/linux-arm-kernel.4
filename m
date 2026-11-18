Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA062606A339
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 05:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=p7zmhygR;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jNVjwa7Y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QV7/azGZskXYhWhh8bvjrBkzYwv/Uf2HoCpYkbr0EGk=; b=p7zmhygR83d5Hk
	/51Vnq41SKU1w+2z+X5AYWpbLAALq5T8tvMQknILFa68zUSMDgq4m+e6v83uCkP+HP3cDYRgGleID
	0oj3gSQd/JZ/u08wVP8fIR1ZQxYsTVhuMn6Ve+ncezQxSEojT2g8X+7VPIDx/yfr/34E2TJpgj88J
	XozxwlqF6CwqKbatDPJC3EsnFVAbi1RPPasTmOs6V5J4FkwFUE+zkAvnnKCv8Roe5usHcsNuCI5fM
	6i7EGjx7oXfLZ8ofUCv6FjFFpVCdlzxdYRZPLfn4vh8iw3Xt9h7Sn65as4B+6/sL0jn26MajWQKgO
	GMIupPmTW7hlX4tw/1vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTYeJ-00000007nsu-3nrQ;
	Wed, 18 Nov 2026 05:56:03 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTYeC-00000007nlu-3yn6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 05:55:58 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-89ecfdbe443so53625b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 21:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794981356; x=1795586156; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QV7/azGZskXYhWhh8bvjrBkzYwv/Uf2HoCpYkbr0EGk=;
        b=jNVjwa7Y1nM1NpjMECe/t0UTQ7KcOTtL+0nGIHfEC2FvjkZAFhoy0A8REwGZsi9BGu
         L6vruE4UszCamjrx78eTO0usD/UkHxDW9P8B63A2n95OGeu0LE0PZ7W35c8NymjvQVUR
         ULvcsrNW9N78TdGd0qWDzRvBxLY49RtO7mfyDkwoW3PWtFiNr4uzEiOaeSBIMUpfgI50
         JFBl9wnZG9g7V7w9kANLJrKZR6CVS5Yxu87S7XlWJ9jYd85xoPsmhKf09rcAMqYDv0C9
         gajlhBxWUVOVPZSVLwmhx8PNdxP8l5Z8tW3B7kjG0EEWOSPUOGsAdVdGYw47zwT9igBK
         0yXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981356; x=1795586156;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QV7/azGZskXYhWhh8bvjrBkzYwv/Uf2HoCpYkbr0EGk=;
        b=JAUW8h/Q0tViE068s6frMkeZVhRbBJSt5kbnEwKMhlGRWGqSldLSvQ93R88WlWdjhv
         mvwfCxe+z2rs7ibZU+mmVqMbIU0ZPz2uBhVnvIZ8YXAuF5JWuohBI0IwjZS+6NHRp0Zc
         PuXwN1kJ2aWVcJAVaBMR8IA8N+JcdJqd+qx4lZYX+8r+ynN0sj6Owv9kj0VJp8f5bTzQ
         GIWtiZ7KOXxI/e5NUrg5xIeylyCMr7GyywON6EYiFx3S1D965AQmdS6wSNJvVptNlJHb
         6/Mcmaky8j+3618TGhdDL3mkb7G5azCYWMV8u+xv6AuvVUpi01w6MK2LRTl5yfNC6nBL
         ovZg==
X-Forwarded-Encrypted: i=1; AL+hErEsFQxC1b03++Y+nha8SPoVMUZ5FHTISQTzbTy1CktdAn8imf6zhRWFJBdzLEA3+Do1QO661FBRnCuHlPr7+3xD@lists.infradead.org
X-Gm-Message-State: APuU4Z8+FhyjKs2TP+dMOiVFz15lzxE3AuKCmEyg2ZEwbEH84OxZWBno
	1NSV0mVLNilyL25uu8K+WnIRAaax28KEfaLG+D2S2Q5Kd0osXiaz+ZgI
X-Gm-Gg: AYBFou0RdMjZGlgWYN96qaWcFbPepTSOmIzRjMgNw9YlfjDOUWSlDMl9mO9ywEivHFH
	T1nGakYDJ3wum7q8unih+cXvAj4ioWCX2AEO14WyaiwqG1yoQkS1RQBP2SXi9sJLvP80WHkALIe
	VUE8W/rl0xbzEPY+D2zRBy9ss3kbLzdZh6hCCwOFjNITvmCxps3mX1q6IpwzznEC32eQuh9R6NZ
	3mLEXa3QuBtllzo98g90TVcFWU3VBczsAJhAT+VP9DdVCSASVJ2gUGmRBoxv0x1fyVUoK033cAa
	vdqY8C+p5+W//vdoXjpK0XMO+OKMKZL7Hpmv7dq2Hy4KYqIQIFwJgE2snebzVSLmeqjckxVrDi9
	rU3T4WDZ7KHg1BWDVCHDmdPi8r3B6gK0yDibH9dk/T3oUNg0KZB2F5Mf5AOSHmLaNoPvF8dvfbv
	CNnHjwDHoblUeg00M+lsxcyd3Nm0DVnSyWkLXF9pGnyjzaRzlRpEGUkmJZWqmlHfiVEBz/CUBhM
	zD9uGDW8dbWkKwjarbuKFuMUxnTkqkFIdzvpR6Ia8oIu1FWgz8fShe1uCHAf9DSqFPU1jkq0SEu
	AOHtfPeLNmGEZna+91XVe/8zrRPuhfSV0hCKTMtNjLq5RQVHydlc+e/BFWKLA3iObnLIVjMp5+D
	7QygdEahvvtGsuEE+cdhk
X-Received: by 2002:a05:6a20:3815:b0:3f8:fc10:f77b with SMTP id adf61e73a8af0-3fe84102e03mr2033878637.0.1794981355696;
        Tue, 17 Nov 2026 21:55:55 -0800 (PST)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5ca5bf959sm569563b3a.20.2026.11.17.21.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:55:55 -0800 (PST)
From: Jason Yang <jason98166@gmail.com>
Date: Wed, 18 Nov 2026 13:55:16 +0800
Subject: [PATCH v7 3/9] phy: rockchip-samsung-dcphy: Unwind power-on on PLL
 lock failure
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-dcphy-rx-v1-v7-3-8de1adac3a74@gmail.com>
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
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 Jason Yang <jason98166@gmail.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794981338; l=1650;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=W4uqFjWfli07BWEGnXyu4qteuMVlaJHZHz3TMUadK50=;
 b=m7mXviKej2/0soFdmjYmH/XiRdXYaK1GmHksA4I0n03fIHctRzeTS9lVuu4DW3Gbc47NJvzGM
 7LSU94kNnpNDWdZ3aC5c+qp1M/C+VWAcJCPLR81h+FNtfxK0ZNnu2+8
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_215557_007780_EC5016BE 
X-CRM114-Status: GOOD (  14.67  )
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

samsung_mipi_dphy_power_on() returns on a PLL lock timeout with PLL_EN
set and m_phy_rst still asserted, and the PHY core does not call
power_off after a failed power_on.

Today the APB reset at the start of the next power_on cleans this up.

A later change moves that reset to runtime resume, so the leftover
PLL_EN would stay set, and regmap_update_bits() would not even write
it again.

Unwind the power-on before returning the error.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-phy/sashiko-outbox-174059@kernel.org/
Signed-off-by: Jason Yang <jason98166@gmail.com>
Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
Tested-by: Quentin Schulz <quentin.schulz@cherry.de> # RK3588 Tiger CSI1 2-lane IMX219, CSI0 2-lane OV5675+DSI
---
 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
index 7382043e1f31..ce1bc62497c5 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
@@ -1343,8 +1343,11 @@ static int samsung_mipi_dphy_power_on(struct samsung_mipi_dcphy *samsung)
 	samsung_mipi_dphy_clk_lane_timing_init(samsung);
 	samsung_mipi_dphy_data_lane_timing_init(samsung);
 	ret = samsung_mipi_dcphy_pll_enable(samsung);
-	if (ret < 0)
+	if (ret < 0) {
+		samsung_mipi_dcphy_pll_disable(samsung);
+		reset_control_deassert(samsung->m_phy_rst);
 		return ret;
+	}
 
 	samsung_mipi_dphy_lane_enable(samsung);
 

-- 
2.43.0


