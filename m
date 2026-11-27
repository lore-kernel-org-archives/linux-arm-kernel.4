Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB399606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wDurUBdY;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SuHgiyv2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GbFTXgWz4qbUUEtYKh+mkh290tQbhLkX/pW25drgstk=; b=wDurUBdYHFXkeo
	MUQ8xoO6Bpsz4YmpqnzM7Fg15eWND3pKoCNjrSCjli+vv0Sl8D1Ej8vaYL161H+cOuTIZHT7tFgCd
	v3Zg1APG5WM51a0OC+MILks/GkneSV7eZG77om/jK8mDiEXI7nZI6jG+cw6BzuU8xD7lehJfgaoeL
	5Mfc8iZHL5GFrrvRMk5nEoQ4EhXyVJCqHZ7cJxU1KA81QMyq14V9uVELiBPiG79gOxxfIX9rYozqF
	zUhAY9bhGmX8tqtxpje81HgiWUl4Oqw98Dzt1r8m7d3tpDh4+AB/nQ8a1Yqh2V1LyzQQ8uI3eVIMn
	x0wfssSmsT2j7mBeZ4eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWueE-0000000FwQ5-0ICE;
	Fri, 27 Nov 2026 12:01:50 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWudo-0000000Fw4Z-3j07
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:01:26 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so69813675e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 04:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780883; x=1796385683; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GbFTXgWz4qbUUEtYKh+mkh290tQbhLkX/pW25drgstk=;
        b=SuHgiyv2cJ21sz3EWxmWIakZJQFi8k6dCThjA4hcKq9KoUkL65vAjv5pAuqHrSUwmp
         4SCvl3WEbxshX+2FhK+KuiZSwGy6J7sHYaqwvK0NKiSI7Cb2NvqwpIkam9MvedAYzoSx
         tUYq9W9uzHFwYeN8qDu0mvcJLozPC4DRRVpq5wWlyhV5Pfw/jahkujHZkL9eliym9TSA
         YCl2/eiWCfY4voWNkMLa+ayM7QrzTAr6Xgz21TxAu7AWnBw4X9YovqUFq46kj51Prud5
         AgmMRRWKYvrCEr2ULEtOsPdutIOuYjEl9s0LVaOff4nzt80m61BKx9MPSq7tpWxbyjsQ
         HE9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780883; x=1796385683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GbFTXgWz4qbUUEtYKh+mkh290tQbhLkX/pW25drgstk=;
        b=r83slVwXBS8etCbyti6N/RKqkAGRWqNAf5EoCXhxuI5VY3yYE7cte5vOA8zY0dFDGA
         mRgTIeS6VHdfePUCGkj+6SjCa5p166EG+TWMf3S33XozE6orWjaOVJIkm7SlWCkI3zZm
         1NqFod9TzMafxkfeV0ZijtVbzem/2h3ON0zUGXN/S0SKLDlpN0aRrNsjBR6/k2WKW1AP
         Dk7Towo3mocyl95hkgFlaXdS132Mj1p5P+i9wmP9nAjxBYsXXP/Nto6kBMHqWseJlxHE
         0FuYhqlWFJXYqzHhGnNh2w23O5laXMmjqjX7cB9IkQ08cuoS8Jy5bUBzo2x/SqVEdmc5
         Fr5g==
X-Forwarded-Encrypted: i=1; AL+hErETcdJ7J9/dNfjvRiaUq2bkIxPGvfVisqstMBl1jzQt8riZQckjnAxZqt/pM4iIEei+0iGSM2f8JL7vdAWxJ/Yp@lists.infradead.org
X-Gm-Message-State: APuU4Z/gyGspKzoAsVebsFiiS+IVpH2XvQxFFWL2Fw5rRKGNFNaow9eN
	jVpmb2hApZYpO+H8rSNxzxK3KJXqy0lF4k/oWCWnZtLH5kKo6F5wtbYm
