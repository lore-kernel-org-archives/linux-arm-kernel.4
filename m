Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48F3606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 14:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=e+vo9+Sb;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gnhYRruN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0/aFPQt49ikbeQUDeEJ95DjEIDG8hIXLsnOyjwQr970=; b=e+vo9+SbPtGScf
	OniWYXFqwS8FEYp8ugcS5uDyoJIG7ZNDjmQlQJT9IBDajjmnyAVP/yAMLGNsd0efqZM7/BjHbtTTH
	nLDWmixyKdvVBITjqtLhGKt4j8EhSdQh9pCGDtjosb8/hD01gX8bdAHrZDJoswAnZH6/xiHy7jfvZ
	EssoijuvOb2xnG6vv6v6R3Ckp5DSxW1KJIeDxdVJzkVjGKnJChFRizbJP3yQ5HOLGe44Lox+yXGkT
	anCf58YaQj8zCQCriYItosEjvkjGpEZ0ZSgslVQdPOew0/bpR9jW3teDACwBBbmHvpxYIi/ojUspN
	zFbGWT6/v20+xS/THzgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDud-0000000A97K-1gKh;
	Wed, 25 Nov 2026 14:23:55 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDuT-0000000A91o-1Y8d
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 14:23:47 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso72561405e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 06:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795616623; x=1796221423; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0/aFPQt49ikbeQUDeEJ95DjEIDG8hIXLsnOyjwQr970=;
        b=gnhYRruNlj/aAGdizFhYwVVLn8niCaJx76in57rquQSAFtwTNxfZ9YVlqfNj5aL08q
         +rCfbIobDvqLIp8DEQhVmENblJZzupdEO5dpACYusO1VejBXH9rm1TcPZWR1edjC+Wq9
         b/hPTzOQUC5E83Ck8J758x4PrTd8GfOfkUavanNotu3K3WLAwE6b3XF7cNmc88Uz1JeG
         eOtW6aRWJqgCVIvqQV5AS1MfNWM54hrHJVcT4nf5hzZrh87EnL6Qkei8dhLlc6oGPvbT
         RmkH0g1Qt6qe1oZ9qu2EU0hJRQGVcO0EuHoRpXp36VBmH7A3Dle/y9g2I8I8jsJVcgLx
         peBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795616623; x=1796221423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0/aFPQt49ikbeQUDeEJ95DjEIDG8hIXLsnOyjwQr970=;
        b=HOPENhqjcf+fdkTEo/zpUBdoMZqFwomPrC/FPzDsQebxmoNmzW3VFHTA7TqA16373M
         gNPelopLHWPjKJvyz+WCv9uXwmN+MrmoBI+0U8fe/A+jeol4mY1R/ZOtN66msM5Ow2Hx
         4D8VdijzLjE50cfzV+5TpmBXQ+cA8pvGDM8wSDEZiSxBqv27HAPnD9Hg+9V8g8qC18HE
         iYQcgL7Ymg8qmN7kWvarDsGX8FSpqxkQb6gl3T1XiCD5M/r3i7c8fFT/TDV+y4xzl4oB
         Dwo1KLcTRUP7jacOtFuqH2F6Btd7qbpUH+0XSOPYpauT9xinGi/ecZT6SxHA+YXAqhT6
         5/fA==
X-Forwarded-Encrypted: i=1; AL+hErEHrY4vAgyCr9g/cmBz9BvvczPdsxntGbAqWjYUm3c9AZtvyYRItdbUXNSbituSUzCr2n98z5D7aFqRHFhrXgzq@lists.infradead.org
X-Gm-Message-State: APuU4Z+lMAK61wWMhLIXPTSBlgl3x43S2ADrzuennOr7BV02oSCn08Ju
	6Fo2O5Vg9+POh9EqJG0dpMiNdEgv35YjR+9+Tqc0H/QfaP4WGDYrwvl1Ywhg2OwsYcg1w03VYD9
	Q1PMPLAI=
X-Gm-Gg: AZFdTZft0YwcoOvXW2UjN8DnD1Amnk0hvQ5pkaA/rwwPt6gjien1N1FomFGzcorMGv1
	1EydGiy/CdY3Z9TYtod3HeoWXqqolUNZbAOHFgKOhhuJEOfQS2zQ+d/dgtpOBu8x7m0giDYo4pV
	RSf2ZAq1ZLC9BfeV7x+U/lsNfJFq3zyxmO+6IdWX2EwrVA/NywVcxxVwtl/GJOyATfP4FzZ2S8t
	S1kz06pc1Bov1ER6fFy3MRg7unr8XLJLBbI9mdiHu61rsnaVfhWyFgyFDed9Ay9oEpOt78PMdLP
	FY8ArGmxLNhAxBET3E0oLhecVCql5f4syUdfFm/6c3cP3fz7maXoFMU4QdNmIxNSwcwl4NcVYEY
	YbI1bLk4OiVlzLbGTNYOgHLq/BEICTSAYdhZqG45uxMGlI89HzKdZAzgt7NeH6GcJU1Wrz/T5QB
	fxxQ5J1UTnqZVAI+RDFn4waFeKAaXRHsTIWEcnfhhBPDAQLJKgYy0ifZfBfY7HHsDj3ozuWA2YX
	+h/3QstwTjNOwqOBPjk+Mp6TmgWtvZD8blo0+dHYJzwkBjfUsWqYNDhLufEsj3hs/w32Y1opiCv
	6dFxGefc5To5TTqr+pGlU1ZKeV6c96OuFwoPeIbjAN0894xqUBWySbeyaqPR8Le55dLRe5jSgb/
	ws4mW54/qd3Y7i4w1Ugiuzcg=
