Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6B8606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 14:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pmJrpa8Q;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xf2aE7To
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KKiLkuiHStesk5TE8OyB7f604YZ0z47hf89flcQlAyI=; b=pmJrpa8QVRt5rN
	Vx5jj7N8zK8zBn8fIrh8kFuNcjpafYSBgGNy7q0a6gosQyut/NPPn1gX6Mzv3MAiqjYO8l5J8qsm8
	AUA8rGE1Apn7Uptzu5xbweZdzTmRIXoSdHeaG1ZIXMazi/NXV8Aa3XqR/7BXcQVvSQopR5eyHWosx
	uLiS49BrHvBAXntkx9w0bdRzWkPoYeXFdkH+xWlJWyIzl89sU2KRmv6aMJnpR9qP1wQb2VZN5mOTP
	pojpoWxEHrPt9dl6vvu1/Y+Osbo/6Ke1KekekCDGx2eWvChnzaeC8bn2yVvEFXq81VlBqndDyw9J+
	GKOrbjek3U+XOOl6mDXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDud-0000000A96u-0YqC;
	Wed, 25 Nov 2026 14:23:55 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDuR-0000000A90v-02xU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 14:23:44 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-491971ac844so5262953f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 06:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795616621; x=1796221421; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KKiLkuiHStesk5TE8OyB7f604YZ0z47hf89flcQlAyI=;
        b=xf2aE7ToodEBwUeZN9WSrnnEygGCE+UmX+BBXWL1UzQRB3i1eXARcE0SOadmD5Gto5
         WGwo0POMrF55ugCgy03KtTgnMlFVUAfSn4aRevHQ3MCdmk32+4nsrbpPyt6g0UIPq2TE
         2KEhFGpxFIap3IDLvc9OFhKHWhz8rqpoowHUBHYvYc3Gfuzu3DImbEujRsFvbut1DteT
         c9URkdEkaT5eaec0V8bcpZv2QJMQ8mz3VmoWvNsnQa5rfDXqzSK0dC850wbPmXC8TVvG
         ClbhZ7XItOhhwYxCVXwUHM5eVE86hS+ljfk/knD9LEmWqzrl6aV3C5+ASAKtD61w5uOh
         WbmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795616621; x=1796221421;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KKiLkuiHStesk5TE8OyB7f604YZ0z47hf89flcQlAyI=;
        b=ZwKMcuFrrtKpW3wGAzo6dXkrijRLxNcP1j8tt/mY0jqXviUyzgn5y+PH0ZJ2BdcTPA
         yzL6OkCR60BqiHs6FD3G5UjJj+XW8uSsGQ8RU2l7v7qBL8bPVxw1Jd8H4RHZWpixZaNV
         FYOxuFMLZKhy2+cbu7jYJ2Eud6oJaLXaqdiqq6WAlJrW5POEI5ULftD/6YGMq0tCscpv
         FIQXeHAhmL3q0p+8xvcoAS85ieHSmf0OY5McrHFtut49kyzRit3nqqM5gydr+RYu2c//
         rcVxLkoWHYoBOpS59lo6FdO+Z1V9Rqdi5LuH+XOWXHmizcZSiVSrB/TmY29zVaY2XdoR
         KV3w==
X-Forwarded-Encrypted: i=1; AL+hErEmxn/wQMwM3g3DBabmHb3rzylleFZ9fVdo+uhwyQMN1YS8jLPb6/gevqjrIdp4XaH14OFXnAZm/MsTI3cFC+sc@lists.infradead.org
X-Gm-Message-State: APuU4Z8suY65H8SD7JvIkecpoR3XaA8PxeFjI5ZkSsDnMXyF6qOkcKul
	jCAu20X0XiI3cH7lR9KN4d46pd790xMGn4vzs0d/WeXUI+KP8xM0syURrBbdjw9bMXarKhZ8yHk
	KRx7akhk=
X-Gm-Gg: AZFdTZfqpxajUyw3tS/V40R8Z2R09eOKSWM4hSuX4oJOV/Jqmt2Pkdk8FWBvtzv9Hcj
	xTja+OIhAdc1wPMLropTg7NrGZOK4rP6ZQc0XqG9g4J4cgLh5NczfcxPUDkN3InV/NJSezUSieh
	bQQPtqbk6hiBZH4rbdIucpxJPE2wPqEjkJsPxnHDO5CZxxojHwU7Tx7XQGC2s1kFVtulMGm2AXw
	QgMVSSE+RHfSWtA0NPAxJKey1wJmY+NC1MnG7oGsz0d+5z/9Flx5wr2OJRztJ+CDrAk81oBgY/w
	/iSIrwkHWy3Ko3qT4bOpjcguEEfNLQ8JBzPkjOwnHSDJ8dv5IJVp1gGL6CVzD4Pyf8cOXF+iBxp
	P5agrrhP9KFGuHI/BgI8AeOVVl6G9od7VuZ2QLRbhkanmwyhJUi3XukuOBDD4bJyAvlC/ymMTMn
	VBk5d6XV6EEmaoXaMWUVeMas28EVPZWBZYZTrODTWiGvqjxAzck8SB6fi2nZFi7BqbbU+uT5BsY
	FAsB4H5XIlKDjzBW6fzsDzwbOjM2p2KGyF3xX/sfK4gyWwg/1qstVUKpRtkKoKNMeXwK5MPZLqP
	kmCOPhuHQXzaMgICWSg98EYUhUQErv+fqjLPJy50nCdakYa8tq0P2ikBVMihnhbJwyYPxryEvKG
	31xsr9Hb6Vi1X1Xjq3GqmYA==
X-Received: by 2002:a05:6000:41d2:b0:48b:1296:52ec with SMTP id ffacd0b85a97d-4abb0c5d65amr34428066f8f.18.1795616620901;
        Wed, 25 Nov 2026 06:23:40 -0800 (PST)
Received: from [127.0.1.1] ([2a02:c7c:5e34:8000:720:5dc9:500c:65bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bc8ce06sm33638667f8f.47.2026.11.25.06.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:23:40 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 25 Nov 2026 14:23:33 +0000
Subject: [PATCH v2 1/5] dt-bindings: iio: adc: samsung,exynos: Add
 Exynos850 compatible
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-exynos850_adc-v2-1-26de1c6f1717@linaro.org>
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
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_062343_089405_1ED9F9F3 
X-CRM114-Status: UNSURE (   9.83  )
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

The Exynos850 SoC contains an ADC block within the CMGP block.
While similar to existing Exynos ADC v2 blocks, its data register is
located at a different base offset (0x08) hence a new compatible.

Add "samsung,exynos850-adc" to the devicetree bindings to differentiate
it from existing Exynos ADC variants.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml b/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
index def879f6ed20..90a220e3b78d 100644
--- a/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
@@ -18,6 +18,7 @@ properties:
           - samsung,exynos3250-adc
           - samsung,exynos4212-adc                # Exynos4212 and Exynos4412
           - samsung,exynos7-adc
+          - samsung,exynos850-adc
           - samsung,s3c6410-adc
           - samsung,s5pv210-adc
       - items:

-- 
2.53.0


