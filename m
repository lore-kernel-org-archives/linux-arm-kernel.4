Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A1A606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 16:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=B3GrRSrR;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=LTrMdE1L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vh0BAdo2m4YNdv43vLdl/BjP3ewFE0kTwJwjZn4sTvQ=; b=B3GrRSrRHlYJd4
	K3N+/7wFXRejUm6Q4YfQFOme1MUT9sWcS82El8qBbyUlZsDnMcvg5nBJKbWvfQOKp3DV2DCyjY5eU
	ikKcVRWjQknCAqtYdfssPcUKEiWidGZof+PRoz9TKHOJemxulUAj93kaKFnpCpTmVWBQec/iQi49J
	2Sd6whutJbti7dl5LqG196j1eaFxfxlFG/JTmsHjMydKWSpc/2BGWJz5qe+w6Pc9qvNTW8/smYOm6
	R3PuHm9oqTKKXdXo5BvIFpdMEoPU/rKxXXUCf2BthQjsM3JwWDFHjAAAgm+tpiiSe9JJhZSkSHq+K
	EQfCLYvXFmB2hxku0Puw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtFx-000000076No-2NqY;
	Tue, 24 Nov 2026 16:20:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtFu-000000076NK-3R9A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 16:20:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A4EB497;
	Tue, 24 Nov 2026 08:20:24 -0800 (PST)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 80D4F3F86C;
	Tue, 24 Nov 2026 08:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795537227; bh=mOUbQ4p97y6xrtmHyboo3pUZSt7uQyACpafQkgBuGJE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LTrMdE1LuQCeoCPryQYYWwwsfV4wPqp2aaCA7ba3L+gGy3IvFi+v/W1gpWNnFTmzm
	 UPoSXiPVOhIy5qHty1w5p8yUBxGbBhRkalKi3ydK933L1rVp0uKRioH1xQVljuWo0X
	 P2dg7TH+XlkSbrmvb4PayQNFySKNVu8bzaSnDSDc=
From: Leonardo Bras <leo.bras@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Leonardo Bras <leo.bras@arm.com>,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Dan Carpenter <dan@pereq.eu>,
	stable@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: nv: Upgrade sub-page TTL hint to maximum size
Date: Tue, 24 Nov 2026 16:20:16 +0000
Message-ID: <awW5QKqGZAqw1ru9@LeoBrasDK>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123182312.4842-1-maz@kernel.org>
References: <20261123182312.4842-1-maz@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_082030_937876_81A727A0 
X-CRM114-Status: GOOD (  30.26  )
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

On Mon, Nov 23, 2026 at 06:23:12PM +0000, Marc Zyngier wrote:
> Should a guest be slightly foolish and submit a S2 TLBI with a TTL hint
> that describe a base granule size smaller than the host's page size,
> we take the resulting size at face value and feed it to the S2 unmapping
> code. Which legitimately screams about something not being page-aligned.
> 
> The architecture allows us to drop the TLBI on the floor, as we don't
> support a S2 granule size smaller than the host's page size. But it turns
> out that doing so is proving pretty hard (we call compute_tlb_inval_range
> from a number of places, none of which is amenable to an early out).
> 
> Instead, detect the annoying case, and pretend that we don't have a TTL
> hint at all, leaving the size upgrade mechanism to take place and use
> the largest possible size for the guest's S2 granule size.
> 
> This will still allow nonsensical stuff to get through, such as a 4kB
> level 2 (aka 2MB) from a guest with a 64kB S2 base granule size running
> on a 16kB page size host, but that's not worse than doing nothing, and
> the host code won't get shouty.
> 
> Reported-by: Dan Carpenter <dan@pereq.eu>
> Link: https://lore.kernel.org/r/20261123-inval_range-v1-1-815e15797089@pereq.eu
> Fixes: d1de1576dc21 ("KVM: arm64: nv: Handle FEAT_TTL hinted TLB operations")
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Cc: stable@vger.kernel.org
> ---
> 
> Notes:
>     Reposting this as a first class patch, as I'd like to plug that one
>     as early as possible (and Dan has plenty of other patches in flight...)
> 
>  arch/arm64/kvm/nested.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> index 78d5b18dbd2d6..36e4e83badf0a 100644
> --- a/arch/arm64/kvm/nested.c
> +++ b/arch/arm64/kvm/nested.c
> @@ -714,6 +714,13 @@ unsigned long compute_tlb_inval_range(struct kvm_s2_mmu *mmu, u64 val)
>  	 */
>  	max_size = __ttl_to_size(ttl);
>  
> +	/*
> +	 * IMPDEF behaviour: treat subpage TTL-annotated TLBI as the largest
> +	 * possible invalidation. Don't try this at home, kids!
> +	 */
> +	if (max_size < PAGE_SIZE)
> +		max_size = 0;
> +
>  	if (!max_size) {
>  		/* Compute the maximum extent of the invalidation */
>  		switch (vtcr_to_tg0_pgsize(kvm, mmu->tlb_vtcr)) {
> -- 
> 2.47.3
> 

Hey Marc,

I think the changes make sense, although rounding up to PAGE_SIZE also 
looks a valid solution in my unexperienced viewpoint. 

I am curious if there is any particular reason not to merge that with the 
test below, such as:

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 78d5b18dbd2d6..36e4e83badf0a 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -714,6 +714,13 @@ unsigned long compute_tlb_inval_range(struct kvm_s2_mmu *mmu, u64 val)
 	 */
 	max_size = __ttl_to_size(ttl);
 
+	/*
+	 * IMPDEF behaviour: treat subpage TTL-annotated TLBI as the largest
+	 * possible invalidation. Don't try this at home, kids!
+	 */
+	if (max_size < PAGE_SIZE) {
- 	if (!max_size) {
 		/* Compute the maximum extent of the invalidation */
 		switch (vtcr_to_tg0_pgsize(kvm, mmu->tlb_vtcr)) {
--

Given max_size is unsigned (>=0), and it will be changed again in the 
switch case below, I was not able to understand the need to make it zero 
first.

Thanks!
Leo 

