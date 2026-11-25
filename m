Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FDB606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 05:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q8g9UbYg;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bq6ZwgmP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=z31507qutrSHsDuMlMYuZrOSlqTz0X7hfxnmDVf3XDU=; b=q8g9UbYgMt7JNu
	4+kHAhF4gO2vCy6vgDV4LfjncrkbwyaKMlMXDHaC7GPe+Q+AA5cJMLImvL1rFy73K6L3jEnpVjB7w
	DQyuk8vIHcLAsabp3ta+zuE2NbNrM/DrIQsuzG7XBUD4UsTtETwqkD8BwJz62XXdVg4rKfJPHqpK9
	LbOn9GAnwWV1UtNN8ARtrFSKKhWTg5XLYgtP5gmYVDRLFIw0xL0l9qdow7q8VtdBaH2OfRzxawiYQ
	ATCj4CsFtrqRVbZHS1Qndts3QzSBsB1+9l8+m5chCWc44+JkeGl0zywC60iy35JKo++/DndD0LaA0
	BCB0sBhcimWLp+YJRJpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW5a2-00000008T3m-37bC;
	Wed, 25 Nov 2026 05:30:11 +0000
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW5Zo-00000008T1K-2zjx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 05:30:02 +0000
Received: by mail-vs1-xe2b.google.com with SMTP id ada2fe7eead31-7d2e1abf3eeso4447317137.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 21:29:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795584590; cv=none;
        d=google.com; s=arc-20260327;
        b=FSMCxMprwQu+IdQgsHZgjHrC5sjtRPvs27Ksae6a7z9WQ0m6vw/lokFECaqfDnIAy6
         eIl+sMJhqlYn+UI2kuw69YviEDit/rD0hc3sDUQa3DQ/liCAoZbEKe9kDuQpNT/FWgKv
         SR0GmLM3Qwtq3OZeXFsZufM9OooloSa1R/8Ni600aC4vxNn1E/2KJygFMEugOgXBfWxI
         /Vw8NnGDzJVsc4gwawYHY88XU/8JLU3OzCvxJNjKrbuokktEDZ7OHiR2O/vvFZ+ThXyv
         O/kZZAsB3jDH7NbrATeTqaZxM9LYGM/ctBOLlnOaMBc+G3O7WHwHtSmC3wnoJjxdEgcd
         EmnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z31507qutrSHsDuMlMYuZrOSlqTz0X7hfxnmDVf3XDU=;
        fh=h3d82c5SFfT5YtbpNzgYIjTKms6HUcH0wNEaExKyhIs=;
        b=clewK4oVJzOlQ+lkmXY3BZ1KC69lQDApDX7plt4RCVRoDCSjUNQc/iU8WREbhKuOls
         TyXYZ4+R5EvGfsGP8vFac64S0qAkdwZVPLAPMytTcuon/Xvzq8WweIAlcSa3GHSScbLm
         sSk6+51Fun2JxofDm26dw5IVDH9vS5rVZBr/qYJr1YaBsEdSlyo+ywZNXKU9VMsPRATc
         5bxb/uzEOg+P9UBMun4ILhVYceEljSXBeYwdvStmU2eanxbpjrSiGnJQHaCAOn4H56Dt
         x2Bu/stjTiprKNtD1dompKMAg7qdiIKZYI3N+rxzOWe/BHwIMhjLF1Q0ClTFUcPm4Buz
         bKug==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795584590; x=1796189390; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z31507qutrSHsDuMlMYuZrOSlqTz0X7hfxnmDVf3XDU=;
        b=bq6ZwgmPYqsIiJjpU8AqEV3rBFh3sIEfOp55j/iYJAYpaoJ8BcW6Rwx+9bvRnN2+nt
         qjNevY9dHuYsUZbNa18c/LtErjbo35TMdh9F18lbYWyfLW0om4/F4p6MXDgksyCavLB6
         MExVdZIXn7JYkV6OtwhcdGrG1YX5lt5VsCVwwPlqPmp14dW/JQlGC0azsHIvV29gxngI
         hdMh7U8PnkDpVLQ+yiRHWplHaAbP4RlVIpHuk6IITgfcH8PcVd/71b5jrYhrNsUgOPHX
         wletPHrM/FE5AmACXPTuZdhCr7Oo+EeUwKNa7iEJ3bQ20tCT1sU1dihUoEhAAy8v13XQ
         LlwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795584590; x=1796189390;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z31507qutrSHsDuMlMYuZrOSlqTz0X7hfxnmDVf3XDU=;
        b=L9zO75br91d02Wgimt7Jc3F8tOjB4/dh17cXWw5fHcYPZloRW3VfMqc/gBAQ2c5uh4
         zs+/gE+C0A3gBPKRMECL2ccXZC16G+Zxb3O4zxwj668t4Eoms0P6J8WOhP1L73iA2ZNH
         X8Z54i3s/2ct+YzOa++18Ua2CEkUkqV+tQS9TVnR2GKLfzCfr3A8hGT3vqncWPfmjCF7
         7efVrQ5T+o9ANrXBvreSZpCKCZtNWuSdR3FSaKxpHPr+qDjSO+H91bSjZZgUhfl71X1U
         wA1dP/XClelpgmez3GzXfCGHr3QUaJA8GZQ7FxjSzI9cGfgoPgpAzUJxC92rB8z4iGt9
         zBow==
