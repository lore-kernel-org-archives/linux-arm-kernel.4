Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F0B606A322
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 11:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iWKtVd0h;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WyIK05Z8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NTI6bfaVgGVs6WfACz4lcJC4XYY+Jhtgi4CMSA27Peo=; b=iWKtVd0heXKuC0uQ4gp/yVKMnM
	kibAODtkK/J1M7XiLPdYxgIpeWqj7l0/hbXzVYamagakbpW+2gua2batBceQcFkCHKEGb7bkglIEU
	wND2lcQzqJifdhwrxcyjsXn77yGuOIPy+HhHj3NvLJ7KvJtdbDQAApa2cgEwtZzZE6nR1NvF4CDdO
	IbK3AKJjLmsVAtzbNOX1pvEhI3Jl38d3kHO6j1XfCHn936Ngv/oj95p6UDbgsF1apgm6s1oDQsAgJ
	hAkaypBmBLkVGv7RWUyRYkjaT3hWjb3oD9SwVAQ7xRUkbzUrvq1V9qN6G6czjuv+yBQmKZmN2ofoD
	QcbTuXlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQNr8-00000000ZjG-2XqF;
	Mon, 09 Nov 2026 11:48:10 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQNr6-00000000ZiW-26Yj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 11:48:09 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a018493d57so25375e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 03:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794224886; x=1794829686; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NTI6bfaVgGVs6WfACz4lcJC4XYY+Jhtgi4CMSA27Peo=;
        b=WyIK05Z8QnSyU1qcSiYeciMnn33ADc/9r3HZqnou9OXWURSAV5t7cy0zo3RP7jDpyb
         xJJ9V57jw4zua3SyWiu/sqEoXg6s7RzWB6+30YgZ18Vh0VKHypz8mM9I8mB2ngLq8i/O
         nh3krlQ0QsZ4eGWo97I+mG12CbPd+Xih0142R/JUN27gwO1u+9J6D3664ZTT6/ht6cq3
         TOzChlR8lD4j/ekHo46Oh4nqdGtyjXK8Yk6cTqDzNe7EdEte9hYzqEVxUq4KeBtuI610
         bvrBb4EOpr71czqNT0fq8PcCCLsSD+9CVQTb7kHfQ5XXjYPKCUNGq+ZEuhW/W93Lmgnt
         t9ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794224886; x=1794829686;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NTI6bfaVgGVs6WfACz4lcJC4XYY+Jhtgi4CMSA27Peo=;
        b=mFd8FmCBAmzLEu2jzDKcmUHFqSOP3U4Yo/ZNi9Twf4mkVmz1etK/4bmvykXqdv5p5v
         GN/cCrihFTWTqp8E39CPOY9BbiFgLMtAKxD2QriN7ZXfGc1+3svlz6iWQM5FszNGqgUl
         6SlPrK/0gGuMRuiiPFXMx8bbs1BjY9xITPJtC9JIMdEaEIQSqqLvvLzV7PHw7cs+2jQ9
         MAfbDL+04dF3LKnN6mx83gjP7TWvhZJUHYrNyS/aAE18cmUgLdTzIHgdB85L3sA0Vgs3
         kUwRPGGqBbMye0QHVgDZtdwvumAAjj77iqdfuD3zrBo36PQKbSQ7Uq9e/mIm31xEnWyL
         orzg==
X-Gm-Message-State: APuU4Z9tpCuZzTii1M4Y2yNJ/L/PeN4XvOhYAW6CW6ZuLkM6X1zPBuNA
	04EX11K7UFU4Vev6nLYBfUqRQdFwx4z2fVw3/34x9YwT1cZPLJq1FBO0WPRz8iQJbw==
