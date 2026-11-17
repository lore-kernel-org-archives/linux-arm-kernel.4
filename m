Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1851D60A5BCE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 17:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c2TqK5nx;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=XISAVZ4i
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=j49FQqF/5AAaYAE+Xw+IyqdKqNIf0oE/qvi3zUpU3es=; b=c2TqK5nxvYzB9E
	ZSs7Bwq5CHU+nbS/JY5kzeJ8BcbMM3m05SQTgcuTy12lJzk31i96/jY8pQ6NLSa6xJAFSTXywbH/c
	/vYFwf7M2nQOWfcZknmtP4Z1A++vDjnvbGAuWR1bkOxfA0drJvT3AUV86NwNlEUmSgKMc39btP347
	ETX7WDHTtL/zGqwiP6I/m7S1ZParncc3704qseQX1yCSMKqrNTweVjt03+JIiDGR2WdVa/AWTtpKk
	cak9h89JQIXbl3yNZdTSM7GQEcPCNaRsAhMw0LMByBZM+WkXHtxXMOHjoAFAwNO+6hvNdkWQJ4+/H
	pb62JbgUYV39JDnubETw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMs0-00000006WZ0-31p3;
	Tue, 17 Nov 2026 17:21:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMrw-00000006WVd-3EhH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 17:21:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5DAC11A00;
	Tue, 17 Nov 2026 09:21:14 -0800 (PST)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B426A3F632;
	Tue, 17 Nov 2026 09:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794936077; bh=UF4/WZWpnvhVbjnhm5Fhiug3i+G9AJ9V+I3bAy37IEw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XISAVZ4i0KKFtENmf4YZAeVOf0w1jBZnBhSZ+hU3sV8p6PBglO0PqWm9emUhFpc9a
	 5P4dH5Z+qPk/6NH+bBWt69XFuo+en5u+hsdgjg5xg3eFIcViu1jN33qiwD5BXvWKzf
	 ywluq+Q2pDqzs9KM9otMDaTb7/VRQ8XTyeE450SQ=
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
Subject: Re: [PATCH v1 1/2] KVM: arm64: Fix inverted E2H0 check for HCR_EL2.NV1
Date: Tue, 17 Nov 2026 17:21:10 +0000
Message-ID: <avyNBn24sLjxrfgR@LeoBrasDK>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116200418.3535619-2-coltonlewis@google.com>
References: <20261116200418.3535619-1-coltonlewis@google.com> <20261116200418.3535619-2-coltonlewis@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_092120_899242_B08D87DD 
X-CRM114-Status: GOOD (  22.84  )
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

On Mon, Nov 16, 2026 at 08:04:17PM +0000, Colton Lewis wrote:
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
> Check kvm_has_feat(kvm, ID_AA64MMFR4_EL1, E2H0, NI) in
> feat_nv2_e2h0_ni() so that HCR_EL2.NV1 is treated as implemented only
> when E2H0 is IMP or NI, and forced to RES0 when E2H0 is NI_NV1.
> 
> Fixes: b2a324ff01fe ("KVM: arm64: Use HCR_EL2 feature map to drive fixed-value bits")
> Signed-off-by: Colton Lewis <coltonlewis@google.com>
> ---
>  arch/arm64/kvm/config.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
> index adaf26ab93b85..b4f555d39f54a 100644
> --- a/arch/arm64/kvm/config.c
> +++ b/arch/arm64/kvm/config.c
> @@ -258,7 +258,8 @@ static bool feat_nv2(struct kvm *kvm)
>  
>  static bool feat_nv2_e2h0_ni(struct kvm *kvm)
>  {
> -	return feat_nv2(kvm) && !kvm_has_feat(kvm, FEAT_E2H0);
> +	return feat_nv2(kvm) &&
> +	       kvm_has_feat(kvm, ID_AA64MMFR4_EL1, E2H0, NI);
>  }
>  
>  static bool feat_rasv1p1(struct kvm *kvm)
> -- 
> 2.56.1.750.gf70dc682cf-goog
> 

Hi Colton,

I just read the code that uses feat_nv2_e2h0_ni(). IIUC if it returns 
false, we get HCR_EL2.NV1 to be RES0. Otherwise it's writable.

The change you suggest is returning (ID_AA64MMFR4_EL1.E2H0 >= -1), which 
would return false in the case of NI_NV1 (-2), and make the field RES0 only 
in that case.

I think it does make sense, but maybe we should also change the name of the 
helper from feat_nv2_e2h0_ni() to something that reflects what is being 
tested now. feat_nv2_e2h0_imp_or_ni() would be confuse, and maybe 
feat_nv2_e2h0_not_ni_nv1() would be as well. 

Maybe feat_nv2_e2h0_not_res0(). What do you think?

Thanks!
Leo

