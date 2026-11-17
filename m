Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C990E606A323
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 02:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pUhXo/uB;
	dkim=pass (1024-bit key) header.d=nearthlab.com header.i=@nearthlab.com header.a=rsa-sha256 header.s=google header.b=Wx/tp+Ow
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LMBbatKuFXiOiiKhIDdtLoJOCz6eVaYMtmr54QH3Bd4=; b=pUhXo/uBcS7Zox
	wHQjHQnR5tj3j6LZXxwUaY7xTf00osLONCUrbBZckmuO2WG0l36rXU+JjK7rWq1C49J8ZDtxY8FPo
	a38wSQQDm7m24Ya3kksbP3lDcf+AitgR+gII18qNcbhOiLCRQ2cCOJfmeus3lKAfPoNCOp4A+rFp9
	l/3oH0PG2wdSPycRtUBkGZEOE5E9CNUynOt4vE7q2RQOBM26doTcZewCkkXWH6FuJh4y+art3NTUC
	jMbVmudONYp+f44nzjrhkMY5HAA7ThT8awvw5HvCbiCReiR0GBm4cXXPyDa380ZubL8YXkj8kuU6C
	fRceu/ASoCNaMl6eqRtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT978-00000004Qbn-0voG;
	Tue, 17 Nov 2026 02:40:06 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT974-00000004Qaw-22rK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 02:40:03 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2e946155442so43408005ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 18:40:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794883201; cv=none;
        d=google.com; s=arc-20260327;
        b=FFdXijqW35kVS+ii+LMcG1XAp6RpjwAjFsRe1/ILn5aMKnkPyhDjCR1C5BuoOLXf/n
         h5AN3OztLWKGJ6URrdQVdqBwjIPG67hhp34ay54S/+RXqS7ANkxaSznz4sKsvYAfsLAA
         84d2F4J68N81pHvEWldUWUI6MR6n8e6ZZa+rvPHRrc4dAzUmUvFxs7ixVKPqsm5s720v
         OmEftC4+qTiAg28wheOKWpDDzakg2b9W9zalKU9uZONNgOtgcoNxSS7Kp9bYzzHa051I
         RJqX4ZbOWu2L5x7/1B/Fuo9nz+OWohCXDKBa53p1RIN2nIrJmbrHyDdGX74qWULJPcIl
         xcPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LMBbatKuFXiOiiKhIDdtLoJOCz6eVaYMtmr54QH3Bd4=;
        fh=3ucy1gXlSiwRON4IciYCw9jX/MAFq15kMfjhbuWBLHs=;
        b=R7BR39TOXuB0zyjIxMaWmbENJmISd9rFBnm3/CnjKCAqaM8vsA0SEc4lotYPzC4R9O
         8+EwMRe8Jk9Jmgh2Q2CXVFMiBniyStX9l1D6yDilZD1NXtIiE9239eII4qUpgN/Duy/W
         zaBeltvZCLZDXBbJco0XEu2qhp9xs6POf+4jMaEcRXirdugGQZXn5vs0QhoImEMRKOEZ
         tS5xjp4xeB18fsAhgXXUY+xrm1bFc9tvzxy6l/mH1JBU9t3M9n3yGb1b+JoGbi9DPzoJ
         iqyiYm5VRGa8X/je5d6FLGqItJAxZ/V3GmVuKgQrRY4LP+1ZxyE8hT2BbZx3FCZpir96
         e3Vg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nearthlab.com; s=google; t=1794883201; x=1795488001; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LMBbatKuFXiOiiKhIDdtLoJOCz6eVaYMtmr54QH3Bd4=;
        b=Wx/tp+OwwLgmBXzXA4boG0xtOZHbG6If6c0rV1oEkydjFMoV78WaawNIpjqJG2BB9s
         Cbl7JKIVjKTZzipt1tVNUKsC3u848adr4puD+hA0hnpE9/1GMREAYiW2y1rLsFjZP35n
         iaMROEHjakLCsYapvrEQt/g+IUpHAV36fFf64=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794883201; x=1795488001;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LMBbatKuFXiOiiKhIDdtLoJOCz6eVaYMtmr54QH3Bd4=;
        b=sjaWGhR/tYjDx2h686AlHRO36UkHEAE5bJ18m+b1SuUT8YSjp5Vv7yhXoGh6KYzWN1
         BQo06T1apSrkuRKZ/MrHw6QZbykKN2CFqPf4ZAkXAKsoAs15fJSl/GqL17t2qIP2pXQJ
         xueE9/mLTE1B9fwjFPxOg/P39kyEQaiivWoENqZeOPmPX1iBUhB5YE9GQkS4Kbdq1Zn2
         eux6yvmMjLQB1hCd1n+oYvGJRgOAXyzOfZQc3s29wGsrM5isQ4C9PwYaQVyWtVsW569y
         hKH+gcPTPOODKy4KsGHKIuhOEg5v1tgYCmRQ7BeHZbDaQ4Zp4MVoHcQ2tgzZosKrURWn
         q3PQ==
