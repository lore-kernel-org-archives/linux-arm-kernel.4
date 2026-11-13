Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4820606A890
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 09:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Lnt90N8i;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VrdtmNVE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fDlgPTYiBve6ac0EYBh5ooi40MgDxOWxlCucyVyeQqE=; b=Lnt90N8iwDGKLBISnJiUj8f9LH
	jXFZjEfjrQOpOmT7VAWB8fB9hJ2zW/7RrPJwLFd/BtqZW9DVmiJZ3GzHMH1B2SFaAw2IVkgwkAWW2
	QEfS4N5Q9U7LeJT7V6WcjJq79rxtlkBDcrzZ8PYjPDZ4LZxQDczmdV/dvp6T5cerLwSVmiCqjelGO
	4i3OwXH0n71bvqzU6xpdsSqgyFQwRPMW+ssD8hSld6Zu0wNdPJlsjRiClpmfdyvyjgL96uYQmAppw
	r/mQ0KUIVl6UUxCHpT0zwqSVSr4obAlxmOB0q2umaXM3WEJYHea7VMbSYJD+II9J5zD+mpfGDDIL7
	/jL13d6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRnjw-0000000CEnm-0vWn;
	Fri, 13 Nov 2026 09:38:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRnju-0000000CEne-2orL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 09:38:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 299EE433A4;
	Fri, 13 Nov 2026 09:38:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95EC71F000C8;
	Fri, 13 Nov 2026 09:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794562714;
	bh=fDlgPTYiBve6ac0EYBh5ooi40MgDxOWxlCucyVyeQqE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VrdtmNVEX6vFWYNrugRtAcCWWH2zt84rUMn8ClUP5nviTGWbxAz2VBxvTHUuf1zlQ
	 4ZTOeLMB88Vi9xHdNM/uS3gOHhy4wSu0awpqaDpyLg7NvaI1TcfVa2e5qsnNrAwAFP
	 +Q+PTfgXSQI49l+xdNmuI/87bKJHbEkjfBQyF+E5WbXDepbXPCCnuL1ftPXC+KBgtN
	 cCiP1XdFu0MKrVOkG0aSQuYCu9ggDcEBcCVgkTD76Q5NxW+wHgKGEFmOSz3L5cKtIE
	 HEHNauuNQ4b0ceq+JEp8P0I/SRqEtY8MiXGGJsu8cGVN0wq/LK8Ey9OLGVmUQoB6ve
	 XjCx4/Ah3QlEA==
Date: Fri, 13 Nov 2026 09:38:30 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Jamie Nguyen <jamien@nvidia.com>
Cc: linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Dat Mach <dmach@nvidia.com>
Subject: Re: [PATCH v2 3/3] firmware: arm_ffa: Share FF-A version negotiation
Message-ID: <20261113-innocent-cockatrice-of-fragrance-ffb1dd@sudeepholla>
References: <20261112-acpi_ffh_ffa-v2-0-575a9dbed22b@kernel.org>
 <20261112-acpi_ffh_ffa-v2-3-575a9dbed22b@kernel.org>
 <20261112163047.575186-1-jamien@nvidia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112163047.575186-1-jamien@nvidia.com>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 12, 2026 at 08:30:47AM -0800, Jamie Nguyen wrote:
> On Thu, Nov 12, 2026 at 11:14:08AM +0000, Sudeep Holla wrote:
> [...]
> > +	guard(mutex)(&ffa_version_lock);
> > +	if (!ffa_version) {
> > +		invoke(&args, &res);
> 
> Can this scenario happen?
> 
> 1) pKVM is enabled but not yet initialised, and offset-2 AML runs
>    (e.g. during the initial ACPI scan), so ffh.c gets here first and
>    negotiates directly with EL3.
> 2) The result is cached.
> 3) Once pKVM is up, ffa_version_check() gets the cached version and
>    never sends FFA_VERSION through the proxy.
> 
> If so, then I think kvm_host_ffa_handler() would reject the transport's
> calls, since has_version_negotiated is never set.
> 
> Should we decline here instead, without caching, while
> is_protected_kvm_enabled() && !is_pkvm_initialized(), like ffa_probe()
> already does?

Yes, I had already considered this, which is why I kept it separate.
That way, we can easily drop this part if we want core ACPI FFH Offset2
OpRegion support without the extra complexity. Even with this added
logic, we are still constrained by the requirement that the bootloader
(such as UEFI) negotiates the exact same version. Given that this
doesn't provide a complete or reliable fix, I'm inclined to drop it
rather than introduce complexity that only gives the appearance of
solving the problem.

-- 
Regards,
Sudeep

