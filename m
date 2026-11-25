Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BD7606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 14:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=n9poMGO/;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=abJHWcGg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YYfMAbauZ3UyOtNrmZ1+mkqTtdWQRKsrJ13JpeqSsZQ=; b=n9poMGO/PCE9IC
	ut1EurnDy3PLTj0nDvucAg6sL+I4E+wOefIYgddBG/wP2H9v5l09PC/MBrynd+JWa38Df3Z2bQ2o3
	tQ+JYDVaULnW2tCb5NXktH44d9eNrbOFqw0wYnW9Iv/qnT2kSXROSmAlJNmS0thKzu47GKXlfj/TL
	VKkN4eSSKbfeTlwbZ7qxsj6CmUzFIuuEWSI/o6WUKLTxxa/GvKyCd7dyKYXd5wjmhVampqDOR7b2q
	i9kK5TPraHgTC60QPgInKD+9zkX/XJlDiErswEvWjX/+yyTtDD9Y6zds5nQmPT91TWx21DhFAsZbH
	o7BqEvOxmc2AbasmTuZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEQI-0000000AGay-0kci;
	Wed, 25 Nov 2026 14:56:40 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEPo-0000000AGMb-0mc1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 14:56:13 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-4aa5833c263so5655379f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 06:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795618566; x=1796223366; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YYfMAbauZ3UyOtNrmZ1+mkqTtdWQRKsrJ13JpeqSsZQ=;
        b=abJHWcGgLu2cIn890TjMq7tcOfBAOXrPdohmoCH8z6lt0VL91I5SVsxuUhq5Tqhr4x
         HVh1ecnD9fv+rj/5wZTwL3QoD8edbxZ//qEwFuJMKlwLtZS9U2QwVfmiCfSorthrfZhv
         eHZ7GLHk0aRJucA0rOhJy15+bxCLt6d9iPt7omLOgYzzl9vTlj5rHnYM+f53AToYhRca
         SSSRl+BnQE6BAoYjziOX9HDSyK8+/BrV7D/CsSOGKpSm0UPDvaoINuWGpECHhNbN0DVw
         in/rJT+dtKtvD0KdDMLmyAOMGqO7ZXpB0nUeqnMi8y/bpLbxjwX5IlfxnE7kTFui+IHt
         hJLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795618566; x=1796223366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YYfMAbauZ3UyOtNrmZ1+mkqTtdWQRKsrJ13JpeqSsZQ=;
        b=rP0nGkYAIuJl6NyqRMi1R6kZ+FGzaFF7LEjQGLdEaF04qApLEkwk4S4aXYBFaYXZHr
         oAo8IK0RjpdcK8q/7vSQKGhpmk+4dozrb/B2ME/TqsHBaZV1dpBmhagkSxO2gOvDjVxp
         vhpdrwI4HrRbFWP7kPY+bbFfJdYOfLelUVXSlQ9zzzsnDNP511jCda8brSG3isIM7AW+
         ZhIp4uXY3kFAfs4bI/1DiXst/ZGgz9npUPeA8rEXIhqsF/oS6wJgyLZYQA5pXCfdAHeA
         /JUPDt4dFy4e8t91AdPHVDmkuBd5cNNGsd9aRA0woXo7UXMHnDSjhZc+lOm0lX7znsj0
         7kvA==
X-Forwarded-Encrypted: i=1; AL+hErGIGUB9kzVntebYQl2xwTaj/PwTMKKCbYUhJmTz4eML3oyAcIUeYx2kcmYjkDy/KjWsnnuyT3kksRbzczREhnDA@lists.infradead.org
X-Gm-Message-State: APuU4Z/zOJqx21NoRmH0Ge5ho9RDOCwTCmW0Zv5j+pWN/daWxiLkqBtr
	v6e5xf7n2p5k4DA35eVHh/1wuW7HaEaVV/MVhDur5nc1ZxvYnmlSSBa2
