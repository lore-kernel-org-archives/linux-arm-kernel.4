Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636ED606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 10:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cit86VFZ;
	dkim=pass (2048-bit key) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=QiCnoxSi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8DddB4BOu0Fwu4SIijc7HO6ywtYEmx0fPwUuOrXpjQw=; b=cit86VFZxs5DtHLykrxR2Uwkec
	mjnr1LoIQgmgqE0G5EG6JLHyb0TuiRyvXB6FlmoSkD7VOPp62sXWTBKLkeqL1HkbGRPEiOcuYOVxw
	ZpDlbzI1+g0ZfB4h/oQzNfsPpEexsm8q2IOvp4hFe2fOm8qa0wO09Je0c3yVVnsc4InvKhNtKFDba
	QNGMmfSRytAKofYUpIDtLD2yTpfKAt1fJe36PuAMOrSr0nmL/yWFFwBQ01OVSP4t3+eSJ5SMqdUvr
	tuMKYZqtNwxEAbkI9CVCKVOsa/2G5nLux/1Zm6BjtgPRL5UFjBk5OGU5G218T7q013XAPVs0zCt/P
	UOE+2eHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTd6f-00000008b0P-1JMM;
	Wed, 18 Nov 2026 10:41:37 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTd6V-00000008avF-3X5V
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 10:41:29 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-490d59c3edaso457396f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 02:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1794998486; x=1795603286; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8DddB4BOu0Fwu4SIijc7HO6ywtYEmx0fPwUuOrXpjQw=;
        b=QiCnoxSiXpYg8YhM8KmcjHgzA/Pr48RHaawmc14g+cPJanfdnPPahcXULWdGC9AHWO
         k1X2mopEyKtWfiHE760I12C/qeX3LgtA4ERUjS4Th/fzib5htnnzw/2u8Lmw/x6YfOVD
         WiEqw+ZOInnNf1RSmqjuG/9ICw0EWGJHCK3b9jwS01xGVAaAxJsJQHDu8RPP10q5rKT1
         50jIRsrn28wD3w5PaQGIwY4K8Zel8OKn74Qtrw1oX4HMMX1DmbJ4MT+AazlvE6wOP4MT
         KQd6LDhYy+aOPrbWhJ4MrE+y4550NiaZ/RRbE7d0NGPk9BmTlJc6O3zdyOvrU42LYo7l
         3lnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794998486; x=1795603286;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8DddB4BOu0Fwu4SIijc7HO6ywtYEmx0fPwUuOrXpjQw=;
        b=rquFLaL1koQj9hOBEBePsV9ASgKiWBUjV0Wx0Y9wzuoSfq40hnwamGPt9S8UR8yzwh
         ooq9hF1CX5IoB4xhPp7UP1gJblZk3l0ceN1R6Zg049psy9Db6KC7CYMLYBbBrRJWPkXA
         SYL1DBCzFbi9pvYhMp+V57US85NqFnEfPpN8bS803nvR9XhYkStbaZkAdYftd+EvV6YA
         kSXX029M3mhSZNQx5dudduxj8l2ETa6K2mPdzqoNBh95IzGQemEPah5O/u1zee6NLnKk
         fXTviLIY4I3Gmf37GdTogwMyRhGiWElLhr23lf4DEqzpZeE1y6Ubt2IchC2A/kleImqO
         3ZAg==
X-Forwarded-Encrypted: i=1; AL+hErFXjB/95+gVKUBWUCVxlqtZ0RKnpkdXYb7IQiaPowu0NyKlSVK1DbgPPUElJkF2sGcphnxHjQxughN5MHFN80ws@lists.infradead.org
X-Gm-Message-State: APuU4Z/dCCwsMyzVx3rIRrIdb6fEnig3GWBeRVCx/zVrqkGpMn5dHg4R
	N+rCuvQP+30QktpCM999BmBEs7OGRtXb52vm4CwYZ9RddPXq6cq5cw8GMtOu9bEFOAc=
