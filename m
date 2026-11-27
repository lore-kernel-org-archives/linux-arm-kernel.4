Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BD2606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 09:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=D9Vyzew6;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=XmSqFQKA;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RwMThS8v
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WEiknYOGnWAiIBXTLUJNV1DE++CQc9r9ihlhMXP9mRs=; b=D9Vyzew6KqW5BZFZWn3spw9S1E
	IWGOOyJ1FyIBE/u+/GQnuaJglgvH4eepSs6jbg/vZGRPcjALxGEsb+tN6/zR5oJ7E3Y4R0503Aml8
	orsYrTej97G5IiW7vRRPLribPOpXKpC2GnRQ31LmLlE+dbOkQv9zo0q3X8XCYbu2J3G2i+uHtUkYD
	syNuv/gWTa5U/S9v6EUDTiR24VPonxe5CXEHbmRQw+T51TgGY9UsXh4J3gz1sEdg4mQGkgVi3+cO5
	K53DnsnEVrved0mbMA1W4Rbl23LCk0W6QrGiZ63lmJ1zhhrEYXGFUyqZugO801HvtQ83XL99ZX/U9
	AwgILkQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWs75-0000000FPTE-0NZv;
	Fri, 27 Nov 2026 09:19:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWs74-0000000FPSp-0mXz
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Nov 2026 09:19:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=WEiknYOGnWAiIBXTLUJNV1DE++CQc9r9ihlhMXP9mRs=; b=XmSqFQKAH6K9becmEhb+VK3c6r
	qvdu7VmXYqc8mJuQBXT+KkEi7HKz7Nlu2GVUKKX5UEyYihAr1XLGJkH2nAocxcVdHWVR1yPDEpJ4a
	DITBW72ohFrX2T9gI86eumYxovaMl+ajQeEe44iIUgzIsBdpzvZwIwB3qc/dCZMcv/CPvZIAFGSqP
	4Z+WBnsMSKVlddMMLo9YE12IzG+xG6441PWJtkC77vl69TTun4IRZ8WdHeCHA4ujeMn0CfljXyC1N
	24s5X1kjP5tCLdmR93tTFlO42KprpZfjjLXiczfMPJlbJa+dneMRk7PmhVsVg5DRFZHZfwlr5IFyn
	T/lC8SgA==;
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWs71-00000007VRL-2NzY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 09:19:25 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so63652075e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 01:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795771160; x=1796375960; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WEiknYOGnWAiIBXTLUJNV1DE++CQc9r9ihlhMXP9mRs=;
        b=RwMThS8v4FYvgmEr1BEZeyVrJBLqidO999crM+4q+cgTPSsCJqdgbRdEF6QqBOp+6i
         n9pBopvABT7wXb67ShuMIU7dQPM1TE5KcnEtGz2zzMwTeKppZjuH1E2R6fmY6LiWF+yJ
         dyMd1Jr2gM4mVDxGlosvXLWuEMNpL9cWc/iZIYNF2+Ms2S1qBWD5LV4RF9jFZJpKQ9/N
         k4MuLU4akgVHz4gkf+fvUXLtbZMhxJurjBCKnrfCcymX/FCR3TDsIKbEH8ClHNyu1L/9
         bcW5HRT7PjSpt8Vfe7a5UMBH0LfgJ/5/SoImecM7XDTLDNT1kN6/O6zKGS/AP/1cHqNV
         csUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795771160; x=1796375960;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WEiknYOGnWAiIBXTLUJNV1DE++CQc9r9ihlhMXP9mRs=;
        b=Z83GjYdBXB/ZQa08sV82N/lDSSKX6zVmwr06x3qeo2TXmAzkpLdCTZ1zRBYPrGuLOm
         4tx2WU9reCHfxIWF3TIgeUKlndCCdLgQgruJNfPL15sdU6M3fQtdpatMXwVYhqj2RMuB
         9aRffjSWw1AJQXlBiCOwuHznljvEldxfSzWvbytFNfgnN8qV0vNd+Zl71X4b6nOBy2+Z
         a9NGRekUghqwhFKMbXFcoNmKXrXBPwUSHOnCRr5WwWRltiAOJsYHo3OoiH6/Y/u5nXtv
         lMIF4KI5kp5nKWFJ7wijHGkE9xH+vYWXaHBL23N+lR51CEFjtLnIGvbYiGL7ELCA11Wk
         I6iQ==
X-Forwarded-Encrypted: i=1; AL+hErHz5fEmC68paGWlEkjJVphxAj59BOY0rP9SSw+ucxpu9ekqwInYcC5KmOlYvSOvjxb6qqM2WiB9Rhjkojl23z1Y@lists.infradead.org
X-Gm-Message-State: APuU4Z8bhIUwjSMdj2vWA/0YUyja1mw3LdaDLGvW486pN7sRhIroGxgE
	eIkx/qjUGhNGEYFYZO8Ive5QooJKRiyQHymxSlDaXciMEAqrF8fs1b+HRLWnOUaE2A==
