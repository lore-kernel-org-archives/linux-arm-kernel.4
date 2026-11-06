Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C75606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 18:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OpxcyZfU;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GBY2bh5Z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6WEB/QmqGNShWN2WfpdxFDs5dt086xZeyrUN/pg7o0I=; b=OpxcyZfU0ZGbNpQdlR7sdIwjbr
	PDEwZZ6vnzCyxPq+8goWW/UST1/sfltQEWt1ORub2GoaYcaCedyHpGSJQy7GBWMfow8Rt5LDabJOa
	wMWTYn+EuP3O4no1ts40inYcBjSBFedZij4a3nRQIhPWqmww2EVLwL4HH6NfxYOg1kJuAt+m8aV6P
	D7DrmYY+H3kKxTHS+asO06TQVbXxOqssMLrzRq8E+VMoggj7y5cbCFnjA2QDkuUpPZ9tLmQsBDzVb
	0LTFtLdF2AsqvOzonHrwnq3FdPBmRNLuc/41QXMwFaJFsEMuOvJ2srtropcYxf47jByHNn7jFP3dj
	7REO2ikQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPO6T-0000000DJ01-3Qot;
	Fri, 06 Nov 2026 17:51:53 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPO6R-0000000DIza-1wsW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 17:51:52 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a215e64962so10758795e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 09:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793987509; x=1794592309; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6WEB/QmqGNShWN2WfpdxFDs5dt086xZeyrUN/pg7o0I=;
        b=GBY2bh5Z/00hQnaVQ+WKNs0mkH521PoyOnd3b291F3+wXfzBZtpFIbeuwuWyb5L5mT
         03jX9j0bKOSOnt1P9GlM77kYSvdfDTnLo0x44laMPr1nMphgeIAQT7qoeUDJtmZezdUM
         yBvlL5+plAhW+bsxf3EW//TD33mwrOkCHRAYF3CTJCghabE532SHMIRPgVWX32zZZxur
         g0Uo8W4/aCFQjvZh/vJpVRdZKGUEIsUUiGEPAqdcFFAv/SBPUL60zDAZCXwq/mgLdcU6
         fka+8dkN6pmj3TBFXBknPS0QhdC4izpegf0Rh4vERBFRbLNgM8fJPQNR2d3v7HXDEZSq
         rg6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793987509; x=1794592309;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6WEB/QmqGNShWN2WfpdxFDs5dt086xZeyrUN/pg7o0I=;
        b=10cWXBBSjGP+sdP5dTqxWYwHrcdrq2JyqQMC5Siy4clxqpfbeZcjXUHYcnqwKX0GwM
         GPYEgT2cIbb9MkqSnJ3C5dHL6DnpTA/CSP7XMjBuy6jPF9BBEK9eZuf+94X3z99gaDmS
         v1Wck7uASStqVi5ec1qtILlSVNeMe4xEUhbxp305fwl3Nu/ZjfuvipTd2kfr0dTm99AR
         H4lyiK7aWfUUA48TEXOWNuwbDkhH6p8eq4sILOHcxVVTs6qWx9ZRJyv6exlJUcmy0jv0
         Ve9euj6QWu10emP/a3NgF/5UVYHSY8wbFmrkcEgglFtMFKARPkxr2dPAqDAAQGqb/R92
         1MDQ==
X-Forwarded-Encrypted: i=1; AKwUvBzhyAPdkN1VyYjBbLtoeXI8SlM9gGYxixHxQhxGVMRDFMiq/jMMaQXlQreCznXg4XGumumRajDCUNLJCaMpE7Si@lists.infradead.org
X-Gm-Message-State: APuU4Z+PPdzRBOK3hfpzys85Na0Uwg25OIZzNTOdZbSnONNfvYbDYzY5
	gI0DDdpSSnBK8XBNDu6k+QYq/VNOe2kFYcAeWOlbsrTuG1Quj4nZ51wNLw/WKC6msw==
