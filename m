Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DA4606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=s4ejgp1p;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zKoupADa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IoF64jnw/OxIgULPI43O4WtliYquxuYl5hRwBwB9SZc=; b=s4ejgp1paYeylk
	kxk0vycnJUo+BWpr7Fvv1KV8BF+7IV9By0ebMIF7JScZLvGF12cPpdEoQV+0ZUgdrnO5cz9YA7+K7
	qD9dMni0iNQcqzCyykOSqfkoVcRxY7fSJJm10Alzj8zMoo2kmSsVIHe5euAoriR+EL0Qmj4LS7UPQ
	UX6RO2n4NxTNPsWKEXSPYT58wR39CS2bUpwwHJcgQYc/Ym0h4zjm42ZblnKDVAwGATu2xQ08Ua75k
	jDIhSJ27sETwp4AjEteclA94+La2Okd3R7mspkUqxutyOekgat2IAStbE0wrroPARsXPxSf/l83ei
	5/l+x7fk6nJYgv+CuhIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWueH-0000000FwXp-3Ros;
	Fri, 27 Nov 2026 12:01:53 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWudx-0000000FwB2-2Q5C
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:01:34 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-4acb44dcd7bso7218346f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 04:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780891; x=1796385691; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IoF64jnw/OxIgULPI43O4WtliYquxuYl5hRwBwB9SZc=;
        b=zKoupADaQitkp2d64spKe4BUphYl5bOB7Od+goOy5Uvb+QBk3ZbuxSpQ5iqrsPiO+/
         qcZjPNyKfOrHN0r56mR/RGh5uKVsgqAJMNjEc4djSdAFXze7eWmWghVw4F1qLmCj/LJN
         qDXamoEa6lwI4yNDxp387/DpYx23oxHaDH24QXd7OPC0PZtT1FsQOk3oNaqN93QNXqBs
         SqZJ2TmMl8yJWZ0u9Nl4bQHV4DJdDnt1d7tPZQMqIY7SBEzLgGe5mbibM0bskvSeewfr
         xr13UtD2TM4BPFB1d6xUGbsg6JbpTrIGwQVKzbsnLuvu7UsvKD0k6rT9p124uAB8kj0V
         IPRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780891; x=1796385691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IoF64jnw/OxIgULPI43O4WtliYquxuYl5hRwBwB9SZc=;
        b=VKXZ4+nFeoTUk408hVpOaS4hIGLEJP371DnkMrt9zCLVY1jB4aeUoPqrVE4E3ZhZuh
         7/nyT4WS3psvNIFHuM8zbaGTHhUhMtP7ZRzb9D5xGt1EgybzwgVZq/1NNXtZEfxum4MK
         hgu+bf24W0cNlcRRCaDDT29tg6Uw+ZAV+WCPYK65huEq48QkwZG3Ee5yYi9d9r9rJH0Q
         tfxrjdfp7HD+MDim9DoOQSYqoBmEC5rPO4REY80OP4oOorvttoTyaoNt+nnxiBWTmqgr
         cDADTvnZWsxYTjRjzY4EEIsn9JMfhWncAx6eMcvORaY0YCyr9EA9Mtig62vQZQ1yiGGA
         eaZg==
X-Forwarded-Encrypted: i=1; AL+hErFuFa+jCBChnp+Sxx71tE3VhubbdmmpxAWjYorjqV7wbv9+3XBQlwiaHpuogzoUcBiv0HWcF4LK9lvYG2WX7/UP@lists.infradead.org
X-Gm-Message-State: APuU4Z8DqiL7hCiezzT8xRwAj9xc5ZzWo/NVsQr5E85wo1NIm7OBS6gR
	Vwxa7HFQO/H5O60LKUc6FMK/1i0PlluVp6M6knVt9kthfGqKpMdosGO5
X-Gm-Gg: AZFdTZcctSXV3lkeIdUxevYLrPBlSzJX72lSLEJFqNjAmzrZKEtSFItIkoWZAWAbdtf
	Rw03RTx9aux9sYrz37cuyOuVcSB8vwo7cmHeQMR4DCCDm/U58qZXFaMasULKKb8l6X4TCmgzrcy
	crhc5Wimo2+Phg76Bd3hXzSiRqcPnoclK1sPaiZmkVrzyjDNj/52TGDuaBm9r/jUrLWCckx9+Rr
	3C86b02M3vVOlhcfiV/y2t+RCgfQVauhtb2AjrNtJ7Whmfs2fLLvwFRb6/9/6+DQ+8jLvmHzULy
	nJS2FQH04EFMuo54xuejxe4MLZzEEjfoa2YtXxe2uOchEI2vN9mNV0qc/sYV96k3Hvlmr3b+WD4
	Aipbrn32peHEbtO288q0IRFCrAHrp3XPYrHuPEaAI1q+U3T5yqBkk+l2F0Nuc5KOJC6K6akn4oZ
	OTA6HpHNfOxBu4jVD4lp/UajQVcIOEoM0a7J7qF1QB2lNycXd7Kb2sr3kJvze0uFaIVULbSouvA
	u+ABTJ6iK6tzC+V+iI6DTSItq7A0M9cxsGpdAgAlllRXy30QuJE2yqerl2CBi/ByW2aJD7AM8id
	LTr4V9Ev1kEdCODZHSPehuIeLrQsCs7H4ixW/frMhw0hVgk=
