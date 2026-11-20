Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F093B606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 10:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wvKL9L0/;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=WfQ2ywv6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vHOMPFBnuW28mRa7isHb3MCchoH5mvXwIUScVxLLKUY=; b=wvKL9L0/BZP1kI
	peIngkVR2UnfeB3ewttdVkYKJ5c5+NBbUnC5wKsDyG4aAMFgK0So+IdyqLZjdd5J5NDAnyk7CcXu3
	pWho9pmq6vWTOidLXesuMT1HNCkhXA9yBU4kySt/v2Btd0oMWt7vP+eJ6IL4XIDmDfB0yRLtDt0JT
	QpUyqvnKLHtlN+14hOOhQG3TKt8uHwfL9iV7zbpu5CahGPgV1M5GP152DEQmdSHF6Wm926vbzXooH
	2k5N+O4FLGbqf1Wa5KggXfk7D294nsgWXaDOQycHlmpocL6z4OUL2IbK2ifIOYy/Gc6OtQFMe6AnQ
	ojhF3zhjuCjJwzFs37Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMBb-0000000Ef1Y-2IM8;
	Fri, 20 Nov 2026 10:49:43 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMAN-0000000EeUS-1ePM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 10:48:36 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so6479915e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 02:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795171706; x=1795776506; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vHOMPFBnuW28mRa7isHb3MCchoH5mvXwIUScVxLLKUY=;
        b=WfQ2ywv6w24okio4vEvjnbBQ6RstlVT0er/6SVddYkfKouMU3ttEc1RC0z4Q+sF4FN
         rLaUcLN/0cumAcCEL/RiXxLHA00chOald6xJj7OA+oMpVvsPYsqP40nXgRZPnx733XPP
         u3bcssYQBdLHJ5qU63CKxzeDKZDS0Jr/iR1csgmYXGanaWQx6y43vBsv78DeX4V9t1qR
         z5leh6LJsSee/Qck9TNSTTwZ8zpYYzg1jiK+P6iL5nDgC48nXX8zXoLDxLzJqKTYDq+E
         aeVsKl1GVW3eOmRhwuGXchzBrP1fkeK9tZoH643SqBMrbkTRN9CVIKcgbB1VrqagKYRa
         ARlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795171706; x=1795776506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vHOMPFBnuW28mRa7isHb3MCchoH5mvXwIUScVxLLKUY=;
        b=0Yo4qONX/CgE2inYQmoXJOVYVMM/1i1oLDNjGrE2rqwvEQ/of59BmiCVjPfnLNcDE0
         rEmTi34JvW8tm4tueGzr5qcKU4rK2tHV0nSo5J56LujrSkzgQF99yx5Hc/2o2UX8LZuQ
         2e7kY5lx4IZ4j9qlXLcUOfl9241pfLeGVp6ywGTgK5lMlbcriMAKjEfQzQflu7Ls8EIg
         kSgKUf6Yj3nsLY3Ix8gNuhv8wfccl+0Je+7gK/MLW2SsmPBXf2oj2alSTZlUQH4XMrvT
         qZduu4swUgKhvbrLywxqPw14Q5ChNsNdjolVkRFwvLfhLghGsr4SdQNJyUVatlfiqU6L
         FeeA==
X-Forwarded-Encrypted: i=1; AL+hErGY9tuBL0+/t6k9974yYVGM9ddybMgemaY/lDJE/ty6RHgd+SoWF2Dh2epFpIJPaSjX0tp+ERqSwcE6ROxTIBib@lists.infradead.org
X-Gm-Message-State: APuU4Z+6ORsQCn4KFGaAKGTNk+zZPBT/5Lpz8ogy6g+KyU2DHkmcK8Lh
	+4aKYdKRpoigXDrrDri9NH/CLLGEdeYA0JU+FAri7KWb6rfBCsKZsTFQdX/VI910S2M=
