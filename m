Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B95606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 07:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0u3YuM32;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PrUf5+3n
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+3u+1mXse830YNAARv07fietRfMx8v03rEL53YZE7+Q=; b=0u3YuM32aO5G2K
	lD/p2vq7aO6NmGHG6bBGSjlFNpd80aWqhke6iLErnZROtDK2Qnn+5PDRnWkl+PK//wBLXsrWfKHN+
	nkWpRJBrYrgTR65EXES66ucDnMA69eYWNwKbBRmef+wY7hdumFc8kyAiV774eemwEzgG9RitVT3r3
	+hoQoED32DxXj3pjai7gXsk/LT7w2Tk2puPmSFDQmmReU96Zknc5CsDsXtFn5opGSzZKILqmE9Ck0
	dSGqG+l/HPTIkLEPvLmm5OotnqCE+JcAMjHCj5AVrZo8JWM6JWYGVtFr+Q1JrB6a5stbDkZjRSr3A
	VFU33otN4Gtx1F96TIdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPxcq-0000000Fp49-0Vpm;
	Sun, 08 Nov 2026 07:47:40 +0000
Received: from mail-dl1-x122a.google.com ([2607:f8b0:4864:20::122a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPxcn-0000000Fp3o-2IbE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 07:47:39 +0000
Received: by mail-dl1-x122a.google.com with SMTP id a92af1059eb24-14394530ec6so256703c88.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 23:47:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794124056; cv=none;
        d=google.com; s=arc-20260327;
        b=RBGF4LV/RspsElaRekt75cAVeMNNP/4gbSul/OW3zOmgyFCljX1ZlP16LiKZZY12uQ
         sgKl8JYJxTKmXeP8zpPMuKTFOrHbvPQIY1jiZLlyyc/MCf6CMb4xHM0gDf1wB2Oxt17v
         9hLAg1T5farvLqc2Pnv65sutAH3KuKWmD0cLOsIagYuKGFD7XAXYckfuJvtX6ZW9El6M
         T/e94lnOS4vVP56AOjK01eN24r5O8NcO1Qd8nL0AowMt9uhpujoAYXeJJEAd1OIiORDk
         pqqPQBDG0t/d8lmpL3zvKHBL5d/l7XP/aykSEMBGABpU8eMU9EqapAxuFyBxLGt+Drfl
         oZkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+3u+1mXse830YNAARv07fietRfMx8v03rEL53YZE7+Q=;
        fh=WQOK4PW+Np27BwKE2cyD88a5y9Cniwxenl6pPTg+4qE=;
        b=OUG2O9s2f+MNGlWzRHAsEHSux4UHOZ2AtsPw8DCiCQjUdAyGPKaEmwPoUhxrkMw8rk
         aUkfpWvWqx3zRLa6ai85oZu3Bhk0Q3nk+on1WhaoUEtC48aKUH3IlFDSkIyACljhilIt
         tP90IqFpgParF74qSZSCyFtigDvzmKvCwip2BA3n1wXN1ASBAOq7ASmgBM1s8racvJjL
         XlXXhcCdLfRp1KHyZt7mG4RmM+ywHpshSTskFgX1Ib3xZ/TTycVCiAFT7oAspsIcXh9d
         kVQn3QN2kI+Whwd67j3mCTkRtLaj204x0rshHOZXp6eqWpCWdoygjnzfAal/m8k6Elgw
         dKVA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794124056; x=1794728856; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+3u+1mXse830YNAARv07fietRfMx8v03rEL53YZE7+Q=;
        b=PrUf5+3nA4t+H3178p01Ad9bvIXa9F5Qkfzwg7JvvMcXzAHO8acbGAzKGpWStY/W/D
         LSh97i/hUNUOWGTpKHDrsmCsLvZ9E/cPBuJW48wKl09Rv7OfmhoEtNrFn1hjIEwRvi1A
         2cSsZZ1hu41ZKKO2vRgS6AX/N10nnLB3F9U409GqO6i4onc3PsNok1jSorhifmdkF8Gc
         k60NGBzl35qxeIIBfkndcRfFtN5GqcQvYsTSrzZfwu4+nU7wb6hMGfICYK0C/+NOD86m
         av1ZpJmDOjzpf9o9+ZDH6rkAC3pyz5agXSmU97/5wVvJZis4flFO6Mh1a3ohyVR+DN5U
         f8aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794124056; x=1794728856;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+3u+1mXse830YNAARv07fietRfMx8v03rEL53YZE7+Q=;
        b=Wi1YIT9kW5esELbh7i6JICLAfgz8uuOp8n+F/pk71cTKVtPyWpMEenezBDIBMmGJiw
         Ui+uJqQ4gfEFWMaNPMVN79CAuMKoQuyYi/2eyGaK3XGKi1y/nHAhqarpyCoDoMx+fwRA
         KYwGUxpjTyF7WTyWRYIwZaFDPGKr6ghvXXwh2wD7wz3UrqUarKVi0yoR93a59pNULzg9
         LLNT+ouN7DgZ5ql1/HtpLkEghh/7D0O3f1bMPGiETyLNXcABzkG/iFoLNjvbme0uXACw
         s710E0HuM0pkkkIXWaYTTrk/uEM/V/RmESpmqIcelcYwKSFLmMkVtq+7wIsWHSO0fXmT
         KPKA==
X-Forwarded-Encrypted: i=1; AL+hErHKJ4cpnGMRfmOFIbbutFj7vpAsBjXEccnu6M581km/vgn1LdToxBoNpRMkMFWq4os7tdwUvaDgPWLR3INaVVjz@lists.infradead.org
X-Gm-Message-State: APuU4Z/AH8X6Bw4RK72IMwNd0ohrTaBp7v0ntmkDQcxDNb635BKAglNF
	r3z2Zsmt4xfEqGpfsPOl7GUhuQ6lO228WoNB1ILTkJkvYWN8nGz24JLL6byOsxHWfJdUtz0JJ6w
	i6vGnAdYYASkz2NALyrzIqQRtRDckWmQ=
X-Gm-Gg: AYBFou3MIumzHSVRHUrcOrDqnkl7jaf1Pcgs1wQHsdJlWd4Z0ON6KFnYmqrPBESQMuC
	hZoMMfQW/KbzudTlt3V9vk9Eae6jl6VHrvJBEjXq2cuBzmsxQ9B68JFNTlBvikpZORU8RMwsbxZ
	S304n8kfoJ2hLALv5AWwvdUyKYay41Fr4tHxKZE8L98BWZa7hZfjesERcIJKXW2fwzKYSmh8DDe
	1O4spoyDP0r0XcLoWd59y6pAJKGo448V7eTchwCcdUy/M+BvdX8sfIZ49Pk3J+FArC8ssrADvRl
	5jMCYFLe+gctApcYIMQlS5Po2Vm6gKRD+KrWd1wMP5NYa0+jhHhnpWpMDytZzZNu9/5srek1rfT
	/jXyafGC2Tb9FeQV1IOqA0fjyQ/Ml2C/XZmsIIan2uG+m13rXbeXwsbY+RzNOrgDr7Bdn
X-Received: by 2002:a05:7023:d08:b0:1a4:4194:fc04 with SMTP id
 a92af1059eb24-1b39fee24c3mr1357876c88.28.1794124056106; Sat, 07 Nov 2026
 23:47:36 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261107063726.3388730-1-hj351016@gmail.com> <179412117075.994134.3223982666310946745@kernel.org>
In-Reply-To: <179412117075.994134.3223982666310946745@kernel.org>
From: khj <hj351016@gmail.com>
Date: Sun, 8 Nov 2026 16:47:23 +0900
X-Gm-Features: AclHuK87SL6WE7SWisw0Zo0rIquffDMZDke6cCWcKrt96_L0Ez15ObIZ4QBMLWU
Message-ID: <CAGr5VtOgm523z1mPuScHLaAYypQjSj=eOZqvn63cKet_sLTC-Q@mail.gmail.com>
Subject: Re: [PATCH net] net: ti: icss-iep: fix deadlock when disabling PPS
To: netdev-bot+sashiko@kernel.org
Cc: danishanwar@ti.com, rogerq@kernel.org, netdev@vger.kernel.org, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_234737_604653_AE8513B9 
X-CRM114-Status: GOOD (  51.33  )
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

Thanks, this is a good catch. All three are the same underlying point:
dropping ptp_clk_mutex before the drain lets a work item that was already
queued (or latched by the IRQ just before the compare was disabled) run
icss_iep_cap_cmp_work() after PPS has been turned off, where it re-arms
CMP1 and emits a stale PPS event.

v2 fixes that by guarding the handler: it now returns early, under
ptp_clk_mutex, when neither pps_enabled nor perout_enabled is set, so a
late or stale work does nothing instead of touching the (just-disabled)
compare hardware or emitting an event. That covers the "handler already
blocked on the mutex" case and the "pending work starts between unlock and
cancel" case.

On the concurrent-sysfs window (pps_enable_store / period_store not
serialized against the ioctl path): with the guard, a work cancelled by a
disable that races a fresh enable simply bails if the enable has not yet
set the flag; I don't think this patch can fully close the ptp_sysfs
serialization gap, which predates it.

On the pre-existing perout/teardown issue you flagged (High): you're
right that icss_iep_perout_enable(.., 0) never drains iep->work, and that
icss_iep_exit() clears iep->ptp_clock before the perout disable runs, so a
work queued during perout can still reach ptp_clock_event() on teardown.
The handler guard reduces but does not fully close that, because on the
teardown path perout_enabled can still be set when the work runs. I'd
prefer to fix the perout-disable drain and the exit ordering as a separate
change rather than fold a teardown rework into this deadlock fix =E2=80=94 =
happy to
send it as a follow-up unless you'd rather have it here.

Not tested on real hardware (no TI ICSSG/PRU device); the above is from
code inspection.

pw-bot: cr

2026=EB=85=84 11=EC=9B=94 8=EC=9D=BC (=EC=9D=BC) =EC=98=A4=ED=9B=84 3:59, <=
netdev-bot+sashiko@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 (1) =C2=B7 Medium: 3 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] The patch moves cancel_work_sync(&iep->work) out of the
>   ptp_clk_mutex critical section in icss_iep_pps_enable()=E2=80=A6
> - [Medium] After the patch, an icss_iep_cap_cmp_work() instance can run
>   after icss_iep_pps_enable(0) has disabled and cleared the compare=E2=80=
=A6
> - [Medium] The commit message says that because the compare is disabled
>   before the drain, 'no new work can be scheduled once the mutex is=E2=80=
=A6
>
> Pre-existing issues:
> - [High] This problem wasn't introduced by this patch, but the shared
>   iep->work is never drained when periodic output (perout) is disabled,=
=E2=80=A6
>
> --
>
> net: ti: icss-iep: fix deadlock when disabling PPS
>
> This commit moves cancel_work_sync(&iep->work) in icss_iep_pps_enable()
> out of the ptp_clk_mutex critical section. The PPS disable path then no
> longer waits for icss_iep_cap_cmp_work() while it holds the mutex that th=
e
> work handler needs.
>
> > diff --git a/drivers/net/ethernet/ti/icssg/icss_iep.c b/drivers/net/eth=
ernet/ti/icssg/icss_iep.c
> > index ec085897edf09..6264061a4eab3 100644
> > --- a/drivers/net/ethernet/ti/icssg/icss_iep.c
> > +++ b/drivers/net/ethernet/ti/icssg/icss_iep.c
>
> [ ... ]
>
> > @@ -607,7 +608,7 @@ static int icss_iep_pps_enable(struct icss_iep *iep=
, int on)
> >       } else {
> >               ret =3D icss_iep_perout_enable_hw(iep, &rq.perout, on);
> >               if (iep->cap_cmp_irq)
> > -                     cancel_work_sync(&iep->work);
> > +                     drain_work =3D true;
> >       }
> >
> >       if (!ret)
> > @@ -616,6 +617,15 @@ static int icss_iep_pps_enable(struct icss_iep *ie=
p, int on)
> >  exit:
> >       mutex_unlock(&iep->ptp_clk_mutex);
>
> [Severity: Medium]
> Once the mutex is dropped here, can icss_iep_cap_cmp_work() run against
> compare hardware that has just been disabled and cleared?
>
> There seem to be two ways for this to happen:
>
>   - A handler already blocked in mutex_lock(&iep->ptp_clk_mutex) now
>     continues. This is the case the patch fixes.
>
>   - A work item that was pending but not yet started begins running
>     between mutex_unlock() and cancel_work_sync(). In that case
>     cancel_work_sync() only waits for it to finish.
>
> The handler doesn't check pps_enabled or perout_enabled after it takes th=
e
> mutex:
>
> icss_iep_cap_cmp_work() {
>         mutex_lock(&iep->ptp_clk_mutex);
>
>         ns =3D readl(iep->base + reg_offs[ICSS_IEP_CMP1_REG0]);
>         ...
>         ns_next =3D ns + iep->period;
>         writel(lower_32_bits(ns_next),
>                iep->base + reg_offs[ICSS_IEP_CMP1_REG0]);
>         ...
>         pevent.pps_times.ts_real =3D ns_to_timespec64(ns);
>         pevent.type =3D PTP_CLOCK_PPSUSR;
>         pevent.index =3D 0;
>         ptp_clock_event(iep->ptp_clock, &pevent);
>         ...
> }
>
> icss_iep_perout_enable_hw(on=3D0) has just written 0 to CMP1_REG0/REG1. T=
he
> late handler would then set CMP1 to 0 + iep->period, which undoes the
> "clear CMP regs" step. It would also send a PTP_CLOCK_PPSUSR event with a
> zero (1970) timestamp.
>
> pps_event() doesn't check whether PPS is enabled. It records the assert,
> increments assert_sequence, wakes /dev/ppsN readers and calls
> pps_kc_event(), all after userspace has turned PPS off.
>
> Before this patch, the blocked case deadlocked and the pending case was
> cancelled under the mutex, so this behaviour is new.
>
> Should icss_iep_cap_cmp_work() return early under the mutex when neither
> pps_enabled nor perout_enabled is set?
>
> >
> > +     /*
> > +      * Drain the capture-compare work only after dropping ptp_clk_mut=
ex.
> > +      * icss_iep_cap_cmp_work() acquires ptp_clk_mutex itself, so call=
ing
> > +      * cancel_work_sync() while the mutex is held deadlocks when a ha=
ndler
> > +      * instance is already running and waiting for that same mutex.
> > +      */
> > +     if (drain_work)
> > +             cancel_work_sync(&iep->work);
>
> [Severity: Medium]
> The drain now runs outside ptp_clk_mutex and doesn't re-check
> pps_enabled or perout_enabled. Could it cancel work that belongs to a
> later enable?
>
> pps_enable_store() and period_store() in drivers/ptp/ptp_sysfs.c call
> ops->enable() without ptp->pincfg_mux. That means they aren't serialized
> against the PTP_ENABLE_PPS ioctl path or against each other.
>
> One possible sequence:
>
> CPU0 (disable)                       CPU1 (sysfs enable)
> icss_iep_pps_enable(iep, 0)
>   pps_enabled =3D false
>   mutex_unlock()
>                                      icss_iep_pps_enable(iep, 1)
>                                        program CMP1, set CMP_EN
>                                        pps_enabled =3D true
>                                      first CMP1 hit:
>                                      icss_iep_cap_cmp_irq()
>                                        schedule_work(&iep->work)
>   cancel_work_sync(&iep->work)
>     removes the new session's work
>
> icss_iep_cap_cmp_work() is the only code that moves CMP1 forward. Once
> its work is cancelled, no further compare events or PPS pulses are
> produced, while the driver still reports pps_enabled =3D=3D true.
>
> The other order is possible as well. Suppose an old-session work instance
> is blocked in mutex_lock() and gets the mutex after CPU1's enable. It
> would read the new boundary B from CMP1, write B + period and send a
> PPSUSR event stamped B before time B arrives. The first real edge of the
> new session would be skipped.
>
> Before this patch the cancel ran under ptp_clk_mutex, so a concurrent
> enable had to wait for it.
>
> [Severity: Medium]
> The commit message says:
>
>     The hardware compare is
>     already disabled by icss_iep_perout_enable_hw() before the drain, so =
no new
>     work can be scheduled once the mutex is released.
>
> Is that guaranteed? icss_iep_cap_cmp_irq() reads pps_enabled with no lock
> and no ordering against this path. Nothing calls
> synchronize_irq(iep->cap_cmp_irq) before the drain:
>
> icss_iep_cap_cmp_irq() {
>         val =3D readl(iep->base + reg_offs[ICSS_IEP_CMP_STAT_REG]);
>         if (val & BIT(1)) {
>                 writel(BIT(1), iep->base + reg_offs[ICSS_IEP_CMP_STAT_REG=
]);
>                 if (iep->pps_enabled || iep->perout_enabled)
>                         schedule_work(&iep->work);
>         ...
> }
>
> Suppose a CMP1 hit was latched just before CMP_EN was cleared, and its
> handler on CPU1 has already read pps_enabled =3D=3D true.
>
> CPU0 can then set pps_enabled =3D false, drop the mutex and call
> cancel_work_sync(). That call returns immediately because nothing is
> pending.
>
> CPU1 then calls schedule_work(), and the work runs after PPS has been
> disabled.
>
> On teardown, ptp_clock_unregister() -> ptp_disable_all_events() ->
> icss_iep_pps_enable(0) runs first. After that the pps source and
> ptp_clock are released, and icss_iep_exit() sets iep->ptp_clock to NULL.
> A work item queued this late could call ptp_clock_event() on a freed or
> NULL ptp_clock.
>
> On PREEMPT_RT the handler is force-threaded and can be preempted between
> the flag read and schedule_work(), so the window is wider there.
>
> The old code had the same race with a larger window. However, the commit
> message's argument depends on this window being closed.
>
> Would a synchronize_irq() after clearing pps_enabled, together with a
> state check in the work handler, close it?
>
> > +
> >       return ret;
> >  }
> >
>
> [Severity: High]
> This isn't a bug introduced by this patch, but the perout disable path ha=
s
> a related problem. icss_iep_cap_cmp_irq() also queues iep->work when
> perout_enabled is set, but icss_iep_perout_enable(..., 0) never drains it=
:
>
> icss_iep_perout_enable() {
>         ...
>         ret =3D icss_iep_perout_enable_hw(iep, req, on);
>         if (!ret)
>                 iep->perout_enabled =3D !!on;
>
> exit:
>         mutex_unlock(&iep->ptp_clk_mutex);
>
>         return ret;
> }
>
> On teardown, icss_iep_exit() unregisters the clock and sets it to NULL
> before perout is turned off:
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
> The ptp_disable_all_events() call inside ptp_clock_unregister() only
> disables EXTTS and PPS. The PPS disable returns -EBUSY while perout is
> enabled, so the work isn't drained there either.
>
> Can a work item queued while perout is active run icss_iep_cap_cmp_work()
> after this point? It could be queued before teardown, or by an IRQ that
> arrives before CMP_EN is cleared. If it runs, ptp_clock_event() would use
> a NULL or freed iep->ptp_clock and pps_device.
>
> This can be reached from ndo_stop via prueth_emac_common_stop(), or from
> prueth_remove(). It needs an IEP with an iep_cap_cmp interrupt and the
> icssg_prueth clockops, which set n_per_out =3D 1.
>
> Also, iep->ptp_clock =3D NULL is assigned without holding ptp_clk_mutex.
>
> Should icss_iep_perout_enable() also call cancel_work_sync() on disable?
> And should icss_iep_exit() drain iep->work before it unregisters the
> clock?
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261107063726.3388730-1-hj351016%40gmail.com

