Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80403606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 16:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NZMtfyj+;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ILZyt2V5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=akrbTj34kp1qQLuIM9IA5lVStfc+bc9pL2azqD7+FzE=; b=NZMtfyj+bgbMNJkESWsRgD7Uwo
	R66B+Hjb1LoyeHB0ZNJOXf4K+ceD/bLpJtTJDn7rs2d7PesIZQxkTkgq61OnBs7jEYZOoB8VpSAmi
	/kYINxnsHTZwTwFKWFwDs9gmk5PpBaNvuoVpQfXqDexCRLPUf40p/4iw+ymRRtksecRwEEbOGLH1F
	aCIMqzywMSVUnFp47d4nekOmSKyISF11AStGQLCKSAomAE8ZHmNq/A3iCVHXUqAa3zVg9XfL/FRjv
	3D9PU7VXu/ECzYtr6wycQJJUNtKLMpiMKwL2s/bfv9yxwXEPvogOOehzBcWYEgC427LnIozO3guug
	e/aiyfzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxPP-0000000Gfne-0LvX;
	Fri, 27 Nov 2026 14:58:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxPN-0000000GfnF-1KLO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 14:58:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5442A169E;
	Fri, 27 Nov 2026 06:58:37 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B75843F86C;
	Fri, 27 Nov 2026 06:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795791520; bh=EOBJ+NhqSTFq21LooJrnzAHFZphR7yuwbCN7US4Z3+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ILZyt2V5OyFl3FnKePvEwIfPJqp6jkDEZ2PJJo6mFNyRLjpf0+dFs9/yqKWcuREQA
	 qIQaeNVj1ppgqiofUCrDFF6H+P6WbX9UKG/TgvZOJPHMrjVtsy9C2r/NQFHrWoZmOt
	 rUTb+sIykZsVkKg/p+agGCAC82jCnIsXzbxYs0+4=
Date: Fri, 27 Nov 2026 14:58:33 +0000
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: maz@kernel.org, oupton@kernel.org, fuad.tabba@linux.dev,
	joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, will@kernel.org, mark.rutland@arm.com,
	linux-perf-users@vger.kernel.org, catalin.marinas@arm.com,
	james.clark@linaro.org
Subject: Re: [RFC PATCH v7 06/28] KVM: arm64: Add KVM_CAP_ARM_SPE capability
Message-ID: <awmamXEZHdLyWNNS@raptor>
References: <20260903160623.315525-1-alexandru.elisei@arm.com>
 <20260903160623.315525-7-alexandru.elisei@arm.com>
 <atDtheEuNRs7v3Gx@gremlin>
 <avXcdwY89YPFGIlk@raptor>
 <avtHrG0NFuUPqIot@gremlin>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avtHrG0NFuUPqIot@gremlin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_065841_476165_81FA92DA 
X-CRM114-Status: GOOD (  17.78  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Lorenzo,

On Mon, Nov 16, 2026 at 06:29:51PM +0000, Lorenzo Stoakes (ARM) wrote:
[..]
> On Thu, Nov 12, 2026 at 03:34:15PM +0000, Alexandru Elisei wrote:
[..]
> > On Thu, Oct 15, 2026 at 05:51:03PM +0100, Lorenzo Stoakes (ARM) wrote:
[..]
> > > On Thu, Sep 03, 2026 at 05:06:01PM +0100, Alexandru Elisei wrote:
[..]
> > > > +
> > > > +static LIST_HEAD(spe_pmus);
> > > > +static DEFINE_MUTEX(spe_pmus_lock);
> > > > +
> > > > +struct spe_pmu_entry {
> > > > +	struct list_head link;
> > > > +	struct arm_spe_pmu *spe_pmu;
> > > > +};
> > >
> > > This seems like an odd way of making this into a list, can't you just embed
> > > list_head in arm_spe_pmu?
> > >
> > > Then adding becomes:
> > >
> > > list_add_tail(&spe_pmu->link, &spu_pmus);
> > >
> > > And removing:
> > >
> > > list_del(&spe_pmu->link);
> > >
> > > And you can avoid the alloc below too.
> >
> > This is the same pattern used for the PMU. Seems like a small thing, so I
> > think consistency is better? I don't expect more than three SPE instances
> > in a system (little + medium + big), so the extra 3 * 8 bytes should not be
> > an issue?
> >
> > On the other hand, it is indeed more common to embed list_head in struct
> > arm_spe_pmu. Up to you what you prefer.
> 
> I'd prefer the embedded, and I think we shouldn't be too intent on following
> PMU's patterns _entirely_, especially in a case like this which really
> significantly simplifies everything.

Ok.

Thanks,
Alex

