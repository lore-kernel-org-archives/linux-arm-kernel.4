Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE789606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 15:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KcsQR3wE;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iQuxI9z5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=STeVH55BBeBKM6xcTx+69M7sUEKnUAjtUBsUatOVMGw=; b=KcsQR3wE8rPCg6
	zo6g5ZMVMHWQd/6EpLWHBkddPybqKDjSSd98nJKCxd5G0Z6F1Yr+1kVhzZhkP1uhWyd58NaIEduW6
	O2BSH9se9JlLUHSHLdrogAEu6IcL31TUIew+xw7q+siKf/W+9s1JmChKUXmLDaHtGBtYsBXk1Artv
	aCAOZVpBawBEpi0bjMfTOCTXqLMkRmqjDQEUCGOy2LBUveaN6tWcef+pDF0Nh4UvdSEpsdDvWy0tp
	S4je5ZxiExX1WwHki/JIzHaaLbjVXZjjarTeWPkiP44/zq2fd8R4pWVg3D0aFBUvUeJX7I8uV7nTx
	vOSPgd8R7fKeYcGKMUIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVhj-00000003vBl-3GUe;
	Mon, 23 Nov 2026 15:11:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVhi-00000003vB8-1294
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 15:11:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8411B622A4;
	Mon, 23 Nov 2026 15:11:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 282D31F000CF;
	Mon, 23 Nov 2026 15:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795446697;
	bh=STeVH55BBeBKM6xcTx+69M7sUEKnUAjtUBsUatOVMGw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iQuxI9z5WzUZZyvlumpBl7lcu5ipk202NNdsZPnzmCgWGAvZa1ay60Fxq64Rp5KCp
	 rHfctmjrETxSiuULSIL7i3VOpXh35crvqibh3btRqwuRLzMrSHbul92HPic8ircLfH
	 bsBKfrFNI6SwINufuwPRKS98uTt0xnRuI8hfm40Khn+C+Od/orlQuiEyBHGUz2RUzQ
	 R5nMiXWOcIHzT7NwxLinqSHvkCdZYQeJRzl/w1gyX1j7qQsXTtr6mqzkCDfJnRulc7
	 66NyzfOQZY98dQ23iYtSbhtTGi+T+R3x0cP4LkbwXIyWS31Yiok+k7lUWRtO3iCOt8
	 74cstbe/A8PZg==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Corentin Labbe <clabbe.montjoie@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	bui duc phuc <phucduc.bui@gmail.com>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 04/10] crypto: sun8i-ss - Fix scatterlist array overflow for HMAC requests
Date: Mon, 23 Nov 2026 15:09:55 +0000
Message-ID: <20261123151055.2533735-5-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
In-Reply-To: <20261123151055.2533735-1-lee@kernel.org>
References: <20261123151055.2533735-1-lee@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

sun8i_ss_hash_need_fallback() reserves one hardware scatterlist slot
out of MAX_SG (8) for the trailing hash padding buffer, allowing up to
7 input scatterlist entries.

However, for HMAC requests (tfmctx->keylen > 0), sun8i_ss_hash_run()
also shifts the mapped source array up by one slot to insert the inner
pad at index 0 and increments i before writing the trailing padding
entry at rctx->t_src[i] and rctx->t_dst[i].  When an HMAC request
contains 7 block-aligned scatterlist entries, i reaches 8 (MAX_SG),
writing past the end of rctx->t_src and rctx->t_dst, corrupting
rctx->method and rctx->flow, and indexing out of bounds into ss->flows.

Reserve an extra scatterlist slot in sun8i_ss_hash_need_fallback() when
tfmctx->keylen is non-zero so 7-entry HMAC requests use the software
fallback.

Fixes: 801b7d572c0a ("crypto: sun8i-ss - add hmac(sha1)")
Closes: https://sashiko.dev/#/bug/linux-93388c71-507c-42fd-9c86-8076b06fc7c0
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
index 56ba4ff6d5ff..c2e0c6520f84 100644
--- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
@@ -344,9 +344,11 @@ static int sun8i_ss_run_hash_task(struct sun8i_ss_dev *ss,
 static bool sun8i_ss_hash_need_fallback(struct ahash_request *areq)
 {
 	struct crypto_ahash *tfm = crypto_ahash_reqtfm(areq);
+	struct sun8i_ss_hash_tfm_ctx *tfmctx = crypto_ahash_ctx(tfm);
 	struct ahash_alg *alg = crypto_ahash_alg(tfm);
 	struct sun8i_ss_alg_template *algt;
 	struct scatterlist *sg;
+	int max_sg;
 
 	algt = container_of(alg, struct sun8i_ss_alg_template, alg.hash.base);
 
@@ -360,8 +362,9 @@ static bool sun8i_ss_hash_need_fallback(struct ahash_request *areq)
 		return true;
 	}
 
-	/* we need to reserve one SG for the padding one */
-	if (sg_nents(areq->src) > MAX_SG - 1) {
+	/* Reserve one SG for padding and, for HMAC, one for ipad */
+	max_sg = tfmctx->keylen ? MAX_SG - 2 : MAX_SG - 1;
+	if (sg_nents(areq->src) > max_sg) {
 		algt->stat_fb_sgnum++;
 		return true;
 	}
-- 
2.56.1.750.gf70dc682cf-goog