X-Forwarded-Encrypted: i=1; AL+hErFqEdT9XURzbTLMf7yvw3CTyd0TtS6m//XD/2n8OqMRKUfF6FhTW8ys9RYPIhgQZQsfIoop6KiVX+LzKoSjDIBB@lists.infradead.org
X-Gm-Message-State: APuU4Z/P/fISxTuwwsnfoNATCPnIkaUjNu8kmGeLayzbWulWD4N18ABY
	KiUp+9KJ/DGzipTE1kIe70kjMg99OAz3qPNl8pHnHg0dDh2hPD2E6eCtfRayoqCAMI7W7K0kIjZ
	YQJBTXtjBWntz8kTwEFiXNTqIFEIuomxJbLTLXVsy
X-Gm-Gg: AZFdTZf0gkyCCTFN7Vf1eM9K0BNO9zDO2VlU4S/1wunfjS8FqgUpTyn1rfVpdm3mf+U
	U3NUWTHIOU84pkp4/GF4T3JQ9qtJD0iFVp0qk+7R4YQOQ1TxqUm6xMIjVEgiSDpaO0/3xgq61vS
	gz4I1ycpKCigleLxyDUyIFV2JbQ+GJldPEb5lQtkumytLJdgbBEDg5J0OU+ntx+XLQypVHg8QkB
	o59dyl19FJqStkBtmekr9cSCSLvUQHLy63kmTEdCmUvhSIolB2zcVvLydONc+r9MCuGRJJwXMil
	Mc9E830ZuiQgt7qxxdQ7FbNI6XBrLFMwKz777IZtTajZyX+Mw/YT3oKt8DdtdqrOeiHfSDVfUjB
	PmE4ajxwQrFzIc1ldw0XXCM/jKImCBVSN/qCNKkSBQ/3VhRnXz/5WTqlhlcYQmYtIW84ftyvdo5
	2XBQi+nxt393rlY9A/RN5x6JCXJsG1Dap39VSJ99Owjq1T19G+QXdhxk8J/hAOH8486jk6o2z7
X-Received: by 2002:a05:6102:4488:b0:7cb:bb7b:77e4 with SMTP id
 ada2fe7eead31-7d7393b30c6mr5630777137.3.1795584589058; Tue, 24 Nov 2026
 21:29:49 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261118101913.3135869-3-amitamishra@google.com> <20261123154945.3083888-1-praan@google.com>
