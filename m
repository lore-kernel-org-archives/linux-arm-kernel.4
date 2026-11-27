Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF732606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fiUu83yD;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vctbPqLh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KMyqFUlA/AvT12hLb9IrqwnM+Bo9I2ifCE4zJcXn8o8=; b=fiUu83yDe8KAzG
	z5EqjCCZ84tUeDM2wOP2yuSi3Y0Qlcn1dAuYdeAAsSsc4OSk7xrMLYzSMotC0r126IdES8lkTRxfB
	77AgKOI66XAtE0va8Xjoa8y7hQgQEu0K7SQT1g5+YPEM6tN9OviZgbxRy+Dvvsug345K+G4Z71Qqn
	Dzpuaj8NzzbO7njEFT+FC+Uskh1Q1wWjioNxfFJ1fTNuqc9JQKV9xl4KEtqaG1IoOfd9hV3EMvZ2T
	jG6TcEpnjY5fHlhNpc9nt6z6XvGirP7AT2G7FUlOSULDzSz41D9fqmz33bOPSnjx0rh3rvvmiyqIZ
	fJQLH8FfOjwbUvkWnbgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWueG-0000000FwUX-2HaI;
	Fri, 27 Nov 2026 12:01:52 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWudr-0000000Fw7w-2Ulm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:01:31 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so85068235e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 04:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780885; x=1796385685; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KMyqFUlA/AvT12hLb9IrqwnM+Bo9I2ifCE4zJcXn8o8=;
        b=vctbPqLhZGzbHjzCswUGPvV3BOM55W85WRnXmU8oKzHfTbOHMuS0FMQOkg/aT7cQbX
         +Ber8ptT5+fVA7C+A3ITriaID9Ha99GIVFHZEeGVNnmRMGSN2F1McxOeLu/ITvjhJv7m
         9F/rq+U/q/Q4AzC9+oxF4sci4YahhFlEp+bVSZgsZ3qt0F/cFk0yt3D+GTpkP600S/hw
         DWN61cjL69iWvOgenEGK0AaJ5xSGwBkvRaPWMaAlDPynClc+nzX9yxvH4gkNaERf59gs
         /NSOfIFYsgD56fbtPQL3eGd4M3qFjCOGmfJjP4BclX9E7GcOhZHRglypL/4jTihuJ+Zb
         0BHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780885; x=1796385685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KMyqFUlA/AvT12hLb9IrqwnM+Bo9I2ifCE4zJcXn8o8=;
        b=lXrXmiRosv4VZ4z1P0Rgw/8ZTThZh7lEInN7CoA15j6kL0a0bI2jznG+kDvIbreYQO
         6NgIxjUnbzbv8MVBhNVQxv6FxHz/T3AV9UvtPV7r5n2X4VEl1RNmMOHsMPrXNkbOCE6g
         BKnoETzyqbNoIrQNQfjUtKTY2kFv9pRBpee88WuDjwwYOI1/N2DEv1trZOdwUGWiq1iN
         yD0Yn1JIpcvGHgporBxXQCRIE0k/Ns5mI3cyG235bEvlUSTeW125PTEVJr9KXesQINcc
         r0uY4bWhLKigKazprY0DCx1OM1N4rcnsaUJHeDqg1qUsEPuLtztPKdPGxifeBgp5Csdx
         Xqmw==
X-Forwarded-Encrypted: i=1; AL+hErEGlsaRl1au4xo2A5jdWBqM6PW5DSBsfV5Wc5Rm72qLgTJ/VBI7jmTrhxSOGTBNYmkTCO8I5Zegx61ztsFZ3VD2@lists.infradead.org
X-Gm-Message-State: APuU4Z/8zLwSJEkMz+BluczC7b4P0WNsQF7grf35GEOBNCghVRSaJXhM
	uEihGrZwGGVWmAwOKGyobONSjv7B8lXwW2tWXb899gUKd/7tn70enrC+
