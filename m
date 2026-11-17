Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26B4606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 22:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E22EF+SO;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iyO9GWF2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=O42IkrS9jeTCK/NHaai3Y1tyVx5hVS+EWpn+Yy3d8yI=; b=E22EF+SO2avoufeCZ3hRPxClF5
	Dj+un+p+AolrUaMDtim6OAtH027su7duo8R4alWY+C35ZFfG60Vq+jPF8Xw3vgDXCKzRwDiARYZzG
	rc8SQwbblgdZntsmXlVJ6kKpnfQKnEgD0WxDVhZ4FdgE+zAV5zSfBUVDuImslRLt9u4AQUMyIeVcz
	ztJIyQOUQavlqGyx4oLH/OCqycB+q7RE9aaDJ60KlGaauS/axFjF3ti7cRJnvVIyAshjgqllvzYOa
	3dUNVAvzMTALEqBNHosINFl9dwAoPkjMnPoxSK0v3oVtRWyA8wSZnMU0sQEkSP7ucZATfFIpa6Ok1
	iPmt3iOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTRwt-00000007Fsx-32v8;
	Tue, 17 Nov 2026 22:46:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTRws-00000007Fsl-1JfU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 22:46:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5CCF561CD0;
	Tue, 17 Nov 2026 22:46:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E46F41F000C4;
	Tue, 17 Nov 2026 22:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794955605;
	bh=O42IkrS9jeTCK/NHaai3Y1tyVx5hVS+EWpn+Yy3d8yI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iyO9GWF2tAcGIGrZynM3V9LMbB3J3bzToMv8b0reAugTl73Sx4KZii0IJsV1VBfx2
	 WGvl6RFuotOhxRMGJoU5ayKO92eMS8kwLZx140AxWWqTpy1TxTk7iygRo06VzvBHN8
	 KgfG5jrSvA2PiQ2lsc3Hi8WtAeEc1rF1q65+j9gD3pvTbBZ3l2yVzKr4usIwcq/JDY
	 1Q9IWj5Xy4plv83pxJOrsAZLBVGf/2uNbBCzHtYS7sCo6FbiBMr4DZC2tt/7qHdLew
	 Unjnf5r8pOmNdxp5RiA1ljIGfHRjlqUJWM/5YFgQaHNYPv+MkAG8YQg8pzZumR8Sg/
	 0JwSgIuselQYw==
Date: Tue, 17 Nov 2026 14:46:43 -0800
From: Oliver Upton <oupton@kernel.org>
To: Colton Lewis <coltonlewis@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Leonardo Bras <leo.bras@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <fuad.tabba@linux.dev>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] KVM: arm64: Fix inverted E2H0 check for
 HCR_EL2.NV1
Message-ID: <avzZUyu9EhxAWtbd@kernel.org>
References: <20261117204535.4036191-1-coltonlewis@google.com>
 <20261117204535.4036191-2-coltonlewis@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117204535.4036191-2-coltonlewis@google.com>
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

On Tue, Nov 17, 2026 at 08:45:34PM +0000, Colton Lewis wrote:
> ID_AA64MMFR4_EL1.E2H0 is a signed 4-bit field where:
>   - 0b0000 (IMP, 0): FEAT_E2H0 is implemented.
>   - 0b1111 (NI, -1): FEAT_E2H0 is not implemented, except HCR_EL2.NV1
>     is implemented.
>   - 0b1110 (NI_NV1, -2): Neither HCR_EL2.E2H == 0 nor HCR_EL2.NV1 is
>     implemented, and HCR_EL2.NV1 is RES0.
> 
> Prior to commit b2a324ff01fe ("KVM: arm64: Use HCR_EL2 feature map to
> drive fixed-value bits"), kvm_init_nv_sysregs() marked HCR_EL2.NV1 as
> RES0 when !kvm_has_feat(kvm, ID_AA64MMFR4_EL1, E2H0, NI), i.e., when the
> signed E2H0 field is less than NI (-1), which matches NI_NV1 (-2).
> 
> When converting HCR_EL2 to the feature map, feat_nv2_e2h0_ni() was
> written as !kvm_has_feat(kvm, FEAT_E2H0), where FEAT_E2H0 checks
> E2H0 >= IMP (0). This inverted the condition: feat_nv2_e2h0_ni()
> evaluates to true when E2H0 < 0 (including NI_NV1), leaving HCR_EL2.NV1
> writable instead of RES0 for VHE-only nested guests where KVM advertises
> ID_AA64MMFR4_EL1.E2H0 = NI_NV1.
> 
> Check kvm_has_feat(kvm, ID_AA64MMFR4_EL1, E2H0, NI) so that HCR_EL2.NV1
> is treated as implemented only when E2H0 is IMP or NI, and forced to
> RES0 when E2H0 is NI_NV1. Rename the helper from feat_nv2_e2h0_ni() to
> feat_nv2_nv1_not_res0() to clearly reflect what it tests.
> 
> Fixes: b2a324ff01fe ("KVM: arm64: Use HCR_EL2 feature map to drive fixed-value bits")
> Signed-off-by: Colton Lewis <coltonlewis@google.com>
> ---
>  arch/arm64/kvm/config.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
> index adaf26ab93b85..a975ac73ed876 100644
> --- a/arch/arm64/kvm/config.c
> +++ b/arch/arm64/kvm/config.c
> @@ -256,9 +256,10 @@ static bool feat_nv2(struct kvm *kvm)
>  		kvm_has_feat(kvm, ID_AA64MMFR2_EL1, NV, NV2));
>  }
>  
> -static bool feat_nv2_e2h0_ni(struct kvm *kvm)
> +static bool feat_nv2_nv1_not_res0(struct kvm *kvm)
>  {
> -	return feat_nv2(kvm) && !kvm_has_feat(kvm, FEAT_E2H0);
> +	return feat_nv2(kvm) &&
> +	       kvm_has_feat(kvm, ID_AA64MMFR4_EL1, E2H0, NI);
>  }

This could benefit from a comment, because testing for NI as a feature
is very misleading. Also, I don't why this needs to spill onto another
line.

	/*
	 * The E2H0 field is a 'negative' feature field, where a value
	 * of -1 implies FEAT_E2H0 is not implemented but does not
	 * restrict the use of HCR_EL2.NV1.
	 */
	return feat_nv2(kvm) && kvm_has_feat(kvm, ID_AA64MMFR4_EL1, E2H0, NI);

Thanks,
Oliver

