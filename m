Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6AD606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UfMS4TWy;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=woVxifno
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=H6JuaHlgOFaTRvm4ik6+FqVcECQ77XVTUFxb5teXNtM=; b=UfMS4TWy+fedpk
	NkcPSc5DaOUS6VqhUwXAuWS2D+XOQkNlfF8NhaZIMMrKqQFz6B9fw+tV60WXmLbp1bNF6a9GYUM+v
	RtNb9IvSDmX2dSoUYwHyw+NR2Oz++J/+7V1nw0lBNAzbcIwtpCzXyR5x24kyMRl143TFRWhVc1l+w
	0D0xqTDTZaE7k+XfqLsvO5DDFkLwi9I+eo8Qz0vzZSThBYN8PseRr+zQDUob8bSjVMB6aJNl9zLPU
	gVoSi0jKdVth578sCVIxjYfKiDzwHtTR+3Z4wNwu+nd7BgbV31msCD4qJLU0S6ZaoPoQ8V0OllU4A
	uzKYnEeYQaan3GLR7BIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuhF-0000000Fz5U-3beG;
	Fri, 27 Nov 2026 12:04:57 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWueK-0000000FwbW-3S6F
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:02:05 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so102606515e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 04:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780915; x=1796385715; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H6JuaHlgOFaTRvm4ik6+FqVcECQ77XVTUFxb5teXNtM=;
        b=woVxifnon9k6OCitr70hY6O5TudcUiAGOtp0mj0b1MPgDC7PWds2bTkQsWLQaVhVIX
         Tw+c/qXlK8LmCJW2U8PZyXlvndbV3ibNmJUQ/02A0lfJJpQwaS8+dRryp9U4QlWukf4t
         bZxMZq/nZ1HcZKqpuriCeHq9hYPGymQmk3v/CrSGvgdIIXgbqJMpa+a7Lxt3BObmIEPh
         2cvRi0sw/nSFVGjD6QxFfKELF+r309mc0s+Id6UrfkJhUsMJAPKtPO0ulzZtPtR6kZ0A
         d8FACaV07qDCeslWRzsnmvqnzemk2DS7Tudqg9XnX9qAkjoqHzkvVJYw96A17xU7PNtA
         pCJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780915; x=1796385715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H6JuaHlgOFaTRvm4ik6+FqVcECQ77XVTUFxb5teXNtM=;
        b=xoBdftoafhdY3zrXu3/A+5yywUcc6ZqncyecmB71xQC0A962JaCoK2qeDBgGZuISc+
         AmS74uZ8GGond4FYfnFuAb2MJAyxlIBIlHpEeIx3Ul5EifsvUbcluqfz+DLtX86afxX9
         nrgsqu+Bn13O1GYzzeINT84mZHP75AC2KZtVCzkfbt7ZY6wTw3rTcK8BR+3I7TOcmVoR
         5HS/asiU9nQ+WoHnwgLpGV9rJF6DRWY3Yk6Ev0jJs4158yT2btukMGtQM6U5ZVzmURkR
         7EIFPaNTCG2/f1ARsk5Oj++dRS0mfCPydApgqNVdyG9lDIepu3d9vyClv0GCouwVKNdK
         2aSg==
X-Forwarded-Encrypted: i=1; AL+hErHOGyk1o3eS0AfmKANmFDPdENh7GpQpaW1ZaR61CA8aTnMHWYxAWrXsZoBs7R6litEVdCHL3pWRWI0XN6iL+SHA@lists.infradead.org
X-Gm-Message-State: APuU4Z95bw7Ajan8qJaPAluhcy5jBzH+Bx6ADid3grKxRYXsgtSdtisA
	2AjnwSZxxHCyf6izxbOWj5/eDU54yQ7PI7SZ9aUG9SkBjq2MLa1vDmfc