X-Forwarded-Encrypted: i=1; AL+hErFeqDoLuggYW/I38aMxX8GxhvA2e413o0//hQf9ON53cnZswNzra6mB9gFlOiLGsGdfNARUeLRgRCV5yUeayUF3@lists.infradead.org
X-Gm-Message-State: APuU4Z+LBKtDwVpgY0rZM3uy+guznZXeiufPc9+1yW1o5+/04qpdbMHB
	Ppp/oT6rG61zoxZI7+U3vCk5eLppQI9rO1z+QNTsvqEB1rim5Fewa9VcSCLjUY8Y1cH4N02x5PI
	QaoYzu9AO0AqOv+bkEscusMORjjaJmG9Rop5sBGidRw==
X-Gm-Gg: AZFdTZcy1PC1zok44cTxek8vzCn5MHOug99T0cbOKeWXsp7DE8wOSmcPKa6Hq1E3VaT
	/VVtsF96Y+ghDdIHE2DdlzPzO4JIsyUUCQoqrXhfSspSewIWNd0E7qrK9amYAjhM6qEDMHxpFVb
	6E0rUrkoZuqJ2QyK6o3fleUUOWUi0sF+0dM1AHbdXnoGfc6QcRd7MQL2pR8WXE1xOLIJ3Ido4Dn
	Nyu9YXxKHeNM35c0YUKuZGz+2B1In53hjfH8Nf74buI5w88pCYBzDYNNpY1nF4bPU5TurerB1Vs
	qZtR/Sp2iRSYwbY89fIuDwpAwpMCA7tLEIsxHHPgMPo76kUUHuybJusdegy+YEpMbst2NyRKb48
	vl+RRJdkx++G+B3h8Mv+fIdPheRR8wK0M5ihoaw==
X-Received: by 2002:a17:902:c942:b0:2dd:b795:9cb6 with SMTP id
 d9443c01a7336-2ee0daa43eamr121018955ad.21.1794883201054; Mon, 16 Nov 2026
 18:40:01 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <CAFg7d9becn9_=ZzNwQ7bSBBNid28t_RnofL-Vb1cZVHVHxS9fw@mail.gmail.com>
 <20261013160612.GA1522005@bhelgaas> <CAFg7d9a2p2jtGyThS1M=2ZFDX0y5rpSK3H34ZuTz09R5r_ff0A@mail.gmail.com>
 <87h5i3xael.ffs@fw13> <87fqxbwla2.ffs@fw13>
In-Reply-To: <87fqxbwla2.ffs@fw13>
From: =?UTF-8?B?SGFuIC8g7ZWc7IOB7JqwU2FuZ3dvbw==?= <sangwoo.han@nearthlab.com>
Date: Tue, 17 Nov 2026 11:39:49 +0900
X-Gm-Features: AclHuK_Q986uTw7GVWmW0pPbL64Jb6Aqx4x9deC_Y4lkDrtjuDN2ErRNHLdvq1g
Message-ID: <CAFg7d9bXZEy78HqxyJ9J103FvRZLQ_jyDWUimDrHfEAQtNWDfw@mail.gmail.com>
Subject: Re: [PATCH] PCI: brcmstb: Reserve only the MSI vectors that are
 handed out
To: Thomas Gleixner <tglx@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, jim2101024@gmail.com, florian.fainelli@broadcom.com, 
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, 
	bhelgaas@google.com, bcm-kernel-feedback-list@broadcom.com, robh@kernel.org, 
	linux-pci@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Inochi Amaoto <inochiama@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_184002_553729_33CB4357 
X-CRM114-Status: GOOD (  32.80  )
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

Hi Thomas,

Thank you for the updated patch.

I will test it on the BCM2712 with the same setup as before and report
back within November.

Thanks,
Sangwoo