X-Received: by 2002:a05:600c:1911:b0:4a2:150f:1607 with SMTP id 5b1f17b1804b1-4bb8880a584mr492741765e9.13.1795780891427;
        Fri, 27 Nov 2026 04:01:31 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:01:29 -0800 (PST)
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
Subject: [PATCH v14 10/30] crypto: amlogic - Cleanup defines
Date: Fri, 27 Nov 2026 13:00:43 +0100
Message-ID: <20261127120103.1532882-11-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120103.1532882-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_040133_669431_4A2FEE9A 
X-CRM114-Status: GOOD (  14.52  )
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

It is bad to use hardcoded values directly in the code.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/crypto/amlogic/amlogic-gxl-cipher.c | 24 ++++++++++-----------
 drivers/crypto/amlogic/amlogic-gxl.h        | 16 ++++++++------
 2 files changed, 21 insertions(+), 19 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index 00d3247ebea1..c17ce5cc70a8 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -141,8 +141,8 @@ static int meson_cipher(struct skcipher_request *areq)
 						 ivsize, 0);
 		}
 	}
-	if (keyivlen == 24)
-		keyivlen = 32;
+	if (keyivlen == AES_KEYSIZE_192)
+		keyivlen = AES_MAX_KEY_SIZE;
 
 	phykeyiv = dma_map_single(mc->dev, bkeyiv, keyivlen,
 				  DMA_TO_DEVICE);
@@ -161,7 +161,7 @@ static int meson_cipher(struct skcipher_request *areq)
 		todo = min(keyivlen - eat, 16u);
 		desc->t_src = cpu_to_le32(phykeyiv + i * 16);
 		desc->t_dst = cpu_to_le32(i * 16);
-		v = (MODE_KEY << 20) | DESC_OWN | 16;
+		v = DESC_MODE_KEY | DESC_OWN | 16;
 		desc->t_status = cpu_to_le32(v);
 
 		eat += todo;
@@ -214,7 +214,7 @@ static int meson_cipher(struct skcipher_request *areq)
 		desc->t_src = cpu_to_le32(sg_dma_address(src_sg));
 		desc->t_dst = cpu_to_le32(sg_dma_address(dst_sg));
 		todo = min(len, sg_dma_len(src_sg));
-		v = (op->keymode << 20) | DESC_OWN | todo | (algt->blockmode << 26);
+		v = op->keymode | DESC_OWN | todo | algt->blockmode;
 		if (rctx->op_dir)
 			v |= DESC_ENCRYPTION;
 		len -= todo;
@@ -363,14 +363,14 @@ static int meson_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
 	struct meson_dev *mc = op->mc;
 
 	switch (keylen) {
-	case 128 / 8:
-		op->keymode = MODE_AES_128;
+	case AES_KEYSIZE_128:
+		op->keymode = DESC_MODE_AES_128;
 		break;
-	case 192 / 8:
-		op->keymode = MODE_AES_192;
+	case AES_KEYSIZE_192:
+		op->keymode = DESC_MODE_AES_192;
 		break;
-	case 256 / 8:
-		op->keymode = MODE_AES_256;
+	case AES_KEYSIZE_256:
+		op->keymode = DESC_MODE_AES_256;
 		break;
 	default:
 		dev_dbg(mc->dev, "ERROR: Invalid keylen %u\n", keylen);
@@ -388,7 +388,7 @@ static int meson_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
 static struct meson_alg_template algs[] = {
 {
 	.type = CRYPTO_ALG_TYPE_SKCIPHER,
-	.blockmode = MESON_OPMODE_CBC,
+	.blockmode = DESC_OPMODE_CBC,
 	.alg.skcipher.base = {
 		.base = {
 			.cra_name = "cbc(aes)",
@@ -417,7 +417,7 @@ static struct meson_alg_template algs[] = {
 },
 {
 	.type = CRYPTO_ALG_TYPE_SKCIPHER,
-	.blockmode = MESON_OPMODE_ECB,
+	.blockmode = DESC_OPMODE_ECB,
 	.alg.skcipher.base = {
 		.base = {
 			.cra_name = "ecb(aes)",
diff --git a/drivers/crypto/amlogic/amlogic-gxl.h b/drivers/crypto/amlogic/amlogic-gxl.h
index 608ce75f027a..15b4335942d5 100644
--- a/drivers/crypto/amlogic/amlogic-gxl.h
+++ b/drivers/crypto/amlogic/amlogic-gxl.h
@@ -11,19 +11,21 @@
 #include <linux/crypto.h>
 #include <linux/scatterlist.h>
 
-#define MODE_KEY 1
-#define MODE_AES_128 0x8
-#define MODE_AES_192 0x9
-#define MODE_AES_256 0xa
-
 #define MESON_DECRYPT 0
 #define MESON_ENCRYPT 1
 
-#define MESON_OPMODE_ECB 0
-#define MESON_OPMODE_CBC 1
+#define DESC_MODE_KEY (0x1 << 20)
+#define DESC_MODE_AES_128 (0x8 << 20)
+#define DESC_MODE_AES_192 (0x9 << 20)
+#define DESC_MODE_AES_256 (0xa << 20)
 
 #define MAXDESC 64
 
+#define DESC_OPMODE_ECB (0 << 26)
+#define DESC_OPMODE_CBC (1 << 26)
+
+#define DESC_MAXLEN GENMASK(16, 0)
+
 #define DESC_LAST BIT(18)
 #define DESC_ENCRYPTION BIT(28)
 #define DESC_OWN BIT(31)
-- 
2.47.3