X-Gm-Gg: AZFdTZfzGbrlypg+ZYHWGbGrypktQVrXSLorvJDzSfR99QK06k0cfB1NSzGTdMTz0FR
	UPo6++aQCylnz8yldxNkKPYwHSF3HVd5Tk4chf+a3UsaNv41zu+IUscVE4V5nd1TSInfF6ZTaYl
	tW98fIJ9ghpdx1hz+E2VYwmYFNyTnUgKUlu1l0PvVd4NkxffLaP7h8lv5+3n3EbXoH3UXlzV7tc
	MRiVe9JOHWHz0Ag2cJBOgxRQO2TF2r1UvO6HMAYdUKAXFGXA0IQaaiGouAwiUTAFeE/hjEmwUby
	Tbxm0Gz0LWFjg4H+00xacdlWekVcOYKa0gGKbJAja9GY0Ht7D1dj1jh7jTGyYmQuxql9cFidIuE
	WtyFp+c6MJgsBuE/blEV7nYiXWGCgU3LFpa6aiN00Q+O/8yfaoeH3xpZlPF4doOT7WcIPTaa25h
	+nwEJ3rApfD20yjydJtT6tHo3HFMVa0P/NgG7YHmDkadUTABsZ26eNhJNmECEhS+QxxB6WlS9bE
	wkMZGbaAx1/zqOG+la68QtGvz2rmBgsH/KIB7WEk6i3Bap+6ORzTK8blGCEu3gC2ghdrXM9v7Ji
	w6Hu6pX9ujFfObzsSR3qLsvOfLri2L0+djSBEEyj70T2hi4=
X-Received: by 2002:a05:600c:5303:b0:4ba:4928:8aec with SMTP id 5b1f17b1804b1-4bb88807d7cmr456893495e9.9.1795780914919;
        Fri, 27 Nov 2026 04:01:54 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:01:52 -0800 (PST)
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
Subject: [PATCH v14 19/30] crypto: amlogic: hasher: add one-shot digest path
Date: Fri, 27 Nov 2026 13:00:52 +0100
Message-ID: <20261127120103.1532882-20-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120103.1532882-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_040158_731435_DBE9989E 
X-CRM114-Status: GOOD (  20.61  )
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

Implement the ahash ->digest callback so one-shot SHA requests are sent
as a single engine transfer instead of the init/update/final sequence,
and skip the spurious trailing block for digest requests.

Also unregister the hasher on device removal and lower the "hasher not
supported" message to dev_dbg.

Signed-off-by: Jose Nieto <jnieto.alaber@gmail.com>
---
 drivers/crypto/amlogic/amlogic-gxl-core.c   |  9 ++++---
 drivers/crypto/amlogic/amlogic-gxl-hasher.c | 29 +++++++++++++++++++--
 drivers/crypto/amlogic/amlogic-gxl.h        |  5 +++-
 3 files changed, 36 insertions(+), 7 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index 3a6bac10bb04..38b9645386ae 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -237,6 +237,10 @@ static int meson_crypto_probe(struct platform_device *pdev)
 	if (err)
 		goto error_flow;
 
+	err = meson_hasher_register(mc);
+	if (err)
+		goto error_hasher;
+
 	if (IS_ENABLED(CONFIG_CRYPTO_DEV_AMLOGIC_GXL_DEBUG)) {
 		struct dentry *dbgfs_dir;
 
@@ -247,10 +251,6 @@ static int meson_crypto_probe(struct platform_device *pdev)
 #endif
 	}
 
-	err = meson_hasher_register(mc);
-	if (err)
-		goto error_hasher;
-
 	return 0;
 
 error_hasher:
@@ -269,6 +269,7 @@ static void meson_crypto_remove(struct platform_device *pdev)
 	debugfs_remove_recursive(mc->dbgfs_dir);
 #endif
 
+	meson_hasher_unregister(mc);
 	meson_cipher_unregister(mc);
 
 	meson_free_chanlist(mc, mc->flow_cnt - 1);
diff --git a/drivers/crypto/amlogic/amlogic-gxl-hasher.c b/drivers/crypto/amlogic/amlogic-gxl-hasher.c
index c83739ec3456..978cdcd8a4f9 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-hasher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-hasher.c
@@ -51,6 +51,25 @@ static int meson_sha_final(struct ahash_request *req)
 	return crypto_transfer_hash_request_to_engine(engine, req);
 }
 
