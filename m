Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7097606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 20:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fhwBcdEY;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GXME4/uF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SZViwLMRIRsc10i5iYEamCnIC3DyjaOcp2ziBxdsyFo=; b=fhwBcdEYMaAOBgLlftKfwywcDg
	07hjMgFvu03zUIHrexgDB0OA8J9+Wf4BFe7GsRdtNp3lEi7WCnMP0mntp1Ilhesu0Lx9vY6xKxeGD
	t5T9vfsr3bSm/ODags4iTuU5Mtrd7RaRjTyYIS5CPwUt13EfwjfWyAWtxWTmuO0tyEKyALQ7eQoYV
	55MGkoBA8/cmPlw+3mMpgDSsrVm7JOphtXe+hs/kF2NHb30u/BL8yy/s37ut7UqDPi/ClpbR9dYMI
	l1VFYy8SPh9uxEVnVlq52WOVBtMYByZD4qzoFp4C5uAoTRxKtAsSW/2jkNzDyXZJ1iOphiDEXKzg4
	hV6e17zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfhs-0000000EQXj-2dZk;
	Thu, 26 Nov 2026 20:04:36 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfhq-0000000EQWr-2DlD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 20:04:35 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so43396905e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 12:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795723473; x=1796328273; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SZViwLMRIRsc10i5iYEamCnIC3DyjaOcp2ziBxdsyFo=;
        b=GXME4/uF0KfFa/PaRGfDEeaNG+JEts0j3euumbNko0QbT9fCJH+kuP2NYnaP/NsNIP
         4BVjbJ6GLUBm9rRJa/9mPeMmSIcs9xRxHBSVmX/ZBEZpw4Uhm1pffPaHPDrZpnR5q3nG
         9EFnPdSlDiqukNv90aDDstQ6vSFobvV1kzm9S9EiKZI2SFogn3qYlUciQ9AvZVaaLfvw
         PbMBshQe7QOCselTEXjrqkKNEEU9kznHyjAbTtDO8XkFW4H4aKrV0BSb179Zyx+uhrcS
         ffcZqG9zdypA05UK0eoil+IstZw1z3wSwQZo9mhjFFCaW+606tEGbKFVfW/9DHYKLm5R
         fYYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795723473; x=1796328273;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SZViwLMRIRsc10i5iYEamCnIC3DyjaOcp2ziBxdsyFo=;
        b=GmC0JVgpEokIei0iXTRviWOLOBJNWGShGxFC/yofr0hLPMw2qGHVuqHo5rN4Vyw1we
         SXPLzxvtIl7NhOyo8uU2LlJCoS4c8gEqztd9ufxZpyHfy7Vk4k8Gl4kZC1VH+AWJ9sVl
         QHQlHbNqFV5z0ZvN4m2CMCRcqOvzanjVuinTXL0yGZZl36u6hNhvXAik/La9DGPb3se6
         KJo/TwBlJ2uuu8NCk3LTkThymZspVUNE0Jxo5aFjb6+o8hc05h5Wlnwo9rAOcVYOjCzI
         jcfpnEOlQRgzgwdH8MdFir2xKor1jvpJhY6Ev4ceybF+rUpflYFG24NCI5PyuhpW8i54
         D1kg==
X-Forwarded-Encrypted: i=1; AL+hErHaOYAr7tzXBMYSza6sC2zqt/ndXqZDs8HiLBFzSrHHFRsOuPqNH4wsXaYnmdqKpLCD7ZyBAAGhQFc6bP9ZJcTl@lists.infradead.org
X-Gm-Message-State: APuU4Z9Zch+9LY1hdMzh2s3QWp8jWVOAINQn8PhN5ZLu3HziBT/m8+Gq
	OknnXuv4atwMGYGIlNcxn1RnVEjjXrtbXvRU9ySbi8owpUTNaJGXmtdQqTSBRw+XMQ==
