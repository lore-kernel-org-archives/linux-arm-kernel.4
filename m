Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15DD606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 00:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ppMv677U;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YAmYtRaF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hZGsiZPfJDMA7smlRJ4dLsRRcxTqNeN1zBeKd7rqlMk=; b=ppMv677U/lw5jy
	vVmaxnts7C3ENlMbLqE+sgBwYkYwZN+/lZFnCnT1sCeJ4qAfdmDB5KyI+mEGmcaX5NvC7fxmqCoJV
	z8g9i+fy5T/sb3CyjASBwxpoo2QZnJxutPM6Wnm4DxHAVzA/cvtH5Lk49V0WTHSdE9KUCYCPu+29D
	m7cW2e3o/BN0Gb1UZREUrKv0eC5hDZy+tQPuxHEKjNWSeFSCIdYfVzrV9h/pLGw5hdCVc0Gt2s20C
	65pooZByRqsV3Tp5gwvz2hwDYhGn0/Izv/HjGghM41ePNTIWZS2g6gAwmQJwqLD4Cv9DCSV6ZuIS1
	wLiNurBACpYVhdM78q2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVIJ9-000000021rr-1h2x;
	Mon, 23 Nov 2026 00:53:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVIJ4-000000021qg-22Gu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 00:53:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C6E0A6060E;
	Mon, 23 Nov 2026 00:53:17 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795395197;
	b=I8Po4EbRcMa6mIQr4qfhnKRwy+QikTiz/yKVVNeEuDmO5cGxc5if3boZNBp2xU0Kt1pb
	 oAGi/fpmkJykFAMvquugCWqAxZwYuBvoZYBoPCpQ3KGIrsI/WxZIuXsRY0aI5tQgmTFnA
	 Bv8JmTfpLxF/It+i4RIxmdAVn/hI3C5Q8lfSOB/bxrxhjv2XzA6FQivGU3EDMXQFG6I26
	 Zkvx4PEVdeNa38XNbpzQeUoOD3YWKG3avU/x+dPA9WyshWEEcpbedediZJrBYEnW8mm+I
	 6QZYA0i47zba3nDMqB+6l+NhBJUFjkrFw7J44vs0aQI2HWka5g4i/n4yxao1D4t/wZw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795395197;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=hZGsiZPfJDMA7smlRJ4dLsRRcxTqNeN1zBeKd7rqlMk=;
	b=LOqS4QtYeP9CdfRYgjDFNR7NfEXM/CSNZ7lM5pzJT4btnd/WfogVtbVaGLPxTZLM5PAy
	 0lYWK5mVwFhqF3ayvfg3RBWRSGOmDQBf1Z5bGyjvePaW25Ga5F9deD8HdDteJ2Fe44ZLh
	 kaueSHvJugE4KKx8ttPI+G4k03KVDSkDtdU+o/vnUITh6j3kM5JaUI9OSa9FtKRhqex6F
	 K33MP8rrvBXbFvV1+5Ed46Z+NxYq9R0GLb4a0o0Mv7B2u4kFZyNl2/kCIkHNfpjwuI4om
	 d87rY4zQQyf8IxtFigu9teR3VHk3HFbunxCJER0b/mMYIljVxfqGMKtSm+fQTpamqCw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 703741F000CF;
	Mon, 23 Nov 2026 00:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795395197;
	bh=hZGsiZPfJDMA7smlRJ4dLsRRcxTqNeN1zBeKd7rqlMk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=YAmYtRaF8RTMsiV/SM/mOr+ocD9610C6TNWyWCG+/Uiij87mC7adagCwFektHLg8u
	 TKRv4CnMAQ402M7Ppk0ttAq4+TWPAn7I3FsUXXJr8LMMTGxKEpntjEBgV0Sj6N2KMK
	 gMFj4YtJNSmr3ECtZ8S3IgwUvCsshDz9wW6zWVXSQtsWXAbSrC9Io9astmQYPnvP61
	 PUB2o8Dwy9TV4BytVYHtol+I2ST07NdtaQ3Dy7aLKh+i/tCQRNg8uGf5EyPewJBRjj
	 3qEu8HH6RBmBhGJf4p4eq3MLkJqeRhTyYUlYMDdaNPgdw6e79pIMlCA3WBS/GuMb4K
	 2CX2c+xCvctHw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id F21524C299;
	Mon, 23 Nov 2026 00:53:06 +0000 (UTC)
