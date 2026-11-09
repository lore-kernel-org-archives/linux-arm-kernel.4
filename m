Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050BD606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 10:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LTufNmxA;
	dkim=pass (2048-bit key, unprotected) header.d=email.cz header.i=@email.cz header.a=rsa-sha256 header.s=szn1 header.b=FlElEeVi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=QAvczo67RSfalJeCsyzcJCLsA81gRzj2i73BFxVghM4=; b=LTufNmxA0SbyZz73SyFUzi+b5k
	21Rd6OOcHKVvn4bQtb/b2uOWrEEGyEcUcxZrftrlgNiJh/wDpili64FOMqfauOYNbLDutSBBk93zJ
	HwqZxSeHlD+vJRfYOvdDfMx36bND5X4EKKi65xrUorKHPgx9iESGTnv4mgMZFYD36MSH56+H6QQEg
	pAU+ZQAcNsfYafo2gVVgyuDK2+1pm2ih6y48ZNPT8J+lPDqW48/iV52VYEp4+lJbcoPPWgxN2/l5X
	9n2P9hV98SYwO7kB3/jLxIEIlxIzQGamEZU9OJnvSboRvfH4Ljr2sYGOVJIli9+KEQxFtUx6y22MY
	xqq0kPpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQMml-00000000RHE-0H94;
	Mon, 09 Nov 2026 10:39:35 +0000
Received: from mxc-1-9b3.seznam.cz ([2a02:598:128:8a00::1000:9b3])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQMmh-00000000RFi-2dTe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 10:39:33 +0000
Received: from email.seznam.cz
	by smtpc-mxc-685566bfbf-xlpnn
	(smtpc-mxc-685566bfbf-xlpnn [2a02:598:128:8a00::1000:9b3])
	id 0a2fb6b9f4db04130aa138a1;
	Mon, 09 Nov 2026 11:38:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cz; s=szn1;
	t=1794220732; bh=QAvczo67RSfalJeCsyzcJCLsA81gRzj2i73BFxVghM4=;
	h=From:To:Cc:Subject:Date:Message-Id:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=FlElEeVi/y5ot2kn+A79b9hWgIgCoDJpxEsC9bi1TycepDmisqCrPJ3rhrdnLwg6l
	 uG8WWC4ct6q2xG+QAI4fZOjj8NfdYiOts1KqRA3rlPRUFH4vhkb/ohAXKuytIyFHkd
	 RItTTrNynfnFo2WBl2ncd/sj1wzYJIN2kNJtnzJAd+LVkbm5LkEL88fEKQSxdBhY/E
	 PH3mMfDXZF6XsKDyOqEnJhy7AiC0/xvqPchvmuVG5OrHz53ZmOA2/pp9qpNvHsZYA5
	 AsHimeXL/hQewfv6VPiRXcmz3byNfqLXLVgpciP7aQxSvG+UqJ2YOKyUv8rLJhpNnV
	 AcVhEn51tpYHA==
Received: from unknown ([82.144.143.215])
	by email.seznam.cz (szn-email-ebox-5.1.30) with HTTP;
	Mon, 09 Nov 2026 11:38:39 +0100 (CET)
From: "Tomas Paukrt" <tomaspaukrt@email.cz>
To: "Herbert Xu" <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Cc: "Shawn Guo" <shawnguo@kernel.org>,
	"Sascha Hauer" <s.hauer@pengutronix.de>,
	"Pengutronix Kernel Team" <kernel@pengutronix.de>,
	"Fabio Estevam" <festevam@gmail.com>,
	"Marek Vasut" <marex@denx.de>,
	<linux-crypto@vger.kernel.org>,
	<imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] crypto: mxs-dcp - Fix softirq locking and completion
