Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E127606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 22:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hpwB9yNi;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VwjGYOJh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xoLIi0+olq1ojYmB+iwbcLFbgFXr/KR/iCCHN1uHop8=; b=hpwB9yNi3zz9bfuMPFdDzTdcrE
	WGG3qaVVqUvUFYZoi5xlV3FgrNDhxZElfjO/h7rCob9R4jjJKjN8u5+4s1htTbHUwYiGN5PFG8Fee
	bJEvDZ9t3w8yKkVWBodBWxwP7XSi/f2o36WnOv3TPC2Lw4FZ7lfV5BVnLefo1SCmIMaoC0V6lMyDR
	Jo/kbi0jLNxUR9uxMt1aZ2Mv9wgajX9fVRKizKYPvpy3CIpen+RDkPYXt2hQt8FUFyetHEkrWTWoi
	j3I8JqYipZubiIOd79ljGbDM2UCfSCpgDxoMS8ysAdlBE94KBED39N+z4EufpYVHjA+fGjMAQ+JzR
	wAIJi4rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTRzu-00000007GFi-0UNt;
	Tue, 17 Nov 2026 22:49:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTRzs-00000007GFO-2HRj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 22:49:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 013AA438EC;
	Tue, 17 Nov 2026 22:49:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD8911F000C4;
	Tue, 17 Nov 2026 22:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794955791;
	bh=xoLIi0+olq1ojYmB+iwbcLFbgFXr/KR/iCCHN1uHop8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VwjGYOJhlAj8ZpYJeytQG47xN61sbDQutcXuSQlxtF0fWFJ2Zd5V6wzE0g7m6YzZN
	 dHRFlOJKCqYCSL7pnYD63FHOCtfqV6aWC+WxNlOUCMaqFQshLLN2/31d3wdFhcv/ul
	 0ZLTOAxA8YgseK6uBCIqBZTTL2EWys00vbsPoZpjg3w4autIth33cv5mzM+jyeFM17
	 9LJwlgFPNWTIVl6UFi8GTDI83XZ3tp3yZ+jxmBwZYVUNCdR1NE7HmcktvaLkfBcZVU
	 /Z1wOSx8jySqBZSGtegqLhYLeX2LeJ6LE03sGIBA89IoWz+T1OK8LN91pVBYId8I//
	 7dc3Uql7OkHFw==
Date: Tue, 17 Nov 2026 14:49:50 -0800
From: Oliver Upton <oupton@kernel.org>
To: Colton Lewis <coltonlewis@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Leonardo Bras <leo.bras@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <fuad.tabba@linux.dev>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] KVM: arm64: selftests: Verify HCR_EL2.NV1 is RES0
 when E2H0 is NI_NV1
Message-ID: <avzaDnFRQ2GTHDiN@kernel.org>
References: <20261117204535.4036191-1-coltonlewis@google.com>
 <20261117204535.4036191-3-coltonlewis@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117204535.4036191-3-coltonlewis@google.com>
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

On Tue, Nov 17, 2026 at 08:45:35PM +0000, Colton Lewis wrote:
> In a VHE-only EL2 guest (KVM_ARM_VCPU_HAS_EL2 without
> KVM_ARM_VCPU_HAS_EL2_E2H0), KVM advertises ID_AA64MMFR4_EL1.E2H0 as
> NI_NV1, making HCR_EL2.E2H RES1 and HCR_EL2.NV1 RES0.
> 
> Extend hello_el2 to attempt clearing HCR_EL2.E2H and setting HCR_EL2.NV1
> from userspace via KVM_SET_ONE_REG, verifying that HCR_EL2.E2H remains
> RES1 and HCR_EL2.NV1 is masked to RES0.
> 
> Signed-off-by: Colton Lewis <coltonlewis@google.com>
> ---
>  tools/testing/selftests/kvm/arm64/hello_el2.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/arm64/hello_el2.c b/tools/testing/selftests/kvm/arm64/hello_el2.c
> index bbe6862c6ab16..5910497f8fbe4 100644
> --- a/tools/testing/selftests/kvm/arm64/hello_el2.c
> +++ b/tools/testing/selftests/kvm/arm64/hello_el2.c
> @@ -45,6 +45,7 @@ int main(void)
>  	struct kvm_vcpu *vcpu;
>  	struct kvm_vm *vm;
>  	struct ucall uc;
> +	u64 hcr;
>  
>  	TEST_REQUIRE(kvm_check_cap(KVM_CAP_ARM_EL2));
>  
> @@ -66,6 +67,13 @@ int main(void)
>  		TEST_FAIL("Unhandled ucall: %ld\n", uc.cmd);
>  	}
>  
> +	hcr = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_HCR_EL2));
> +	vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_HCR_EL2),
> +		     (hcr & ~HCR_EL2_E2H) | HCR_EL2_NV1);
> +	hcr = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_HCR_EL2));
> +	TEST_ASSERT(hcr & HCR_EL2_E2H, "HCR_EL2.E2H should be RES1");
> +	TEST_ASSERT(!(hcr & HCR_EL2_NV1), "HCR_EL2.NV1 should be RES0");
> +

Again, comment would be helpful for why this is done from userspace,
i.e. the RESx as seen from the guest POV is stateful but the value is
ignored.

Thanks,
Oliver

