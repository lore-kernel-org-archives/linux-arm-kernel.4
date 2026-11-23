Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBEBD606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 00:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mqx2sZzR;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QG8sqYzX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eSw5Z0+yIQVkx+BQEpJQ+jfzywFUxYk8ZiC2TGjHOi8=; b=mqx2sZzRvlpePg
	IBZ14MApoqK3iqjinWlQCoDZ+4vyTZzjLhKWU2goorV/tCV7OhVVH+i5p91r91XtkRYAx/nTfZNRK
	or0hFKcJaRepWKK5vyumP2sMD2HRYiusouKZqwTe45rL2g7Cvuo7p6tG0bmxWGYec2VqbDtCAP70S
	jCGvWfC1TbvoJqkKZl/sSi/8y+Wl2S5sWiEU12c9ooxo8+v472oXMP091YqH3O5aHEYccjVE9KPsA
	i/lqLut7IdSHqK4urRWeR4RU156/6BSxXd/ZNC6Sl+9+71lVe6TazmUKCoYKk4+P6UlD0YKEae50I
	mWouNddG0zbjDsAlB/Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVIJ9-000000021s1-25Q6;
	Mon, 23 Nov 2026 00:53:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVIJ6-000000021rI-3IAg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 00:53:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3C1A760D0F;
	Mon, 23 Nov 2026 00:53:20 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795395199;
	b=yQk2EOIwe+qLggSF3BK6BTLM5SWSyseWKxXGC9Eqcg2a8UrEcNWJTuG2Bvawk0RM0ZDY
	 tj7Id4SLZwSHH1OgbdiiZ+nmW7Vx5zduxc3hv18kZj7xqj3PBo1Yv4yLougzmIod5SFzP
	 zaqQq6n1JukoLHxH6DI4ns4jxXC7t2fBLiB2o2y86gMtEkRFG92R98EWA+XzHAeF3McuP
	 SstR/MK6zfl9LCyRcdnWx+vSYSJLM29T7sbYX561tQK4F8PeFiyRvK1pTfpVtnDZqwsiu
	 6/8Q7IQg7GcpshYqZcoCm3SDgJWPMCzmLujLQBkkXPsF7+AeVtd54/Trzdh3Fk4ap0w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795395199;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=eSw5Z0+yIQVkx+BQEpJQ+jfzywFUxYk8ZiC2TGjHOi8=;
	b=zkCYJP4ElasAKtok/fRXP2iezd1eDpKLbrKONLbM9nX3940fLMPAEB6V8eN9u52V+UKd
	 aVqDdP5mtIux+5lf+jAsr/W/VciYw20upCFMkCs9H605df/opJz7k5qmHecY8GwebY9f2
	 1nB337x46kD8n82sEpqHDACcYCC7zcrHF4byABFK4K0xLoQSgdmoNKCMXFTtoAyPS6ptl
	 KSTP4rcXHzkBFgcRo2bKiEOAcZxIpPccUG7tTiPrta//knEREHym3mhmCmQbF7cPjptX9
	 5CPjiYAjE1l3C9hwQrQHxXK6EOhvueQ6R8MrT7CSLYR2Qoz4tjfQlfqauvciOWGirMA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 63E1F1F000CA;
	Mon, 23 Nov 2026 00:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795395199;
	bh=eSw5Z0+yIQVkx+BQEpJQ+jfzywFUxYk8ZiC2TGjHOi8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=QG8sqYzXMNYuO0MnWoa/6VChRBnBK/9UzCES8DUE0HGJDWhr0EdTh/8JIDt/chOJx
	 7UYp4zMThFY/qQlAR7mkJcxwH26srEU8nL9PE4JVBC607EXxeXuf8Lr0ISdaWvNZy3
	 kdI/9eULILb+PvoJmA+X9gjyDxGqeAM8rpKvhaYUdXadid64HLiizlsD1J2MC8+k7O
	 tiTmfXIpEX1R+mv/cu5i5HvBUw6dxMZk37pXGC1DuF/qSLTkKDO1ivN2fZOXzL/crA
	 xH77HBO+lG3fuiuD1soeur4i5NVySVLlKqB4AWs7sZsm3oWInHaFo/7S8uB37YczhV
	 FL9MaE/be5RFg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D8F584C298;
	Mon, 23 Nov 2026 00:53:06 +0000 (UTC)