X-Gm-Gg: AZFdTZf7xrJwqOz/9eyEAyfTuFDSNa74b9FYkYROZZ6JRWTGoSdfiVV9q8dvAZK/hVw
	R4AK4iiSerm3i5sq4QavnIvaySu781oWTbl8JWajdxMYJk8PXFgVKP0z5lZgWj13uQiY6xMnNEe
	V8HxcLRIpKb6k61viFz0gMUGRzOCpxvnnHkvIWU5Z4kF+94UI5WhRq6T1v4LPQzuT/M8kLlNF2r
	WQYegxvsTTXaM+r91v6pGOhM9Z2IA/bS25Mx66ltfrdAv7zBWiKsMFcA2LNwxG44bhAAvuBhUCo
	TrDvL4CVIABf24mYgiAFIWUImGCHA1Vleo4Zj46JMG7rqaEl9pV6Nd2Jpyw4fGKXTugBHQTgQ86
	T5cCiK/dauJnFgxMtwitpxCexhpf5JOg8DONjMT6h/H9JhMq1X9xK7W3zzLP7CVRyskMiszhjAf
	aE484V5dtQUNeP9Ujilo/0Yioy+YZHd/ZwzilxmzhtRQjMcUiGUU2SDG/M4MSqCMC/h8G3KEeHI
	a4+MFINpAyxWMbweoTFax2fOeTK4Ti6tzXMtBsB6fqf8Svz66plz6vIB8obGS9W/NqsyH0qw7Am
	y49tnG5KV249zOLpL1WWWgPF8ve6eqcf7RCSZBni47s+0jI4qxLnXZkLyKA5+Xwfyma9BUgEORj
	yIlM1bhkzXX/CiqxUmcLiP0xvNqSr9YrzbA==
X-Received: by 2002:a5d:5f93:0:b0:4a5:33ad:871a with SMTP id ffacd0b85a97d-4aba56f470cmr35093956f8f.0.1795618566479;
        Wed, 25 Nov 2026 06:56:06 -0800 (PST)
Received: from DavidArch.internal (catv-78-139-0-46.catv.fixed.one.hu. [78.139.0.46])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b2c9sm36036139f8f.31.2026.11.25.06.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:56:05 -0800 (PST)
From: David Virag <virag.david003@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	David Virag <virag.david003@gmail.com>,
	Umer Uddin <umer.uddin@mentallysanemainliners.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 3/5] phy: exynos5-usbdrd: support Exynos7885 USB PHY
Date: Wed, 25 Nov 2026 15:54:54 +0100
Message-ID: <20261125145458.2594179-4-virag.david003@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125145458.2594179-1-virag.david003@gmail.com>
References: <20261125145458.2594179-1-virag.david003@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_065608_320900_2A684A12 
X-CRM114-Status: GOOD (  17.35  )
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

The Exynos7885 SoC has an Exynos USB PHY that theoretically supports
USB3 SuperSpeed, but all known devices using it only have USB2 and the
vendor driver has USB3 function stubbed out, so we'll only support USB2.

Apart from this mysterius USB3 capability, it's the closest to Exynos850
out of those supported. Unlike other SoCs though, this one doesn't set
the reference clock by default, so we have to set it manually.
For this, create a set_ref_clk_rate property in drvdata that can be set
to a predefined value to set the clockrate to.

Co-developed-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
Signed-off-by: David Virag <virag.david003@gmail.com>
Tested-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v2:
 - Use unsigned long for set_ref_clk_rate
 - (from Umer Uddin:) Error-check clk_set_rate, and fail if returns an
   error.
 - Add Umer Uddin's Co-developed-by: tag for his improvement.

