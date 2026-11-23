Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F669606A334
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 01:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qba4Icfg;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LE/HPTqk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hZGsiZPfJDMA7smlRJ4dLsRRcxTqNeN1zBeKd7rqlMk=; b=qba4IcfguPpHs+
	bqe/x+cJnIrEJbxcqqdvi7f+R73aaQPfgbWoN6gC++O5Xq060D03XJVQh23Bhe1ehNWQLTTQlJO6n
	0QQPQfQMatuxw3SIMNS6BsFl1ktYcK7bKZI6mzsahc1MTVKLh2WgC9xx4MWKKvd/H4R5vqx/nOj7i
	M0fnBz3IxAl7812Fc5wChPuQK5iqs0HtGnfJlf8SpUfNTDolooH2yhWxPdZNfZnl0KPJxRjs9PLmp
	3B7sTbonNNpts0ysxR0pEzRs55eky1+OAjBN87JAojuawCa9nFVj5fqLJn5UB967C/S854YMIqY4l
	zDiPRUJKpjVmgqFrQlmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVIgf-0000000244i-19D8;
	Mon, 23 Nov 2026 01:17:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVIgd-0000000243h-3bGd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 01:17:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9CA644086C;
	Mon, 23 Nov 2026 01:17:39 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795396659;
	b=Y6v6WIiMCRz32KNBQtCjXevYxRfj7rbakmdEbJoILY+Pt2TOrGeRi4uvELjD/dnjIWuC
	 AjAdQbiH9GWpJgbnj8PYbsnJqcd0jJnwrEq5rCy1I0fzI0prn2IepXtio8SWynj0p7Q6M
	 JbudgLDpbUK5VXWTVoRY28T0Tj7WHYYYoTtkP1Y+3V3MIdUzSoWCH8EYaGq4Y/41M3jdo
	 5wc/J9RStS9vYPZNYOPAKTS4CAmLoUmMooErB64NML0ofcDPabnUy+tsXYG6hxX6BUNxI
	 K96bNsQN5l7MIubzpKE96MbUE8aNBhYHR0g27ly32iFc1/PqWL3VTC4tZvdmXxOrQYQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795396659;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=hZGsiZPfJDMA7smlRJ4dLsRRcxTqNeN1zBeKd7rqlMk=;
	b=BUasE2tE+cLKCNOYYVrn5sIXbY6Wz8U/96AHvoxmN/w58KiQ3wc2G8vL1XQHlMzec28j
	 Y1014R8ehmRtz3PatukYGDaEJde2h/Eyw4GlQIJ6If0vgx+wSRc1R33y+VU0q6Wdv91kU
	 ecqLtDyeO7w9vhczUYjo2jdo+dTyDn2YQEXVGOXyTNix0rN/bboNx3ibDxw92QZt82t53
	 5QceDBe5EsuZ9CyW7OZD9EtYRj4rM+eMivrhz3zxuGFsi53+gVgwXIhu1Cg9om/aYZGdb
	 5QevyEGiYAEWjRCRX7cPiSvsl+LP+lE47LrUvEJ1BUGNsFzu2Jdp+eZ0ozjvPk/FeAg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A33511F000CA;
	Mon, 23 Nov 2026 01:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795396659;
	bh=hZGsiZPfJDMA7smlRJ4dLsRRcxTqNeN1zBeKd7rqlMk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=LE/HPTqkbCWcFLd2TIZ/4hRb5V8w2zUlfkYktBOOmlombOkssioZgrYJBjfCgpmkA
	 d71rB70SLoeosiBZLnvclHdUeqal814aRUiDM4R3FF4qSI9MF8JL9qQF1vzxeKwekr
	 cs5066b/L3HOlimQeVPr9Ozwr83hxKO+sZbJTKXY1fA4/bSDrSw1kvkd8GikovwQ5z
	 6GZDC0nH5zS0V08qi8a5ctRqmUZ1fKzEFcoTHSyfDiwUWXs4R+IlIqJkZJaQrp6dLx
	 fFAfk/mcdq8yh1ghJ/DvkPgh1t3xORVEnk/6fmARJYv3SOQKwLE1RJ7b5eGn6dExss
	 yriltAW++0plg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2F8A34C2AE;
	Mon, 23 Nov 2026 01:17:38 +0000 (UTC)
From: Suyuan Wang via B4 Relay <devnull+shyckless.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 01:17:38 +0000
Subject: [PATCH v2 2/2] dmaengine: idma64: Kill the channel tasklets in
 remove again
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-dma-chancnt-v2-2-241b1672883e@gmail.com>
References: <20261123-dma-chancnt-v2-0-241b1672883e@gmail.com>
In-Reply-To: <20261123-dma-chancnt-v2-0-241b1672883e@gmail.com>
To: ludovic.desroches@microchip.com, vkoul@kernel.org
Cc: Frank.Li@kernel.org, dave.jiang@intel.com, linux-kernel@vger.kernel.org, 
 andriy.shevchenko@linux.intel.com, dmaengine@vger.kernel.org, 
 allen.lkml@gmail.com, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795396657; l=1951;
 i=shyckless@gmail.com; s=default; h=from:subject:message-id;
 bh=GQuussW5tcaY3AFLXhEILE+dApPEjArrisGtHmyiqFk=;
 b=U6oKz//o2HHTu2pfkrIuRf215zDz+FwzL6agyeIwhgoacFdrGmq8WvjiYE2pBb7wqHZgWFMlu
 cOUB3HacL3gBk1AxAC9+NCuo9BW3JGxQneaPrbIr3/bl9qs93RBdPUl
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



