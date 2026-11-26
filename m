Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137B9606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 09:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eDZImv3N;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=PZO/3fWh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PKb6Lv9566jmrUekmyibhfShQVVqbzLTnv8vBBP6Now=; b=eDZImv3Nfp8dOH4pEf9J6SdKyc
	JilSX6QQNtlhMkh26ry/nRwOkuzXbNSbiR4AezKJoZcE4o/ubxPEh3m26V5KqUzg2zsnhTIdIj1KE
	spIMQmobEmCQPHNmlg+Xxqt8M4iJAFZ/D4d3knu65olMSvtnYjTUYaSU2Gad3K0HNUiyPtqF8swGn
	ncMdEKjpIHogH0NATOqJ8vvbwbP1lWbYfQex6rKc/iV/rfASGouv6k+5WtsRHMtNr5FlPnf0tSqUl
	DeFk+jkzqcLMezW+kE+DVZcxH1kJB6ku0aaa5NqMEWF3aSnyMBaztDXETjAxGCmNM9ZhbAVLDrIAW
	W2T3tH1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVdq-0000000CWKM-0hUr;
	Thu, 26 Nov 2026 09:19:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVdZ-0000000CW9z-0fJL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 09:19:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3FDD21BA8;
	Thu, 26 Nov 2026 01:19:20 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 487F73F632;
	Thu, 26 Nov 2026 01:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795684763; bh=vajJYokIaDsQB/sfzZSuHY7xzgLKhIl9RiIc0CiMP7M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PZO/3fWhC5W9JAJ/9Wb15a5WWLLUli+0Uw9MLzgcrP4nxxb+ccxeXMKQDoh0VXr04
	 4XtUtt6AYL4ci7HWenQS2G+FFW+Ra2KhjHUK4noxBSUVfTxh6w5PY6e1V0cIpJJQt0
	 +ujUG/yVTpFGFZoXZqcGc10m6V4HGn9IHErS0xYI=
Date: Thu, 26 Nov 2026 09:19:18 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
	akpm@linux-foundation.org, david@kernel.org,
	pasha.tatashin@soleen.com, ryan.roberts@arm.com,
	rmclure@linux.ibm.com, baolin.wang@linux.alibaba.com,
	kevin.brodsky@arm.com, kas@kernel.org
Subject: Re: [PATCH] arm64: mm: clarify necessity of isb() in
 emit_pte_barriers()'s comments
Message-ID: <awf5lpDczOUak7eO@e129823.arm.com>
References: <20261125183805.1188848-1-yeoreum.yun@arm.com>
 <pzq4vyyvychgi5rvnunyxaotl6oo3afwuedza5epnfiqbfxces@lyw7ffhmp2dr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <pzq4vyyvychgi5rvnunyxaotl6oo3afwuedza5epnfiqbfxces@lyw7ffhmp2dr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_011929_513993_5A004D3F 
X-CRM114-Status: GOOD (  14.08  )
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

Hi Anshuman,

> On Wed, Nov 25, 2026 at 06:38:05PM +0000, Yeoreum Yun wrote:
> > The dsb() in emit_pte_barriers() makes the pte store visible to the
> > table walker. However, without FEAT_ETS2, address translation for a
> > subsequent data access may occur speculatively before the dsb() completes,
> > potentially observing the old invalid PTE according to
> > Arm ARM DDI0487 M.d:
> > 
> >   B2.6.9 Data Synchronization Barrier
> >   ...
> >   In addition, no instruction that appears in program order after the DSB
> >   instruction can alter any state of the system or perform any part of
> >   its functionality until the DSB completes other than:
> >   ...
> >     - If FEAT_ETS2 is not implemented, translating any virtual addresses of
> >       instructions that generate Explicit Memory Effects.
> >   ...
> 
> Above wording checks out in the ARM ARM.
> 
> > 
> > Document this behavior and reference Arm ARM DDI0487 M.d, B2.6.9 to
> > clarify why the dsb() alone is insufficient to prevent a spurious fault.
> 
> Documenting FEAT_ETS2 dependence nuance in the comment does make sense.
> FEAT_ETS2 is mandatory from Armv8.8 onwards. Hence this might not be a
> real issue on the field ?

Right, the intention is to clarify the existing barriers.

[...]

-- 
Sincerely,
Yeoreum Yun

