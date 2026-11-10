Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E64606A332
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 12:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IZx2npIH;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.a=rsa-sha256 header.s=fj2 header.b=RvrERWya
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xPi/3K5EgSO8uxLuJimni9tpMpXLjb9QZkfq/GsXYRI=; b=IZx2npIHiHy7gSj5WepoPACckB
	Os9/WHzwKpLx+Rv16AzR+7l+Gy94An53Q7sZKHW/CuFJw6+c0gQXrvtHIf9FYUnmqCQfKLNjssAzf
	x5OaPEaClzgeWwZDdV8wb3/yJ+L5YJNfvmEwaeeFLhw6mz3Akck1lh9Fki79DFKsBFhgTQg0yO3y3
	SnX1t0UCR8Hs/8tCm06+AVeXgkubIi8WraHyDT3+LNCPUb33jK/x/juBTtUiSBi6TvFqmGUMlW+iY
	GeuueDhmQm+AcS5YowEOBc2xPIE0feLUoAZjEccA7AA6OxlHUZGk/7ZHv0SIBBRHk7Hq+Grlz9oSQ
	FZxbBKjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkhf-00000003mGg-3ntP;
	Tue, 10 Nov 2026 12:11:55 +0000
Received: from esa3.hc1455-7.c3s2.iphmx.com ([207.54.90.49])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkhc-00000003mGB-1dG4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 12:11:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1794312712; x=1825848712;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2Eio9nYqq1HUIYESAuWhCyeK9Re+Weog6uesd4h1oSo=;
  b=RvrERWyaQTAcZGZxZJ1MYJfRYHIyqRa9GU0mBfujm15cdjNKstBWKq7H
   0qkG0DgmhaUoC0VKXVMnVYDB6O0OhFy0zwRCaH0Xh5hyT/348MdpFAQ/2
   iNrWeG0nr3eejG/yzyEmrjhmzUP/DEEvt/XJEAG3kQ0eNoqTW6LDI3+PK
   LGfYleajRYUXF2H4e+9ccbxhyDgcyiIo/cYy4Ob1F1InQ/RU8JF/9lnF1
   wyBQiTvQ3OsLwyYbeblPVvZhm/hjTxckteKkqGvtpTkO6B/6W9RgIM7Wn
   nzxXXqVrMgz6dN4JchA3Ry3VXgfgRtAXghFA4KXaAIKeLSL/bcA73HMrg
   w==;
X-CSE-ConnectionGUID: YSQgYwo8THKJ6FollIJuKw==
X-CSE-MsgGUID: AZiORv+3TVOYyztERT1uSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="261201955"
X-IronPort-AV: E=Sophos;i="6.27,205,1786978800"; 
   d="scan'208";a="261201955"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 21:11:50 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id EB5CE42A30D
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 12:11:49 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 9A0C11C00133
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 12:11:49 +0000 (UTC)
Received: from FCCLS0092175.localdomain (unknown [10.9.61.34])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with SMTP id E5AFE1800A47;
	Tue, 10 Nov 2026 12:11:40 +0000 (UTC)
Date: Tue, 10 Nov 2026 21:11:39 +0900
From: Kohei Enju <enju.kohei@fujitsu.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>, 
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun <alpergun@google.com>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>, 
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com, Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: Re: [PATCH 00/11] KVM: arm64: CCA: Prepare Realm memory management
Message-ID: <avMI__K5XBf3z7wv@FCCLS0092175.localdomain>
References: <20261102141304.126883-1-steven.price@arm.com>
 <avLgdqlfUPMAI-r9@FCCLS0092175.localdomain>
 <e9bc3885-4e29-44a0-a186-463337f57d9e@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e9bc3885-4e29-44a0-a186-463337f57d9e@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_041152_731198_405B9E69 
X-CRM114-Status: GOOD (  21.76  )
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

On 11/10 11:54, Suzuki K Poulose wrote:
> Hi Kohei
> 
> On 10/11/2026 09:24, Kohei Enju wrote:
> > On 11/02 14:12, Steven Price wrote:
> > > This series adds the memory plumbing for CCA building on the basic
> > > plumbing[1] that has just been merged.
> > > 
> > > These patches add the internal realm VM state and RMM feature checks,
> > > prepare realm stage-2 setup and teardown, and provide RTT mapping and
> > > invalidation helpers. Realm memslots are now contrained to the lower
> > > half of the IPA space, because faults treat the protected and shared
> > > halves as aliasing. The final patch then connects these helpers to the
> > > KVM stage-2 MMU operations.
> > > 
> > > There's also an integration branch[2] that builds on this series and
> > > includes the realm descriptor creation, REC entry/exit, activation and
> > > the new uAPI. This series by itself is also available as a git
> > > branch[3]. However the new code isn't generally active without the full
> > > integration branch.
> > > 
> > > [1] https://lore.kernel.org/all/20261007073537.2454351-1-suzuki.poulose@arm.com/
> > > [2] https://gitlab.arm.com/linux-arm/linux-cca
> > >      branch: cca-host-mm/v1/integration
> > 
> > Hi Steve, thanks for your work on CCA upstreaming.
> > 
> > For testing purposes, could you clarify which TF-RMM revision (or commit
> > hash) you tested with? Although this MM series itself doesn't seem to be
> > particularly sensitive to changes in TF-RMM, testing the integration
> > branch could be affected by subtle changes in the RMM.
> 
> Tip of both the repositories should work (tf-a and tf-rmm).

Hi Suzuki,

Thanks for the clarification.

Then, unless otherwise specified in the cover letter or elsewhere, I'll
assume that the latest revisions of both repositories are expected to
work together going forward.

Thanks,
Kohei