Changes in v3:
 - Add Tested-by and Acked-by tags

 drivers/phy/samsung/phy-exynos5-usbdrd.c    | 26 +++++++++++++++++++++
 include/linux/soc/samsung/exynos-regs-pmu.h |  3 +++
 2 files changed, 29 insertions(+)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 087d552eb511..77bba791212d 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -483,6 +483,7 @@ struct exynos5_usbdrd_phy_drvdata {
 	int n_clks;
 	const char * const *core_clk_names;
 	int n_core_clks;
+	unsigned long set_ref_clk_rate;
 	const char * const *regulator_names;
 	int n_regulators;
 	u32 pmu_offset_usbdrd0_phy;
@@ -1847,6 +1848,15 @@ static int exynos5_usbdrd_phy_clk_handle(struct exynos5_usbdrd_phy *phy_drd)
 			return dev_err_probe(phy_drd->dev, -ENODEV,
 					     "failed to find phy reference clock\n");
 
+		/* Some SoCs (e.g. Exynos7885) leave the reference clock unset */
+		if (phy_drd->drv_data->set_ref_clk_rate) {
+			ret = clk_set_rate(ref_clk,
+					   phy_drd->drv_data->set_ref_clk_rate);
+			if (ret)
+				return dev_err_probe(phy_drd->dev, ret,
+						     "failed to set ref clock rate\n");
+		}
+
 		ref_rate = clk_get_rate(ref_clk);
 		ret = exynos5_rate_to_clk(ref_rate, &phy_drd->extrefclk);
 		if (ret)
@@ -2095,6 +2105,19 @@ static const struct exynos5_usbdrd_phy_drvdata exynos7870_usbdrd_phy = {
 	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
 };
 
+static const struct exynos5_usbdrd_phy_drvdata exynos7885_usbdrd_phy = {
+	.phy_cfg                = phy_cfg_exynos850,
+	.phy_ops                = &exynos850_usbdrd_phy_ops,
+	.pmu_offset_usbdrd0_phy = EXYNOS7885_PHY_CTRL_USB20,
+	.clk_names		= exynos5_clk_names,
+	.n_clks			= ARRAY_SIZE(exynos5_clk_names),
+	.core_clk_names		= exynos5_core_clk_names,
+	.n_core_clks		= ARRAY_SIZE(exynos5_core_clk_names),
+	.regulator_names	= exynos5_regulator_names,
+	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
+	.set_ref_clk_rate       = 50 * MHZ,
+};
+
 static const struct exynos5_usbdrd_phy_drvdata exynos850_usbdrd_phy = {
 	.phy_cfg		= phy_cfg_exynos850,
 	.phy_ops		= &exynos850_usbdrd_phy_ops,
@@ -2929,6 +2952,9 @@ static const struct of_device_id exynos5_usbdrd_phy_of_match[] = {
 	}, {
 		.compatible = "samsung,exynos7870-usbdrd-phy",
 		.data = &exynos7870_usbdrd_phy
+	}, {
+		.compatible = "samsung,exynos7885-usbdrd-phy",
+		.data = &exynos7885_usbdrd_phy
 	}, {
 		.compatible = "samsung,exynos850-usbdrd-phy",
 		.data = &exynos850_usbdrd_phy
diff --git a/include/linux/soc/samsung/exynos-regs-pmu.h b/include/linux/soc/samsung/exynos-regs-pmu.h
index db8a7ca81080..73d9c509dae6 100644
--- a/include/linux/soc/samsung/exynos-regs-pmu.h
+++ b/include/linux/soc/samsung/exynos-regs-pmu.h
@@ -665,6 +665,9 @@
 /* For Exynos990 */
 #define EXYNOS990_PHY_CTRL_USB20				(0x72C)
 
+/* For Exynos7885 */
+#define EXYNOS7885_PHY_CTRL_USB20				(0x674)
+
 /* For Exynos7870 */
 #define EXYNOS7870_MIPI_PHY_CONTROL0				(0x070c)
 #define EXYNOS7870_MIPI_PHY_CONTROL1				(0x0714)
-- 
2.56.1