X-Gm-Gg: AZFdTZdwb3gtcncn2+6Ju4JNplJeSbAAJELRHpT5t4Ri0ywymq/BUKHFojjBK2VcPSv
	P4m3KslQwMG0dnd/X6X4/Ax9lxa29AN/vVF5FJoT37E91SpX67NVoP8xKq4P9cK+FQY6zG6Rs/A
	1zGwYALcyQHE3EYPGzM5OpjmoCMwGPlpzazZQZP1Wdc/zJ6W1egDR1p30kIPvPIwQ7mai/xpL9r
	UxgosGkql1LoukiaMcdO+Dpl8ib4qzfOVeA2Uhm8z+NEENNgHYJYpPJyvucDs6/Lcn5ivvKgIzo
	ol/2ZC48HdaXpdL/Dom7w5rXrBOlZHJ7FmoD3sshsQ0lSdhG1iogk0eQIsk6jVnHccftnlob+lH
	HVY9ShM0JR3tYf9tX9ID2CVYcScEdhUndyMqEnHLM0MlurXp+29plvn34f2eiNyR2DHXBy9xhDC
	L07oR03trTi82yBvBXu3zd60rXl9ngDwUFKR+ui7GQW9pwGuSXauouxodoYO8j9L1CG2NsL6O8F
	Ypb4Zn7cSD6ajLS9JozKNaeftwDM0CtuUNbpq6F37AONnlSguNmP+Bcdk7HE3/fPa+DA/ICssnI
	m2VoKSWHOC5iDLwKdUxpS9lBu72cTekf/zUWtcMM
X-Received: by 2002:a05:6000:2489:b0:495:b427:1e6f with SMTP id ffacd0b85a97d-4a62d6d71ebmr4953529f8f.0.1794998485425;
        Wed, 18 Nov 2026 02:41:25 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a6573baa9fsm4323892f8f.57.2026.11.18.02.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:41:24 -0800 (PST)
Date: Wed, 18 Nov 2026 13:41:20 +0300
From: Dan Carpenter <dan@pereq.eu>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Karthik Bhargavan <karthik@pereq.eu>,
	=?iso-8859-1?Q?Cl=E9ment?= Blaudeau <clement@cryspen.com>
Subject: Re: [PATCH] KVM: arm64: nv: Fix NULL dereference in
 kvm_inject_nested()
Message-ID: <av2A0FxSab9P3eMW@stanley.mountain>
References: <avsH0lxpLIF2Ug64@stanley.mountain>
 <86h5hg1wak.wl-maz@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86h5hg1wak.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_024128_255924_39D0783C 
X-CRM114-Status: GOOD (  18.47  )
X-Spam-Score: -1.8 (-)
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

On Mon, Nov 16, 2026 at 06:11:15PM +0000, Marc Zyngier wrote:
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 5959bbbfa026f..21cd872ea394b 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -2007,7 +2007,7 @@ static int kvm_arm_vcpu_get_events(struct kvm_vcpu *vcpu,
>  static int kvm_arm_vcpu_set_events(struct kvm_vcpu *vcpu,
>  				   struct kvm_vcpu_events *events)
>  {
> -	int i;
> +	int i, ret;
>  
>  	/* check whether the reserved field is zero */
>  	for (i = 0; i < ARRAY_SIZE(events->reserved); i++)
> @@ -2019,7 +2019,11 @@ static int kvm_arm_vcpu_set_events(struct kvm_vcpu *vcpu,
>  		if (events->exception.pad[i])
>  			return -EINVAL;
>  
> -	return __kvm_arm_vcpu_set_events(vcpu, events);
> +	vcpu_load(vcpu);
> +	ret = __kvm_arm_vcpu_set_events(vcpu, events);
> +	vcpu_put(vcpu);
> +
> +	return ret;
>  }
>  
>  /*
> 
> and be done with it, avoiding the fast-path bloating altogether.
> Unless you can spot another path where the vcpu is not loaded, but
> still requires the injection of an exception?

I feel like this approach brings arm64 slightly more in line with
x86 so I like it.  I'll send that.

I'm still redoing the TCR2 changes so I won't send those today.

regards,
dan carpenter


