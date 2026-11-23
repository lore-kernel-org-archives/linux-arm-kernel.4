Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930D7606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 14:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TibsNJSJ;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gzHLWGLY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=R32xhf3Kvq/DaeS/L7g8lPdJxhRkFnoaSwXaedjNBvc=; b=TibsNJSJRbU3ZasUMb49ppw4yl
	BJIlwqvsBek65queg8mbU9lPFcjURI9Ns1IiEZk/HXBBMx3IIXyV9THyGDgPhkKpEID9D0ud2bgdQ
	l+/EtCg8QQtb1cHm4kGAKVY33MDY4xY7N+VWjfTHgzHnK5H3bZxYzdawz+GObnvFSV09XyKVfj2wJ
	fnJLVRIK57ZTZipAqqLrL3BZHuDP4QDbvSLhk4wBWsQHBXs4YL5usC80opGLehJLuVDpxPz9SyEVB
	eLrl29pm/sgZtaC4/Hq2skYklC7aCRQTghJvHCP5BrmIrBEtQ38JwK9ronkeevVYPRUso+k7/26kn
	wEfgHzZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUlM-00000003gvN-1Fij;
	Mon, 23 Nov 2026 14:11:20 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUlJ-00000003guh-1bhA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 14:11:18 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-8b4eab91bcaso17262567b3.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 06:11:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795443075; cv=none;
        d=google.com; s=arc-20260327;
        b=m5OQK94MgPGKX8jkLxniyUll1htZK7wPqb/v148r8Xm7HkPVJ2nwFTzgq2Dy8Atgil
         BoivtH/Nq+M05Y35iPHIyTZIyHiMoGgZtxIh2HHFDeEmBXjm9e5DsJW3I3qjrgmZ8S1E
         AXyMqtyqxcyE5/m+rHwAk6sksizWI+rg+0KhbnyWWPuPyeCu296CcsflNrcR19HBHFNc
         M66Abb9ox61e6eMnNA+S1tnKc/BAzurOeWB2W8xP1ACEqTjf55plCRvoNYztt53rqtUg
         RU27FSvo0KQ0lugNnGVRZcZKQ/q9UKTYiJ9cSxsAz1dC153go6Q3F6DZTSTAK/JfTte0
         /rww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=R32xhf3Kvq/DaeS/L7g8lPdJxhRkFnoaSwXaedjNBvc=;
        fh=csnNKHi4IE+wGYs7AWI4K7BuO7RZWlXqNl+uFQWEvAA=;
        b=qjiNYB2YyI2ZEjkQBAtRmnP2uy3O++r4V45+krC/JeIZ34BA3luPfIw1py4EyQ0hXE
         xCKycNR2crZcfQbayWr5iRsR1vmuwibihRDy6O0g5ZAiQp6IbzcSTw/i1ieJHjVe9jED
         JnGtctNWlX9ZeNcE8FMFYuWFGfQ9yk/nCgy2gekKARq4/FHGOuZAnudRIpHNik0F/Om6
         5LstOEdwm6RE4ymO+1LO3T3VSZPUkezm1kK0CjIg0BISDywK3woiGGoA0U8PXmWnTw2Z
         atuW0BAVDxa1/jkkD2Jbuq2JaYVC3eQ26PO0elwZFRz1BcHB6qfv6GYqoAtnBdG8XKwW
         E8iw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795443075; x=1796047875; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R32xhf3Kvq/DaeS/L7g8lPdJxhRkFnoaSwXaedjNBvc=;
        b=gzHLWGLYtdsIcpT/ld+V24ruxUJ9RNDRvP0LJe676RJufVVZk6E8e2Dsp4bwEKGS2Q
         V4hZoIgxFJ4XE97icEaQYySH1ZrpOmmtPFHOrKgRYQdzi4NGDlFcqKrHVvztvBXusmUy
         RECAwPEGisYQioG5Kyl37AJavrG+x3NxGgxIyzEtOZoTLuZ9EpqSqPTFLo2p9eTPIjTy
         DHIZFFA0Jc154oqm7GreMVAiykuYff7WBgUA19k0QbVA3AFo4MCDYgKe/Wtm7zIYHC6n
         splQjQ7QBm1K3a/Q6AXlLxQzmQA1BcI+xt4ThBBAgzRzZW9xJWvJrBCr8nD0gKuNiBT/
         BnIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443075; x=1796047875;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R32xhf3Kvq/DaeS/L7g8lPdJxhRkFnoaSwXaedjNBvc=;
        b=Yb+L9B+PpSxp78iGgpATIeMxgAicVZrDwMtv++SxUlSeDRB0fipWlgEwGlTh/uNZsM
         1XHl2glawgZi/hVPMMQtNjslmGCqWWpS673VXL1GYe2pXBoTKD8pX4ooksvbIsdfKry4
         apjpChjSFtBONHENzREDNa9j1J90IiqqJksffkezBE8++Qdj43AMlmau6JsWSb/02oJl
         rcck+y4sbW9kVyGPbo3g14Qdi/pjgkZBxulrTIbS5VO2l+63765NamqKibQ3oWRUz21l
         DaffabkcxL4Cnc40Y5ug49XDeIFa3XNhuL6ts/TdyN4CZUsd39gBP/QbWq91/uy1Mwii
         Scow==
