Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D4B606A330
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 09:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ObG2kJNn;
	dkim=pass (2048-bit key, unprotected) header.d=gondor.apana.org.au header.i=@gondor.apana.org.au header.a=rsa-sha256 header.s=h01 header.b=H1WVx17U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ahj0CzU1hVbnWhl0n2zcJwrXID4d5ZIGphREm93F3NE=; b=ObG2kJNnE6w4ScBqtwYXw9YRro
	k2P4y/ICfHa3HhqMyLWtHWLSoyp4yE8I8PAD5Fw2OSJGQscYBU8F47/c0+cLNnAXY7yyBcCLwWBBx
	Klu0o0xGOsAX5taxr0PK0PnJqjJGJ3ZB4swAYJsxYosMZlYD2r3zApTJia3U6qqeMrvrazRtJQpuG
	kQ7XG26wbxzZaT6kI8YEs4ik/FRIfVBQu/rGcIFGlyWejk7Ek0fAg1fGtf+E6rGoMcrlqnQ8C9qhp
	3tjtR/HznC6DqAI1SBwYiZ8mGPflyf5GKzQnab7LawsPNow/c/zMsZRfQ0ZyOTT7xI6srayXQwb0E
	1YKRaLfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULFM-0000000EVxq-3Ugk;
	Fri, 20 Nov 2026 09:49:32 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULFJ-0000000EVwj-1S9g
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 09:49:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=Ahj0CzU1hVbnWhl0n2zcJwrXID4d5ZIGphREm93F3NE=; 
	b=H1WVx17UduHJXhsqMth2XijYI7d19aD7TZi6FtWGof7pRRJ3VSEfG3vC9nTPyfz8/AuXGq7C4Kl
	YMEOhKp910Qe5OBCsN/Ku3B71lxP5JMCvFn+EvmakYHvfNrjnLvUypvTDTlZ4v193LYUU4LjfWbz+
	ILC1Pkfj6dDYc3l4bTMzZLqF0S1iG9kJ7xPW3Hi1Sq9U76HjQjefdcoq4FDMxb7UNzy7jevOWoR5S
	2oSPWvRmw5167Vo5PypkR+tsm5QYvjgszgw0kkBkSJCzCdg8B6n3zvIhnEvY0LSdl33+3y70Ehg4i
	fLC+YLtepD1gFX6QdtA7rtWdEzF6hHn5dO7A==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1xULF1-0000000HYWQ-27Cr;
	Fri, 20 Nov 2026 17:49:12 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 20 Nov 2026 17:49:11 +0800
Date: Fri, 20 Nov 2026 17:49:11 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Tomas Paukrt <tomaspaukrt@email.cz>
Cc: "David S. Miller" <davem@davemloft.net>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@denx.de>,
	linux-crypto@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: mxs-dcp - Fix softirq locking and completion
Message-ID: <awAXl6j7tb5NNTjQ@gondor.apana.org.au>
References: <1qB.ZqMy.4DIhrOb2ZPx.1gyQAk@seznam.cz>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1qB.ZqMy.4DIhrOb2ZPx.1gyQAk@seznam.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_014929_430586_3CAACD41 
X-CRM114-Status: GOOD (  17.18  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 09, 2026 at 11:38:38AM +0100, Tomas Paukrt wrote:
> The request queues are protected by plain spin_lock(), but requests are
> enqueued from softirq context (e.g. by ESP on packet receive) as well as
> from process context, while the channel threads dequeue them in process
> context with bottom halves enabled. A softirq that runs on the same CPU
> while the lock is held either deadlocks on SMP, or corrupts the queue on
> UP where the spinlock does not provide any protection.
> 
> In addition, the channel threads call the completion callbacks with
> bottom halves enabled, although the crypto API requires them to be
> called with bottom halves disabled. With IPsec, esp_input_done() then
> runs xfrm_input() and gro_cells_receive() in plain process context,
> which races with the NET_RX softirq on the per-CPU GRO cell queue and on
> the xfrm state, and defers the NAPI poll until the next interrupt.
> 
> This was observed with strongSwan on i.MX6ULL: the throughput drops
> quickly and eventually no packets are decrypted at all.
> 
> Fix this by taking the queue locks with spin_lock_bh() and by calling
> the completion callbacks with bottom halves disabled.
> 
> Fixes: 15b59e7c3733 ("crypto: mxs - Add Freescale MXS DCP driver")
> Signed-off-by: Tomas Paukrt <tomaspaukrt@email.cz>
> ---
>  drivers/crypto/mxs-dcp.c | 30 ++++++++++++++++++++----------
>  1 file changed, 20 insertions(+), 10 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

