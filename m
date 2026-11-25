Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E059F606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 08:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UUSRM+/r;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dVZLEuUu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3JXKHxrVmfq0TiEVcdvg17Zz9dDLxpeu9nQ6Vk0bf9U=; b=UUSRM+/rBaWkrDfopRiDMSmHIe
	6NvppXS7YH7wehHmRroL/MwJlQDlDgM5hkieb0nUY+9R3uWdUFqLNZ96JSr5UwQpMAIYXyhRlTMDt
	keaYtdfFxMGYLqLZv82i4eIVd2ETneq9eqOFS6c8H/H15S17pGvhpjDZkjIxppAMRJrnsrRcHdmfM
	Szhae0dXyMQiHHUlzvwmucILQtRpAhqjuMl9/CTapGQRzmytJAV5k2BrMXOLE7Hb7REZ4Fh1VzMg9
	T9Vp4XtlQkfb05t0xtEFVeCFGnxkDOK6xRuzyzfEytDkFIOqyOeQ3/a6GKq2OReLQf8tH3oRDKElY
	qRAGXUkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7vQ-00000008xwF-2tcg;
	Wed, 25 Nov 2026 08:00:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7vO-00000008xvi-2867
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 08:00:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 96D0262295;
	Wed, 25 Nov 2026 08:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91DA11F000C0;
	Wed, 25 Nov 2026 08:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795593616;
	bh=3JXKHxrVmfq0TiEVcdvg17Zz9dDLxpeu9nQ6Vk0bf9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dVZLEuUu30Bp0Mh++rmExNRXqzfiexWadppURIK/+VKrCSdKwgsrU5sSKafqAoMVX
	 RtpJk1zM4M8Ozkq3n2tUfIqN+dazbRh0Uk7tMt4ZKtCp7Ik1X2ra2vvZj3cHCkYNkX
	 zuXHvYHAOKfV4dqS/c9v6ph+IVGU+V0EM3zsIhN334mSVLff8iGgpVz0EnVdps9F9v
	 lvttxclF3v13FajsFkdWXUAd9uDcBXebqbW8913/zEe90DATxMaaeCz18gzbwRYCac
	 3vztu/ALwxVnGZRTyZ/1AgydZcZmYQzBw8Vsp4D0WPSLc0s4EKB6yJgnt7x2ZIftB3
	 QdvdlQRkUaauA==
Date: Wed, 25 Nov 2026 00:00:15 -0800
From: Oliver Upton <oupton@kernel.org>
To: Dan Carpenter <dan@pereq.eu>
Cc: Marc Zyngier <maz@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Christoffer Dall <c.dall@virtualopensystems.com>,
	Rusty Russell <rusty@rustcorp.com.au>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Sebastian Ott <sebott@redhat.com>,
	Eric Auger <eric.auger@redhat.com>,
	James Morse <james.morse@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>, Karthik Bhargavan <karthik@pereq.eu>,
	=?iso-8859-1?Q?Cl=E9ment?= Blaudeau <clement@cryspen.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 5/8] KVM: arm64: nv: Replace a pending SError when
 injecting a new one
Message-ID: <awaVj0Aa6dMSksxX@kernel.org>
References: <20261125-double_exception-v2-0-224689d8a764@pereq.eu>
 <20261125-double_exception-v2-5-224689d8a764@pereq.eu>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261125-double_exception-v2-5-224689d8a764@pereq.eu>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Dan,

On Wed, Nov 25, 2026 at 09:56:20AM +0300, Dan Carpenter wrote:
> The kvm_inject_serror_esr() function injects SErrors as the name
> implies.  The bug is that it doesn't handle already pending errors
> correctly in nested virtualization.
> 
> In vanilla KVM the kvm_inject_serror_esr() function always sets
> the SError to pending.  However with nested KVM, it might set it
> to pending or it might deliver the SError directly.  We can only
> have one pending error at a time.  Imagine we enter the function
> with an SError pending already.  In the current code if we decide
> to pend the new error that's fine, everything works.  However if
> we decide to deliver it directly then the pend flags should be
> cleared but they are not.  So we deliver the SError directly and
> then the SError that was pending on the next exit or entry.

I could use a bit more color on how we got here. From what I can tell
this state is only possible if userspace changed the routing / masking
of the SError outside the context of a KVM_RUN. Otherwise, if the SError
is deliverable on guest exit we perform the injection prior to exiting
to userspace.

Thanks,
Oliver

> Clear the pend flags unconditionally at the start of the function.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/sashiko-outbox-229065@kernel.org/
> Fixes: ce66109cec86 ("KVM: arm64: nv: Take "masked" aborts to EL2 when HCRX_EL2.TMEA is set")
> Fixes: 77ee70a07357 ("KVM: arm64: nv: Honor SError exception routing / masking")
> Cc: stable@vger.kernel.org
> Signed-off-by: Dan Carpenter <dan@pereq.eu>
> ---
> v2: New patch
> ---
>  arch/arm64/kvm/inject_fault.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/kvm/inject_fault.c b/arch/arm64/kvm/inject_fault.c
> index aa2011cc0d5a..0f6a89b65074 100644
> --- a/arch/arm64/kvm/inject_fault.c
> +++ b/arch/arm64/kvm/inject_fault.c
> @@ -361,6 +361,10 @@ int kvm_inject_serror_esr(struct kvm_vcpu *vcpu, u64 esr)
>  {
>  	lockdep_assert_held(&vcpu->mutex);
>  
> +	/* A new SError replaces any that is already pending. */
> +	vcpu_clear_flag(vcpu, NESTED_SERROR_PENDING);
> +	*vcpu_hcr(vcpu) &= ~HCR_EL2_VSE;
> +
>  	if (is_nested_ctxt(vcpu) && kvm_serror_target_is_el2(vcpu))
>  		return kvm_inject_nested_serror(vcpu, esr);
>  
> 
> -- 
> 2.53.0
> 
> 

