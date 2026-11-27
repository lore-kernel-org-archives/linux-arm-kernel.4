Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FAD5606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 15:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=biW3alHW;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Q4hiAaGA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zJMYmG+hFRAiAQXsXLcPjjAA+AdGp4gOt8/ZQXWz6Iw=; b=biW3alHWXvdXZsyMGMV1BSNS2u
	+AeQ4EbHs8XFD5w17HPbTGh0cwouvKF5sbIHDZrK6yfRlokRc9bu02y6svH8ZRSm9Sj3zOGJrf5eW
	y2zeH6ffCY1wtSJeTo7KvBy1XVv514NMLwCiHX31VFnm04xurV/zyF9W9WOhywtghJG04Vk+AmmtM
	eqoTxsiSlONRAm9pUXYE9MByY3l7Qnodk1Oq6Kw+6mnbJ9zoFt4gSapQ0PVBps+xDsqauUVSWSIkh
	+bErjCi8HLQQEjHfbbYKxxRL432cG0PXDEyljhaeHrgntBEJbMbpqgz6wDf/hJCLcilDKJBb5wNBj
	Jmfth2PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxVM-0000000Gh0a-2tKP;
	Fri, 27 Nov 2026 15:04:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxVJ-0000000GgzS-16bH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 15:04:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 709E3169E;
	Fri, 27 Nov 2026 07:04:45 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 454E23F632;
	Fri, 27 Nov 2026 07:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795791888; bh=Kf2u3+pp6YKT0cNUHCqSJb7trEljWxemN2FamiU/bxs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q4hiAaGAw0EWPBEIOOeQkDgfHDkovS4x7Dg78UF0E/14h8/L2HyTx/tE5cNqhWF+W
	 GSweeM6g3cvkUwPn1fDT2yNteGV/MJvxBjVEGkIqM2wWwWH+RUM/tYSO9wSfdy35Cj
	 YYuc9m2+vc/SV0SLahDEc27J69+uBMD8Rfmbb5Mk=
Date: Fri, 27 Nov 2026 15:04:42 +0000
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: maz@kernel.org, oupton@kernel.org, fuad.tabba@linux.dev,
	joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, will@kernel.org, mark.rutland@arm.com,
	linux-perf-users@vger.kernel.org, catalin.marinas@arm.com,
	james.clark@linaro.org
Subject: Re: [RFC PATCH v7 08/28] HACK! KVM: arm64: Disable SPE
 virtualization if protected KVM is enabled
Message-ID: <awmcCq3p0gOX1n_5@raptor>
References: <20260903160623.315525-1-alexandru.elisei@arm.com>
 <20260903160623.315525-9-alexandru.elisei@arm.com>
 <atIzmvlo78PDwAXI@gremlin>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atIzmvlo78PDwAXI@gremlin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_070450_047783_58AF8AA6 
X-CRM114-Status: GOOD (  20.17  )
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

On Fri, Oct 16, 2026 at 03:30:26PM +0100, Lorenzo Stoakes (ARM) wrote:
> On Thu, Sep 03, 2026 at 05:06:03PM +0100, Alexandru Elisei wrote:
> > For RFC only.
> >
> 
> I realise this isn't intended for the final series :) but be good to put
> something here briefly for reviewers to explain why this is here, e.g. pKVM
> needs special attention etc. Similar comment for 9, 10 if there's an RFC
> respin.
> 
> So for this and patches 9, 10 in general it seems you disable the feature
> for:
> 
> - pKVM (at global level)
> - non-VHE
> - nested virt
> 
> Are these temporary for proof-of-concept reasons or do you plan to make
> them permanent limitations for the initial implementation of SPE?

This was intended to be temporary ('For RFC only'), until we can get to a
consensus that using guest_memfd to keep memory mapped at stage 2 for SPE is
viable.

As per the ongoing conversation on the cover letter [0], it is possible
that these limitations (VHE-only, no pKVM, no NV) might end up as part of
the initial implementation.

[0] https://lore.kernel.org/kvmarm/auy-TwnMbIn-r2xl@gremlin/

> 
> If the former it'd be good to know what your plans are to provide support
> for these, if the latter it seems sensible to put these all in one patch
> that describes why you are limiting each.

The reason for each limitation:

- VHE-only: to save me the effort to implement the context switching code, which
  is a pain to get right. Arguably this is the easiest to implement out of the
  three though.

- no pKVM: last I checked, the __host__ SPE driver is broken under pKVM, didn't
  even bother figuring out if it can be made to work for a guest.

- no NV: too much complexity around reinjecting an SPE fault back into the L1
  hypervisor for an RFC. I'm also not sure if KVM can configure VNCR_EL1 to
  transform accesses to the profiling buffer system registers to memory accesses
  instead of traps, and how that interacts with the errata workarounds, and with
  dirty page logging.

Thanks,
Alex