X-Gm-Gg: AZFdTZdj0yI/V4Ynawm2MytM0IAf1aJ7LKUNLebCR66gJ19n0yw6DGzGKPqlULtLCd/
	HXFH/sJZkH9WXPb9LrDSwFsiVDKJ3tU7BmLWukorJJk9DUf8hiIOg07H+E9JGN1F4I1Br8POGdF
	BJWESD8BdNjqjgu9AFM2WIZ4MYRF3lc2HzPMCdYmOQFm7xqQR6odpBDEvOJBUvpFrhLWJaUS4V1
	OCnBWvHum0drNO4rrWfgijcf6RKIB0lHILVDTLjrbgorQIURiROixzB5ix995t1bcF+D5pxZgGe
	MflCjAt5pHdk0YMh9BurgErQMLcFQjrGOE1ikENhquHVJF2NGENThpW24i/AU+uBaXHM+DS1e+v
	mpWUTdppk6D+Rcnxkow12IzwVTCF2fcH0U51al1seZcfFjCo+sL3AykT9HfWjtn6tpOERKGwvly
	fhu+xMJlZtuM/oa2TmpqnWy9zlcqJCZiX6xAFo7N2KxhgEylXtTO0ewdTVZNE6QGDMxFX6+YVFm
	CR+QN1DW2KRqAYSFdckkA+ibHInqvREDjTNFtv3OE8mg2D2uQRUl+059bHA3LFknBm4/cHitD/R
	uUt83NjB9RrzDt6vhN4W3pqYxaRt60ABF5iuBAvDgZ/71+HGzuAZjpyiIji7vdcuPaffTcun2u5
	N3cISvJHugiKSxTq4+WoQzV0=
X-Received: by 2002:a05:600c:828e:b0:4a1:cd83:b23e with SMTP id 5b1f17b1804b1-4bb88786ddemr411339985e9.0.1795723472329;
        Thu, 26 Nov 2026 12:04:32 -0800 (PST)
Received: from google.com (0.182.34.34.bc.googleusercontent.com. [34.34.182.0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b8429sm981502225e9.14.2026.11.26.12.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 12:04:31 -0800 (PST)
Date: Thu, 26 Nov 2026 20:04:28 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com,
	qperret@google.com, weilin.chang@arm.com
Subject: Re: [PATCH v4 21/23] KVM: arm64: Add PKVM_HYP_REQ_SPLIT
Message-ID: <awiQzMZxQDEHrRf4@google.com>
References: <20261117174403.58762-1-vdonnefort@google.com>
 <20261117174403.58762-22-vdonnefort@google.com>
 <CA+EHjTzZkAf8+BGNH15TKCEYUyO=VFvGSeJg5hfaFoefNOTVpg@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTzZkAf8+BGNH15TKCEYUyO=VFvGSeJg5hfaFoefNOTVpg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_120434_584775_7E007D20 
X-CRM114-Status: GOOD (  16.84  )
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

On Mon, Nov 23, 2026 at 08:49:00PM +0000, Fuad Tabba wrote:
> Hi Vincent,
> 
> On Tue, 17 Nov 2026 17:44:00 +0000, Vincent Donnefort
> <vdonnefort@google.com> wrote:
> [...]
> > diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> > index c55b6d442d0e..58ca7ffa68e3 100644
> > --- a/arch/arm64/kvm/pkvm.c
> > +++ b/arch/arm64/kvm/pkvm.c
> [...]
> > +static int __pkvm_pgtable_stage2_split(struct kvm_vcpu *vcpu, phys_addr_t ipa, u64 size)
> > +{
> [...]
> > +        ret = folio_add_pins(page_folio(pfn_to_page(mapping->pfn)), nr_pages);
> > +        if (ret)
> > +                goto unlock_mmu;
> > +
> > +        ret = kvm_call_hyp_nvhe(__pkvm_host_split_guest, gpa_to_gfn(ipa), size / PAGE_SIZE);
> > +        if (ret) {
> > +                for (int i = 0; i < nr_pages; i++)
> > +                        unpin_user_page(pfn_to_page(mapping->pfn + 1 + i));
> > +                goto unlock_mmu;
> > +        }
> 
> Could you use unpin_user_folio() here, to mirror folio_add_pins()?

Ack.

> 
> [...]
> > @@ -765,6 +890,23 @@ bool pkvm_force_reclaim_guest_page(phys_addr_t phys)
> >          return !ret || ret == -EAGAIN;
> >  }
> >
> > +static int pkvm_hyp_req_handle_split(struct kvm_vcpu *vcpu, u64 gfn, u64 nr_pages)
> > +{
> > +        phys_addr_t addr = ALIGN_DOWN(gfn << PAGE_SHIFT, PMD_SIZE);
> > +        phys_addr_t end = ALIGN((gfn + nr_pages) << PAGE_SHIFT, PMD_SIZE);
> > +
> > +        while (addr < end) {
> > +                int ret = __pkvm_pgtable_stage2_split(vcpu, addr, PMD_SIZE);
> 
> Could you drop nr_pages from the split request? Patch 22, the only place
> that raises it, passes 1, so this loop runs once.

Hum, it is just we have range everywhere now so it feels a bit weird of not
having one here. But then I agree this isn't a stable API.

-- 
Vincent


> 
> Cheers,
> /fuad