From: Suyuan Wang via B4 Relay <devnull+shyckless.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 00:53:07 +0000
Subject: [PATCH 2/2] dmaengine: idma64: Kill the channel tasklets in remove
 again
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-dma-chancnt-v1-2-f0eea0a4bb63@gmail.com>
References: <20261123-dma-chancnt-v1-0-f0eea0a4bb63@gmail.com>
In-Reply-To: <20261123-dma-chancnt-v1-0-f0eea0a4bb63@gmail.com>
To: vkoul@kernel.org, ludovic.desroches@microchip.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank.Li@kernel.org, allen.lkml@gmail.com, dave.jiang@intel.com, 
 dmaengine@vger.kernel.org, andriy.shevchenko@linux.intel.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795395185; l=1951;
 i=shyckless@gmail.com; s=default; h=from:subject:message-id;
 bh=GQuussW5tcaY3AFLXhEILE+dApPEjArrisGtHmyiqFk=;
 b=ji9WRcuHGobYS9nt8jrwgQQ3y9toNeTxMkJ70wG2ign/Yyl02TFW/2ibsbLp6r13W6629PLua
 fsVOoXzy6TrDFRy9TrznW54l/IaQlKsFPoPFz+2vE2QOmQMhZSihUx0
X-Developer-Key: i=shyckless@gmail.com; a=ed25519;
 pk=pMtccVGiWES3bV+7YBFuBclkvq2n2HBHQ5azaBrK2lY=
X-Endpoint-Received: by B4 Relay for shyckless@gmail.com/default with
 auth_id=1498
X-Original-From: Suyuan Wang <shyckless@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: shyckless@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Suyuan Wang <stevewong@hust.edu.cn>

idma64_remove() frees the IRQ and then kills the channel tasklets, as
the comment there says, so that no tasklet scheduled by the interrupt
runs after removal:

	for (i = 0; i < idma64->dma.chancnt; i++) {
		...
		tasklet_kill(&idma64c->vchan.task);
	}

Since commit e81274cd6b52 ("dmaengine: add support to dynamic
register/unregister of channels"), dma_async_device_unregister()
unregisters each channel and decrements dma.chancnt for it, so the
count is 0 when this loop runs and no tasklet is killed. A tasklet
scheduled by an interrupt can then run after the devm-allocated idma64
and its channels have been freed.

Read the channel count before unregistering the device.

Found with a static analysis tool and checked by hand.

Fixes: e81274cd6b52 ("dmaengine: add support to dynamic register/unregister of channels")
Cc: stable@vger.kernel.org
Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
---
 drivers/dma/idma64.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/idma64.c b/drivers/dma/idma64.c
index e3db213e564b..5d0df1defb14 100644
--- a/drivers/dma/idma64.c
+++ b/drivers/dma/idma64.c
@@ -604,6 +604,8 @@ static int idma64_probe(struct idma64_chip *chip)
 static void idma64_remove(struct idma64_chip *chip)
 {
 	struct idma64 *idma64 = chip->idma64;
+	/* dma_async_device_unregister() decrements dma.chancnt to 0 */
+	unsigned short nr_chan = idma64->dma.chancnt;
 	unsigned short i;
 
 	dma_async_device_unregister(&idma64->dma);
@@ -614,7 +616,7 @@ static void idma64_remove(struct idma64_chip *chip)
 	 */
 	devm_free_irq(chip->dev, chip->irq, idma64);
 
-	for (i = 0; i < idma64->dma.chancnt; i++) {
+	for (i = 0; i < nr_chan; i++) {
 		struct idma64_chan *idma64c = &idma64->chan[i];
 
 		tasklet_kill(&idma64c->vchan.task);

-- 
2.34.1



