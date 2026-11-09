Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290F5606D824
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 10:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FFpcjnpv;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aa2hb7NS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9ORalyFXe7qdK/R0lBn9ynib3IYyaexwVRCwyl06+yA=; b=FFpcjnpviZBGMKNeJjDdzZh7++
	1ErYfukgsE2IKW0ffJLD91DZEwlIFnUseiJvJB8XEIWmQgLtKDEhzN+V82LgN4CrCPEmFMlsHr2Li
	Rz0HFutBbCahy6aNfd98Gh5TYCENVlHk3IX0LTprfB23XmRNi541B1UZbYMI5kaD1kzOZiXzldu7T
	4RPOxXrP6ObLeUOW0Qd630XgXQ+AL/1kQ+yWko937wjnzwGUcMGMzU/VPpIAWR+ES1aVtoxp7GH2d
	Ugt/ltUhryZdy9lMX5IhWnH1d6+TdZJGMnZmCfx6DJu5/UGbIDaAiiGWsjZ6faknAnMoiDBh0z6Yv
	mLxXwArg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQN2z-00000000TFc-20gV;
	Mon, 09 Nov 2026 10:56:21 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQN2w-00000000TEn-3ozT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 10:56:20 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4b6266b5bc4so22245e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 02:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794221777; x=1794826577; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9ORalyFXe7qdK/R0lBn9ynib3IYyaexwVRCwyl06+yA=;
        b=aa2hb7NSFk7STclPnUHChlePtQ1cgP/Tko0jDVuoyZWjNlVuvalSjhmoPqVBYfYfeI
         y6Imrz22kBL0dFuo8ioVferSBBDHLv6HV7npzo6kGkpDsAihfgCl4phc2tl7k1JHwCVQ
         WthPJDHNxHiZAXxNz53pW1oQzxAiRUdf4N1rNR32Ao1G2oTXeq8AtDY/efh9QLNsTFuM
         eH0DN+3CkHb8EHM5Y1TLoDTDyG505htg7TQv9ysGC45uhvLWdoLTMI5j1U0qiPsdbbj4
         LHKVh6FejTDpPDkbSiR0fRUHPN7USSMu4fFXSrngr0ce+iBXlulqNEIa5k92RCVRH5RJ
         IiqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794221777; x=1794826577;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ORalyFXe7qdK/R0lBn9ynib3IYyaexwVRCwyl06+yA=;
        b=ZqT8wOT+fNWje3mS/nplg3GTHazFpKQq51B9v7EyTI62ZMBi7tiQJ4u/OXTO3+UNFA
         Gu2sw+mdO70ecbn+xWES2cDpK36koxtvibsifJzK8XHgAihJwlXK+m83rZoZSnnTmCDD
         d580Ogl5A6qlSEYxVAbpOOnJKIZ3qaPjQhmBCZYGbM2p9F6OWxKczJCguknQR61Vsr3Z
         3QeHq1kuV1AHzlT4iETRsZOv1KQBpJ89vOZzC7jgecMPdQSRFHs9WHXsLq8U+/sYVMw5
         HCDiNghHyI+B60RI6LqqDQhg4dC9yljdTfcZDdYZI/NDJk10xFR6aBc22AvhB3YvCpJW
         bo9A==
X-Gm-Message-State: APuU4Z+9XeORCmzcbJygYpKbJne3kNrckvERJMFHJUJQKLMyreYSPisR
	Lef6VRSOgxTSJjysd+GkhDHmOdxg0BajT7w3q7pVlbrrqyoSEZywYdaGM7EqlaF6HA==
X-Gm-Gg: AYBFou2pWDA/RAgFSK09M3Pa9g1HLRR6uEGLyoJerrS4OJXjk4x51PCiW8LfCrH81ok
	gegsKOVw2ykyTktxgmY9gb3OItfIEWtVvV72rSsHSS1xb4C/pvRdRo7W0NL1NyXd3uD69HctWMj
	qtgaN2oiqcjnaSfD8hFZwTRc2uk1tTkvmBQVvrk2lRDJicyvMX7Tas6JrcdmhCycIGY4+OXfsY5
	o/4KB7OiH8BYDuzGv9m+m5zkb3r5dBpwF+v6FSOEBxoGlPNQLHAUp9scTAZ7nsDItWmSUBoo82S
	NKjP+0p9jQFJYCAkaXE20/Rf8ZdqfNkXkrln8tU40sUqfPrJqtpZSM/+1M3ScdlRYfEV8Vxy3kX
	OaTCdDE16kaMohWaemrsjsX3BOxKj94BzTZxFZQJ/rJt2ZORGcqCWzvjM3wJYa1GlTH0cxbkm5n
	lDiuxiiJClfCZD8AhY/g0ztMBMTYBqmgNQxyPR3dYFNBopP0sH3AOpdXIUDotA8R4W2/Tw9tj80
	JEkpVSLugoexRX54KbEXXDeMMM4YQmjCATdFWccR8WSDSTPcRdn7Npndynj6Wh8F6c6cB+vwdLM
	s8gD1bQ1xnw4PxX5VuqQKJ9/5hR0xGp0QYVH/RdnwIp98z2St/EzM3W8oTR3FnSK9O6sGA==