X-Gm-Gg: AZFdTZe1USMgsvCXSih01eNsaAUl4pf9DxXdm05/q8rG3/+hWPDcA2Ii9J/7EAHqzjM
	+5hW7FDkeRBrk9VhvHbZtI5xVu6BvsZhNd3cAXXfGZh+RO6T5d/oFfNAE3gQlVDM1kaHJdvmQjM
	Jzu9Bukg3idDbQwF/oj1IMpK3WRQhhYoVS4HCd5yZO+45NDrRn3tlXxpWUjvLqmZEI+bf4ga2Vv
	f5s4YIcrmuXvq1eCDQ1iZNVx356izhO1uo5YrPN8ONIT0nWlCT4Du9sKIYa71lgPzVwD4WDm5Wh
	e6DCT10rUz+LZjpULGintCyIBLoUmnheR1TW87L5qO5q5Zahjqvci+Fz9FpIR3d5TFNN5UtKtMz
	ErZj19d2ZQ3sZFvFvr6lROoOs1oTAUjomJSlntwxFjQX15IdJ5h+YPPMsUjn7yjFc4N1Iwc4BTy
	HmSDFNGjBfwIYKsKNXZmlnz5zT5IcPqZ3M4X3OmLycUoJ2ZoPMeF3B4mJ54GTrwV5mm5LU80vup
	b75H7Ni8sA6Q1gVnLiXKFtW187ntiEzlmb8UW8C9zG2znapmNxsAmCR7t2ggZUv/w8wls2TccC4
	o9TvAWb3hzPYT0SkkxIyh7Fa32ttpnmzLOMDhxc/Su79YvmWptV/TNHnWS2f+AsfnVx/
X-Received: by 2002:a05:600c:1548:b0:4bb:7347:d5df with SMTP id 5b1f17b1804b1-4bb88814405mr505901515e9.13.1795780885387;
        Fri, 27 Nov 2026 04:01:25 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:01:23 -0800 (PST)
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
Subject: [PATCH v14 08/30] crypto: amlogic - Drop status field from meson_flow
Date: Fri, 27 Nov 2026 13:00:41 +0100
Message-ID: <20261127120103.1532882-9-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120103.1532882-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_040127_668739_6138032E 
X-CRM114-Status: GOOD (  17.93  )
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

This field is used only to check for timeout. But there is more
convenient way to achive the same goal.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/crypto/amlogic/amlogic-gxl-cipher.c | 13 +++++++++----
 drivers/crypto/amlogic/amlogic-gxl-core.c   |  1 -
 drivers/crypto/amlogic/amlogic-gxl.h        |  2 --
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index f6c13d8fcb47..cd94296e4d9a 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -228,13 +228,18 @@ static int meson_cipher(struct skcipher_request *areq)
 	}
 
 	reinit_completion(&mc->chanlist[flow].complete);
-	mc->chanlist[flow].status = 0;
 	meson_dma_start(mc, flow);
-	wait_for_completion_interruptible_timeout(&mc->chanlist[flow].complete,
-						  msecs_to_jiffies(500));
-	if (mc->chanlist[flow].status == 0) {
+
+	err = wait_for_completion_interruptible_timeout(&mc->chanlist[flow].complete,
+							msecs_to_jiffies(500));
+	if (err == 0) {
 		dev_err(mc->dev, "DMA timeout for flow %d\n", flow);
 		err = -EINVAL;
+	} else if (err < 0) {
+		dev_err(mc->dev, "Waiting for DMA completion is failed (%d)\n", err);
+	} else {
+		/* No error */
+		err = 0;
 	}
 
 	dma_unmap_single(mc->dev, phykeyiv, keyivlen, DMA_TO_DEVICE);
diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index 58d56f352dd6..81d0e8731ab1 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -53,7 +53,6 @@ static irqreturn_t meson_irq_handler(int irq, void *data)
 	for (flow = 0; flow < mc->flow_cnt; flow++) {
 		if (mc->chanlist[flow].irq == irq) {
 			if (meson_dma_ready(mc, flow)) {
-				mc->chanlist[flow].status = 1;
 				complete(&mc->chanlist[flow].complete);
 				return IRQ_HANDLED;
 			}
diff --git a/drivers/crypto/amlogic/amlogic-gxl.h b/drivers/crypto/amlogic/amlogic-gxl.h
index e14cd5021add..cf07c5fbc5bf 100644
--- a/drivers/crypto/amlogic/amlogic-gxl.h
+++ b/drivers/crypto/amlogic/amlogic-gxl.h
@@ -59,7 +59,6 @@ struct meson_desc {
  * @engine:	ptr to the crypto_engine for this flow
  * @keylen:	keylen for this flow operation
  * @complete:	completion for the current task on this flow
- * @status:	set to 1 by interrupt if task is done
  * @irq:	IRQ number for amlogic-crypto
  * @t_phy:	Physical address of task
  * @tl:		pointer to the current ce_task for this flow
@@ -68,7 +67,6 @@ struct meson_desc {
 struct meson_flow {
 	struct crypto_engine *engine;
 	struct completion complete;
-	int status;
 	int irq;
 	unsigned int keylen;
 	dma_addr_t t_phy;
-- 
2.47.3