X-Gm-Gg: AZFdTZenC1SuePSiFeRRZFFp+PDsE8p2Fpl3my8KvRCAY0aQAkemLtdaAZbAf5N8ptN
	ozYq2tdnwNSvRYCTgLwCEdrETRLK/A4IQpile0piQDpRrL4EVmLGlRFppg+8sTd/8swERrk7eF7
	Kvmj06wf5zIuLwtzooaWc0G0c2nUB1N4yu/tizCWg+eNszph4/1p2Qx50pEBo84Unqbgo5Rs9Cl
	6iKX8BXqP6cL5L7QBVw2XhsxY9x5b7sSam1vikABlb6lV6buJ317wE5K8R6W1LWV2N5Ip25Zwod
	mvdEb2N2mrJhk/fP+FiSAjZMpQxYVHbQktu/Trhy4HuontRjU4aV2usMJo5P2IpPsW6HDzYpebY
	Ue5vBosKpgYhYa3pbZ4IkNqTyJWoc5dthhzhRqQTTTB3ZQUSI95SFsrG33o5p2RQXY8r2WpxeJH
	2FlH/DEBikzhJoM6vjUlcT7k3jt7zsqFlDTM5Chjs0s5SLQ6z+uADuH3k8N0yBSnrBF1q7hm7TW
	snAe0A014zwSvsLvSjMs7dsN9O45lvd4ab+oLUDeB4SKHn6qlftHt+/IPc1nWp+UbLKk4GNpv3O
	e+y72TzRKs0khK9ZJu2IYxHsXkuMPqUWt6RuyqQkFWl1Wo0=
X-Received: by 2002:a05:600d:18:b0:4bb:9001:1aa with SMTP id 5b1f17b1804b1-4bb900102b8mr353961815e9.10.1795780882841;
        Fri, 27 Nov 2026 04:01:22 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:01:21 -0800 (PST)
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
Subject: [PATCH v14 07/30] crypto: amlogic - Move get_engine_number()
Date: Fri, 27 Nov 2026 13:00:40 +0100
Message-ID: <20261127120103.1532882-8-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120103.1532882-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_040124_958807_8ECCF22B 
X-CRM114-Status: GOOD (  11.74  )
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

Move get_engine_number() function from cipher.c to core.c

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/crypto/amlogic/amlogic-gxl-cipher.c | 9 ++-------
 drivers/crypto/amlogic/amlogic-gxl-core.c   | 5 +++++
 drivers/crypto/amlogic/amlogic-gxl.h        | 2 ++
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index 62aa82e1cb5d..f6c13d8fcb47 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -17,11 +17,6 @@
 #include <crypto/internal/skcipher.h>
 #include "amlogic-gxl.h"
 
-static int get_engine_number(struct meson_dev *mc)
-{
-	return atomic_inc_return(&mc->flow) % mc->flow_cnt;
-}
-
 static bool meson_cipher_need_fallback(struct skcipher_request *areq)
 {
 	struct scatterlist *src_sg = areq->src;
@@ -297,7 +292,7 @@ int meson_skdecrypt(struct skcipher_request *areq)
 	rctx->op_dir = MESON_DECRYPT;
 	if (meson_cipher_need_fallback(areq))
 		return meson_cipher_do_fallback(areq);
-	e = get_engine_number(op->mc);
+	e = meson_get_engine_number(op->mc);
 	engine = op->mc->chanlist[e].engine;
 	rctx->flow = e;
 
@@ -315,7 +310,7 @@ int meson_skencrypt(struct skcipher_request *areq)
 	rctx->op_dir = MESON_ENCRYPT;
 	if (meson_cipher_need_fallback(areq))
 		return meson_cipher_do_fallback(areq);
-	e = get_engine_number(op->mc);
+	e = meson_get_engine_number(op->mc);
 	engine = op->mc->chanlist[e].engine;
 	rctx->flow = e;
 
diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index b972df44e8b5..58d56f352dd6 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -22,6 +22,11 @@
 
 #include "amlogic-gxl.h"
 
+int meson_get_engine_number(struct meson_dev *mc)
+{
+	return atomic_inc_return(&mc->flow) % mc->flow_cnt;
+}
+
 void meson_dma_start(struct meson_dev *mc, int flow)
 {
 	u32 offset = (mc->pdata->descs_reg + flow) << 2;
diff --git a/drivers/crypto/amlogic/amlogic-gxl.h b/drivers/crypto/amlogic/amlogic-gxl.h
index 64f2f0e63f12..e14cd5021add 100644
--- a/drivers/crypto/amlogic/amlogic-gxl.h
+++ b/drivers/crypto/amlogic/amlogic-gxl.h
@@ -159,6 +159,8 @@ struct meson_alg_template {
 #endif
 };
 
+int meson_get_engine_number(struct meson_dev *mc);
+
 void meson_dma_start(struct meson_dev *mc, int flow);
 
 int meson_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
-- 
2.47.3