X-Received: by 2002:a05:600c:3ba3:b0:4bb:6118:4c9a with SMTP id 5b1f17b1804b1-4bb88819940mr421222855e9.30.1795616623233;
        Wed, 25 Nov 2026 06:23:43 -0800 (PST)
Received: from [127.0.1.1] ([2a02:c7c:5e34:8000:720:5dc9:500c:65bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bc8ce06sm33638667f8f.47.2026.11.25.06.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:23:42 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 25 Nov 2026 14:23:35 +0000
Subject: [PATCH v2 3/5] iio: adc: exynos_adc: add Exynos850 support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-exynos850_adc-v2-3-26de1c6f1717@linaro.org>
References: <20261125-exynos850_adc-v2-0-26de1c6f1717@linaro.org>
In-Reply-To: <20261125-exynos850_adc-v2-0-26de1c6f1717@linaro.org>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, 
 Sam Protsenko <joe.skb7@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_062345_435149_B7722245 
X-CRM114-Status: GOOD (  13.09  )
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

The Exynos850 ADC controller located inside the CMGP block differs from
other Exynos ADC controllers, mainly in its register layout.
Specifically, the data register sits at offset 0x08.

Add the exynos850_adc_data struct that describes Exynos850 ADC ops.
It also requires its own hardware initialization and exit routines.
Add them as well.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/iio/adc/exynos_adc.c | 50 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/iio/adc/exynos_adc.c b/drivers/iio/adc/exynos_adc.c
index a1124a418f29..3e9b5d28b922 100644
--- a/drivers/iio/adc/exynos_adc.c
+++ b/drivers/iio/adc/exynos_adc.c
@@ -46,6 +46,8 @@
 #define ADC_V2_INT_ST(x)	((x) + 0x14)
 #define ADC_V2_VER(x)		((x) + 0x20)
 
+#define ADC_EXYNOS850_DAT(x)	((x) + 0x08)
+
 /* Bit definitions for ADC_V1 */
 #define ADC_V1_CON_RES		(1u << 16)
 #define ADC_V1_CON_PRSCEN	(1u << 14)
@@ -410,6 +412,51 @@ static const struct exynos_adc_data exynos7_adc_data = {
 	.read_value	= exynos_adc_v1_read_value,
 };
 
+static void exynos850_adc_init_hw(struct exynos_adc *info)
+{
+	u32 con1, con2;
+
+	con1 = ADC_V2_CON1_SOFT_RESET;
+	writel(con1, ADC_V2_CON1(info->regs));
+
+	/* Bring out of reset */
+	writel(0, ADC_V2_CON1(info->regs));
+
+	/* 64 times conversion */
+	con2 = ADC_V2_CON2_C_TIME(6);
+	writel(con2, ADC_V2_CON2(info->regs));
+
+	writel(1, ADC_V2_INT_EN(info->regs));
+}
+
+static void exynos850_adc_exit_hw(struct exynos_adc *info)
+{
+	u32 con2;
+
+	con2 = readl(ADC_V2_CON2(info->regs));
+	con2 &= ~ADC_V2_CON2_C_TIME(7);
+	writel(con2, ADC_V2_CON2(info->regs));
+
+	writel(0, ADC_V2_INT_EN(info->regs));
+}
+
+static u32 exynos850_adc_read_value(struct exynos_adc *info)
+{
+	return readl(ADC_EXYNOS850_DAT(info->regs)) & info->data->mask;
+}
+
+static const struct exynos_adc_data exynos850_adc_data = {
+	.num_channels	= MAX_ADC_V2_CHANNELS,
+	.mask		= ADC_DATX_MASK, /* 12 bit ADC resolution */
+	.needs_adc_phy	= false,
+
+	.init_hw	= exynos850_adc_init_hw,
+	.exit_hw	= exynos850_adc_exit_hw,
+	.clear_irq	= exynos_adc_v2_clear_irq,
+	.start_conv	= exynos_adc_v2_start_conv,
+	.read_value	= exynos850_adc_read_value,
+};
+
 static const struct of_device_id exynos_adc_match[] = {
 	{
 		.compatible = "samsung,s3c6410-adc",
@@ -432,6 +479,9 @@ static const struct of_device_id exynos_adc_match[] = {
 	}, {
 		.compatible = "samsung,exynos7-adc",
 		.data = &exynos7_adc_data,
+	}, {
+		.compatible = "samsung,exynos850-adc",
+		.data = &exynos850_adc_data,
 	},
 	{ }
 };

-- 
2.53.0


