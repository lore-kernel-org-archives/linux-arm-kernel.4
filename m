Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF41606A329
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 17:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uJko44RU;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SoSvYWtr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QgfTA5a+5MMLBq/A4jGpp86Ey0W49QUd8AMooz78Jz8=; b=uJko44RUh2pmKNpyeBwYu+gSNZ
	+CoDHA+UXA0tfL8BiLW8c7ZPRV+c+pvZLwdX0qnUTODUjXI2l9U7WOHXp/uYxOcaiLVKIKkaID62+
	PocN1Ut/VSmbjr2wUr8Af2k3jZaU1b4OV18zwEUduTCK3vNMLEapzWFJOtDKPndrtZqdsRBlkP/h6
	GZqMgUIYUccNOcPxKHC3pML7366XQ1XtsdUnV/H0HRL/ZGBfmQDOKejBtJosJXVG8z2eNXwuTM4iF
	APIUsdl0FuFcF02cW0pC8BNwzDlgG2ze9tjoBX5L4LQuEVm3zVJOrd6QJrdkKDt67GiSSGO/jXcLh
	+mZrAsGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOCa-0000000DKAr-3Q0W;
	Fri, 06 Nov 2026 17:58:12 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOCY-0000000DKAS-3H7X
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 17:58:12 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so8380875e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 09:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793987889; x=1794592689; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QgfTA5a+5MMLBq/A4jGpp86Ey0W49QUd8AMooz78Jz8=;
        b=SoSvYWtrf4Nc7LDgFo0BdSkTwBmiyfudQqUYKhLTDuTYaXhFP2LrGwLQ+JKeKCVC3Y
         U0wJL4R5u49p5TzDIKiOuD+iTxyRet2ucXLHzulkMkfGstk5LiwfulgwM5Wk3PyBVhGN
         RDDNMjs2aka+SSRQrjultCvexqj6MZNPSeYTZ0KkK+SVNNFWoL6pqtpm+sJrpXpJthTx
         LHuNOOWYlBHv86yRKVYVILpbtNcAppC5e0oA8Qo8qcEUCVsUwP2DKfi1hPlVjeZErIqP
         Eni0nz8+6Bmjyu+RF+OjfoiNygY2+CbF58JmXvnnU7DryzyTyuxYgAnelotNUAEjmlbg
         1tCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793987889; x=1794592689;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QgfTA5a+5MMLBq/A4jGpp86Ey0W49QUd8AMooz78Jz8=;
        b=WYERqpWNfp73rJsL0fRLFgmnZm5AFMc6TZDatmANoXg/1DbXkFatCpazWTf4EUjwEK
         PoXpIGKUQnk7NmqhlQt84XtgGTZAZTq7Jqyqi8Lyk75N359i26+TupaSwV3mptpOcc2M
         NOVIO52WNvaghYtljEp/00nkwxbZxLqgu8Rv8cKJfe4YMUZy3gwB6ucN12n/jCN6pnth
         eebWPSdrYqDmHbu0trbT1giCFAAln7yFZwHhrib8EkL2HdhRt9cBrTUbnwH0MjUBIWcr
         pnOkXDwYKtASMjexhMZz/on0W3BcZUNYn6rsa2QEHkzrxnJOp5DFe4K337g1N0yvCczp
         FdaA==
X-Forwarded-Encrypted: i=1; AKwUvBzZfAZis7J2a7NhxKaopKaOQXihJjtVr26FVwxs0PmxRM1vDJl6DnShcj4kj9B9BvdFxjHxwcTGfWSj/JvZx9rB@lists.infradead.org
X-Gm-Message-State: APuU4Z/SeOfukPXdkzaWz7W4wdQkFolDFlWq+BjfmI4wtqXJFTOFlMTw
	zca91VYncwip0pdraN57WwGtjMAVbnaX5zmToAqCP3Ed1v9tR9n34N01h100VcZzOg==
