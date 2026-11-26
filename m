Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D8A606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 19:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rD/pLY9n;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LcudpX05
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KMyqFUlA/AvT12hLb9IrqwnM+Bo9I2ifCE4zJcXn8o8=; b=rD/pLY9nO26HiK
	o13erKApU5NG/tJG1cANhRHbYYRnFgh+7mAv7IInVrIIA+LGKq6Bq/SA8LIhLVfA91w+4LlK1h6DH
	tWMbsYIZRThkLF2OnQOtyiGLN5dndDg+ZZps3KgkmzWe/vrmjsRg9erXZkejoilwmdPRKJ6zfd2Hc
	2DGP7tMGhuSyL/kUkgZPiWny2KoBsfwSUnsEPadnWdTCtYSdN8rumysql4TMZR+I+B9V4Of8QzA6a
	sMumRpHXfxq2aG4TVTSfFp9KI2k7eaJzp9fhesvdvrqqw27lMc5g0pObOh2GmID4ubumP3gCKZVLj
	lXbXFH1XsL5jB4GWtfRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfDj-0000000EJn9-3Mbd;
	Thu, 26 Nov 2026 19:33:27 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfDV-0000000EJUe-3U0j
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 19:33:15 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4bba5e17cbeso20792105e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 11:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721592; x=1796326392; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KMyqFUlA/AvT12hLb9IrqwnM+Bo9I2ifCE4zJcXn8o8=;
        b=LcudpX054MoWMWyTMD7mOEpFQp1yOlYiHfzj/aTiNMojfFY/Xx82HpJqCz5RSuV+DS
         Awx2ljixjYCED6BogERTqRCNP1vhXxkxUZh6MF+t7oWl+3j32OYQ9jqlQeJYhI6MYKbd
         ocxkDFejq+wmWYEEY+9SXIvJ83cSpu16cJU3PK1/GjqB+3fZtlaYdlkoGfi2CTjIR+Oh
         jFZ48Xfk/Jc5Camq+/6F/UTqLwUUuIuBtLA8v2tzn2o4SCou0OynfL+tLoxj8Kgq2W5T
         olQxc13WZy1A/ZYnCeWcfUo4uSyqWKBLkK9DymGv4QzjqmzXg2EkMe4iKRrIqQC3b4qQ
         AwCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721592; x=1796326392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KMyqFUlA/AvT12hLb9IrqwnM+Bo9I2ifCE4zJcXn8o8=;
        b=dVUToobfRcPCnDgdqRgewCVRo3AJbN6hUvNo6JpLN0PuKCAfKKdWP0Y3CgzFsxpjiQ
         +UIuXRhetyioJftn4PN46REX3XF/IU3+8YLJGN/OvXV7Shq6lDKD+5aipJ4TYOifYwXW
         18wS8sLdX1hZvPjCaPbhs1Bg0Lgnf8QJb1EsxEyjK1yRtAO/OcPrdFKT0ZE7EIdmrUKu
         JU1eV5kn+ZUr091NybDMQzFrBo+RRn82VRQzhKuqO6l6dmXnAC1dS6NQrkQjLdGt/xsE
         WznBCg8VgpC+dMz7jXY4sMs09g7eT0UP0ix5nMXt6ggVCY2bh/4exp1RbRQ/sWaTDF9c
         tKTw==
X-Forwarded-Encrypted: i=1; AL+hErHR9pOc4h2can15DDkDgLpap+o5UUafODaUPJkeaGFZ4YAouTH3TQFex37c7lAHF4WlqaiB8eXBz8Gmvt/KP89h@lists.infradead.org
X-Gm-Message-State: APuU4Z/RLN/becDzC8sYmyiQ8iZk2Q/Jhj5C691xAEejOrGdh7Bwo9t3
	msZQUgrtiQyfMyt6mJcoJUTo3Hv1XTCeafSMa7iyr0OP0wd9SeN4qMuV
X-Gm-Gg: AZFdTZffFU0LYe3ZNpLhdta/CZMzbbJCaMAcmgPBusV3zZUwD1MhKKGkM8gujEfDFuI
	VYFVLY/UqlKShdI9Z9mVD8szcXi/udxumPu1JvcrubcKOr07NA66YEolJ88Lvs+i/UkLe0fQhFz
	CFw4hdeG4uLaSPv0h8DKcmvheV9pA7a/TLxDVLN3fCMvxRdI3lWXFP44sDQ5MruKhTy9GsR6Gz4
	NoBJh1ExBl19JLN/hHiOQMhfiAwCkiIJgNl0M+3U8cxyCqsGbSv4JGWpr8pj29KhPPZ2LNRW0te
	26R35iRRSLVcbgXTRsVa2/GHXgWn01EaftVOKrIsTnIDfQQQ2T855YOM9Wd1LmRUppCV1XCywkQ
	/pzzNFU58Sq55seG6Avx7t7JbyO3Ye2Gom2R169/jTv9MJWbSipHyn5Bxl5bQR7nqvGSkcfAKwB
	1gHqSp916ysmTJxYeW6PG7HYCwj0YLxc755KOnhkDyPnk33eK+xJNnK7LGYcs4NMiAFEzZUN5CU
	J7qiRVpIBWBehPbZZsVSlRXdm/M/uWTUMoGSMqnP1QxO2CvTmTpJqIbIJJUCj5erF1GjcDgI2/G
	wzLYr4sLcKMTx/fksIB+vel4C7TyaKmhcOuTSzf+gAH32A==
X-Received: by 2002:a05:600c:4e16:b0:4bb:6f77:1e35 with SMTP id 5b1f17b1804b1-4bb88810991mr475888005e9.21.1795721591813;
        Thu, 26 Nov 2026 11:33:11 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm368287675e9.2.2026.11.26.11.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:33:11 -0800 (PST)
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
Subject: [PATCH v13 08/25] crypto: amlogic - Drop status field from meson_flow
Date: Thu, 26 Nov 2026 20:32:24 +0100
Message-ID: <20261126193241.1471372-9-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_113313_875770_50404CC6 
X-CRM114-Status: GOOD (  18.01  )
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


