Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070C7606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 16:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SI78gi9r;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=q4f+N3FU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ne13n2DB/jDf1VtY7sHJ82JPmofZWUZ317tjpSfR3Dw=; b=SI78gi9rEU/H6r
	L5txItjH3U6fIKV7zUQkEqKdD7n7vvNYhr9jXIqx9QiAgU1tshwSeEjTnpb+Me2FjsTAPIOQdqARz
	QdAB803tSZPFsEC+nfvyRdfTzlqBJt7W447kpQD222t1Ic3hsPSoVgIpXU8qZ+dP/pnq594lSMLgV
	4MMzGNUqEhMvXRVhYdmCAFykLFtwu5Fn8NCC1qlD3+qS7/O1Qm6OmKaStFJDOeYaLe7X5k4LjXwHg
	lcQ958KjpBhnHep4vBOhTBruvlhL56WgulZGXDPBd8NYqKpyAlrIDLdM/gD+I9M/DRUE4sq6+xzA3
	/3yGkt3Kt4t+8o/JBQgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPNHT-0000000D9Al-3FKb;
	Fri, 06 Nov 2026 16:59:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPNHR-0000000D9A2-1LwR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 16:59:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3632C15A1;
	Fri,  6 Nov 2026 08:59:05 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9021D3F673;
	Fri,  6 Nov 2026 08:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793984348; bh=SwqfUHhYw1QVVQnkFBQI8TJ6m4IcNWWoizO5xgJB1Dg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=q4f+N3FUhY2jtMruQLhFpwiEFK3SxbelCDNVN4G2YY/fb6ecXxSc6URM7pHHITiUD
	 vzDfxnl3mHUL2B1GI+RlxlC1GGJ+hkP8AG2V86+fFw+S4UmIwq0RrayGh92NCNyHWW
	 //hJqQ1UHYuWPd1hVksWZ4l/ZpM+PYIgyL5FGJ+o=
Message-ID: <1639d961-1092-4a47-8825-55c1647a115b@arm.com>
Date: Fri, 6 Nov 2026 16:59:05 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v4 1/3] KVM: arm64: Avoid re-testing walk_continue
To: Leonardo Bras <leo.bras@arm.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
 Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Raghavendra Rao Ananta <rananta@google.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20261106161240.1345126-1-leo.bras@arm.com>
 <20261106161240.1345126-2-leo.bras@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261106161240.1345126-2-leo.bras@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_085909_411905_0521BFF0 
X-CRM114-Status: GOOD (  19.32  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 06/11/2026 16:12, Leonardo Bras wrote:
> __kvm_pgtable_visit() performs a bunch of calls to
> kvm_pgtable_walk_continue() to find out whether the walk can continue
> further, and if not, 'goto out', which retests the possibility of
> continuing the walk before exiting.
> 
> Given that it's testing the same ret variable again, there is no reason
> the result of kvm_pgtable_walk_continue() would have changed since the
> previous check. So turn this goto into an early return, simplifying the
> code and paving the way for further rework."

Looks sensible to me.

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>


> 
> Signed-off-by: Leonardo Bras <leo.bras@arm.com>
> ---
>   arch/arm64/kvm/hyp/pgtable.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> index b74dd5ce1efd..7a51f78b6446 100644
> --- a/arch/arm64/kvm/hyp/pgtable.c
> +++ b/arch/arm64/kvm/hyp/pgtable.c
> @@ -183,32 +183,32 @@ static inline int __kvm_pgtable_visit(struct kvm_pgtable_walk_data *data,
>   	 * Reload the page table after invoking the walker callback for leaf
>   	 * entries or after pre-order traversal, to allow the walker to descend
>   	 * into a newly installed or replaced table.
>   	 */
>   	if (reload) {
>   		ctx.old = READ_ONCE(*ptep);
>   		table = kvm_pte_table(ctx.old, level);
>   	}
>   
>   	if (!kvm_pgtable_walk_continue(data->walker, ret))
> -		goto out;
> +		return ret;
>   
>   	if (!table) {
>   		data->addr = ALIGN_DOWN(data->addr, kvm_granule_size(level));
>   		data->addr += kvm_granule_size(level);
>   		goto out;
>   	}
>   
>   	childp = (kvm_pteref_t)kvm_pte_follow(ctx.old, mm_ops);
>   	ret = __kvm_pgtable_walk(data, mm_ops, childp, level + 1);
>   	if (!kvm_pgtable_walk_continue(data->walker, ret))
> -		goto out;
> +		return ret;
>   
>   	if (ctx.flags & KVM_PGTABLE_WALK_TABLE_POST)
>   		ret = kvm_pgtable_visitor_cb(data, &ctx, KVM_PGTABLE_WALK_TABLE_POST);
>   
>   out:
>   	if (kvm_pgtable_walk_continue(data->walker, ret))
>   		return 0;
>   
>   	return ret;
>   }