X-Gm-Gg: AZFdTZcp/C+cL3YMq5D7bk+PUG9Akx0+aERU7D7Swy2DhXKl4Go3dIfmfRbyvemnkRo
	Ho8G0NMgPJNBuo5BdI2Mej1LstxzDdZpCCzcA5FS11z0MT/wSPbkqDjwdLheBxulsT9oWmePPxm
	RE4gjAbVqFJKB4iNnFUwHQSA9yDaLv2aCBCo59LlPZ2s26j6hxJTngl1qu1Mb1qysuBbVpu//6u
	T4J02eGxe/zcGImKMmXoZFmNJVEtbvGYUb0NIZs5HCR4rnV3J7RaRXSBxZarGBJUyTII8MjfdFo
	MW9O1Vz70yoZAD4b22933eOZ6unXcqh6mMKXCQkD/53NrIoWs4GzlHSEeBn7UVwlu3EAu4tEND4
	g9yogPzrpSkHjQjKNE05ekeGw3uDIBedhZIi5HH5OujRa6l9IMJ4vaQe8vxSvUsmQfMUSc6/Oam
	irkIhKQljQ+Uw/HGD6NMZYL7SX0GsqCRwByuHH3rOgGWHOHle4hYdUaSPnNDlKsONtkqTpm77kZ
	LP/KH2eM5Xg67LUEhR75c9Zr9+gA3MgZDlvizGz9wrIi1oUx1j6PUvmxOjIoDakdUe/MKKLFU/B
	c81wAZIKx3aTv/0JbxvjWONVHrkSLdc2nrHIJatsbjQyof6fQ1m82XojSMKO91yWZp4uP2E3QzQ
	vq7WO5DabwtTeJ8/BGSz5av14p8ewH8f02+9EzSaI+vU=
X-Received: by 2002:a05:600c:46d0:b0:4bb:7987:fbc4 with SMTP id 5b1f17b1804b1-4bb88817eb2mr492863995e9.19.1795771159362;
        Fri, 27 Nov 2026 01:19:19 -0800 (PST)
Received: from google.com (0.182.34.34.bc.googleusercontent.com. [34.34.182.0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b2c5sm661484675e9.5.2026.11.27.01.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:19:18 -0800 (PST)
Date: Fri, 27 Nov 2026 09:19:15 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com,
	qperret@google.com, weilin.chang@arm.com
Subject: Re: [PATCH v4 21/23] KVM: arm64: Add PKVM_HYP_REQ_SPLIT
Message-ID: <awlLEwegiWQZLeay@google.com>
References: <20261117174403.58762-1-vdonnefort@google.com>
 <20261117174403.58762-22-vdonnefort@google.com>
 <CA+EHjTzZkAf8+BGNH15TKCEYUyO=VFvGSeJg5hfaFoefNOTVpg@mail.gmail.com>
 <awiQzMZxQDEHrRf4@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awiQzMZxQDEHrRf4@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_091923_575625_88216E6A 
X-CRM114-Status: GOOD (  22.23  )
X-Spam-Score: -15.7 (---------------)
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

On Thu, Nov 26, 2026 at 08:04:28PM +0000, Vincent Donnefort wrote:
> On Mon, Nov 23, 2026 at 08:49:00PM +0000, Fuad Tabba wrote:
> > Hi Vincent,
> > 
> > On Tue, 17 Nov 2026 17:44:00 +0000, Vincent Donnefort
> > <vdonnefort@google.com> wrote:
> > [...]
> > > diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> > > index c55b6d442d0e..58ca7ffa68e3 100644
> > > --- a/arch/arm64/kvm/pkvm.c
> > > +++ b/arch/arm64/kvm/pkvm.c
> > [...]
> > > +static int __pkvm_pgtable_stage2_split(struct kvm_vcpu *vcpu, phys_addr_t ipa, u64 size)
> > > +{
> > [...]
> > > +        ret = folio_add_pins(page_folio(pfn_to_page(mapping->pfn)), nr_pages);
> > > +        if (ret)
> > > +                goto unlock_mmu;
> > > +
> > > +        ret = kvm_call_hyp_nvhe(__pkvm_host_split_guest, gpa_to_gfn(ipa), size / PAGE_SIZE);
> > > +        if (ret) {
> > > +                for (int i = 0; i < nr_pages; i++)
> > > +                        unpin_user_page(pfn_to_page(mapping->pfn + 1 + i));
> > > +                goto unlock_mmu;
> > > +        }
> > 
> > Could you use unpin_user_folio() here, to mirror folio_add_pins()?
> 
> Ack.
> 
> > 
> > [...]
> > > @@ -765,6 +890,23 @@ bool pkvm_force_reclaim_guest_page(phys_addr_t phys)
> > >          return !ret || ret == -EAGAIN;
> > >  }
> > >
> > > +static int pkvm_hyp_req_handle_split(struct kvm_vcpu *vcpu, u64 gfn, u64 nr_pages)
> > > +{
> > > +        phys_addr_t addr = ALIGN_DOWN(gfn << PAGE_SHIFT, PMD_SIZE);
> > > +        phys_addr_t end = ALIGN((gfn + nr_pages) << PAGE_SHIFT, PMD_SIZE);
> > > +
> > > +        while (addr < end) {
> > > +                int ret = __pkvm_pgtable_stage2_split(vcpu, addr, PMD_SIZE);
> > 
> > Could you drop nr_pages from the split request? Patch 22, the only place
> > that raises it, passes 1, so this loop runs once.
> 
> Hum, it is just we have range everywhere now so it feels a bit weird of not
> having one here. But then I agree this isn't a stable API.
> 
> -- 
> Vincent

Looking at the existing kvm_pgtable_stage2_split() interface, I see it does take
a size as a parameter and so does its caller. So I wonder if it isn't better to
align everything and to keep that nr_pages argument.

However, setting nr_page=1 is indeed a bit weird. I believe the hypervisor
should just emit a PMD-aligned request. I can also drop the loop iterating over
nr_pages.

> 
> 
> > 
> > Cheers,
> > /fuad

-- 
Vincent

