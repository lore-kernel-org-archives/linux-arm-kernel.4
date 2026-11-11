Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AEC606A335
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 09:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tNSrRK6J;
	dkim=pass (2048-bit key) header.d=pcc-me-uk.20260707.gappssmtp.com header.i=@pcc-me-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=mANoun97
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mcP1Za+h/1XIgDOTVtisn2Oic4OHK4yE4jC+JPQehyY=; b=tNSrRK6JtitPbw
	n7a7yaK7E95sCTcyO3rzpcP8xHyOUBhvdReORwBZ07mF/EJkbipZ317lbQpUIs8x8RVv4A2eeeIf/
	LD+sd59bCeVLiPrPwDE3VS+2wwtgsOnQaXSuDPoQCv2H8c6IZTgnZCmY4VBstRMQYxDhnDlirPPif
	c7+Kdbx0qWJVGWs8XN1sTHqFGT/K1j0v9Rp00dyy5EdWsH/cqpiJ+iG5byc7j1YBZKFsi6T3wqUPF
	AK78OR21adMPkNlsWRYFGY2pnoNhGFxRrvUuYAzsvZx+jCkEZFre+yXBjZ0yO0yrghr116OS5Q5FZ
	kZ8xeGiYkxEwVMQzYfJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4me-00000006DHI-3eqJ;
	Wed, 11 Nov 2026 09:38:27 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4mb-00000006DGJ-45hd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 09:38:23 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-6b6e8b6d424so4393220a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 01:38:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794389899; cv=none;
        d=google.com; s=arc-20260327;
        b=hQs5HxpHECUX5z9Rvcuda/3R1ud5kLtItgTIsRAY4XHQWQDw0mWJ5xE4MY5q/Fus2o
         wiB+mbGh3bT3ZXCjbjKow+nPESkzMlgPtv39xzQ90bwAJ2UUJg4S3tkGO/GPUsdCb9FV
         NAPm6flcZTuWMmQ0779JbynNkJ0UYII+NVPUqw/HIIjjr/jIk+6JzkABFD8ArYwQShbb
         v9FfB0pbGkWN3KIfKm/Yx1bycg3wHA38ml5QmLrlfsHBFmUvIrFyxh8fTsvbEpVu/cYa
         sDpli7jYxq782mYPZANCHytz1TkbnoMsww8Oh0yzgqUZ3TTr9l7aepuJX3336rnTTvJ0
         UdTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mcP1Za+h/1XIgDOTVtisn2Oic4OHK4yE4jC+JPQehyY=;
        fh=Cm4oe5eulmK33Z2Mjcv/gHlrYsjBmtIpDP7FHFFJ77o=;
        b=b5/RJOJDXHkTKcoDPX84nG/DDo15k7iSLgr8eClef+VKInX54w2eMRV3wfcokiN/eG
         hqBRhGTv00u36BDF7fhl2YurlDm5oIK9Do9AbMxkvMWLhRgCRpi9GTrThTtgQjHLVgqQ
         fVs+gIdn6P+LxKlhj3jqhIDSqrLbLtrxzx5py8jMjPh9naZeqHVaL9KpFkKzb/vm7e33
         8uyl9TPfMIpHKvrN64ta+zDoepOvVQK08mXYrJCzq9I3DCUohk8/5ffCCI/1YDPMYqZ5
         Yh2PrMy+K8vj7waMmJ7eoUCUdGN0N18z6qLnXuLhiqDX3hme9lpie38YqJbENdr55Tn4
         1JtA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pcc-me-uk.20260707.gappssmtp.com; s=20260707; t=1794389899; x=1794994699; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mcP1Za+h/1XIgDOTVtisn2Oic4OHK4yE4jC+JPQehyY=;
        b=mANoun97WxEnKfweQL+WIgquQcp3i2VsRZ8WsB+C8ENYwLPzfQT84geNHdzfxelf8R
         ic1Gh2U3cZkklhf4voZ1bA0j6C0W4KkiE5vJOlObxtSiMYeO5XHmnTJADirjC0gujP+k
         sm91Z05Ld050ShywqQt6wH/T62eqBnHGgzfN4gyCr5JLaH5orBhIw7rnial7ClxDn5vu
         GLGaviiYv50E2rrOqlcDlt7lJ3Q8fNyMxereNLE4Mu+ylfMePxZrYsOLBLDy4ebmotVj
         au90THWnZwuUQkGYapkS3vWCPAw3nGFgh5a0dxA+a8HRQ9G0mPO5/DyXE12WF/QHZQz6
         1d4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794389899; x=1794994699;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mcP1Za+h/1XIgDOTVtisn2Oic4OHK4yE4jC+JPQehyY=;
        b=UUEBcbaUwPycWv87qsIb80yYEmbemkC5KZ30oRxW4kgBMFidD4eOJ2zLrmwgRHHKlt
         b+eNfdEPOsBOgDnwuvIOoYJmFq0jaxrS0WDJ2gwau44ASwGm7iEfL8PrSO+c1G4muh4v
         UgBezCZLE4q1CRBafABO+i5EDJ58b+3MNvpkEnrRfvfbcI5G+jeq/4gFeS4vHCceKxrn
         4r8mzVZJLwA0fRrmz/z1qEQc6/LNK9enwMhdl7gfRTxUDiXa0xD8FZjACJSDkOBcw2VS
         YCC6p9aOSP70WvchuFp7sKuJ9sWc1F1QVFH/rF9UgLv5NbVLJ+vQNljxh3V/zDvrRhp1
         9S8g==
