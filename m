Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B684B606A329
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 16:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=G7EXwyO3;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Uen6VXen
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eGPDDNK/Yei0sGWbDO0NMhfYUHaLt6AdHTFPFf4Fgzk=; b=G7EXwyO3v2rQag
	S2eHMuI1NDCoXPqGec4TtOFra0vso2PD+h2MQEmX90xqY3yehwa/0gXUlGLWC8bQ3gPyfZ6NDF2Nu
	++OdkXzbhcTWIhp76ltjkLaTVBjtU+DOcmEzG6H4KfzS8e92Atg4frngdzkh5EV57JyErVo93I0QV
	GOhIKjMnLF2ThZ8fgc1bRegFiVZkUoaJ6bWKkdoLpDq6qVLpq3/3iQTJCD3aNfokKe9CJ5Q48Dqqs
	J13Hd3010UQAOVthkuBVLOHyFHYQC5zLDi1naseFY9aRIEauuWvpTSLlX7HpcVnb/4S8fGt7HsBLx
	dzIci4qQPcOKq+nR8pIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFpj-0000000AYG7-0kFq;
	Wed, 25 Nov 2026 16:26:59 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFpb-0000000AYF7-45dd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 16:26:57 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-c513a854320so114075566b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 08:26:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795624010; cv=none;
        d=google.com; s=arc-20260327;
        b=P6Ug6dmmTXcBwlWHoSi/gKov2qyddINWm+iCM24MvatbI9RFSowUknv5cgG9Pxp9Yb
         AwZOb9GgKIPhTCWzQcKNlvkZ51m5CR21ah9kIRGgsQ3EVmw6bluZ3//GWS6aZIirOpwk
         Yi1HA8vBzLMwRNhhM2Nc+3/xegjPRQQtdW8OnK0RG3qj5i0LXzTcv1DJEBePBnYOK2Un
         LR/8Ua+WnB9NxxnO1VPZHjMWmX2Cbe1ABHQH5v5ad6WnbSz+4bH0mZZvl/55o2/2m4V5
         pTPNBLPDrw7SfZqjgxWwcXTOhsVzJ0Qs9pZd0x+/I8mkGC+e+/bJRS+YoDyKCMWEt4Mt
         ziZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eGPDDNK/Yei0sGWbDO0NMhfYUHaLt6AdHTFPFf4Fgzk=;
        fh=lQsWsLIeLxs1iEEg/8IBP35kkVpmmbsidffFzAlkGYA=;
        b=muberB0XP+oelRloy/AC/1iL6D1NheeYk04rynWRWkJFIuaj15gVO4KX8i7Kpg3qbl
         rcsVcr6m+cnGisPxz6/pdSinNE8nlIqcjfeEpZGY9TrOFohuj2ay7jWZUL2jQ1xfsm47
         w8meMA2v+kHq4P7axzhGoMXfmKqmyF+QiiDBa8i5gv9XHFc3FoCrfSk4XE7Nv7YnKkSr
         4q3DrXD+YlYxDT8+BQE8O44c8fUBaJuatEilSz2b9Pwx0S7oQFR/9/ZIuh07r57XCLm7
         1FFh2JIiMkPyRckVLe2/7ZhuYQJEIVApM+sNC3T+FOKd4z9MEAdl+eGsyZJVgGcop+P7
         Sbnw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795624010; x=1796228810; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eGPDDNK/Yei0sGWbDO0NMhfYUHaLt6AdHTFPFf4Fgzk=;
        b=Uen6VXenqBmqThgdW47BuYxDy/LPIz3npIX7XcQFqt32atROxHAvflFvAqYnV/wXUU
         XtvwxH0cDzIt11aIeRzIOcqAKPwIj+yGFk4ZqZZjgxJvJMAAntn58EiBisbXh42FwZXD
         jNlsArvHfB3Ndvb4hK8W4c01RYtb64cKvPtX1ZVYqUJe3AUBuF8tGNJ/ALDvX2+qe/Jl
         pes61Qop8S3e3YToCMBeIG1jNMr2ruYvJTek1hbB94sH5lkTbrhLPis3pmjfAEAJrO6K
         BI9UB//ziEQaALG4eCjyIXGI7QzmkE0fu+AARmvUaVRYgQVbCQYpXakVb27PqzeIvYH7
         ijFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795624010; x=1796228810;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eGPDDNK/Yei0sGWbDO0NMhfYUHaLt6AdHTFPFf4Fgzk=;
        b=0/r24WHUjd4FiW+HHb/Ko24szwZWbpT9hVPmT2owEdJYd7w6OhPnw9u1kCTbidFYzD
         loJQ/kZ4i36eNWF4E2Za4FFP++q7Rv51wbwrRAcn4iI2FUqor/pm6mWrXcBc7OwboWqV
         nicxqhQqNGT7Rbq1k1HJowYUN39MhFAYqI2BbiMSL9E2Ck3t61sS4Laeo+c025KdAC2Y
         gPnINOVvqfD34K4SVjamfRaL+FzXEULewMjmIFyoKBI7afVfBE7I0E96kRwzJeMr0lv5
         TggbAkJMO59y1iW2iSDvwUudWXLwec8FNwa77UdkFVOtJa0NI+N2p/KsD9vj8tvgQ3vO
         OyRA==