+static int meson_sha_digest(struct ahash_request *req)
+{
+	struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
+	struct meson_hasher_tfm_ctx *tctx = crypto_ahash_ctx_dma(tfm);
+	struct meson_hasher_req_ctx *rctx = ahash_request_ctx(req);
+	struct crypto_engine *engine;
+
+	memset(rctx, 0, sizeof(struct meson_hasher_req_ctx));
+
+	rctx->flow = meson_get_engine_number(tctx->mc);
+	rctx->begin_req = true;
+	rctx->final_req = true;
+	rctx->digest_req = true;
+
+	engine = tctx->mc->chanlist[rctx->flow].engine;
+
+	return crypto_transfer_hash_request_to_engine(engine, req);
+}
+
 static int meson_hasher_req_map(struct ahash_request *req)
 {
 	struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
@@ -251,7 +270,7 @@ static int meson_hasher_do_one_request(struct crypto_engine *engine, void *areq)
 	struct hasher_ctx ctx = {
 		.tloffset = 0,
 		.src_offset = 0,
-		.nbytes = rctx->final_req ? 0 : req->nbytes,
+		.nbytes = (rctx->final_req && !rctx->digest_req) ? 0 : req->nbytes,
 		.src_sg = req->src,
 		.areq = areq,
 	};
@@ -310,6 +329,9 @@ static int meson_hasher_do_one_request(struct crypto_engine *engine, void *areq)
 		if (!ctx.todo && ctx.nbytes)
 			continue;
 
+		if (!ctx.todo && rctx->final_req && rctx->partial_size)
+			continue;
+
 		if (!ctx.todo && !rctx->final_req && !ctx.tloffset)
 			continue;
 
@@ -393,6 +415,7 @@ static struct meson_alg_template mc_algs[] = {
 		.init = meson_sha_init,
 		.update = meson_sha_update,
 		.final = meson_sha_final,
+		.digest = meson_sha_digest,
 		.export = meson_hasher_export,
 		.import = meson_hasher_import,
 	},
@@ -421,6 +444,7 @@ static struct meson_alg_template mc_algs[] = {
 		.init = meson_sha_init,
 		.update = meson_sha_update,
 		.final = meson_sha_final,
+		.digest = meson_sha_digest,
 		.export = meson_hasher_export,
 		.import = meson_hasher_import,
 	},
@@ -449,6 +473,7 @@ static struct meson_alg_template mc_algs[] = {
 		.init = meson_sha_init,
 		.update = meson_sha_update,
 		.final = meson_sha_final,
+		.digest = meson_sha_digest,
 		.export = meson_hasher_export,
 		.import = meson_hasher_import,
 	},
@@ -463,7 +488,7 @@ int meson_hasher_register(struct meson_dev *mc)
 	int i;
 
 	if (!mc->pdata->hasher_supported) {
-		pr_info("amlogic-gxl-hasher: hasher not supported at current platform");
+		dev_dbg(mc->dev, "hasher is not supported on this platform\n");
 		return 0;
 	}
 
diff --git a/drivers/crypto/amlogic/amlogic-gxl.h b/drivers/crypto/amlogic/amlogic-gxl.h
index a44290fcf3a0..3f1ce6c05558 100644
--- a/drivers/crypto/amlogic/amlogic-gxl.h
+++ b/drivers/crypto/amlogic/amlogic-gxl.h
@@ -161,7 +161,9 @@ struct meson_cipher_tfm_ctx {
  * @partial_size:	size of the partial buffer
  * @partial_addr:	physical address of partial buffer
  * @partial_mapped:	indicates is partial buffer currently mapped or not
- * @flags:		request flags (for example, is this final req or not)
+ * @begin_req:		indicates this is the first request
+ * @final_req:		indicates this is the final request
+ * @digest_req:		indicates a one-shot digest request
  * @flow:		the flow to use for this request
  */
 struct meson_hasher_req_ctx {
@@ -173,6 +175,7 @@ struct meson_hasher_req_ctx {
 
 	bool begin_req;
 	bool final_req;
+	bool digest_req;
 	int flow;
 };
 
-- 
2.47.3


