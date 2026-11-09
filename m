Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B997606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 08:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Zuz3wPE0;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k8/k3csW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0X4LhfmP/kb8JXQdJU0Iyockx0Jve4fj4xU5jma0V/8=; b=Zuz3wPE0mfwbX5
	Gj+4B9jXEQfqiNP7X0MtqhC+WQRrr/fBWjApvQtYTbWiESvrxI+oEmwLNj72QNpvUkP4Np3t9Zw7z
	jH0m59fZBlsPwGaw0wiD39VCz6NebOFzu14pBYyTcVb5eUF+QDZdmFd+rspTGuL893eJQlJgVVTHi
	PM44jjhIUmzFuqBwB0zU3xbgMP/YkWv+T0ZOcxUFDI9nPxtnsH/1bSd0RNnlfjAV0bYQ2pIf1SjcW
	o3hQKIFRNaQVyzU4Qlwu0Oii3VI/k4r4ngQyJXtfflH9vjBQbgMdAa8LQgOCFgsydy3GKY+otU4qn
	OaNnsXuPaLAj9rxl3jUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQKhI-0000000037h-0Kgc;
	Mon, 09 Nov 2026 08:25:50 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQKhF-0000000037D-2LKA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 08:25:46 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso1197852eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 00:25:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794212744; cv=none;
        d=google.com; s=arc-20260327;
        b=XBUfnrSOnadJ8I5bFuH/s27RU/mXI6gmL2kPjeR6/hvZhs3nN4ikzdL0UAS2eaNrBQ
         JgV4JLjlRPneqdYwRwmlFobNtxN62Gt96QHOJv9JHeFsHDXMgo6K3X1eP5iMrhGMPBou
         AkNNCYnpgZVuVFydcogS6RrhrXFC1/mCFcBAw3BFM5CbCZ5LQtSs0zingt58iub9gdCA
         EupuyraOyL4CR4fCQ/95WwBEZqpd4r4io4p7j/L1mmvkGjbi+/ZtkesV2iDS9ZxPsoeq
         wHmVzDUe0BKfRjsbBUw7fJDM6v6wb+K1yqmPLmlPUUrmav4WfHI8lQKMI1ysBLmpic/n
         LqOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0X4LhfmP/kb8JXQdJU0Iyockx0Jve4fj4xU5jma0V/8=;
        fh=87Z7gzaENi0/1vES+t05OhpOPJBtIfaSFuXnrld4SBU=;
        b=OtChfwiH1hW2liU643bxZAALd6ejEBQc/vEb88/J/AuY3Kac9pp4JBNBHNKd1OJnKP
         rLm14h8asq6q3WH8IPsSkRd3fJOJOs3Q9Or8sPK0DRDv4xvSzpqCkAE+MiWtx6nob5qo
         MT5XXsnibdHT0Q3qZT7LKd/dhcOm2tUMeoyPtKtIbyyoCl7WQEO6+mKODtIEE4U/L7eu
         MglWl14bz26cacXeM7U9i7kaJpURpE/SZyusjXS9yy6qhDaqnugXG1LA5Dt8jG8Rokim
         JEEAvV2ES0dIgcQW2JsIwCJ+FWV1Id8oOzn0k7fnomDEXTES6DuzzpsqqZfSKvS+BHur
         f3zQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794212744; x=1794817544; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0X4LhfmP/kb8JXQdJU0Iyockx0Jve4fj4xU5jma0V/8=;
        b=k8/k3csW8zJfoYRy7LcLA94ZQnBWGOY5Cadn7akcjwYIL/dtAUeK7KPIF81VGubRnG
         VCag+DuKQtwJdBmZFUyGWJ3RAM0o3dtmCfVx1cH0OEg6KoDKbWpFNgEkgmnF8eeZ9vp2
         sUS3IurECqgaGopKsf8bR6x+YICgn0mk4Nk4/NQsrTj3eNqf8em2HngPLopL4cKX7eea
         ZD/zMdmOCMWZsSOllkKLG9cqBg4IyQEkKPEmbt9aBc/arPsk+R9osRkeMGMs+yG5hfMa
         W8CXZibS1De16iAiwXDUuce1Wr3xYn1VgNzYvzOgoYZNNM4aAcQ5husmKX7Jqhr2MTQ9
         /Wjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794212744; x=1794817544;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0X4LhfmP/kb8JXQdJU0Iyockx0Jve4fj4xU5jma0V/8=;
        b=R4dNPFOHEfwlePSejXxP4H1BxOmZWdTmdGOQhpTQd061jKZKgwPnkOO5+2U0HzHMq/
         kL1oASAbVuaJ/bgdNQ0UaitrR0juHxOmrogpYyEV33teXzwwqV14rLVV525eQhsie4N8
         +klEivrXr17r+2MUKgGCabGawFgSltVSFW5BW8T67MBE8QrAxLd/3U0iiu0J/g54ES5G
         TqmnZ+q5RYX7EwAnRBe7k7WZYnrN4J0mrTTYXzo7YppfjQNTJmeU54FGk/wYZ6LuTrM6
         lmyz2tjOGujpQOJHD/AjfAtc4Ido8rxFDVJWrZTY4deTRnbzFoZspwx3PUIkGv39VIJz
         NFMA==