X-Forwarded-Encrypted: i=1; AL+hErHe0041/FsIkX/E4kfquDfbq7J2ZJOoBUKQvWEExsgIKVPmGvOTVFZa1lDXa4k/yB0Gv5xyky8b1PRwZVIE3wfM@lists.infradead.org
X-Gm-Message-State: APuU4Z8XxWgK2kXVWNoBlu5yoXtOZjtFCSpk2CeTZ8MWll/oBppizJvE
	OLtlYkdtDZdycK0uPhYsVYjy2TF6DHQeF30hcXQrhaZVMYYSqwZ8joty15m92hIYOka2pqYXK/W
	MQ8vl999qS3inXlv3j96VDwXVjdGo5cj2kiUZjSQIyA==
X-Gm-Gg: AZFdTZfwpGgUXdqWfj9DsIf0JNtoIPpwsf8IO+4KOwnQ8t+EIFCvgzeBdHUkMZ0UwJO
	ixnXtCxl2IHgHg2y4UsCeL6Bu7OsFtNJWnxjHRfsYTXmUwV0O5fDI4AuVsXk/7yotyhKim1j8Ax
	pc1YuJYij0zx4lpPPUP8bluaJsMUJ6CuAukGX7eJj6NH/N00rGDxYITGFIMwThRH6rW8QO9Eh6p
	pRMi7C06p8qXnm3B22hBIUF+QY4M0Au12x9rHDs/SEntV2ZMj6odfNhP5NmG5KMm7ajB8+uarKN
	Q3oFMPhuXxXwWOy1SDFQvdMY7rkXBDRBa+ieeR4ERMkfCAoAwU+weI+lPtVdRAthMDPsPam/doT
	2xiRKqwR3qKavPx4M+zZBgAlzfywoWvuFR20Rc5Blol+r4fefVHxRGfhBUTA8h95j9mXvpI8=
X-Received: by 2002:a05:690c:6b07:b0:8b5:61d:f3ff with SMTP id
 00721157ae682-8b5204e9571mr53022067b3.46.1795443075492; Mon, 23 Nov 2026
 06:11:15 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261110-imx-rproc-free-mbox-v1-1-3e33ff98570d@linux.dev>
 <avMgJNyGez2Eyr3a@nxa18884-linux-1.ap.freescale.net> <awPmc_4VFkcpW0C_@bombadil>
In-Reply-To: <awPmc_4VFkcpW0C_@bombadil>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 23 Nov 2026 08:11:04 -0600
X-Gm-Features: Aa3M54rmzuqQaag6_hKersoZSWqoaB26gF7bb-M07qfK52BJ_PrHvuWnVFcXIfA
Message-ID: <CANLsYkx=M_TXN10qAcQC0be065TYnzfOae6E8ss-9DTj9MzogA@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: imx_rproc: revert channel freeing order in imx_rproc_free_mbox
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Peng Fan <peng.fan@oss.nxp.com>, Bjorn Andersson <andersson@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	weinshec@holodeck2.de, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_061117_442560_9FB298FF 
X-CRM114-Status: GOOD (  20.32  )
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

