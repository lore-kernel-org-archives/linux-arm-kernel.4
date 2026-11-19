Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501B1606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 11:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WhgDkjtf;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=iSp5/LpD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Unsubscribe-Post:List-Owner;
	bh=bUsF2BFmyfh8u4YXfKRfweeg9EbYkyMl9BdaPhOcFI8=; b=WhgDkjtfNC8WvCXWzNdaC8WYAb
	Jh24tUMw8KqWq2KOcOMsxpBsX5kriYn9blYu3IvPTh4yWizjd7t02n0eyObd1wvbRGOatSJx9vhvT
	8McZOSKWYsRYBdSTN1pnwv62unkCxnl6kCDfnznF5oes+mdl1V3vXrO9WosXPCjkDed1drh6QaIz2
	x1ZHee/kIcV4qmsw0pEDqAxrW2eshdLu0lh69gC4m+6ADC8Pn1zN8F7FrHgpGj5mAzf1YPzuQsU/q
	2Tkrn+ZlwCaYPAddWMvumgAdaCaIFCDiogmB36TUa31vs1ukmOkdIkY9lN8SRBe0kRRcdM5xHnT/A
	e9+0mnKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU0VZ-0000000BiyZ-3CFP;
	Thu, 19 Nov 2026 11:40:53 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU0VV-0000000Biy0-2shF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 11:40:52 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 83B30249CF;
	Thu, 19 Nov 2026 12:40:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1795088446;
	bh=bUsF2BFmyfh8u4YXfKRfweeg9EbYkyMl9BdaPhOcFI8=; h=From:To:Subject;
	b=iSp5/LpDRebEE2dL1d8oR0gjk2x4hoaFOYKH5eR1fQ0XANEJWSMg713KP0F/tTkcH
	 59X2iUmbKsTrWu9aB78yyv4lens8+4d7a3BUDi69lsiC9kjhcgapB+8UJGr4C3sF1B
	 t348F4A2tuaWsF9JiNNqO4f9BDonT8YRwzl3kE9gnTtvNeJIow2ljGoscks7QeGG4d
	 Hrp/mgraJIfLF/crc/xqZT/922etN77mUXUA9ftYZbVh4JoCCAC/lcPjmIvdAQOOfY
	 5PRacq4vo16f05C6NVv3sEeuSl6dEUt50HfrrnWyDHh2t556GEGpbOgzq8hsgmo8ua
	 yjP5WVb9mhZ/Q==
Date: Thu, 19 Nov 2026 12:40:41 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Peng Fan <peng.fan@oss.nxp.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	Peng Fan <peng.fan@nxp.com>, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev,
	Bjorn Andersson <andersson@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v3 00/10] mailbox: imx: Use threaded handler to avoid
 kworker in imx's remoteproc
Message-ID: <20261119114041.GA166708@francesco-nb>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <av6Wc+kHFKqwFHAR@shlinux89>
 <20261116102331.K8Sc86V9@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_034050_631866_82FF3172 
X-CRM114-Status: GOOD (  24.23  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello Peng, Sebastian

On Mon, Nov 16, 2026 at 11:23:31AM +0100, Sebastian Andrzej Siewior wrote:
> On 2026-11-16 10:23:41 [+0100], Francesco Dolcini wrote:
> > Our CI shows a ~10-15% eMMC sequential read throughput drop on i.MX8QXP
> > and i.MX8DX (Colibri iMX8X, Cortex-A35), starting with v7.2-rc1 and
> > still present in v7.4-rc3 (hdparm --direct -t: ~129 MB/s -> 105-120
> > MB/s on i.MX8DX). i.MX8QM, i.MX8M and i.MX9 are not affected.
> > 
> > 5d1c0000.mailbox interrupt count before the test went from ~8k on v6.18
> > to 60k+ on v7.3/v7.4.
> > 
> > Peng: any idea/suggestion? Does it makes any sense to you?
> 
> Can you pin point it to a patch in this series? My guess is that
> something with the masking/ unmasking went wrong. The increase might be
> result of the interrupt keeping firing while the threaded interrupt did
> not have a chance to run.

Reverting 36cac4b5101f, 3225a745f517, e55bea377d49 and 692e1bc96a5d
restores 149 MB/s with schedutil.


On Thu, Nov 19, 2026 at 02:25:55PM +0800, Peng Fan wrote:
> On Mon, Nov 16, 2026 at 10:23:41AM +0100, Francesco Dolcini wrote:
> >Peng: any idea/suggestion? Does it makes any sense to you?
> 
> Please help test whether this helps:
> 
> diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
> index 683ccea6f2ba..e29044cf4b92 100644
> --- a/drivers/mailbox/imx-mailbox.c
> +++ b/drivers/mailbox/imx-mailbox.c
> @@ -635,7 +635,7 @@ static int imx_mu_startup(struct mbox_chan *chan)
>  {
>         struct imx_mu_priv *priv = to_imx_mu_priv(chan->mbox);
>         struct imx_mu_con_priv *cp = chan->con_priv;
> -       unsigned long irq_flag = IRQF_NO_THREAD;
> +       unsigned long irq_flag = IRQF_NO_THREAD | IRQF_ONESHOT;
>         int ret;
> 
>         pm_runtime_get_sync(priv->dev);

It does not help.
	
The analysis below was done with Claude help, on measurements I took on a
Colibri iMX8QXP. I hope you can pick it up from there, this is not my
area of expertise, and the best I can do is to send a revert for those 4
commits.

Every SCU RPC now wakes the SCHED_FIFO irq thread (TX done and RX), and
while an RT task is runnable schedutil requests the maximum CPU frequency.
The A35 clock is CLK_GET_RATE_NOCACHE, so each frequency change is
followed by an SCU RPC reading the rate back, which wakes the irq thread
again. The loop never settles, even when idle, and the transitions (ATF +
SCU) are what costs the eMMC throughput (and I assume there is more
impact on performance than just this).

v7.4-rc3, 4 CPUs, idle irq/cpufreq transitions per 10s, hdparm --direct -t:

                               irq    trans  schedutil  performance
  v6.18                          -      -    149.7 MB/s     -
  v7.4-rc3                   16203  10800    113 MB/s   150 MB/s
  v7.4-rc3 + IRQF_ONESHOT     7832   7813    113 MB/s   150 MB/s
  v7.4-rc3 + revert 4 commits   60     36    149 MB/s   150 MB/s

The 4 commits are 36cac4b5101f, 3225a745f517, e55bea377d49 and
692e1bc96a5d; reverting only the RX part (e55bea377d49) is not enough.


#regzbot introduced: 692e1bc96a5d^..36cac4b5101f
#regzbot title: mailbox: imx: threaded IRQ handling causes a cpufreq transition storm on SCU-based i.MX8

Thanks,
Francesco