X-Forwarded-Encrypted: i=1; AL+hErHgtwpbOtW9izDeML5m0QFLdQiEuaH1UtUPaY0uxY6yrWZcUUr6WfXO5VXxbpl+Qayxub/QDLft8jNWuBnSQn85@lists.infradead.org
X-Gm-Message-State: APuU4Z+UjCljm2t+G1ArbDb27/r1swLjlqnGIWPlsFygjE+npULAEp2L
	mw7R4s+c5eNC1NHMEh6jp5NwGDf8sCKUvpiRe9SVkonax+9OIaN84hZ3x2AjgBcemngPXuYrwEX
	In7+p7iidlAXWi4cTkfapZB65BH+TY4I=
X-Gm-Gg: AYBFou2FjYqI8Qp/SdZWV19s/kZ7M9ynj4KGywFZRkE2Js8mFnxViN0k1yZUh1evEB1
	9wMIdhcv6RjbvHWa0rM1grO7vAo8OXgkgdW9/Zs9RuO7tVozlxYWiM9L4VrpP7bb6rC9y2xDRqR
	03GJjeSGuQam9Ett/QpJm/t+K4mH2nvjfKegIRddAyhIh7WOLNlUWKP7Ez5+yuAqu3ksojntZlx
	1CwOMlBgT5Hv4n543Efx3qcQqypc6gBKErctELkYn7rX39WBHxuIMTK2ZTltA5oP2fQVF1G7O62
	VI7+a5nuhRpZ42LWuSN+wwhKTwhIfokrJE5rMaOYnMSOG4rNAql5c3z2eP0HEvksuWqQmKBM1qD
	/3pSqNT8M0JFbxMA1Dv50bsUEQ5VauSm5/Nlmuh9v/aY/5FwZ5ip/6c2YpCCIV90bff7j
X-Received: by 2002:a05:693c:8941:10b0:36d:f004:ae6e with SMTP id
 5a478bee46e88-372571d8680mr6442806eec.34.1794212744367; Mon, 09 Nov 2026
 00:25:44 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261108074733.248784-1-hj351016@gmail.com> <179421246928.994134.4691531527341185507@kernel.org>