X-Gm-Gg: AYBFou3kgcZI2vvSr4Mz87LHf8Ebyh5RlEvqWx8Po261tZtFUcvSWlFX8x0Orl/TCr2
	GhSccMDsTEmAmP9rWZJpbp4DUZ7TJfMUCUmuaKp87+YDM533Nnj4gAncuo/IPtojWHNrKcppXKK
	Msc49o7HwZTKTpy4MxGcQQt9Arx9/lJ3xdlFmTY/MzHYmmd7Wqyb9+UyiY9W1aB8/s5rjv3pxGy
	qyWz7ugl0ancmimV9ceoSKaR/HT7Ifasxuoaj+f8qU16d8toUIjLSfJt4puHOM+ymN+uo5JVSFs
	3B16Ue/Eq9t3zew3bd9rTkgBxj9fvhO5fWlYfzvnuNtjlzgyFTk2C3BavjynCbRugWFbZZqCp3c
	C2D5ZDaBw4twjKMg7XvbZRu2H0649VEN8MjSesZVNmUpmTwDkjpCaZXz+X2HbXQb7y14UMhWRBg
	xU5MJFl1+2cJqSWX6GiV35LST9U4rii798HlijPGBNACegTliQojfAGu58+O0pQj8+kfSpOcoWp
	qjWk/9g53fxalB7z38wfeXEBUoHzf5vY+2cM9DthXYb04/BxncMcUkcMijLsZeXYcDR5sPgBgzu
	vaomnFQ1oevmHjSeTamT+QdcSx6ZftpWE+5NEitUyalIugXzySTjKwSk7QMOUc9vU+V+CzFLnbG
	NdKfJS/KK
X-Received: by 2002:a05:600c:310f:b0:4b5:d95c:2378 with SMTP id 5b1f17b1804b1-4bb8881f9b7mr60419825e9.34.1795171705813;
        Fri, 20 Nov 2026 02:48:25 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f14f1esm38161425e9.2.2026.11.20.02.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:48:25 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 20 Nov 2026 14:48:12 +0400
Subject: [PATCH 4/7] arm64: dts: rockchip: Enable ALDPS on NanoPi M5
 Ethernet PHYs
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-rk3576-phys-v1-4-6382cd14e3dc@flipper.net>
References: <20261120-rk3576-phys-v1-0-6382cd14e3dc@flipper.net>
In-Reply-To: <20261120-rk3576-phys-v1-0-6382cd14e3dc@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 John Clark <inindev@gmail.com>, 
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1114; i=alchark@flipper.net;
 h=from:subject:message-id; bh=mpSxx4bNJlZdRiHhmqkwGoKjmGi2UpOvN6mAhYr+h88=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQzqOZ22986VC2TrsfYesTwddY5Pl2m7E/WRlMcz3/8L
 Hon/5Jmx0QWBjEuBksxRZa535bYTjXim7XLw+MrzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFMtW8jwv+D+z+mvzY4/XMlj+qo5foPYLQafoGdKslYrpx6bE5s9ZQojw6oj8hO
 ibt/mfDRDkWHXpCk/AsrXzJrwWoUjMahO8NbfUywA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_024827_691476_D25AC942 
X-CRM114-Status: UNSURE (   9.37  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Let the RTL8211F PHYs power down while no link partner is present
(Advanced Link Down Power Saving), which a PHY leaves disabled after
reset. Both PHYs are also strapped to stop their PLL in that state
(PLLOFF), so an unplugged port draws close to nothing.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
index 778cb8181639..638e00b6e165 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
@@ -812,6 +812,7 @@ rgmii_phy0: ethernet-phy@1 {
 		reset-assert-us = <20000>;
 		reset-deassert-us = <100000>;
 		reset-gpios = <&gpio2 RK_PB5 GPIO_ACTIVE_LOW>;
+		realtek,aldps-enable;
 	};
 };
 
@@ -826,6 +827,7 @@ rgmii_phy1: ethernet-phy@1 {
 		reset-assert-us = <20000>;
 		reset-deassert-us = <100000>;
 		reset-gpios = <&gpio3 RK_PA3 GPIO_ACTIVE_LOW>;
+		realtek,aldps-enable;
 	};
 };
 

-- 
2.56.0


