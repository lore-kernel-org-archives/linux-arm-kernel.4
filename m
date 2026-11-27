Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954EE606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HOWnxUhz;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=dtZ/30G5;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V2ax5YPm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cyu2YD+0JiTqu9p5NWdi6X2hohcRvSGgQozAHaYtXMQ=; b=HOWnxUhz4u6n4n
	bXfIqBwxrBKqSJEXWw8Z7BxMUZNt+TD9Li8oG6kTynaKvgWcp4fjbbyIEn841Z8f37z+YNTAVSkcB
	4DVz+74blD8UFQh6cGs67qWTLpGhUsWxULUUnqQ/SXZT63B+HsEmE8Je5kdPR65NQZ1SB5efsdBMX
	kI1eZd2ATneuTYbz9W0Lz+yfjBMYZsFkNAmute+Ml0Un2Y8kA3Xf3CNrUvN9xj1cs93HvbTvTJk6T
	Jg8pmyBY8MpylGYN/s+VLri+cDB2SzqnXz0bT1BfdLwmsGm9Uv2KgXU0Tgb+IhRG+46u3sCWYpYyy
	prrPgJYtXPSESAtClIQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWufC-0000000Fxrn-1pQ7;
	Fri, 27 Nov 2026 12:02:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWueP-0000000Fwj0-1Xi4
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Nov 2026 12:02:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=cyu2YD+0JiTqu9p5NWdi6X2hohcRvSGgQozAHaYtXMQ=; b=dtZ/30G5huYNSMT2gLzbaXc//M
	PQxAfFteXdKDFbtlLS9ektz5rlZRa1jJ4ifmh81u/OsPFm1HWpcwAlkBSgO4u/b8t3qVKRJGkEVU7
	AYmhKvIpCmmovfVg20X726ak3KhqD3iLMsBYcFb4YzUqH6l2xRsUsyFtNrNgCizsNF3ml5npSGBo7
	vp7YfXaAruJD9Kso1waxBd1Ti+UyHqmr8KatDV9SU6RpIa5RMnMZJitQ6eFPtrE9Of0YZIY+98DJn
	mIvcBbxjJzrUYW7Pq9jbhl0oPQaSQcc79ek9BXVhdDC7wZjzMDfdW2ZdK/6PB+hIepx/9ohC1iccU
	XuLcWzxg==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWueM-00000007fgH-0x5e
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:01:59 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso42783115e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 04:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780916; x=1796385716; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cyu2YD+0JiTqu9p5NWdi6X2hohcRvSGgQozAHaYtXMQ=;
        b=V2ax5YPmoyn/+JKILlx1BjMJ1FftbVMnPnKUcdB5doSUfUPb/TXT8N2xCd7h+JMPo0
         i1MePiSv1nQP6FC3IfQGaezlc6M6mVjNxQ26NTZabhi0OBg/Ak9fFlPndNYQslIarqFY
         Fyl9ni03tWLGXUqVaLe926rOxCjihALN6HQes+QwoC4n9Gv8liOzX1Hkxt5Gqil+RDKh
         /dyvsBLaMPyT+fc9CoRV21bosK+JynCZO0Wd6g9jvAEepNh3CRJZO/FH/uC1IUZM7OS6
         FVzTO0LZMSfIIY2EHP6oHIQx35uArLp/8nakFPVg/c0UfWX8e84jDbA97BgnnOp8oxat
         LbdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780916; x=1796385716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cyu2YD+0JiTqu9p5NWdi6X2hohcRvSGgQozAHaYtXMQ=;
        b=HPB5nyZ5Q7JO+fllP7X9Q5C3nW6iOz8jHc3T/ycYXKdpLcKVFEiNejqUuPl4FL6uF5
         Wh/1l9bRFaEZMk//airIZVqC7ofRKc62GCq8Ow+jV+BvlU3u3z/QQGGE2CsoHI+kW6jH
         RfV3FlHtSuFdRN7Utbi6z3jXNO8Un3MA0jrzHsTWoAP0dlhUKfYRndqj9JskxNqiAQyR
         Kxb9EdrGcsrAz+w7E3koW54cd2wYq9DtlVtPtVrS02GxqDNIK9kbL9evPBvhHH/UVN39
         iXU58fKwyd8I+Ez4tOawlyQ6NwVKLRZXppeJ0P0LgJ2R7vGz1jmjvDQcixanQZg2x2Yl
         Jedg==
X-Forwarded-Encrypted: i=1; AL+hErG0hKKgUR5HzM5hztEUsN0Xx89sfhb/AYknhhA/Qz5bUTAYOAru8VW4YLdYB4vYxnzAgHGZcJNHTsC39oZej9BR@lists.infradead.org
X-Gm-Message-State: APuU4Z953OzsCbB0bfPTNQid/DwBLAEcjMCeU6+lKAdRm8H7OVtM2o9T
	hUhVBe2tKs2TQ/wjyiL/PU8iJKDgi6sPBxKPmqPxZtLxJmdHmBAEyFnS
