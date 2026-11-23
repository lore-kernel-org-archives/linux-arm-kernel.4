Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C0E606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 15:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lmG1yQHL;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TKofGITs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Y3crQHbdpOlgtQVKmilOb/+IWL0/tt7WDZKDspXm67A=; b=lmG1yQHLHrNxBH
	Cc/djg/EHPEf8bmcm9HWYYnD8Pa1hanSI0GMSkyDrGQjcFI0r7/h7fGYBpI+xsdPyQCRzXY9cHpz2
	aEyvWFLuafX4Ut5/yyKYahMwncIlfjDgSsO39An/vemkNoNkvcQiVqS8unC7rf7NG2ekDe0ael34M
	Ma0uFzmXG5gMA/E9Jaw/sofPSajkaZZlmCCBDPd6is39yr4lsIXrZ+FLTg1txDdNO3Q0GwcWk48NY
	hk1H88V8bkqFNWCJcyiEx+hLb1+iLyIIe2KjCXD8CIsj9xL6V5zN8BgIIPDjhsR4vWs/VlZMTFlDj
	2/3zNybTUdRZNNu687Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVViN-00000003vJb-3aZN;
	Mon, 23 Nov 2026 15:12:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVViM-00000003vJH-3SbS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 15:12:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4751A61EF8;
	Mon, 23 Nov 2026 15:12:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4AD91F000CA;
	Mon, 23 Nov 2026 15:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795446737;
	bh=Y3crQHbdpOlgtQVKmilOb/+IWL0/tt7WDZKDspXm67A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TKofGITszN1ewiDEtpVWMrbMfRwWCjDaHNbBen0MkvuNON/yK2SDQB6oS7h0PE5i7
	 tgeeEjk9sV/5XJ7z3G9kAxf6//s44qhgty+pZrzzDo61M+YdiXd76Le86YxIU2EAX/
	 HwSbyC1UA0W3Z4zrcXmIfMCafL1OGdpa/rgUknqiYoezjf1Y31SOQxHXpxa6hMZaQ6
	 UaVkSoFo7/YsqOymnRN90B9ffJ2A/R2G2juLmFoN7GZrDtN6Xkm8Ivv/YTgkknsdGa
	 jCfUfTf3VAzx6cPLRpi6voTlz17ryusbj9pR39GybniE9OqmDoPYwbl83F/U0wWxyD
	 2u7Vmxw9WVb1A==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Thorsten Blum <blum@kernel.org>,
	Nicolas Royer <nicolas@eukrea.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 10/10] crypto: atmel-tdes - Update output IV before clearing busy flag
Date: Mon, 23 Nov 2026 15:10:01 +0000
Message-ID: <20261123151055.2533735-11-lee@kernel.org>
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

In atmel_tdes_finish_req(), dd->flags clears TDES_FLAGS_BUSY without
holding dd->lock and before calling
atmel_tdes_set_iv_as_last_ciphertext_block().

As soon as TDES_FLAGS_BUSY is cleared, a concurrent
atmel_tdes_handle_queue() caller on another CPU can dequeue the next
request and overwrite dd->req (as well as modify dd->flags).  When
atmel_tdes_set_iv_as_last_ciphertext_block() then reads dd->req, it
overwrites the newly dequeued request's IV with the previous request's
ciphertext and leaves the completed request's output IV un-updated.

Update the output IV before clearing TDES_FLAGS_BUSY, and clear
TDES_FLAGS_BUSY under dd->lock to serialise flag updates with
atmel_tdes_handle_queue().

Fixes: 61b0dd664fa1 ("crypto: atmel-tdes - Set the IV after {en,de}crypt")
Closes: https://sashiko.dev/#/bug/linux-d6fd6f42-d6fc-47d0-86d5-f428e2203a64
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/crypto/atmel-tdes.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/atmel-tdes.c b/drivers/crypto/atmel-tdes.c
index c86d06169ab9..392a2a3a8b85 100644
--- a/drivers/crypto/atmel-tdes.c
+++ b/drivers/crypto/atmel-tdes.c
@@ -504,14 +504,17 @@ static void atmel_tdes_finish_req(struct atmel_tdes_dev *dd, int err)
 {
 	struct skcipher_request *req = dd->req;
 	struct atmel_tdes_reqctx *rctx = skcipher_request_ctx(req);
+	unsigned long flags;
 
 	clk_disable_unprepare(dd->iclk);
 
-	dd->flags &= ~TDES_FLAGS_BUSY;
-
 	if (!err && (rctx->mode & TDES_FLAGS_OPMODE_MASK) != TDES_FLAGS_ECB)
 		atmel_tdes_set_iv_as_last_ciphertext_block(dd);
 
+	spin_lock_irqsave(&dd->lock, flags);
+	dd->flags &= ~TDES_FLAGS_BUSY;
+	spin_unlock_irqrestore(&dd->lock, flags);
+
 	skcipher_request_complete(req, err);
 }
 
-- 
2.56.1.750.gf70dc682cf-goog