X-Gm-Gg: AYBFou29EMQdPx+UalC982V4vGahuCVDbx2vwjYFpSb05cZ4tgOUcVcO0iT2Sk50BvJ
	i+P59NAt3muDH9JVFo0Jw49jaXmpwpgnRakb7IIlcxITQF6zpSTmru25JtoPP1sV+2QxFZTnLJ2
	cJdfGABCLUyq4fweOKZ5pXEuOFgi3jVhKtt2yMiKU81uCe2CzcMYaD4Elw4k53h0ekY9LtEG8Pd
	Sx+VLPTms9WgXnTL9OwnA/qBbKBKFFF6lqeA9kGnJoxz9SeHZHOs5yUf2Nk90GfXEIEO8YfeGZb
	nmRJWS4MTGkJAxsJTqSbusPLxRNglAiL9fAAAKe5wLZpJ+jfZDTQLfjNPKpNZ/lKQdE2AOR0Hpb
	pezNQ5a2fcml3ZGzTCC3B4IT/k2XadJANWoHTscBsgzrB3b2nkt2sctQm/m43G1LRl9BSkIOqKe
	Y23jTE/bzt/M59hIy1COOPcn+4wgWoPjHiMKXMeio0m83Fx7M4ttznCEAgzGl5CGx+BhBagMvjV
	ZBU95ohl1t47olERM09NFdFJO8CQfKM58Muc8KkrLMSWFVJv+dETZ8s/UroPSNRD91nnkqX36D+
	hb0Z29/VsDrtpC3g0guJTSalsIpM2ZjAkHba574tANGWFjlfaU6e3pTBzl8dg2ueBqBwhw==
X-Received: by 2002:a05:600c:528f:b0:4b6:5035:d54a with SMTP id 5b1f17b1804b1-4b8aec15d44mr2258615e9.1.1794224885385;
        Mon, 09 Nov 2026 03:48:05 -0800 (PST)
Received: from google.com (160.193.189.35.bc.googleusercontent.com. [35.189.193.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49596f9a9ffsm9878242f8f.30.2026.11.09.03.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 03:48:04 -0800 (PST)
Date: Mon, 9 Nov 2026 11:47:58 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com
Subject: Re: [PATCH v9 16/25] iommu/arm-smmu-v3-kvm: Emulate CMDQ for host
Message-ID: <avGy7mS5A0SGib0m@google.com>
References: <20261015200903.2735565-1-smostafa@google.com>
 <20261015200903.2735565-17-smostafa@google.com>
 <au4lp8sAnWm3/Sw5@nvidia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <au4lp8sAnWm3/Sw5@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_034808_602003_98BD4753 
X-CRM114-Status: GOOD (  19.75  )
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

On Fri, Nov 06, 2026 at 11:08:23AM -0800, Nicolin Chen wrote:
> On Thu, Oct 15, 2026 at 08:08:47PM +0000, Mostafa Saleh wrote:
> > @@ -385,18 +482,51 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
> >  		 */
> >  		mask = read_only & ~(IDR0_S2P | IDR0_VMID16 | IDR0_MSI | IDR0_HYP | IDR0_ATS);
> >  		break;
> > -	/* Passthrough the register access for bisectability, handled later */
> >  	case ARM_SMMU_CMDQ_BASE:
> > +		/*
> > +		 * Although allowed to use smaller size, we rely on the SMMUv3 driver
> > +		 * using 64-bit store instruction for simplicity.
> > +		 */
> > +		if (len != sizeof(u64))
> > +			break;
> >  		if (is_write) {
> >  			/* Not allowed by the architecture */
> >  			if (is_cmdq_enabled(smmu))
> 
> The spec says the register is RO when CMDQEN=0. So, maybe it should
> be allowed by just ignoring the write?
> 

Yes, that's possible, I am slightly inclined to be more strict here,
as this should never happen and if the kernel is buggy or malicous
it is better to catch the point it goes wrong rather than trying to
debug the side effects of ignoring the write as most likely it will
go wrong shortly after (timeouts or commands are ignored causing TLB
corruption...).

An alternative would be to ignore it and log something, at the moment
tracing is supported in EL2, and IIRC, logging to dmesg is also planned.

Thanks,
Mostafa

> >  	case ARM_SMMU_CMDQ_CONS:
> > +		if (len != sizeof(u32))
> > +			break;
> > +		if (is_write) {
> > +			if (WARN_ON(is_cmdq_enabled(smmu)))
> > +				break;
> 
> Ditto
> 
> Nicolin