X-Gm-Gg: AZFdTZcT9HSqKeycV00T4Qo0WfroSJRmMSqrrTWVDW+5fO3hl9pX/3kdpHxYj2BQsUo
	jcEXs/rW5es2JXjjH+RxX40qPIFk5gZ57WXXHz1ltF1aswhqMSaQjM2a29h9TFDATA31SP+Qg/c
	sLbXnxOsPTmlz6KYvHTCcWOKDzIu/Ys0Zj5Xfg9O9TGCCDhxH9OlQO0UCB7w8qOOQoae+rAD4NL
	qUb6JBLvaVJPfef4Ak61edOOz5CWeoPvxW2tvcxAZerBRWghWWci43IKK1TWsg9snZmdKjqgp6a
	BwKtIAV5Wee7iwgrg906YkGp2NSBZKQMjNeuaK/hc9pVN0nRVZd8v+1Ty6/kzCuHVcgECJh4b6w
	X0U40na5kvkwrAxdg1pUDgzixZbpDmshG8m70JYbWNwuwJ6GTNBRgGaqW+BvWSx4qPHn900QAxx
	DnA025OfVZ71bIW9zxn33bq6j1/ujCn8L2foow0sV4AqyEc4zUaiZRQ9JpA7KVoDHgIHVKRTRCB
	NOLtJvjtt26CNOGtAG28CwGxRhdKzmINi1tNRZw7TNpYQZ1moRcj7kl5iBu3kocR7SGcvakNOjL
	iZO4nU2ys0eogJe6alpxZh0d6YR6mxcp0KVMIS2Smfdgxzc=
X-Received: by 2002:a05:600c:848d:b0:4bb:6687:5386 with SMTP id 5b1f17b1804b1-4bb8880c7f1mr517059715e9.19.1795780916248;
        Fri, 27 Nov 2026 04:01:56 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:01:55 -0800 (PST)
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
Subject: [PATCH v14 20/30] crypto: amlogic: drop unused field and stale includes
Date: Fri, 27 Nov 2026 13:00:53 +0100
Message-ID: <20261127120103.1532882-21-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120103.1532882-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_120158_257342_301D34C6 
X-CRM114-Status: GOOD (  16.52  )
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

Remove the unused meson_flow.keylen field, drop unused includes in the
cipher and core files, and fix stale kernel-doc field names.

Signed-off-by: Jose Nieto <jnieto.alaber@gmail.com>
---
 drivers/crypto/amlogic/amlogic-gxl-cipher.c |  3 ---
 drivers/crypto/amlogic/amlogic-gxl-core.c   |  2 --
 drivers/crypto/amlogic/amlogic-gxl.h        | 10 +++-------
 3 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index 72892fdcd55d..c11ccbaf920d 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -9,9 +9,6 @@
  */
 
 #include <linux/crypto.h>
-#include <linux/delay.h>
-#include <linux/io.h>
-#include <crypto/scatterwalk.h>
 #include <linux/scatterlist.h>
 #include <linux/dma-mapping.h>
 #include <crypto/internal/skcipher.h>
diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index 38b9645386ae..8ce3f6640753 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -19,9 +19,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
-#include <crypto/internal/skcipher.h>
 #include <crypto/internal/hash.h>
-#include <linux/dma-mapping.h>
 
 #include "amlogic-gxl.h"
 
diff --git a/drivers/crypto/amlogic/amlogic-gxl.h b/drivers/crypto/amlogic/amlogic-gxl.h
index 3f1ce6c05558..9c3df0d162b9 100644
--- a/drivers/crypto/amlogic/amlogic-gxl.h
+++ b/drivers/crypto/amlogic/amlogic-gxl.h
@@ -69,18 +69,16 @@ struct meson_desc {
 /*
  * struct meson_flow - Information used by each flow
  * @engine:	ptr to the crypto_engine for this flow
- * @keylen:	keylen for this flow operation
  * @complete:	completion for the current task on this flow
  * @irq:	IRQ number for amlogic-crypto
  * @t_phy:	Physical address of task
- * @tl:		pointer to the current ce_task for this flow
+ * @tl:		pointer to the current descriptor for this flow
  * @stat_req:	number of request done by this flow
  */
 struct meson_flow {
 	struct crypto_engine *engine;
 	struct completion complete;
 	int irq;
-	unsigned int keylen;
 	dma_addr_t t_phy;
 	struct meson_desc *tl;
 #ifdef CONFIG_CRYPTO_DEV_AMLOGIC_GXL_DEBUG
@@ -90,8 +88,8 @@ struct meson_flow {
 
 /*
  * struct meson_pdata - SoC series dependent data.
- * @reg_descs:	offset to descriptors register
- * @reg_status:	offset to status register
+ * @descs_reg:	offset to descriptors register
+ * @status_reg:	offset to status register
  * @setup_desc_cnt:	number of setup descriptor to configure.
  * @hasher_supported:	indecates whether hasher is supported.
  * @support_192bit_key:	indicates whether platform support AES 192-bit key
@@ -112,7 +110,6 @@ struct meson_pdata {
  * @flow:	flow to use in next request
  * @flow_cnt:	flow count for amlogic-crypto
  * @dbgfs_dir:	Debugfs dentry for statistic directory
- * @dbgfs_stats: Debugfs dentry for statistic counters
  */
 struct meson_dev {
 	void __iomem *base;
@@ -181,7 +178,6 @@ struct meson_hasher_req_ctx {
 
 /*
  * struct meson_hasher_tfm_ctx - context for a hasher TFM
- * @enginectx:		crypto_engine used by this TFM
  * @mc:			pointer to the private data of driver handling this TFM
  */
 struct meson_hasher_tfm_ctx {
-- 
2.47.3


