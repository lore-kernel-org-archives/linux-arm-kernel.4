Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4294606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LL5LWzGj;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QHQJTp2v
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JDAQR0t8kY5iGUVaxptzIa8OAS8vI1YyQp0Tt2BgYTk=; b=LL5LWzGjFx5bxw
	BwFjxUoEtn7Q8KlFRQE5CmSyP7gVEYpj2beKKjDhfV1mt9kf+W1K1MktT6MeGmFdq4KrefKmgbroW
	62KFTHZeN/Fm+4Swa0VJKzopm3Csg3T8r61iaH1bpiEXfVj2YW5WzHd9f2YdX0TTFvkmFShobLLUE
	RLPqM3FQoHMqsVm7m5enMMwkGAUyMyhXzUcujG4yRLKlj0NFYL68JJy6SwRtS/o1mmWG1HLRYfEYM
	LYLGA7pioAFmNs/cw6p4YJs9FweQkkBOqdmAs5GA8AyHIfDIdbJ70/Z35DdMw8ran/03v0px4QNlI
	lvgZJfqpsfbGRcr1RVrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuhG-0000000Fz5e-03T0;
	Fri, 27 Nov 2026 12:04:58 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWueI-0000000FwVO-0itk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:02:05 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so6241527f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 04:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780912; x=1796385712; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JDAQR0t8kY5iGUVaxptzIa8OAS8vI1YyQp0Tt2BgYTk=;
        b=QHQJTp2va/hdUo0pxZ+wBvmDjCmIzQUFAtNWjMvWA5ZW/1f3kUQIUwY66CT9IZO2TW
         4IqouGR+eTxDnQkyvIc5wiuEe9mT12oSvI/iR8EJkOCkDiUJEG6yhKOMbmXPfn9LXye8
         Jy3jvSjdwvsovwri6QrsBBiwxAdHovhrh5/fJnQm/tAL6cMyOR7Q+09a2zjjicTBV3SX
         FRayglBMch4dLmm32UckqKOpvoRf91KhkrVz03ytIskFDT1o4phtuEvYF5DTswt8M6ak
         Up8ItZdXRgLS9xYmdu0RG702y/Syoy+Mg6U0mKmpIyPVFFgE9VtMLzfvdFeBgbqEws8E
         kJ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780912; x=1796385712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JDAQR0t8kY5iGUVaxptzIa8OAS8vI1YyQp0Tt2BgYTk=;
        b=hcW4WMALTTWAhwd2nz/1tqSPV8dhwQVaA9KbEieOvuOVlnGSCNDopiB7VT73RVFbRR
         i6rwEM5SY18RyCbvZZeJ4PR1SWJ8i6vnvD83Pbd2XHC1vXXB0Dm29+fu10FaNIbIAPJa
         SPBzIRrbFTuHmKOPwGJrsTkWCgJervleDEXNKfJYHaUe7u6Ptd0GtyJqp+/WS6RS2KJK
         STGnHlIBCBl7X+rhAIknmFFcZFGC/KClfGUqNAOPUf62M8B+AnjOmTxCZw6W6t4Rt3bg
         +jfhkd4nVDLrAbE/wq8uNCklJSWxRvYm31fPaQztg4k7yxDceQ+mtjqRrt+5EswMlJIG
         t0VA==
X-Forwarded-Encrypted: i=1; AL+hErG3pwwMZsAd8g4p2El7iyK45uBVwWM0UgoxyXCT6e4cj8EBkHR5MaviphvIxmXs9M9xT61PT9umU7zeI0AP/uzz@lists.infradead.org
X-Gm-Message-State: APuU4Z+dbZPOInMNmqrY3VlIWXMHlmqDCzE+Gffk84Cg2JDiFTP2t8AD
	BZLpQLyFgy+2JHKKOHMPC7YRSEEW4gnczKXCc2VfBQbeXUpPHzP/s2Mb
X-Gm-Gg: AZFdTZc1htrD9qH6sJJDhs0CExnFlOqJOD67xGxcUmTAmsCmQR7sT+ZDf/N+07I30dM
	6UgZlGqnhURY4TL8az5+1o3F6CkcnYd/18m/q6ZAdfd02DBfS1bUN87U38fHCX2jb20LRIZMicG
	sZNQB1MfJUm858uZxVZWRFLlSUg+i/EqZCk6qf3xH2y3t21iv0NfEqw25RIGyKbNHEPyXh+A3Cw
	bWOGxYRzwXTjlntUjS0HMZFC2/2WcJ9q0f+b1fRWp5DVtiwIFKzb46ai2OkWodAI1l/FPHR/yrN
	Cxq0/s19xk4aj/P57GEnJFlEBncQ79YjgDr0KYNslZUKcpCoqg5zUy/4X22PDaASoVgBWJfWQRa
	fC6P9GLmaXQRL2g1wCfGGlK/zFu9B86S4sWfwDZhicOmcXafN2NMc9AsVgn+efpD4sgkP8iXXdb
	+9qGH5THqYmmzaGHywtXDvIGZHlWOrtW9EZCm6FmQSDAJcWa6xH1U7KjkQrjIT6JDDWSiOlgoLN
	ls7237sby2lHp4lG/OcHswhJiKVxjghRm/YgdK5R4Sipo37vReVOWHvdIH6Do0Axah+Xpu78EFj
	/TffCqj8z54pfZQWCgAsrtBRFkyvP15oG4JwRh5+WXsnFjk=
X-Received: by 2002:a05:600c:5303:b0:4a2:1a:a11d with SMTP id 5b1f17b1804b1-4bb88785d24mr475302715e9.0.1795780910582;
        Fri, 27 Nov 2026 04:01:50 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:01:50 -0800 (PST)
From: Jose Nieto <jnieto.alaber@gmail.com>
To: Corentin Labbe <clabbe@baylibre.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexey Romanov <romanov.alexey2000@gmail.com>
Subject: [PATCH v14 17/30] crypto: amlogic - Add support for A1-series
Date: Fri, 27 Nov 2026 13:00:50 +0100
Message-ID: <20261127120103.1532882-18-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120103.1532882-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_040158_717086_B915E8B8 
X-CRM114-Status: GOOD (  11.40  )
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
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Alexey Romanov <romanov.alexey2000@gmail.com>

This platform data also can be used for S4 as fallback.
Tested via tcrypt module and with custom tests.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
---
 drivers/crypto/amlogic/amlogic-gxl-core.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index 08d89db14788..3a6bac10bb04 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -298,6 +298,14 @@ static const struct meson_pdata meson_axg_pdata = {
 	.support_192bit_key = true,
 };
 
+static const struct meson_pdata meson_a1_pdata = {
+	.descs_reg = 0x0,
+	.status_reg = 0x8,
+	.setup_desc_cnt = 1,
+	.hasher_supported = true,
+	.support_192bit_key = false,
+};
+
 static const struct of_device_id meson_crypto_of_match_table[] = {
 	{
 		.compatible = "amlogic,gxl-crypto",
@@ -311,6 +319,14 @@ static const struct of_device_id meson_crypto_of_match_table[] = {
 		.compatible = "amlogic,axg-crypto",
 		.data = &meson_axg_pdata,
 	},
+	{
+		.compatible = "amlogic,a1-crypto",
+		.data = &meson_a1_pdata,
+	},
+	{
+		.compatible = "amlogic,s4-crypto",
+		.data = &meson_a1_pdata,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, meson_crypto_of_match_table);
-- 
2.47.3