X-Forwarded-Encrypted: i=1; AL+hErEEA8iyn1dOtGGtItcLIuMDNksKDL7x3NUlMW8n8dGHXoW4QkGM+LbcKMMFgsf7nwDXrorzZB4DebRy0sk3e+WS@lists.infradead.org
X-Gm-Message-State: APuU4Z8hRFe1haCNA/0Y0h7Dxuuifgh+yjbT8FQFfV/hPG0jW82E/pku
	wgpaqTa0Q4letwub9WCsKbEsxyOaGR1Ayd0SomyqCFCUfWBbgCCd9innFG+J8vku5sNCQHzxm69
	+4UZrGjhr5jrmiTRMtuZD03mFMon62g6dX6g6gnISsQ==
X-Gm-Gg: AYBFou2oLYFyzyCPVI0Jdw4ncaKh3UwAlyBmex9qRWk9U5M9GWjv8EauO1lOJq2zMH0
	kpgp9MgNRBC72URHAopEEPZZfHxk3M0b9gxTxekfYo5bs6HUu7V9G/3Cu4ldFfLEIo5YXolbpvW
	p73QlZaeNlIuwSPXfjWBnQ/O5l6q0ZUI9d0rETiRMVuT8gwoG/dkp2lbEJk7QdnVCPYh1jlPM/R
	xUuIAzIxaI3XaGNQDWBBw8txIMGCP6ZaEeYw3IQT9OgtMc0Q+SiVzLWytLWk7n04zEbtjOD93kV
	aLvPwCsUtYdWGaO+HYfOuq748jYSkF38ajW9Ff+1va+pUxfPStQ/tpH42eVwEBVT/zYo5mXQYr+
	zInJ6dZhj+pZbVPY0+qe4VozrwMKbRiDiRHIEcZD7CEIPxtzOEKQmSqc20BYNwskiKJGhRA==
X-Received: by 2002:a05:6402:13c5:b0:6b5:76be:be54 with SMTP id
 4fb4d7f45d1cf-6b777829b2fmr1504916a12.35.1794389899169; Wed, 11 Nov 2026
 01:38:19 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
 <20261107-mte-kasan-split-v1-1-d84ea5f30f94@google.com> <avNjcKtuQkZW0_Sr@arm.com>
 <avQqdBEGwje1iVlz@google.com>
In-Reply-To: <avQqdBEGwje1iVlz@google.com>
From: Peter Collingbourne <peter@pcc.me.uk>
Date: Wed, 11 Nov 2026 01:38:06 -0800
X-Gm-Features: AclHuK-VneSANYCNXJ36s2sFC-63re0-bOqlxxsBmGtmuBf0Sv7UobeBKGGbfM8
Message-ID: <CAPQLkRi4zdGZRy=59SeaRz67Vj-+jEJKH-eWMZZ=kk8t-=3-kg@mail.gmail.com>
Subject: Re: [PATCH 01/24] arm64: Fix lazy TCO clear when enabling user MTE
To: =?UTF-8?Q?Pierre=2DCl=C3=A9ment_Tosi?= <ptosi@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_013822_307254_36D1ED54 
X-CRM114-Status: GOOD (  25.97  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 11, 2026 at 12:57=E2=80=AFAM Pierre-Cl=C3=A9ment Tosi <ptosi@go=
ogle.com> wrote:
>
> Hi Catalin,
>
> On Tue, Nov 10, 2026 at 06:33:20PM +0000, Catalin Marinas wrote:
> > On Sat, Nov 07, 2026 at 04:36:07PM +0100, Pierre-Cl=C3=A9ment Tosi wrot=
e:
> > > On kernel entry from EL0 with HW KASAN inactive and user MTE disabled=
 or
> > > in async mode, mte_disable_tco_entry() leaves PSTATE.TCO set to avoid=
 an
> > > expensive write, as it assumes that EL1 tag checks are not needed.
> > >
> > > However, if the thread is in the process of enabling sync or asymm MT=
E,
> > > set_mte_ctrl() updates SCTLR_EL1.TCF0 without clearing PSTATE.TCO! As=
 a
> > > result, kernel uaccesses miss tag faults until the next context switc=
h.
> >
> > Nit: next context switch or another syscall. I think this makes it
> > clearer that the only potential missed tag accesses after the prctl() i=
s
> > a signal frame write as we don't have other uaccesses.

Or any other kernel entry such as signal delivery.

> >
> > > Clear TCO in set_mte_ctrl() immediately after setting the task's SCTL=
R.
> > >
> > > Cc: Peter Collingbourne <peter@pcc.me.uk>
> > > Cc: stable@vger.kernel.org
> > > Fixes: 38ddf7dafaea ("arm64: mte: avoid clearing PSTATE.TCO on entry =
unless necessary")
> > > Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>
> >
> > The patch is correct but I wonder whether we need a cc stable.
> >
> > Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
>
> Thanks for your review.
>
> I'm happy to drop the cc in the next version. The rationale was that this=
 fixed
> an unexpected userspace-visible kernel behavior and closed a window durin=
g which
> tag checks were not performed, which _could_ be a concern when userspace =
enables
> MTE for security. I can see how this doesn't make a strong case for backp=
orting.

I don't think this needs a cc stable.

I'm also skeptical that this is worth "fixing" at all. All that this
patch does is move the TCO disable slightly earlier in a way that is
almost unobservable except by sending a signal to a process at the
right time. So this patch only has a useful effect if it would
otherwise be somehow possible to compromise a process by taking
advantage of the kernel's signal frame write. Even then it doesn't
really help mitigate anything, it just makes the window of opportunity
slightly smaller.

Peter