In-Reply-To: <179421246928.994134.4691531527341185507@kernel.org>
From: khj <hj351016@gmail.com>
Date: Mon, 9 Nov 2026 17:25:31 +0900
X-Gm-Features: AclHuK9eAUiDtMPLiXAXqngFp10UUm9BXsLJcVw65tcB1NHPhojqGG_5DdAb4cA
Message-ID: <CAGr5VtOkBt1duzjEMtgP-0OUiuxRzfTDz_BC9K=uuZtrK0ZLfQ@mail.gmail.com>
Subject: Re: [PATCH net v2] net: ti: icss-iep: fix deadlock when disabling PPS
To: netdev-bot+sashiko@kernel.org
Cc: danishanwar@ti.com, rogerq@kernel.org, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_002545_644554_A0FF188E 
X-CRM114-Status: GOOD (  42.70  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thanks for the careful review =E2=80=94 both are fair.

On the [Medium]: agreed. Draining outside ptp_clk_mutex is what breaks
the deadlock with icss_iep_cap_cmp_work(), but it does weaken the
enable<->disable serialization that the mutex used to provide, so a
concurrent sysfs enable can now race the disable's drain as you
describe. The deadlock and the ordering are in tension and a clean fix
needs a small restructure rather than just relocating the
cancel_work_sync().

On the pre-existing [High]: agreed, and thanks for spotting it =E2=80=94 it=
 is
a separate bug from the deadlock this patch targets. icss_iep_exit()
unregisters (and can free) the PTP clock before the perout path is
torn down, and icss_iep_perout_enable(off) never drains iep->work, so
a late icss_iep_cap_cmp_work() can reach ptp_clock_event()/pps_event()
on a freed or NULL iep->ptp_clock. That deserves its own fix (drain
the work in the perout teardown path / order the unregister after the
disable), which I'll send separately rather than fold into this
deadlock fix.

Since this is hardware I cannot test (am654 icssg PRU) and the clean
fix touches the PPS/perout teardown and the ptp_clk_mutex discipline,
I would appreciate the maintainers' preferred direction before I
respin =E2=80=94 in particular whether to re-serialize the
enable/disable/drain differently or to move the drain into
icss_iep_exit()/perout teardown.

pw-bot: cr

2026=EB=85=84 11=EC=9B=94 9=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 5:21, <=
netdev-bot+sashiko@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 (1) =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] This patch moves cancel_work_sync(&iep->work) in
>   icss_iep_pps_enable() out from under ptp_clk_mutex.
>
> Pre-existing issues:
> - [High] This problem wasn't introduced by this patch, but it is a use-
>   after-free / NULL dereference in the teardown path that the new guard=
=E2=80=A6
>
> --
>
> net: ti: icss-iep: fix deadlock when disabling PPS
>
> This patch changes icss_iep_pps_enable() so that cancel_work_sync(&iep->w=
ork)
> runs after ptp_clk_mutex is dropped. This avoids a deadlock with
> icss_iep_cap_cmp_work(), which takes the same mutex. It also makes
> icss_iep_cap_cmp_work() return early when neither pps_enabled nor
> perout_enabled is set.
>
> > diff --git a/drivers/net/ethernet/ti/icssg/icss_iep.c b/drivers/net/eth=
ernet/ti/icssg/icss_iep.c
> > index ec085897edf09..3b2a88c2dad88 100644
> > --- a/drivers/net/ethernet/ti/icssg/icss_iep.c
> > +++ b/drivers/net/ethernet/ti/icssg/icss_iep.c
> > @@ -534,6 +534,17 @@ static void icss_iep_cap_cmp_work(struct work_stru=
ct *work)
> >
> >       mutex_lock(&iep->ptp_clk_mutex);
> >
> > +     /*
> > +      * PPS/perout may have been disabled (and the compare hardware
> > +      * cleared) while this work was queued or waiting for the mutex.
> > +      * Bail out rather than re-arm CMP1 and emit a stale PPS event on=
ce
> > +      * the event source is gone.
> > +      */
> > +     if (!iep->pps_enabled && !iep->perout_enabled) {
> > +             mutex_unlock(&iep->ptp_clk_mutex);
> > +             return;
> > +     }
>
> [Severity: High]
> This is a pre-existing issue, but does this check cover teardown when per=
out
> is enabled instead of PPS?
>
> icss_iep_exit() unregisters the ptp clock before it disables perout:
>
> icss_iep_exit() {
>         if (iep->ptp_clock) {
>                 ptp_clock_unregister(iep->ptp_clock);
>                 iep->ptp_clock =3D NULL;
>         }
>         icss_iep_disable(iep);
>
>         if (iep->pps_enabled)
>                 icss_iep_pps_enable(iep, false);
>         else if (iep->perout_enabled)
>                 icss_iep_perout_enable(iep, NULL, false);
>         ...
> }
>
> Inside ptp_clock_unregister(), ptp_disable_all_events() only sends
> PTP_CLK_REQ_PPS. icss_iep_pps_enable(off) then returns -EBUSY because
> perout_enabled is set. So CMP1 stays armed and the work is never drained.
>
> ptp_clock_unregister() then unregisters ptp->pps_source and calls
> put_device() on the ptp device, which can free the ptp clock. After that,
> iep->ptp_clock is set to NULL without holding ptp_clk_mutex.
>
> Later, icss_iep_perout_enable(iep, NULL, false) clears perout_enabled. It
> never calls cancel_work_sync().
>
> During this window icss_iep_cap_cmp_irq() can still queue the work.
> icss_iep_cap_cmp_work() gets past the new check because perout_enabled is
> still 1, and then reaches:
>
>         ptp_clock_event(iep->ptp_clock, &pevent);
>
> For PTP_CLOCK_PPSUSR, ptp_clock_event() calls pps_event(ptp->pps_source, =
...)
> without a NULL check. Can this touch a freed pps_source or ptp clock, or
> dereference a NULL iep->ptp_clock?
>
> On am654 with icssg_prueth (clockops perout_enable), this looks reachable=
.
> Enable perout with PTP_PEROUT_REQUEST, then bring the interface down, whi=
ch
> goes through prueth_emac_common_stop()->icss_iep_exit().
>
> [ ... ]
>
> > @@ -607,7 +619,7 @@ static int icss_iep_pps_enable(struct icss_iep *iep=
, int on)
> >       } else {
> >               ret =3D icss_iep_perout_enable_hw(iep, &rq.perout, on);
> >               if (iep->cap_cmp_irq)
> > -                     cancel_work_sync(&iep->work);
> > +                     drain_work =3D true;
> >       }
> >
> >       if (!ret)
> > @@ -616,6 +628,15 @@ static int icss_iep_pps_enable(struct icss_iep *ie=
p, int on)
> >  exit:
> >       mutex_unlock(&iep->ptp_clk_mutex);
> >
> > +     /*
> > +      * Drain the capture-compare work only after dropping ptp_clk_mut=
ex.
> > +      * icss_iep_cap_cmp_work() takes ptp_clk_mutex itself, so cancell=
ing it
> > +      * under the mutex deadlocks against a handler instance already r=
unning
> > +      * and waiting for that same mutex.
> > +      */
> > +     if (drain_work)
> > +             cancel_work_sync(&iep->work);
>
> [Severity: Medium]
> Now that the drain runs outside ptp_clk_mutex, is the disable still order=
ed
> before a following PPS or perout enable?
>
> The chardev ioctls hold ptp->pincfg_mux around ops->enable(). In
> drivers/ptp/ptp_sysfs.c, pps_enable_store() and period_store() call
> ops->enable() without it. That means a second writer can take ptp_clk_mut=
ex
> between the mutex_unlock() and the cancel_work_sync() above:
>
> CPU1                                  CPU2
> icss_iep_pps_enable(iep, 0)
>   icss_iep_perout_enable_hw(off)
>   iep->pps_enabled =3D 0
>   mutex_unlock()
>                                       icss_iep_pps_enable(iep, 1)
>                                         icss_iep_perout_enable_hw(on)
>                                         iep->pps_enabled =3D 1
>                                         mutex_unlock()
>   cancel_work_sync(&iep->work)
>
> Two outcomes look possible.
>
> In the first, a stale work item from the old session gets the mutex after
> CPU2. It may have been queued by a CMP1 IRQ just before the disable, or i=
t
> may already be waiting in mutex_lock(). The new check in
> icss_iep_cap_cmp_work() only looks at the flags, so the item gets through=
.
> It reads the new start value that icss_iep_update_to_next_boundary() wrot=
e to
> CMP1. It writes start + iep->period back, then reports a PPSUSR event for=
 an
> edge that has not happened yet.
>
> Would the first pulse of the new session be skipped, with a bogus timesta=
mp
> sent to userspace?
>
> In the second, CPU1 is delayed until the new session's first CMP1 match.
> icss_iep_cap_cmp_irq() queues the new session's work, and CPU1's late
> cancel_work_sync() removes it before it runs.
>
> In the non-clockops path, this work is the only code that advances CMP1 b=
y
> iep->period. icssg_prueth_sr1 is one example, since it calls
> icss_iep_init(iep, NULL, NULL, 0).
>
> Could PPS stop for good here while pps_enabled is still true?
>
> Before this patch, ptp_clk_mutex serialized the disable, the drain and th=
e
> next enable.
>
> > +
> >       return ret;
> >  }
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261108074733.248784-1-hj351016%40gmail.com