In-Reply-To: <20261123154945.3083888-1-praan@google.com>
From: Amita Mishra <amitamishra@google.com>
Date: Wed, 25 Nov 2026 10:59:36 +0530
X-Gm-Features: Aa3M54pSWQSSH-CwFoe9S0jqnWcBEelhF7YQ6aGMTLjqJveDGr8T5HV3QQARPWM
Message-ID: <CANLJkh0O=_hYhjv1QJKVfoLFp75RCgKRGHuKh2ubDA8EUExGsw@mail.gmail.com>
Subject: Re: [PATCH 2/2] perf/smmuv3: Add runtime PM support
To: Pranjal Shrivastava <praan@google.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mark.rutland@arm.com, robh@kernel.org, 
	robin.murphy@arm.com, will@kernel.org, iommu@lists.linux.dev, 
	smostafa@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_212953_202627_EDEDB990 
X-CRM114-Status: GOOD (  51.43  )
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
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Pranjal,

Thanks for the thorough review and for adding iommu@lists.linux.dev -- I'll
make sure to include it on v2.

On Mon, Nov 23, 2026 at 03:49:45PM +0000, Pranjal Shrivastava wrote:
> On Wed, Nov 18, 2026 at 10:19:13AM +0000, Amita Mishra wrote:
> > On SoCs where an SMMUv3 PMCG resides in a switchable power domain,
> > probing the PMCG attaches and powers on the domain, but without runtime
> > PM support the domain remains permanently powered on even when no perf
> > events are active.
>
> I'm interested to know which PMCGs are these? Upstream arm-smmu-v3
> doesn't have runtime PM yet, thus, a PMCG that shares its SMMU's power
> domain gains nothing from this today: the SMMU keeps the domain on anyway
>
> With my arm-smmu-v3 runtime PM series [1], the SMMU lets go of the domain
> once it has no active clients, and then a PMCG without runtime PM would b=
e
> the one keeping it on, the two series seem to fit together. For TBU PMCGs
> in a subsystem's domain this matters either way.
>
> I'm wondering if you have PMCGs in power-domains that are neither tied to
> the SMMU power-domain and nor it's clients' power-domain?
> (That'd be a bit odd but possible).

They are the two cases you mentioned -- TBU PMCGs residing in switchable
subsystem/client power domains (which already use runtime PM today), and
TCU PMCGs sharing the SMMU power domain (which pair with your arm-smmu-v3
runtime PM series). There isn't a separate third power domain.

> Which makes me question whether the PMCG needs runtime PM at all. It's
> a profiling tool, and I'd be surprised if production devices that use
> runtime PM keep PMCG events open. Without events nothing needs the PMCG
> powered, so all this buys is not pinning the domain while the driver is
> probed but unused..
>
> Do you probe the PMCGs on production devices? If they're only used for
> profiling and not in-field, not loading the driver there (or leaving the
> node disabled) avoids the problem without runtime PM in the driver.

Yes -- the same SoC DT and kernel image are used across production and
profiling/debug builds, and we want PMCGs available on demand for profiling
without maintaining separate DTs or manually toggling drivers/nodes. Today,
simply having the node enabled and probed pins the attached subsystem/SMMU
power domain on permanently even when no perf events are ever opened, which
causes power regressions on idle devices.

On holding the runtime PM reference for the lifetime of an event
(event_init -> destroy): fair point about disabled events and the observer
effect on TBU TLB/config-cache misses while profiling. Because perf's
->add()/->start()/->pmu_enable() callbacks run in atomic context, taking th=
e
reference in ->event_init() and dropping it in ->destroy() (similar to
drivers/gpu/drm/xe/xe_pmu.c) was the cleanest way to keep the PMCG powered
whenever events exist while allowing idle systems with no open events to
power-gate.

> > @@ -975,15 +1040,45 @@ static void smmu_pmu_remove(struct platform_devi=
ce *pdev)
> >
> >      perf_pmu_unregister(&smmu_pmu->pmu);
> >      cpuhp_state_remove_instance_nocalls(cpuhp_state_num, &smmu_pmu->no=
de);
> > +    if (pdev->dev.pm_domain)
> > +        pm_runtime_disable(&pdev->dev);
> >  }
>
> Events hold a module reference and bind/unbind is suppressed, so this
> only runs with no events, i.e. normally with the PMCG runtime-suspended.
> devres then frees the IRQ: free_irq() -> msi_domain_deactivate() ->
> smmu_pmu_write_msi_msg() writes to the unpowered PMCG, since the PM
> domain is only detached after devres in device_unbind_cleanup().
[...]
> > +static int smmu_pmu_runtime_resume(struct device *dev)
> > +{
> > +    struct smmu_pmu *smmu_pmu =3D dev_get_drvdata(dev);
> > +
> > +    smmu_pmu_reset(smmu_pmu);
> > +    return 0;
> > +}
>
> Sashiko flagged this too: after a power-off the IRQ configuration is
> gone, and smmu_pmu_reset() doesn't put it back.
[...]
> This is the same problem I had to solve for the SMMU in [1]: patches
> 7-8 make the genirq/msi core cache the message in
> irq_chip_write_msi_msg() and add msi_device_domain_restore_msi_msgs(),
> and arm_smmu_resume_msis() in patch 9 clears the IRQ_CFG0 registers and
> then calls it (a no-op for wired IRQs).