X-Received: by 2002:a05:600c:492f:b0:4a1:e384:5e12 with SMTP id 5b1f17b1804b1-4b8b04d4155mr845705e9.7.1794221775967;
        Mon, 09 Nov 2026 02:56:15 -0800 (PST)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7da62edb4sm270902255e9.1.2026.11.09.02.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:56:14 -0800 (PST)
Date: Mon, 9 Nov 2026 10:56:10 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com
Subject: Re: [PATCH v9 13/25] iommu/arm-smmu-v3-kvm: Add MMIO emulation
Message-ID: <avGmyuYdheMJdLik@google.com>
References: <20261015200903.2735565-1-smostafa@google.com>
 <20261015200903.2735565-14-smostafa@google.com>
 <au0LlPl2xwJvtfCu@nvidia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <au0LlPl2xwJvtfCu@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_025618_993657_0F9A61ED 
X-CRM114-Status: GOOD (  20.32  )
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
X-Spam-Status: No, score=-13.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 03:04:52PM -0800, Nicolin Chen wrote:
> On Thu, Oct 15, 2026 at 08:08:44PM +0000, Mostafa Saleh wrote:
> > +static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
> > +			     struct user_pt_regs *regs,
> > +			     u64 esr, u32 off)
> > +{
> > +	bool is_write = esr & ESR_ELx_WNR;
> > +	unsigned int len = BIT((esr & ESR_ELx_SAS) >> ESR_ELx_SAS_SHIFT);
> > +	int rd = (esr & ESR_ELx_SRT_MASK) >> ESR_ELx_SRT_SHIFT;
> > +	const u64 read_write = -1ULL;
> > +	const u64 no_access = 0;
> > +	u64 mask = no_access;
> > +	const u64 read_only = is_write ? no_access : read_write;
> > +	bool is_xzr = (rd == 31);
> > +	u64 val = is_xzr ? 0 : regs->regs[rd];
> > +
> > +	switch (off) {
> > +	case ARM_SMMU_IDR0:
> > +		if (len != sizeof(u32))
> > +			break;
> 
> Maybe add a small helper to list all 64-bit registers:
> 
> static unsigned int smmu_reg_width(u32 off)
> {
>         switch (off) {
>         case ARM_SMMU_CMDQ_BASE:
>         case ARM_SMMU_STRTAB_BASE:
>         case ARM_SMMU_EVTQ_BASE:
>         case ARM_SMMU_PRIQ_BASE:
>         case ARM_SMMU_EVTQ_IRQ_CFG0:
>         case ARM_SMMU_PRIQ_IRQ_CFG0:
>         case ARM_SMMU_GERROR_IRQ_CFG0:
>                 return sizeof(u64);
>         default:
>                 return sizeof(u32);
>         }
> }
> 
> Then it'd be tighter by testing the width once, prior to switch (off)?

Makes sense, I will try that.

> 
> > +	/* Allowed RO 32 bit registers. */
> > +	case ARM_SMMU_IIDR:
> > +	case ARM_SMMU_IDR5:
> > +	case ARM_SMMU_IDR3:
> > +	case ARM_SMMU_IDR1:
> > +	case ARM_SMMU_IRQ_CTRLACK:
> > +	case ARM_SMMU_GERROR:
> > +		if (len != sizeof(u32))
> > +			break;
> > +		mask = read_only;
> > +		break;
> > +	}
> > +
> > +	if (WARN_ON(!mask))
> > +		goto out_ret;
> 
> Your cover letter mentions "WARNs are fatal in the hypervisor".
> 
> Is this WARN_ON fatal?

Yes. This is reached if the host does something not emulated:
1) A bug (writing to a RO register, writing STRTAB if SMMU is
   enabled...)
2) New arch feature not supported.

In that case, I'd rather panic here and fix the driver instead of
ignoring it which will manifest in a harder to debug symptoms later.

Also, this driver only handles the Linux host kernel (which must
be built-in in this config) so we can assume how the emulated driver
works and what features it use.

Thanks,
Mostafa

> 
> Nicolin

