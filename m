Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89A6606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 22:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cBov9NyU;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WR3VWbUK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7I8Bl8j2DkVNE27qVMX3vqtaNvrvL7NhHRJK3KxV54A=; b=cBov9NyUNxsIbPAmKf6MCp+Y7C
	7qKa2ev9pv8IfVQQf50wdr1yyEpKlfLNSxBZgW1MhNEg2FIJiVugw6AoxgYzRTI8tgQQFDYe5SYeh
	a/DcV6f5bVaUM4/DwX021hNA9FfeqgHIHspZMiyHV/LtJ0HMBYlmq1j9aLngxMk5zsKwv2cIdVFiL
	AbOW7F1NXH1itLUtHgztSWlrqdpxjd2WKk8qhjZu1nwFZ2RdQPZa+AmHDel0sPC/72Bj1TA6oRB6K
	XBcerqZ28slEBmO+3skJeYshJVwTnHLZXb9ZI4SnojOiZmU8wvcgUK/jQahDkgi8tQst5lPh14oO5
	Wx4sL+Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRdLh-0000000BAiE-3ndP;
	Thu, 12 Nov 2026 22:32:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRdL8-0000000BANa-1ReV;
	Thu, 12 Nov 2026 22:32:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 114A6464D6;
	Thu, 12 Nov 2026 22:32:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B350D1F000C5;
	Thu, 12 Nov 2026 22:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794522737;
	bh=7I8Bl8j2DkVNE27qVMX3vqtaNvrvL7NhHRJK3KxV54A=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=WR3VWbUK1imnQlQmpNAhqSsCOW99QnIUHIcVwRERBUB4R/jAwYxqHbCFi1NkKzLoa
	 ++/G59vhWLixAa9mEUEFGaU4gePyrs3VnVA09595dCjvaKajFGHofoN8XhUcYErqHP
	 mChkoSGEKpddY3E1an1/DwCzTOeoAfXiiV55MWuRWtgoWvpRLoORurIa4d8gh/hEcp
	 K+epw8KzroVsBPW5kuFg8ur7b1k8r1APmZnYOG0rRYfEeEaF5aWQPJ6qMb639O7JbH
	 0Y8hT2yAVt9BfRDAyG2aNSLli4ZxHj62IV5iifmtuRZCbF+l9cL+Y+KQCwGeE9GoNI
	 XttgZKyF9yFfw==
Subject: Re: [PATCH net v9 09/10] can: rockchip_canfd: prevent timestamp work
 from rearming after bus-off
From: netdev-bot+sashiko@kernel.org
To: 1579567540@qq.com
Cc: mkl@pengutronix.de, kernel@pengutronix.de, mailhol@kernel.org,
 heiko@sntech.de, socketcan@hartkopp.net, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
 wg@grandegger.com, linux-can@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 stable@vger.kernel.org
Date: Thu, 12 Nov 2026 22:32:16 +0000
Message-ID: <179452273623.488853.960003123754786062@kernel.org>
In-Reply-To: <20261111-rockchip-canfd-restart-close-v9-9-6643f3825ba3@qq.com>
References: <20261111-rockchip-canfd-restart-close-v9-9-6643f3825ba3@qq.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] Commit "can: rockchip_canfd: prevent timestamp work from rearming
  after bus-off" is tagged Cc: stable but does not say it depends on the…

--

can: rockchip_canfd: prevent timestamp work from rearming after bus-off

After bus-off, the rockchip_canfd timestamp worker could requeue itself
and keep polling. This patch switches the worker to disable_delayed_work()
and enable_delayed_work() to stop that. It also adds timestamp_lock and
timestamp_active so counter reads are serialized with start and stop, and
rkcanfd_timestamp_stop_sync() now calls the non-sync stop before it
cancels the work.

> Keep workqueue operations outside timestamp_lock; the IRQ and restart
> paths already serialize start and stop. Synchronous stop waits for the
> callback before reinitialization or clock shutdown.
>
> Fixes: 4e1a18bab124 ("can: rockchip_canfd: add hardware timestamping support")
> Cc: stable@vger.kernel.org

[Severity: Low]
This doesn't affect the current tree, but should this patch say that
it depends on the previous commit, "can: rockchip_canfd: serialize TX
with bus-off and restart"?

That commit created the one-time probe helper that this patch extends.
It moved INIT_DELAYED_WORK() out of rkcanfd_timestamp_init(), which
runs on every chip start. With this patch, rkcanfd_timestamp_work_init()
in rockchip_canfd-timestamp.c becomes:

	spin_lock_init(&priv->timestamp_lock);
	priv->timestamp_active = false;
	INIT_DELAYED_WORK(&priv->timestamp, rkcanfd_timestamp_work);
	disable_delayed_work(&priv->timestamp);

Three calls need to stay balanced: the disable at probe,
enable_delayed_work() in rkcanfd_timestamp_start(), and
disable_delayed_work() in rkcanfd_timestamp_stop(). That only works if
the work is initialized exactly once.

The sentence "the IRQ and restart paths already serialize start and
stop" also relies on that commit. It added the restart quiescing in
rkcanfd_set_mode() for CAN_MODE_START:

	WRITE_ONCE(priv->irq_suspended, true);
	/* Wait for handlers that already passed the suspended check. */
	synchronize_irq(ndev->irq);
	rkcanfd_timestamp_stop_sync(priv);

Without the prerequisite, this patch won't apply to stable trees.
Suppose a backport fixes the conflict by hand and leaves
INIT_DELAYED_WORK() in rkcanfd_timestamp_init(). Then every chip start
resets the disable count to 0 just before enable_delayed_work() runs.
That would trigger the workqueue disable count underflow warning and
undo the requeue blocking added here.

The prerequisite is in the same series and is also Cc: stable, so
stable tooling would normally apply both in order. Could the dependency
still be made explicit? A prerequisite note on the Cc: stable line, as
stable-kernel-rules.rst describes, or a "Backports must include ..."
line would do it.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261111-rockchip-canfd-restart-close-v9-0-6643f3825ba3%40qq.com