Agreed on both MSI issues -- I'll fix them in v2. Since
msi_device_domain_restore_msi_msgs() isn't in mainline yet, would you
prefer that v2 stays standalone by caching the single msi_msg locally in
struct smmu_pmu (clearing SMMU_PMCG_IRQ_CFG0 and restoring on resume, and
skipping MMIO in smmu_pmu_write_msi_msg() while suspended), or should this
wait/build on top of your genirq/msi patches from [1]?

> Minor: an autosuspend delay would avoid powering the domain on and off
> for every event open/close.

Sounds good, I can add autosuspend support in v2 as well.

Regards,
Amita


On Mon, Nov 23, 2026 at 9:19=E2=80=AFPM Pranjal Shrivastava <praan@google.c=
om> wrote:
>
> On Wed, Nov 18, 2026 at 10:19:13AM +0000, Amita Mishra wrote:
>
> Hi Amita,
>
> +iommu@lists.linux.dev
> Please CC the iommu list as well.
>
> > On SoCs where an SMMUv3 PMCG resides in a switchable power domain,
> > probing the PMCG attaches and powers on the domain, but without runtime
> > PM support the domain remains permanently powered on even when no perf
> > events are active.
>
> I'm interested to know which PMCGs are these? Upstream arm-smmu-v3
> doesn't have runtime PM yet, thus, a PMCG that shares its SMMU's power
> domain gains nothing from this today: the SMMU keeps the domain on anyway
>
> With my arm-smmu-v3 runtime PM series [1], the SMMU lets go of the domain
> once it has no active clients, and then a PMCG without runtime PM would b=
e
> the one keeping it on, the two series seem to fit together. For TBU PMCGs
> in a subsystem's domain this matters either way.
>
> I'm wondering if you have PMCGs in power-domains that are neither tied to
> the SMMU power-domain and nor it's clients' power-domain?
> (That'd be a bit odd but possible).
>
> [...]
>
> > +    /* The same condition smmu_pmu_probe() enables runtime PM on. */
> > +    if (dev->pm_domain) {
> > +        int ret =3D pm_runtime_resume_and_get(dev);
> > +
> > +        if (ret < 0)
> > +            return ret;
> > +        event->destroy =3D smmu_pmu_event_destroy;
> >      }
>
> This keeps the domain powered for as long as the event exists, even
> while it is disabled or not scheduled. I'd be surprised if the
> production devices that use runtime PM keep a PMCG event open requiring
> this?
>
> For a PMCG in the SMMU's domain, with [1] that means a perf event keeps
> the domain on while the SMMU itself is suspended (SMMUEN=3D0, GBPA=3DAbor=
t).
> The SMMU only suspends once all its clients are idle, so apart from
> cycles there's nothing meaningful to count.
>
> For a TBU PMCG, it keeps the subsystem's domain powered, which changes
> what's being measured: the TBU's TLBs and config caches survive what
> would otherwise be power-offs, so tlb_miss and config_cache_miss can
> under-report compared to the unmonitored system.
>
> Which makes me question whether the PMCG needs runtime PM at all. It's
> a profiling tool, and I'd be surprised if production devices that use
> runtime PM keep PMCG events open. Without events nothing needs the PMCG
> powered, so all this buys is not pinning the domain while the driver is
> probed but unused..
>
> Do you probe the PMCGs on production devices? If they're only used for
> profiling and not in-field, not loading the driver there (or leaving the
> node disabled) avoids the problem without runtime PM in the driver.
>
> If we do need it, a couple of issues with the implementation below:
>
> [...]
>
> > @@ -975,15 +1040,45 @@ static void smmu_pmu_remove(struct platform_devi=
ce *pdev)
> >
> >      perf_pmu_unregister(&smmu_pmu->pmu);
> >      cpuhp_state_remove_instance_nocalls(cpuhp_state_num, &smmu_pmu->no=
de);
> > +    if (pdev->dev.pm_domain)
> > +        pm_runtime_disable(&pdev->dev);
> >  }
>
> Events hold a module reference and bind/unbind is suppressed, so this
> only runs with no events, i.e. normally with the PMCG runtime-suspended.
> devres then frees the IRQ: free_irq() -> msi_domain_deactivate() ->
> smmu_pmu_write_msi_msg() writes to the unpowered PMCG, since the PM
> domain is only detached after devres in device_unbind_cleanup(). Wired
> interrupts are fine, and the CPU hotplug path Sashiko mentioned
> shouldn't rewrite the message with a GICv3 ITS parent, so in practice
> this is MSIs plus module unload.
>
> With the MSI message cached by the core (see below),
> smmu_pmu_write_msi_msg() could simply skip the MMIO while the PMCG is
> suspended and leave it to resume. Note it would have to check
> pm_runtime_status_suspended(), since runtime PM is already disabled by
> the time devres runs. Alternatively, keep the PMCG resumed across the
> devres teardown.
>
> [...]
>
> > +static int smmu_pmu_runtime_resume(struct device *dev)
> > +{
> > +    struct smmu_pmu *smmu_pmu =3D dev_get_drvdata(dev);
> > +
> > +    smmu_pmu_reset(smmu_pmu);
> > +    return 0;
> > +}
>
> Sashiko flagged this too: after a power-off the IRQ configuration is
> gone, and smmu_pmu_reset() doesn't put it back. With MSIs, overflow
> interrupts stop arriving and counters wrap unnoticed. With a wired
> interrupt on an MSI-capable PMCG, IRQ_CFG0 comes back UNKNOWN, so an
> overflow can send an MSI write to a garbage address, which is exactly
> why probe clears it.
>
> This is the same problem I had to solve for the SMMU in [1]: patches
> 7-8 make the genirq/msi core cache the message in
> irq_chip_write_msi_msg() and add msi_device_domain_restore_msi_msgs(),
> and arm_smmu_resume_msis() in patch 9 clears the IRQ_CFG0 registers and
> then calls it (a no-op for wired IRQs). The PMCG resume needs the same:
>
>     writeq_relaxed(0, smmu_pmu->reg_base + SMMU_PMCG_IRQ_CFG0);
>     msi_device_domain_restore_msi_msgs(dev, MSI_DEFAULT_DOMAIN);
>
> Minor: an autosuspend delay would avoid powering the domain on and off
> for every event open/close.
>
> Thanks,
> Praan
>
> [1] https://lore.kernel.org/all/20260929034510.2023173-1-praan@google.com=
/

