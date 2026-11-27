Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC780606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k9vpFA3/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=YqWV8s4z;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EaFT/xPk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=X5YVvV6vHMcU5kHSKr3HyFQG5tHJwE0SH4iS9jSSmfI=; b=k9vpFA3/J1G4Fp
	DmujL2opC/zZiVkDMfRKXj7os5aY1DtAVB0cXCcpfOOrd1Npw72yIvHv6OVTfM6jeAMGZSuA4TxFP
	zMy4gd+V6RNlq61A5SZ/FHFFENT7vmwU5hi9ttldD/CLQOVVE3q3Ws3P99GTfLKglQaWufW4TGagP
	K3GeMlbfe/xtEXZc2WNuzpNMwB/gN/twzZtHCLqZuMwOx8pUYAw/L+FNfmhY55CbRCYF9wLYb1P/S
	o1ngD3bhYWC08B4J1L2/tl6JnR5oD1wGGl/39S4jcO5kZpX7B3OtiA86kqivTbIV/z1h6Zl4cfKfT
	4YFPHpieHBw5NrTgHs5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuhF-0000000Fz5H-35TQ;
	Fri, 27 Nov 2026 12:04:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuef-0000000Fx88-36OG
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Nov 2026 12:02:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=X5YVvV6vHMcU5kHSKr3HyFQG5tHJwE0SH4iS9jSSmfI=; b=YqWV8s4z2/zTxvF6Nw6AZwDUTV
	ppQu0L/FpJ+LXOpVxRvan7WSq6AvzPR98u2zxCP9lJY8FlfwCvIJK4baDCzJ365rgjtGuMR9FVsxD
	kt/TQUHOe2cl74y93gsVI9WbOgbCDvqVImrXk6Bfacbnc0RoQ6GsPdg7sxY3rhmZfykuEqs7uTn9x
	E16zJIknryAQe00sXEDQKKvGg/EyhnKlE4lfMIuYStnqR4YBisoS5kgMmrGANow4lUuUEx8L1Jfjb
	SzMKtFihvAyrlNXcm5R745VfzBZPeN2eQPAwnIpzxz+uXUidVIlkP56LFBxHkaMRSpA1yQO66k32y
	AFsMI9Jw==;
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWueb-00000007fki-2PGN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:02:16 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso62234495e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 04:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780928; x=1796385728; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X5YVvV6vHMcU5kHSKr3HyFQG5tHJwE0SH4iS9jSSmfI=;
        b=EaFT/xPk/RRm3z8b6IDh30R5hEisv0kUbZuzSwoCvVt2VPsdDVgR0xQLGiRnwtjWIH
         03YdhLkDowJLj9hChwUH0qN1JeJxMh8jDtFCxm8URUeDqZUMW+Ytq0amFFedkjQSDsIK
         JmJP5A6Zio0FkdPmRsjNhweGd7Yo0oMe1pW4kPSXv50FLK48YJLm0Vg2HjfIzgIpQFAx
         xq9pfBATRiwOhhoaRrj+wPgV8Z4ihqXOd+GLcAbW6R70hEZCXsaUqCUFlsJwi+zEX8vc
         OiDqhxltEAv5QZwkIkFaLsQja2Q4f3RfAL+GcbWybH0mnqgDFTYz9+JwKnxDjtdDZnH6
         tRcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780928; x=1796385728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X5YVvV6vHMcU5kHSKr3HyFQG5tHJwE0SH4iS9jSSmfI=;
        b=bDkrVph5Cafosz5lP6recjGQ+Zp2fs5y9s9x/HGAoutD+HRWt01m8S2q0BakWZAGfy
         gjVxu9iCPRFhi9h03dWx71ob8jcwXb9ptnsu3Zt2VHygZ9Nnl4hbRZ3RH6Gta7Bmgq6/
         pudAJxhSFjzoj/NtTwpP+/eW3vH4SuwqTBG+AZlhxaHlUdtrmTF6Xi/YYIdZHO7VajXb
         4glIOaHC+zsv5FaQgJf7PAEnEbrBt1l2sll48sXWCf/TO5FsJnBDxoVC8FNDnrV8U7GW
         mo+CT7+fw9xkpoWbsPdlpuqhBHIAudI0GyI44HKqslwuXzRsiiYOXaUkJTLhpB5Z6arD
         ATRQ==
X-Forwarded-Encrypted: i=1; AL+hErHyHpAprC/WqPR316+Hn1GCD3EhKctUcPmFrVQhJsm5s2e3N7gNRHNlx4lwIgCxCx2xTsn66st2jzpVEaZxeiVy@lists.infradead.org
X-Gm-Message-State: APuU4Z+c2sZHtjzwSnYykYhfDmsTvRn0vfs3xanXK7caYorCty1DG4Il
	mZThjvyUAAYJkEQuBIlGLXFsaL09NvflqaW4mOl96vwl8/sCddKgnzQW
