Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC68606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 12:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y/F2YBVi;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=vJUzndq5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lGbG2L4q6RTjy90wDXOhxvLRZROy91QQyYQgPEuX3bg=; b=Y/F2YBVinp2iWM
	jY7Xml+HDX+RpXa6B4a3MJRSKMfutpGdxmfohZCSVq3jV2ykiAGSdnohfHYH3159nkztp0MnA4pbw
	KooR7/wJx/5Y+wlkEMM6NBDuPFSX1aQgaBbZ/alanlkuY+LwStlNfC8T/1sKVYHUbuSIzwb7gjqY8
	/WmGEfycEJYm5AfMKyXxvMZG1G7IdGD9ovSX3rEaMf3D7I7hDpM2kWqcQ7y4QZcrvxNIsqnlaxjuY
	oZK6au10oRb42Yu7/9xzd8I1cgu+5jrpa9Ex9MkRU6Laid/fRFHSWSc3bg9MTVZQlOg4ATSvqyfvE
	tThywfDwsUSBhrdrFU+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU0xa-0000000Bn8Y-2Z0Q;
	Thu, 19 Nov 2026 12:09:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU0xY-0000000Bn5X-1gmw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 12:09:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D43B51575;
	Thu, 19 Nov 2026 04:09:41 -0800 (PST)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 03AF63F673;
	Thu, 19 Nov 2026 04:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795090184; bh=1fgCKNJyc0tTlHTT1RIfQJggRcZMC0RxEy2L4qzqKbo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vJUzndq5Ok01/Kqcwshxgwd92G+eiNBaLToglFYnZSlRd4AoA1JRLhuV2E2+WKLoY
	 kC8dh/QxIrV8b/I0GHgE9OAzzkl92ZXhysnUrbeeSmFhsvcLRJauvN6yp+6t8czB1c
	 ooM5FN96dMskIbJkKmUkfgI6LIiEUyWAucO4zaQY=
From: Leonardo Bras <leo.bras@arm.com>
To: Colton Lewis <coltonlewis@google.com>
Cc: Leonardo Bras <leo.bras@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] KVM: arm64: Force HCR_EL2.NV1 to RES0 unconditionally
Date: Thu, 19 Nov 2026 12:09:29 +0000
Message-ID: <av7m-W5ataGJ8dNc@LeoBrasDK>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118203625.743428-2-coltonlewis@google.com>
References: <20261118203625.743428-1-coltonlewis@google.com> <20261118203625.743428-2-coltonlewis@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_040948_611068_7BE1E712 
X-CRM114-Status: GOOD (  20.13  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 18, 2026 at 08:36:24PM +0000, Colton Lewis wrote:
> ID_AA64MMFR4_EL1.E2H0 is a signed 4-bit field where:
>   - 0b0000 (IMP, 0): FEAT_E2H0 is implemented.
>   - 0b1111 (NI, -1): FEAT_E2H0 is not implemented, except HCR_EL2.NV1
>     is implemented.
>   - 0b1110 (NI_NV1, -2): Neither HCR_EL2.E2H == 0 nor HCR_EL2.NV1 is
>     implemented, and HCR_EL2.NV1 is RES0.
> 
> When commit b2a324ff01fe ("KVM: arm64: Use HCR_EL2 feature map to drive
> fixed-value bits") converted HCR_EL2 to hcr_feat_map[], feat_nv2_e2h0_ni()
> was written as !kvm_has_feat(kvm, FEAT_E2H0), where FEAT_E2H0 checks
> E2H0 >= IMP (0). This inverted the condition: feat_nv2_e2h0_ni() evaluates
> to true when E2H0 < 0 (including NI_NV1), leaving HCR_EL2.NV1 writable
> instead of RES0 for VHE-only nested guests where KVM advertises
> ID_AA64MMFR4_EL1.E2H0 = NI_NV1.
> 
> In practice, KVM cannot handle HCR_EL2.NV1 being non-RES0 in any
> configuration: limit_nv_id_reg() exposes either VHE-only EL2 with
> ID_AA64MMFR4_EL1.E2H0 = NI_NV1 (and E2H0 is not userspace-writable), or
> FEAT_E2H0 without FEAT_VHE or FEAT_NV. Checking E2H0 in a feature helper
> is therefore unnecessary.
> 
> Drop feat_nv2_e2h0_ni() and mark HCR_EL2_NV1 as an unconditional RES0 bit
> using NEEDS_FEAT_FLAG(HCR_EL2_NV1, FORCE_RESx) in hcr_feat_map[] (shared
> by HCR_EL2 and NVHCR_EL2). Because HCR_EL2_NV1 is not part of the
> architectural HCR_EL2_RES0 mask, check_feat_map() accounts for it as an
> implementation-defined FORCE_RESx bit.
> 
> Fixes: b2a324ff01fe ("KVM: arm64: Use HCR_EL2 feature map to drive fixed-value bits")
> Suggested-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Colton Lewis <coltonlewis@google.com>
> ---
>  arch/arm64/kvm/config.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
> index adaf26ab93b85..2e81f45dc9921 100644
> --- a/arch/arm64/kvm/config.c
> +++ b/arch/arm64/kvm/config.c
> @@ -256,11 +256,6 @@ static bool feat_nv2(struct kvm *kvm)
>  		kvm_has_feat(kvm, ID_AA64MMFR2_EL1, NV, NV2));
>  }
>  
> -static bool feat_nv2_e2h0_ni(struct kvm *kvm)
> -{
> -	return feat_nv2(kvm) && !kvm_has_feat(kvm, FEAT_E2H0);
> -}
> -
>  static bool feat_rasv1p1(struct kvm *kvm)
>  {
>  	return (kvm_has_feat(kvm, ID_AA64PFR0_EL1, RAS, V1P1) ||
> @@ -1034,7 +1029,7 @@ static const struct reg_bits_to_feat_map hcr_feat_map[] = {
>  		   HCR_EL2_NV2		|
>  		   HCR_EL2_NV,
>  		   feat_nv2),
> -	NEEDS_FEAT(HCR_EL2_NV1, feat_nv2_e2h0_ni), /* Missing from JSON */
> +	NEEDS_FEAT_FLAG(HCR_EL2_NV1, FORCE_RESx), /* Missing from JSON, RES0 as an IMPDEF choice */
>  	NEEDS_FEAT(HCR_EL2_API		|
>  		   HCR_EL2_APK,
>  		   feat_pauth),
> -- 
> 2.56.1.750.gf70dc682cf-goog
> 

Right,
KVM nested requires VHE, which uses E2H, which conflicts with NV1.

FWIW:
Reviewed-by: Leonardo Bras <leo.bras@arm.com>

Thanks!
Leo