2026=EB=85=84 11=EC=9B=94 8=EC=9D=BC (=EC=9D=BC) =EC=98=A4=ED=9B=84 9:38, T=
homas Gleixner <tglx@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Fri, Oct 30 2026 at 20:20, Thomas Gleixner wrote:
> > On Fri, Oct 30 2026 at 21:59, Han wrote:
> >> On Thu, Oct 01 2026 at 21:29, Thomas Gleixner wrote:
> >>   The buggy address is located 0 bytes to the right of
> >>    allocated 48-byte region [ffff8000053a6880, ffff8000053a68b0)
> >>
> >> The report is caused by the patch. __msi_domain_alloc_irqs() passes
> >> nvec_aligned (4) to __irq_domain_alloc_irqs() together with
> >> desc->affinity, which has only nvec_used (3) entries. alloc_descs()
> >> then reads all 4 entries. The fourth entry is read past the end of
> >> the array. If the data there has no CPU set, the allocation fails
> >> with -ENOSPC. Without PCI_IRQ_AFFINITY, desc->affinity is NULL, so
> >> this read does not happen.
> >
> > Ah. I missed that detail. I'll look at it on Monday.
>
> The updated patch below should handle that situation too.
>
> Thanks,
>
>         tglx
> ---
> --- a/drivers/base/platform.c
> +++ b/drivers/base/platform.c
> @@ -421,7 +421,7 @@ int devm_platform_get_irqs_affinity(stru
>                 ptr->irq[i] =3D irq;
>         }
>
> -       desc =3D irq_create_affinity_masks(nvec, affd);
> +       desc =3D irq_create_affinity_masks(nvec, nvec, affd);
>         if (!desc) {
>                 ret =3D -ENOMEM;
>                 goto err_free_devres;
> --- a/drivers/pci/msi/api.c
> +++ b/drivers/pci/msi/api.c
> @@ -286,7 +286,7 @@ int pci_alloc_irq_vectors_affinity(struc
>                          * for the single interrupt case.
>                          */
>                         if (affd)
> -                               irq_create_affinity_masks(1, affd);
> +                               irq_create_affinity_masks(1, 1, affd);
>                         pci_intx(dev, 1);
>                         return 1;
>                 }
> --- a/drivers/pci/msi/msi.c
> +++ b/drivers/pci/msi/msi.c
> @@ -414,8 +414,14 @@ static int msi_capability_init(struct pc
>          */
>         pci_msi_set_enable(dev, 0);
>
> +       /*
> +        * Make sure a MULTI-MSI allocation is power of two even if the
> +        * requested number of vectors (@nvec) is not.
> +        */
> +       unsigned int nvec_aligned =3D roundup_pow_of_two(nvec);
> +
>         struct irq_affinity_desc *masks __free(kfree) =3D
> -               affd ? irq_create_affinity_masks(nvec, affd) : NULL;
> +               affd ? irq_create_affinity_masks(nvec, nvec_aligned, affd=
) : NULL;
>
>         guard(msi_descs_lock)(&dev->dev);
>         return __msi_capability_init(dev, nvec, masks);
> @@ -704,7 +710,7 @@ static int msix_setup_interrupts(struct
>                                  int nvec, struct irq_affinity *affd)
>  {
>         struct irq_affinity_desc *masks __free(kfree) =3D
> -               affd ? irq_create_affinity_masks(nvec, affd) : NULL;
> +               affd ? irq_create_affinity_masks(nvec, nvec, affd) : NULL=
;
>
>         guard(msi_descs_lock)(&dev->dev);
>         return __msix_setup_interrupts(dev, entries, nvec, masks);
> --- a/include/linux/interrupt.h
> +++ b/include/linux/interrupt.h
> @@ -370,7 +370,7 @@ extern int
>  irq_set_affinity_notifier(unsigned int irq, struct irq_affinity_notify *=
notify);
>
>  struct irq_affinity_desc *
> -irq_create_affinity_masks(unsigned int nvec, struct irq_affinity *affd);
> +irq_create_affinity_masks(unsigned int nvec, unsigned int totvec, struct=
 irq_affinity *affd);
>
>  unsigned int irq_calc_affinity_vectors(unsigned int minvec, unsigned int=
 maxvec,
>                                        const struct irq_affinity *affd);
> @@ -425,7 +425,7 @@ irq_set_affinity_notifier(unsigned int i
>  }
>
>  static inline struct irq_affinity_desc *
> -irq_create_affinity_masks(unsigned int nvec, struct irq_affinity *affd)
> +irq_create_affinity_masks(unsigned int nvec, unsigned int totvec, struct=
 irq_affinity *affd)
>  {
>         return NULL;
>  }
> --- a/kernel/irq/affinity.c
> +++ b/kernel/irq/affinity.c
> @@ -17,13 +17,17 @@ static void default_calc_sets(struct irq
>
>  /**
>   * irq_create_affinity_masks - Create affinity masks for multiqueue spre=
ading
> - * @nvecs:     The total number of vectors
> + * @nvecs:     The number of active vectors for which affinity spreading=
 is required
> + * @totvecs:   The total number of required descriptors to handle the ov=
er
> + *             allocation for PCI/MSI which requires power of two even i=
f @nvec is
> + *             not power of two. The extra descriptors are filled with d=
efault
> + *             affinity and not relevant for the spreading calcuations.
>   * @affd:      Description of the affinity requirements
>   *
>   * Returns the irq_affinity_desc pointer or NULL if allocation failed.
>   */
>  struct irq_affinity_desc *
> -irq_create_affinity_masks(unsigned int nvecs, struct irq_affinity *affd)
> +irq_create_affinity_masks(unsigned int nvecs, unsigned int totvecs, stru=
ct irq_affinity *affd)
>  {
>         unsigned int affvecs, curvec, usedvecs, i;
>         struct irq_affinity_desc *masks =3D NULL;
> @@ -56,7 +60,7 @@ irq_create_affinity_masks(unsigned int n
>         if (!affvecs)
>                 return NULL;
>
> -       masks =3D kzalloc_objs(*masks, nvecs);
> +       masks =3D kzalloc_objs(*masks, totvecs);
>         if (!masks)
>                 return NULL;
>
> @@ -90,7 +94,7 @@ irq_create_affinity_masks(unsigned int n
>                 curvec =3D affd->pre_vectors + affvecs;
>         else
>                 curvec =3D affd->pre_vectors + usedvecs;
> -       for (; curvec < nvecs; curvec++)
> +       for (; curvec < totvecs; curvec++)
>                 cpumask_copy(&masks[curvec].mask, irq_default_affinity);
>
>         /* Mark the managed interrupts */
> --- a/kernel/irq/irqdomain.c
> +++ b/kernel/irq/irqdomain.c
> @@ -1611,6 +1611,17 @@ static void irq_domain_free_irqs_hierarc
>         if (!domain->ops->free)
>                 return;
>
> +       /*
> +        * MSI device domains are capable of bulk free.
> +        *
> +        * CHECKME: Are all MSI parent domains capable?
> +        */
> +       if (domain->flags & (IRQ_DOMAIN_FLAG_MSI_DEVICE | IRQ_DOMAIN_FLAG=
_MSI_PARENT)) {
> +               if (irq_domain_get_irq_data(domain, irq_base))
> +                       domain->ops->free(domain, irq_base, nr_irqs);
> +               return;
> +       }
> +
>         for (i =3D 0; i < nr_irqs; i++) {
>                 if (irq_domain_get_irq_data(domain, irq_base + i))
>                         domain->ops->free(domain, irq_base + i, 1);
> --- a/kernel/irq/msi.c
> +++ b/kernel/irq/msi.c
> @@ -1333,20 +1333,28 @@ static int __msi_domain_alloc_irqs(struc
>
>                 ops->set_desc(&arg, desc);
>
> -               virq =3D __irq_domain_alloc_irqs(domain, -1, desc->nvec_u=
sed,
> +               /* Make sure a MULTI-MSI allocation is power of two */
> +               unsigned int nvec_aligned =3D roundup_pow_of_two(desc->nv=
ec_used);
> +
> +               virq =3D __irq_domain_alloc_irqs(domain, -1, nvec_aligned=
,
>                                                dev_to_node(dev), &arg, fa=
lse,
>                                                desc->affinity);
>                 if (virq < 0)
>                         return msi_handle_pci_fail(domain, desc, allocate=
d);
>
> -               for (i =3D 0; i < desc->nvec_used; i++) {
> +               for (i =3D 0; i < nvec_aligned; i++) {
>                         irq_set_msi_desc_off(virq, i, desc);
>                         irq_debugfs_copy_devname(virq + i, dev);
>                         ret =3D msi_init_virq(domain, virq + i, vflags);
>                         if (ret)
>                                 return ret;
>                 }
> +
>                 if (info->flags & MSI_FLAG_DEV_SYSFS) {
> +                       /*
> +                        * This only exposes desc->nvec_used and ignores =
the
> +                        * overallocated MULTI-MSI ones.
> +                        */
>                         ret =3D msi_sysfs_populate_desc(dev, desc);
>                         if (ret)
>                                 return ret;
> @@ -1610,13 +1618,15 @@ static void __msi_domain_free_irqs(struc
>                         continue;
>
>                 /* Make sure all interrupts are deactivated */
> -               for (i =3D 0; i < desc->nvec_used; i++) {
> +               unsigned int nvec_aligned =3D roundup_pow_of_two(desc->nv=
ec_used);
> +
> +               for (i =3D 0; i < nvec_aligned; i++) {
>                         irqd =3D irq_domain_get_irq_data(domain, desc->ir=
q + i);
>                         if (irqd && irqd_is_activated(irqd))
>                                 irq_domain_deactivate_irq(irqd);
>                 }
>
> -               irq_domain_free_irqs(desc->irq, desc->nvec_used);
> +               irq_domain_free_irqs(desc->irq, nvec_aligned);
>                 if (info->flags & MSI_FLAG_DEV_SYSFS)
>                         msi_sysfs_remove_desc(dev, desc);
>                 desc->irq =3D 0;