X-Gm-Gg: AYBFou0K6vHfYJiXU6p8US5/ToBPJP2KRNHijKmjZRg/qSUS9EOW2fhRV4qejpVJluq
	Mw2ya+XlGmVhBVHfv7KbNpqED0CTeMFvqJAaHsE5wwq0tiB185TSyLAYVATHoo+CbvdWeYOKK+w
	pZSzEgBzk6FDO1V43j1WohBYUtbN39mnL4rJ7y/mWWE1I2qrRdIgTRSum3BEbdqG7jLCck7rLMM
	bNpuAXQQ4MpRSPy3MCOEeZ040/PPLiy24DPHUk6X7VDwXyAGK1onWif4sDkHw97WXDVYM2MOb/k
	/KdagD0yyOmrLcTE/66LbrD85b37YdD9WFryWheeFXIBDFlJIiLfLPY/ODg29LRrblKopawji7C
	qjqsvc+nv5R3RvyGVrHZ0H2e5ZaDH4FQUYgRJ/KzVwACMX1/xLCvQocpPdoOuzMwbkS/pNlvd4g
	or6rBpugZZWij+yiKhRgSKMhCfKv6Pn4DykXljhOiAYNTUCtztWs/chCKcrGVISDRASsv9X/UJA
	AXECPrS4JuH4D9bOFcwxjEc4AsWzyaxhiA0TzALt01A2vBAZDktwGhmMmzoBBP3dxx5JwT7cE8i
	ZlgZCClGksziO6o6U9ApjuqyprzWtFp/rVnPoU12tgOJenJpbon0J8pI1vXgfuRXy8uofMQ8BQk
	S/XGlMX8ztQ==
X-Received: by 2002:a05:600c:3e08:b0:4a8:f2ad:a9e5 with SMTP id 5b1f17b1804b1-4b6db4a9ea1mr49691395e9.3.1793987888277;
        Fri, 06 Nov 2026 09:58:08 -0800 (PST)
Received: from google.com (0.182.34.34.bc.googleusercontent.com. [34.34.182.0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b76cbd082dsm8048725e9.1.2026.11.06.09.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:58:07 -0800 (PST)
Date: Fri, 6 Nov 2026 17:58:03 +0000
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
Subject: Re: [PATCH 0/4] KVM: arm64: Support SVE in protected VMs
Message-ID: <au4VKxSnkJgDtcpG@google.com>
References: <20261105130456.1617185-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105130456.1617185-1-fuad.tabba@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_095810_859380_C32E23F4 
X-CRM114-Status: GOOD (  19.48  )
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
X-Spam-Status: No, score=-23.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 01:04:52PM +0000, Fuad Tabba wrote:
> Hi folks,
> 
> This series adds SVE support for protected VMs. EL2 allocates a
> protected vCPU's SVE state from its own heap rather than pinning the
> host's buffer, so the host never sees the guest's vector registers. It
> then advertises ID_AA64ZFR0_EL1 to protected VMs, and routes the SVE
> trap to the lazy FP switch. The first patch is a small tidy-up of the
> pKVM FP sync code that saves a guest's SVE state.
> 
> v2 of the pKVM selftests series [1] will add a selftest for this.
> 
> Based on Linux 7.4-rc1 (6628e7d4c6b25).
> 
> Cheers,
> /fuad
> 
> [1] https://lore.kernel.org/all/20261104084842.132944-1-fuad.tabba@linux.dev/
> 
> Fuad Tabba (4):
>   KVM: arm64: Remove redundant kern_hyp_va() calls from the pKVM FP sync
>   KVM: arm64: Allocate a protected vCPU's SVE state at EL2
>   KVM: arm64: Advertise ID_AA64ZFR0_EL1 to protected VMs
>   KVM: arm64: Allow protected VMs to use SVE
> 
>  Documentation/virt/kvm/arm/pkvm.rst |  6 ++---
>  arch/arm64/include/asm/kvm_hyp.h    |  2 ++
>  arch/arm64/include/asm/kvm_pkvm.h   |  1 +
>  arch/arm64/kvm/arm.c                |  1 +
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c  |  4 +--
>  arch/arm64/kvm/hyp/nvhe/pkvm.c      | 41 +++++++++++++++++++----------
>  arch/arm64/kvm/hyp/nvhe/switch.c    |  1 +
>  arch/arm64/kvm/hyp/nvhe/sys_regs.c  | 22 ++++++++++++++--
>  arch/arm64/kvm/reset.c              |  2 ++
>  9 files changed, 59 insertions(+), 21 deletions(-)
> 
> 
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> -- 
> 2.47.3
> 

For the whole series

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
Tested-by: Vincent Donnefort <vdonnefort@google.com>

-- 
Vincent