From: Suyuan Wang via B4 Relay <devnull+shyckless.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 00:53:06 +0000
Subject: [PATCH 1/2] dmaengine: at_xdmac: Kill the channel tasklets in
 remove again
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-dma-chancnt-v1-1-f0eea0a4bb63@gmail.com>
References: <20261123-dma-chancnt-v1-0-f0eea0a4bb63@gmail.com>
In-Reply-To: <20261123-dma-chancnt-v1-0-f0eea0a4bb63@gmail.com>
To: vkoul@kernel.org, ludovic.desroches@microchip.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank.Li@kernel.org, allen.lkml@gmail.com, dave.jiang@intel.com, 
 dmaengine@vger.kernel.org, andriy.shevchenko@linux.intel.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795395185; l=1963;
 i=shyckless@gmail.com; s=default; h=from:subject:message-id;
 bh=0bu2ZG6YjZNYO8i4NTeIpO5xmk3AyoVwzgyIl6x73y0=;
 b=GN+9Tcxa5FdlvNodTuggieGgo/+wwVABpHuK75TugVN8dd466Y8HGsvRXU0on8ZU1XQA21oCK
 S5A7eaMLqmhBmmnCBans7qbDW/+3QfKLdOgtOHH+EXq4UTwUItjv2Rz
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

at_xdmac_remove() kills the channel tasklets and frees the channel
resources in a loop after free_irq():

	for (i = 0; i < atxdmac->dma.chancnt; i++) {
		...
		tasklet_kill(&atchan->tasklet);
		at_xdmac_free_chan_resources(&atchan->chan);
	}

Since commit e81274cd6b52 ("dmaengine: add support to dynamic
register/unregister of channels"), dma_async_device_unregister()
unregisters each channel and decrements dma.chancnt for it, so the
count is 0 by the time the loop runs and the loop does nothing. A
tasklet scheduled by an interrupt can then run after atxdmac, which is
devm-allocated, has been freed.

Read the channel count before unregistering the device.

Found with a static analysis tool and checked by hand.

Fixes: e81274cd6b52 ("dmaengine: add support to dynamic register/unregister of channels")
Cc: stable@vger.kernel.org
Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
---
 drivers/dma/at_xdmac.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/at_xdmac.c b/drivers/dma/at_xdmac.c
index ef0dfe9d37ba..ef4012c22573 100644
--- a/drivers/dma/at_xdmac.c
+++ b/drivers/dma/at_xdmac.c
@@ -2436,6 +2436,8 @@ static int at_xdmac_probe(struct platform_device *pdev)
 static void at_xdmac_remove(struct platform_device *pdev)
 {
 	struct at_xdmac	*atxdmac = (struct at_xdmac *)platform_get_drvdata(pdev);
+	/* dma_async_device_unregister() decrements dma.chancnt to 0 */
+	int		nr_channels = atxdmac->dma.chancnt;
 	int		i;
 
 	at_xdmac_off(atxdmac, true);
@@ -2448,7 +2450,7 @@ static void at_xdmac_remove(struct platform_device *pdev)
 
 	free_irq(atxdmac->irq, atxdmac);
 
-	for (i = 0; i < atxdmac->dma.chancnt; i++) {
+	for (i = 0; i < nr_channels; i++) {
 		struct at_xdmac_chan *atchan = &atxdmac->chan[i];
 
 		tasklet_kill(&atchan->tasklet);

-- 
2.34.1