X-Gm-Gg: AZFdTZcRDLAGsXWjOKPoF1BwXpeHdUi4DboqV24/fNc+6xk4Nqx3uQyk3NJ//2unBCM
	DiYfj+ccGE7yHLvMQWcCchuPcKHdravg99GxXeRAC6JPwthxIIb5VdGu6eU6YOIvf2ddFgS2N9Q
	pUm9JSA2PMlMsjRCYhYjoSXIk5vyVvegdS6Qc4FrQx48S6LXunVU26ZoXRyaWw4SlaDx5M8dJ5N
	H/i55kudaE7NtkAmbIdHi2tHAqZNLkmuPUWjETx4anuNHlL8kxmAqUt/Z6VjOm/lWC8qyWA+i1l
	7jWCUAYpUJ4YCx3E8k9NLBipEj9cdIlVr58uhQx39v5lrC9gJIyMToUGBax8Bz+p3At72eQfUz+
	fUCFT8jQ83uuURAG3ijfKpvnAEGbnqKHDVt49vUcxixhKIHVQR6Nq3caBuTBuN4Cv7skpN3xjrA
	35oX84Tq35nu5TTgbZ9Ejm14Gq+6J77j6LdNYerBNF2jyffrrIwSDoQLo6nIJlGYBk2XoUw/UwR
	jv7mLPnWcM+KwSwz5fEbbQXhlCLpJNEzDzL0lkuhNP7hBBVmttQLE+805rhHNauZicnZRM1BIJ4
	EmPI97WWojIXlEWS2FdW7s2ClxHKe04WEC+C2k2nI5DPKqk=
X-Received: by 2002:a05:600c:848a:b0:4a1:fbd2:f689 with SMTP id 5b1f17b1804b1-4bb8880993amr464473645e9.7.1795780927493;
        Fri, 27 Nov 2026 04:02:07 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:02:06 -0800 (PST)
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
	Jose Nieto <jnieto.alaber@gmail.com>
Subject: [PATCH v14 27/30] crypto: amlogic: fix probe and algorithm registration error paths
Date: Fri, 27 Nov 2026 13:01:00 +0100
Message-ID: <20261127120103.1532882-28-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120103.1532882-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_120213_540054_A03B61E2 
X-CRM114-Status: GOOD (  17.20  )
X-Spam-Score: -0.2 (/)
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

Fix error-path issues found during review:

  - meson_allocate_chanlist(): propagate a negative platform_irq_count()
    (e.g. -EPROBE_DEFER) instead of replacing it with -ENODEV, and unwind
    the
    channels already allocated when getting or requesting an IRQ fails.
  - meson_register_algs(): clear algs[i].mc before calling
    meson_unregister_algs(), so the entry that just failed to register is
    not
    unregistered again.

Signed-off-by: Jose Nieto <jnieto.alaber@gmail.com>
---
 drivers/crypto/amlogic/amlogic-gxl-core.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index 8ce3f6640753..c11d7d8250ea 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -106,7 +106,9 @@ static int meson_allocate_chanlist(struct meson_dev *mc)
 	int i, err;
 
 	mc->flow_cnt = platform_irq_count(pdev);
-	if (mc->flow_cnt <= 0) {
+	if (mc->flow_cnt < 0)
+		return mc->flow_cnt;
+	if (mc->flow_cnt == 0) {
 		dev_err(mc->dev, "No IRQs defined\n");
 		return -ENODEV;
 	}
@@ -117,14 +119,18 @@ static int meson_allocate_chanlist(struct meson_dev *mc)
 
 	for (i = 0; i < mc->flow_cnt; i++) {
 		mc->chanlist[i].irq = platform_get_irq(pdev, i);
-		if (mc->chanlist[i].irq < 0)
-			return mc->chanlist[i].irq;
+		if (mc->chanlist[i].irq < 0) {
+			err = mc->chanlist[i].irq;
+			i--;
+			goto error_engine;
+		}
 
 		err = devm_request_irq(mc->dev, mc->chanlist[i].irq,
 				       meson_irq_handler, 0, "aml-crypto", mc);
 		if (err < 0) {
 			dev_err(mc->dev, "Cannot request IRQ for flow %d\n", i);
-			return err;
+			i--;
+			goto error_engine;
 		}
 
 		init_completion(&mc->chanlist[i].complete);
@@ -169,6 +175,7 @@ int meson_register_algs(struct meson_dev *mc, struct meson_alg_template *algs,
 			if (err) {
 				dev_err(mc->dev, "Fail to register %s\n",
 					algs[i].alg.skcipher.base.base.cra_name);
+				algs[i].mc = NULL;
 				meson_unregister_algs(mc, algs, count);
 				return err;
 			}
@@ -178,6 +185,7 @@ int meson_register_algs(struct meson_dev *mc, struct meson_alg_template *algs,
 			if (err) {
 				dev_err(mc->dev, "Fail to register %s\n",
 					algs[i].alg.ahash.base.halg.base.cra_name);
+				algs[i].mc = NULL;
 				meson_unregister_algs(mc, algs, count);
 				return err;
 			}
-- 
2.47.3


