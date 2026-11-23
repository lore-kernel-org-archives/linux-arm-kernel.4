Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCAE0606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 07:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Vdsa3VYx;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=slSYe7we
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iKeZ2tXUAbc+Q1yEFhsgCE9SEarvq7KvC09KIeMlRqg=; b=Vdsa3VYxFRNp2SyyqhI29BjG70
	A6BJwOqN4odKMF729MXvMxyYtBW/iKoho8jeQR7pfZhqTHzSeZDYVnc0a2uViW03roKmGnNljdNWm
	cLB3Wi47p5UbDV5otaEB3qsTeGyG27c4gWLvlihf/Rox+1otqEohjQx70njncU9ugNSiPgogC3dRa
	R0SPEijupBuHE/7i1F4ex+2vlgHG2i/FoFKfNk/noXQHSXgu3TdD+YkdGOppD4/r9dthvsTbOsJLa
	RCwken4cFxvKdcEAIDiRj3UrgHBa7v0QmFtajPBgg/SxuTz0AayPPE4bGSK1sctRXxuNQS9ebuaAq
	7OG2wJXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVOBE-00000002RCl-1t3d;
	Mon, 23 Nov 2026 07:09:36 +0000
Received: from out-12.mta0.migadu.com ([2001:41d0:1004:224b::c] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVOBB-00000002RCB-3um4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 07:09:35 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=q3tQG3ndRBja5RIwJmSbJq8oOy/7QF8ip5BzTsP8piU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795417770; v=1; x=1796022570;
 b=slSYe7weT505Px2/vLvB70Al9S5OgU2HDX15Bp2NVZAJR7Xj7Pska8bqp65nCf+FNHhtXRDN
 fQFYCKcEL5vhQRBbt91tp5qHTF1+yU9FeKiSfX1v1Aw+HH/jIMb7o73f9lkgOuP7PCsH1O8THAQ
 opMMcZCWEDBJvVRpczQSiwYU=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 34a5fd8e430d72d2;
	Mon, 23 Nov 2026 07:09:30 +0000
X-Mizu-Trace-ID: 34a5fd8e430d72d2
X-Migadu-Flow: FLOW_OUT
Date: Mon, 23 Nov 2026 08:09:24 +0100
From: Richard Leitner <richard.leitner@linux.dev>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, weinshec@holodeck2.de, stable@vger.kernel.org
Subject: Re: [PATCH] remoteproc: imx_rproc: revert channel freeing order in
 imx_rproc_free_mbox
Message-ID: <awPmc_4VFkcpW0C_@bombadil>
References: <20261110-imx-rproc-free-mbox-v1-1-3e33ff98570d@linux.dev>
 <avMgJNyGez2Eyr3a@nxa18884-linux-1.ap.freescale.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <avMgJNyGez2Eyr3a@nxa18884-linux-1.ap.freescale.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_230934_206955_418D130F 
X-CRM114-Status: GOOD (  16.21  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 10, 2026 at 09:46:12PM +0800, Peng Fan wrote:
> On Tue, Nov 10, 2026 at 01:29:08PM +0100, Richard Leitner wrote:
> >The imx_rproc driver is affected by a race condition in the shutdown
> >ordering in imx_rproc_free_mbox(). A received message might cause a
> >virtqueue_kick resulting in tx_ch access. When imx_rproc_free_mbox() is
> >triggered between the if (!priv->tx_ch) check and the mbox_send_message()
> >call in the imx_rproc_kick() function the mbox_send_message() then tries
> >to dereference a NULL pointer on the tx_ch (as seen in the call trace
> >below).
> >
> >Therefore fix this behaviour by first freeing the rx channel, so no new
> >messages are received and therefore no kicking on tx_ch can happen.
> >Afterwards release the tx channel.
> >
> >This problem was encountered on a fleet of i.MX8MP devices on about 1 in
> >500 system shutdowns, resulting in Oops below. This Oops was recorded
> >from a v7.3.0 kernel before the work-queue removal.
> >
> >    remoteproc remoteproc0: stopped remote processor imx8mp-cm7
> >    Unable to handle kernel NULL pointer dereference at virtual address 0000000000000008
> >    Internal error: Oops: 0000000096000004 [#1]  SMP
> >    CPU: 0 UID: 0 PID: 32710 Comm: kworker/0:1 Not tainted 7.3.0-XXX #1 PREEMPT
> >    Hardware name: XXX (DT)
> >    Workqueue: imx8mp-cm7 imx_rproc_vq_work [imx_rproc]
> >    pstate: 40000005 (nZcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> >    pc : mbox_send_message+0x8c/0x178
> >    lr : mbox_send_message+0x88/0x178
> >    sp : ffff8000897f3b70
> >    x29: ffff8000897f3b70 x28: ffff80007a07b248 x27: ffff0000d90e1a20
> >    x26: ffff80007a07b328 x25: ffff0000c1d31300 x24: ffff0000d90e1a40
> >    x23: 0000000000000001 x22: 0000000000000005 x21: ffff8000897f3ba4
> >    x20: 000000000000000b x19: ffff0000c1b24240 x18: 0000000000000000
> >    x17: ffff80006a453000 x16: ffff800081ac8000 x15: 0000000000000000
> >    x14: 0000000000000040 x13: 0000000000000228 x12: ffff0000c115a3e8
> >    x11: 0000000000000000 x10: 0000000000000001 x9 : ffff800080cd6570
> >    x8 : ffff8000897f3ba0 x7 : 0000000000000002 x6 : 0000000000000000
> >    x5 : 000000000000000c x4 : 0000000004400000 x3 : 0000000000000000
> >    x2 : 0000000000000000 x1 : ffff0000cb268000 x0 : 0000000000000000
> >    Call trace:
> >     mbox_send_message+0x8c/0x178 (P)
> >     imx_rproc_kick+0x50/0xc0 [imx_rproc]
> >     rproc_virtio_notify+0x3c/0xa0
> >     virtqueue_kick+0x4c/0x68
> >     rpmsg_recv_done+0x224/0x658 [virtio_rpmsg_bus]
> >     vring_interrupt+0xbc/0x158
> >     rproc_vq_interrupt+0x40/0xb0
> >     imx_rproc_notified_idr_cb+0x20/0x40 [imx_rproc]
> >     idr_for_each+0x74/0x100
> >     imx_rproc_vq_work+0x2c/0x40 [imx_rproc]
> >     process_one_work+0x194/0x520
> >     worker_thread+0x19c/0x320
> >     kthread+0x134/0x148
> >     ret_from_fork+0x10/0x20
> >    Code: 37f80574 aa1303e0 97ffff39 f9400a60 (39402001)
> >
> >Fixes: 99b142cf7191 ("remoteproc: imx_rproc: Request mbox channel later")
> >Cc: stable@vger.kernel.org
> >Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> 
> LGTM:
> 
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> 
> BTW: would you plan to fix the other issue that sashiko reported
> regarding imx_rproc_xtr_mbox_init()?

Thanks for the review and sorry for the late reply.

Sure. Should this be a separate patch or added to a v2 of this series?

regards;rl

> 
> Regards
> Peng