On Mon, 23 Nov 2026 at 01:09, Richard Leitner <richard.leitner@linux.dev> wrote:
>
> On Tue, Nov 10, 2026 at 09:46:12PM +0800, Peng Fan wrote:
> > On Tue, Nov 10, 2026 at 01:29:08PM +0100, Richard Leitner wrote:
> > >The imx_rproc driver is affected by a race condition in the shutdown
> > >ordering in imx_rproc_free_mbox(). A received message might cause a
> > >virtqueue_kick resulting in tx_ch access. When imx_rproc_free_mbox() is
> > >triggered between the if (!priv->tx_ch) check and the mbox_send_message()
> > >call in the imx_rproc_kick() function the mbox_send_message() then tries
> > >to dereference a NULL pointer on the tx_ch (as seen in the call trace
> > >below).
> > >
> > >Therefore fix this behaviour by first freeing the rx channel, so no new
> > >messages are received and therefore no kicking on tx_ch can happen.
> > >Afterwards release the tx channel.
> > >
> > >This problem was encountered on a fleet of i.MX8MP devices on about 1 in
> > >500 system shutdowns, resulting in Oops below. This Oops was recorded
> > >from a v7.3.0 kernel before the work-queue removal.
> > >
> > >    remoteproc remoteproc0: stopped remote processor imx8mp-cm7
> > >    Unable to handle kernel NULL pointer dereference at virtual address 0000000000000008
> > >    Internal error: Oops: 0000000096000004 [#1]  SMP
> > >    CPU: 0 UID: 0 PID: 32710 Comm: kworker/0:1 Not tainted 7.3.0-XXX #1 PREEMPT
> > >    Hardware name: XXX (DT)
> > >    Workqueue: imx8mp-cm7 imx_rproc_vq_work [imx_rproc]
> > >    pstate: 40000005 (nZcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> > >    pc : mbox_send_message+0x8c/0x178
> > >    lr : mbox_send_message+0x88/0x178
> > >    sp : ffff8000897f3b70
> > >    x29: ffff8000897f3b70 x28: ffff80007a07b248 x27: ffff0000d90e1a20
> > >    x26: ffff80007a07b328 x25: ffff0000c1d31300 x24: ffff0000d90e1a40
> > >    x23: 0000000000000001 x22: 0000000000000005 x21: ffff8000897f3ba4
> > >    x20: 000000000000000b x19: ffff0000c1b24240 x18: 0000000000000000
> > >    x17: ffff80006a453000 x16: ffff800081ac8000 x15: 0000000000000000
> > >    x14: 0000000000000040 x13: 0000000000000228 x12: ffff0000c115a3e8
> > >    x11: 0000000000000000 x10: 0000000000000001 x9 : ffff800080cd6570
> > >    x8 : ffff8000897f3ba0 x7 : 0000000000000002 x6 : 0000000000000000
> > >    x5 : 000000000000000c x4 : 0000000004400000 x3 : 0000000000000000
> > >    x2 : 0000000000000000 x1 : ffff0000cb268000 x0 : 0000000000000000
> > >    Call trace:
> > >     mbox_send_message+0x8c/0x178 (P)
> > >     imx_rproc_kick+0x50/0xc0 [imx_rproc]
> > >     rproc_virtio_notify+0x3c/0xa0
> > >     virtqueue_kick+0x4c/0x68
> > >     rpmsg_recv_done+0x224/0x658 [virtio_rpmsg_bus]
> > >     vring_interrupt+0xbc/0x158
> > >     rproc_vq_interrupt+0x40/0xb0
> > >     imx_rproc_notified_idr_cb+0x20/0x40 [imx_rproc]
> > >     idr_for_each+0x74/0x100
> > >     imx_rproc_vq_work+0x2c/0x40 [imx_rproc]
> > >     process_one_work+0x194/0x520
> > >     worker_thread+0x19c/0x320
> > >     kthread+0x134/0x148
> > >     ret_from_fork+0x10/0x20
> > >    Code: 37f80574 aa1303e0 97ffff39 f9400a60 (39402001)
> > >
> > >Fixes: 99b142cf7191 ("remoteproc: imx_rproc: Request mbox channel later")
> > >Cc: stable@vger.kernel.org
> > >Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> >
> > LGTM:
> >
> > Reviewed-by: Peng Fan <peng.fan@nxp.com>
> >
> > BTW: would you plan to fix the other issue that sashiko reported
> > regarding imx_rproc_xtr_mbox_init()?
>
> Thanks for the review and sorry for the late reply.
>
> Sure. Should this be a separate patch or added to a v2 of this series?
>

Please send another revision with the fix.

> regards;rl
>
> >
> > Regards
> > Peng