Date: Mon, 09 Nov 2026 11:38:38 +0100 (CET)
Message-Id: <1qB.ZqMy.4DIhrOb2ZPx.1gyQAk@seznam.cz>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0 (szn-mime-2.2.19)
X-Mailer: szn-email-ebox-5.1.30
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_023932_390133_CA2E42F3 
X-CRM114-Status: GOOD (  10.85  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The request queues are protected by plain spin_lock(), but requests are
enqueued from softirq context (e.g. by ESP on packet receive) as well as=

from process context, while the channel threads dequeue them in process
context with bottom halves enabled. A softirq that runs on the same CPU
while the lock is held either deadlocks on SMP, or corrupts the queue on=

UP where the spinlock does not provide any protection.

In addition, the channel threads call the completion callbacks with
bottom halves enabled, although the crypto API requires them to be
called with bottom halves disabled. With IPsec, esp_input_done() then
runs xfrm_input() and gro_cells_receive() in plain process context,
which races with the NET_RX softirq on the per-CPU GRO cell queue and on=

the xfrm state, and defers the NAPI poll until the next interrupt.

This was observed with strongSwan on i.MX6ULL: the throughput drops
quickly and eventually no packets are decrypted at all.

Fix this by taking the queue locks with spin_lock_bh() and by calling
the completion callbacks with bottom halves disabled.

Fixes: 15b59e7c3733 ("crypto: mxs - Add Freescale MXS DCP driver")
Signed-off-by: Tomas Paukrt <tomaspaukrt@email.cz>
---
 drivers/crypto/mxs-dcp.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/crypto/mxs-dcp.c b/drivers/crypto/mxs-dcp.c
index e1ff6ac8b213..b6749eb8f6f4 100644
--- a/drivers/crypto/mxs-dcp.c
+++ b/drivers/crypto/mxs-dcp.c
@@ -420,10 +420,10 @@ static int dcp_chan_thread_aes(void *data)
 	while (!kthread_should_stop()) {
 		set_current_state(TASK_INTERRUPTIBLE);
 
-		spin_lock(&sdcp->lock[chan]);
+		spin_lock_bh(&sdcp->lock[chan]);
 		backlog =3D crypto_get_backlog(&sdcp->queue[chan]);
 		arq =3D crypto_dequeue_request(&sdcp->queue[chan]);
-		spin_unlock(&sdcp->lock[chan]);
+		spin_unlock_bh(&sdcp->lock[chan]);
 
 		if (!backlog && !arq) {
 			schedule();
@@ -432,12 +432,17 @@ static int dcp_chan_thread_aes(void *data)
 
 		set_current_state(TASK_RUNNING);
 
-		if (backlog)
+		if (backlog) {
+			local_bh_disable();
 			crypto_request_complete(backlog, -EINPROGRESS);
+			local_bh_enable();
+		}
 
 		if (arq) {
 			ret =3D mxs_dcp_aes_block_crypt(arq);
+			local_bh_disable();
 			crypto_request_complete(arq, ret);
+			local_bh_enable();
 		}
 	}
 
@@ -480,9 +485,9 @@ static int mxs_dcp_aes_enqueue(struct skcipher_request=
 *req, int enc, int ecb)
 	rctx->ecb =3D ecb;
 	actx->chan =3D DCP_CHAN_CRYPTO;
 
-	spin_lock(&sdcp->lock[actx->chan]);
+	spin_lock_bh(&sdcp->lock[actx->chan]);
 	ret =3D crypto_enqueue_request(&sdcp->queue[actx->chan], &req->base);
-	spin_unlock(&sdcp->lock[actx->chan]);
+	spin_unlock_bh(&sdcp->lock[actx->chan]);
 
 	wake_up_process(sdcp->thread[actx->chan]);
 
@@ -750,10 +755,10 @@ static int dcp_chan_thread_sha(void *data)
 	while (!kthread_should_stop()) {
 		set_current_state(TASK_INTERRUPTIBLE);
 
-		spin_lock(&sdcp->lock[chan]);
+		spin_lock_bh(&sdcp->lock[chan]);
 		backlog =3D crypto_get_backlog(&sdcp->queue[chan]);
 		arq =3D crypto_dequeue_request(&sdcp->queue[chan]);
-		spin_unlock(&sdcp->lock[chan]);
+		spin_unlock_bh(&sdcp->lock[chan]);
 
 		if (!backlog && !arq) {
 			schedule();
@@ -762,12 +767,17 @@ static int dcp_chan_thread_sha(void *data)
 
 		set_current_state(TASK_RUNNING);
 
-		if (backlog)
+		if (backlog) {
+			local_bh_disable();
 			crypto_request_complete(backlog, -EINPROGRESS);
+			local_bh_enable();
+		}
 
 		if (arq) {
 			ret =3D dcp_sha_req_to_buf(arq);
+			local_bh_disable();
 			crypto_request_complete(arq, ret);
+			local_bh_enable();
 		}
 	}
 
@@ -827,9 +837,9 @@ static int dcp_sha_update_fx(struct ahash_request *req=
, int fini)
 		rctx->init =3D 1;
 	}
 
-	spin_lock(&sdcp->lock[actx->chan]);
+	spin_lock_bh(&sdcp->lock[actx->chan]);
 	ret =3D crypto_enqueue_request(&sdcp->queue[actx->chan], &req->base);
-	spin_unlock(&sdcp->lock[actx->chan]);
+	spin_unlock_bh(&sdcp->lock[actx->chan]);
 
 	wake_up_process(sdcp->thread[actx->chan]);
 	mutex_unlock(&actx->mutex);
-- 
2.43.0