X-Forwarded-Encrypted: i=1; AL+hErGCD9CPqf5ADo0Tt8hQkKpt8OPIyc7+MWLmsTo0S0C/YVQ6dY7sqpHdsWaAAxZRmP74Y0WO9gsl3Gfg4FTMh8Rh@lists.infradead.org
X-Gm-Message-State: APuU4Z8NKDMh+eMWaoOgQiTKY5QeajBWURswTpnar/n1pnSlWgg3dyYm
	q3Hizx6xoChq3B/3RaDw9DpLYtGTbOBeBTpOWvNk8hCRj+poJqH7z2UoiEtPmzQfjPn9JBV3Egv
	oQnRJsyNeLu84QfqvcX6v0321hOoPrbDweMY3gQVI
X-Gm-Gg: AZFdTZert2uyiQwUsZjf+o+gBKdSEio+kQdUFQgqy9t5vL8d9V6tJA2e95nGp2GU3jW
	atwsqun4QWMeM3lNZCPrVTk2IVmJAm+wejHAZokqL8/kVoeOEFwZuv52IQVNqIv38kPB6ONfpjm
	ltnzw61Ocfkz5yE56QbsmWeyfwy/aI1L++BrqfS08bLhtyd8bAcp1Dlucjw08HdqOOo6pt1/gzn
	djtpAYNGrT0ykXW7HcPP/ASnP7HgIEhKNBaba0EFnGyZLhEMi9E42of1RmLt0PWiL/QHyCp1uWC
	VPsu4cfojADqBB7goDvStduevDwpuxMxfwMZsjHJXIeHdMJNx2NkeaqbyQYv8ZblUDaJRPNXvWk
	2iep/PRlRWp8dLoe4qYcu1oYrgNs0Qezezo4s45m9xACzPSxf9SDXjV0hh9vQUaW3wxlszSEM3e
	pmesXQ3IaAIupyQJjGKxFY1Lslm2MSIlicZ4/gMMIK5niVL4F/J3A=
X-Received: by 2002:a17:906:3713:b0:c50:4d71:a85d with SMTP id
 a640c23a62f3a-c513aac5448mr1166580166b.32.1795624009440; Wed, 25 Nov 2026
 08:26:49 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261122184453.2668189-1-jthoughton@google.com>
 <20261122184453.2668189-9-jthoughton@google.com> <9487E341-5F59-4245-BE0E-EFDD413E45D2@linux.dev>
 <CADrL8HXPKfUhRaVhVyV6CPoQ2apZx1FCpyqyPMr=p=Q_kF3HBA@mail.gmail.com> <0EFB24F3-D3F2-4B28-9684-68CCCC1E80B8@linux.dev>