X-Gm-Gg: AYBFou20ZRx+fZUH/fNVxKP5Na7lcvEB1ao/abBtc9f9/lW3lw+u3DJTMOqOhA/Cm9/
	yC3Ywtkas6a9q9EHjhLjfOr5y7/c6D6dgJBIki1q2W62SyvDFbDkHO6P1qFqRLGx5YRvYD6/57e
	mBY+kTHEb7l8etRs/ojR8eIddn4g4lPlkDrLROR3VDKABvLiMvew4mDfLzwBzgDAM+VJhPnrff0
	/N1Ojv0eggk4926LZFZAIvsmTJ/+SFZWdpOjj1iMokAuBkqqKnpm37lQ5h1YNOC0GIGkM6sVj/v
	DyFQ5fXE8wCS81ssQJtbgOqLwknSZvTHzQqZUD3k/sbl7odDYhSl2n9nnvDEkN8D1cvN6ZEoXIm
	/2CLX3k1nwitf2Xc9JlDoWiln9oCV5ZCFi8qod6ZlKLY3f0syv3oY3KYGDFM0VAeMJhV8ybAIAl
	SWydhsqOzOY5bvWlGkjJrvEzEUtxfNS2cuPjqZgoFXZUVfZm4m/eVJBdR7QBXjBmjtPoV1SwMb+
	HvdreqJk9kF5vgsrk6m2A02Qrni6XccOr8lnMtfmiEhbSS4pIoCjr46guRn4z9+gHy/0ajn7dRN
	1YwyJpJ0i/M6v3U1fZZ0yd0adW+oS098OnBEqh5y7PpIvSFZOLySgRfv/90AU8WDiD/rTcR6msl
	nD5kkqDyR5g==
X-Received: by 2002:a05:600c:620c:b0:4a1:813f:2a60 with SMTP id 5b1f17b1804b1-4b6dea6881fmr58086205e9.11.1793987509034;
        Fri, 06 Nov 2026 09:51:49 -0800 (PST)
Received: from google.com (0.182.34.34.bc.googleusercontent.com. [34.34.182.0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b76cbd082dsm7811725e9.1.2026.11.06.09.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:51:48 -0800 (PST)
Date: Fri, 6 Nov 2026 17:51:44 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <tabba@google.com>, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] KVM: arm64: Allocate a protected vCPU's SVE state at
 EL2
Message-ID: <au4TsO50x7BcFYpi@google.com>
References: <20261105130456.1617185-1-fuad.tabba@linux.dev>
 <20261105130456.1617185-3-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105130456.1617185-3-fuad.tabba@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_095151_522818_04F508DC 
X-CRM114-Status: GOOD (  14.40  )
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

> @@ -1243,6 +1253,9 @@ int pkvm_reset_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
>  			    PSCI_0_2_AFFINITY_LEVEL_ON) != PSCI_0_2_AFFINITY_LEVEL_ON_PENDING)
>  		return -ECANCELED;
>  
> +	if (vcpu_has_sve(&hyp_vcpu->vcpu))
> +		memset(hyp_vcpu->vcpu.arch.sve_state, 0, vcpu_sve_state_size(&hyp_vcpu->vcpu));
> +

Why wasn't this line around before?

>  	kvm_reset_vcpu_core(&hyp_vcpu->vcpu);
>  	kvm_reset_pvm_sys_regs(&hyp_vcpu->vcpu);
>  
> diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> index 32e82653ebf7e..06ea91415ad8b 100644
> --- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> +++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> @@ -570,6 +570,7 @@ static const struct sys_reg_desc_reset pvm_sys_reg_reset_vals[] = {
>  	RESET_UNKNOWN(MAIR_EL1),
>  	RESET_ZERO(AMAIR_EL1),
>  	RESET_ZERO(MDSCR_EL1),
> +	RESET_ZERO(ZCR_EL1),
>  	RESET_ZERO(CNTV_CTL_EL0),
>  	RESET_UNKNOWN(TTBR0_EL1),
>  	RESET_UNKNOWN(TTBR1_EL1),
> diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
> index 10eb7249aa9e8..aaaa1b8634ba4 100644
> --- a/arch/arm64/kvm/reset.c
> +++ b/arch/arm64/kvm/reset.c
> @@ -52,6 +52,8 @@ int __init kvm_arm_init_sve(void)
>  		if (WARN_ON(kvm_sve_max_vl > VL_ARCH_MAX))
>  			kvm_sve_max_vl = VL_ARCH_MAX;
>  
> +		kvm_nvhe_sym(kvm_sve_max_vl) = kvm_sve_max_vl;
> +
>  		/*
>  		 * Don't even try to make use of vector lengths that
>  		 * aren't available on all CPUs, for now:
> -- 
> 2.47.3
> 

-- 
Vincent