In-Reply-To: <0EFB24F3-D3F2-4B28-9684-68CCCC1E80B8@linux.dev>
From: James Houghton <jthoughton@google.com>
Date: Wed, 25 Nov 2026 11:26:12 -0500
X-Gm-Features: Aa3M54qAHiURLXighOGPx7-HKZ5MkmT19-dDBj6zUM_QZzKzc5QW8DO7KfwSRns
Message-ID: <CADrL8HXM6Or4_7LM+D0XP9++4eENFt0J4ssShuXQxcmX8mAkoA@mail.gmail.com>
Subject: Re: [PATCH v3 08/19] hugetlb_vmemmap: Expose whether HVO is enabled
 to architecture code
To: Muchun Song <muchun.song@linux.dev>
Cc: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Oscar Salvador <osalvador@suse.de>, Andrew Morton <akpm@linux-foundation.org>, 
	Kefeng Wang <wangkefeng.wang@huawei.com>, Nikos Nikoleris <nikos.nikoleris@arm.com>, 
	Linu Cherian <linu.cherian@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	David Hildenbrand <david@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Nanyong Sun <sunnanyong@huawei.com>, Yu Zhao <yuzhao@google.com>, 
	Frank van der Linden <fvdl@google.com>, David Rientjes <rientjes@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_082655_779278_9F7A496E 
X-CRM114-Status: GOOD (  52.07  )
X-Spam-Score: -17.6 (-----------------)
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
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 25, 2026 at 6:24=E2=80=AFAM Muchun Song <muchun.song@linux.dev>=
 wrote:
>
>
>
> > On Nov 25, 2026, at 01:13, James Houghton <jthoughton@google.com> wrote=
:
> >
> > On Mon, Nov 23, 2026 at 3:50=E2=80=AFAM Muchun Song <muchun.song@linux.=
dev> wrote:
> >>
> >>> On Nov 23, 2026, at 02:44, James Houghton <jthoughton@google.com> wro=
te:
> >>> +/**
> >>> + * hugetlb_vmemmap_optimize_enabled - whether HVO is enabled
> >>> + *
> >>> + * This only reflects the hugetlb_free_vmemmap=3D kernel command lin=
e parameter
> >>> + * and the vm.hugetlb_optimize_vmemmap sysctl, not whether the archi=
tecture
> >>> + * supports HVO (see arch_support_vmemmap_remap()).
> >>> + *
> >>> + * The value is final once early parameters have been parsed only if=
 the
> >>> + * architecture selects CONFIG_ARCH_HUGETLB_VMEMMAP_OPTIMIZATION_SYS=
CTL_RO;
> >>> + * otherwise it may change at any time through the sysctl.
> >>> + *
> >>> + * Return: true if HVO is enabled.
> >>> + */
> >>
> >> I don't think hugetlb_vmemmap_optimize_enabled() has clear semantics.
> >>
> >> Its name suggests that it reports whether HVO is actually enabled and
> >> usable, but it only returns the policy bit set by Kconfig, the command
> >> line, or the sysctl. It may return true even when
> >> arch_support_vmemmap_remap() is false. This is particularly confusing
> >> because arm64 calls it while determining the capability on which
> >> arch_support_vmemmap_remap() itself depends. Therefore, the helper
> >> really reports whether HVO was requested, rather than whether it is
> >> enabled.
> >
> > I agree, the name is misleading.
> >
> >> Could we keep vmemmap_optimize_enabled private and let arm64 retain
> >> the boot-time setting locally instead? For example, arm64 can use a
> >> private hvo_enabled_at_boot variable with a
> >> core_param(hugetlb_free_vmemmap, ...) registration. The system
> >> capability is evaluated after core parameters have been parsed, and
> >> arm64 makes the HVO sysctl read-only, so the value remains stable for
> >> system capability and late CPU verification.
> >>
> >> What do you think?
> >>
> >> +static bool hvo_enabled_at_boot __ro_after_init =3D
> >> +       IS_ENABLED(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON);
> >> +core_param(hugetlb_free_vmemmap, hvo_enabled_at_boot, bool, 0);
> >> +
> >> static bool has_bbm_through_af(const struct arm64_cpu_capabilities *ca=
ps, int scope)
> >> {
> >>        /* The kernel only enables HW AF updates with CONFIG_ARM64_HW_A=
FDBM. */
> >> @@ -2055,7 +2059,8 @@ static bool has_bbm_through_af(const struct arm6=
4_cpu_capabilities *caps, int sc
> >>         * BBM-through-AF is only needed for HVO. If HVO is not in use,=
 don't
> >>         * penalize systems with mismatched support.
> >>         */
> >> -       if (!hugetlb_vmemmap_optimize_enabled()) {
> >> +       if (!IS_ENABLED(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP) ||
> >> +           !hvo_enabled_at_boot) {
> >>                /* Only valid if HVO cannot be enabled later via the sy=
sctl. */
> >>                BUILD_BUG_ON(!IS_ENABLED(CONFIG_ARCH_HUGETLB_VMEMMAP_OP=
TIMIZATION_SYSCTL_RO));
> >>                return false;
> >>
> >
> > This is a good suggestion, but let me explain why I don't think we
> > should do this:
> >
> > First of all, I'm changing the bbm_through_af capability from a
> > SYSTEM_FEATURE to an EARLY_LOCAL_CPU_FEATURE, which means that
> > has_bbm_through_af() will be evaluated before core_param()s are
> > parsed. I could change it back to a SYSTEM_FEATURE, but I would rather
> > not do that. (See [1]).
>
> Actually you can use early_param.

You're right that they won't conflict (today I learned).

> >
> > I also don't like duplicate parsing of the same command line argument.
> > I'm not sure if there is precedent for this, but I feel like it will
> > lead to confusion. (It is news to me that duplicate parsing like this
> > is valid, as long as they are not both core_param()? or
> > early_param()s, I think?)
>
> I checked the command-line parsing paths, and having more than one
> handler observe the same command-line option is supported. In
> particular, it is not restricted to handlers of different types.
>
> do_early_param() walks the entire .init.setup table and invokes every
> matching early_param() entry; it does not stop after the first match.
> There are several existing examples:
>
> - "kfence.sample_interval=3D" is parsed early by the arm64 and powerpc
>   MM code and is parsed again by the generic KFENCE module_param_cb().
>
> - "pci=3D" is registered with early_param() in both
>   arch/x86/kernel/acpi/boot.c and drivers/pci/pci.c.
>
> - "console=3D" is handled by an early_param() in
>   drivers/tty/serial/earlycon.c and by __setup() in
>   kernel/printk/printk.c.
>
> I agree that duplicate parsing should be used carefully, but these
> handlers would not be competing to own the same state. The generic HVO
> code does not need to expose its internal policy state solely for arm64
> capability detection. Arm64 only needs a local snapshot of whether HVO
> was requested at boot in order to decide whether the BBM-through-AF CPU
> capability is needed.

How HVO is requested could change in the future, right? Like if a new
command line option is added, for example. I (strongly) feel like it's
better to provide arm64 a way to properly determine if HVO has been
requested, rather than parsing the "hugetlb_free_vmemmap" option
itself and trying to keep mm and arm64's parsing logic in sync. Even
today, although the parsing logic is simple, duplicating is really not
ideal.

I feel like Will and Catalin will be opposed to having
`early_param(hugetlb_free_vmemmap)` in arm64 code, too.

Also, doing it this way, if an invalid value is set, we would see
"Malformed early option" twice instead of just once.

So let's just add that helper to expose whether or not HVO was
requested; I don't see anything wrong with that. Do you agree with
that?


>
>
> >
> > It would be much easier just to rename
> > hugetlb_vmemmap_optimize_enabled() to
> > hugetlb_vmemmap_optimize_requested() and properly document what it
> > returns. Does that sound good to you?
> >
> > [1] https://lore.kernel.org/linux-mm/CADrL8HUgo0zAHe7_eF1+hfTR6jBbZ=3DU=
KB1qPpMWpksvqbNHsyw@mail.gmail.com/
>
>

