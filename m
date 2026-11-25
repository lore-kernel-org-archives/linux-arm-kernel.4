Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF082606A329
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 06:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xYwEZBWi;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=MvP4Qd0D
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cdqxXzF0nK7QzWfPYBzfNXGgW3hBDjtbpSIe6sOp4qA=; b=xYwEZBWiT2WIbMKU32H9IMGgzq
	BViY21q25tARUVQXiqYrsrV6dOsea8aXAyya85ivjUjnMyrGpR+Qh7zGDK6RjzZ6RvKLpC4JyvvRJ
	eeK5oEqwZ0S4lJ2u2Db7UHJHy2oCmYbmJ/EyBul5/4D4uxQyAlTDVEpuJ2OgUMHcLeCnNgQX8qtnH
	WM3k4HiObuETBTfmw7XFXE6Z7zoZZ7AgEvwVASGN1z78GcQ/X4Miq191URABXHdf5xnTudrGLStuN
	0Ikae6Htwe5bVxzibdUrq34PDvkAhYLi3MrQI+rApyMQ+cGn4gfOVHFlZlV0VibQsXTydvX51C35t
	RhcU7ZhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6cY-00000008ijI-3ue4;
	Wed, 25 Nov 2026 06:36:46 +0000
Received: from out30-97.freemail.mail.aliyun.com ([115.124.30.97])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6cW-00000008iic-2QpE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 06:36:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1795588598; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=cdqxXzF0nK7QzWfPYBzfNXGgW3hBDjtbpSIe6sOp4qA=;
	b=MvP4Qd0DU1yNYOpMAw5xmIkoEddP12YV8pFdD7zSYk1WaCIL/C5upix8UMOZL2Y5CfY98sTX13eN8wlXUj228F+Fn31Pd0Ze3HQh2f5BWrCyeddp37hlibAuW4j8AjRIObUQ6xxI0o7i3iPjNIUmIKmKYBbYRfRYdZIEF5ICKH0=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R491e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=ying.huang@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0XFQbIt-_1795588597;
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0XFQbIt-_1795588597 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 25 Nov 2026 14:36:38 +0800
From: "Huang, Ying" <ying.huang@linux.alibaba.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Yadong Qi
 <yadong.qi@linux.alibaba.com>
Cc: will@kernel.org,  mark.rutland@arm.com,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
  ryan.roberts@arm.com,  robh@kernel.org,  gregkh@linuxfoundation.org,
  ptg-linux-kernel@linux.alibaba.com,  stable@vger.kernel.org
Subject: Re: [PATCH] arm64: fixmap: fix missing break-before-make in
 __set_fixmap()
In-Reply-To: <awW3Dw743-rw_-cf@arm.com> (Catalin Marinas's message of "Tue, 24
	Nov 2026 16:10:55 +0000")
References: <20261123093505.974-1-yadong.qi@linux.alibaba.com>
	<awW3Dw743-rw_-cf@arm.com>
Date: Wed, 25 Nov 2026 14:36:36 +0800
Message-ID: <87mrqxto23.fsf@DESKTOP-5N7EMDA>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_223644_825033_F5ABE594 
X-CRM114-Status: GOOD (  15.83  )
X-Spam-Score: -17.6 (-----------------)
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
X-Spam-Status: No, score=-19.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Catalin Marinas <catalin.marinas@arm.com> writes:

> On Mon, Nov 23, 2026 at 05:35:05PM +0800, Yadong Qi wrote:
>> diff --git a/arch/arm64/mm/fixmap.c b/arch/arm64/mm/fixmap.c
>> index f66a0016dd02..5593d7e0d523 100644
>> --- a/arch/arm64/mm/fixmap.c
>> +++ b/arch/arm64/mm/fixmap.c
>> @@ -126,12 +126,19 @@ void __set_fixmap(enum fixed_addresses idx,
>>  
>>  	ptep = fixmap_pte(addr);
>>  
>> -	if (pgprot_val(flags)) {
>> -		__set_pte(ptep, pfn_pte(phys >> PAGE_SHIFT, flags));
>> -	} else {
>> +	/*
>> +	 * Break-before-make: when the slot still holds a valid mapping
>> +	 * (e.g. earlycon re-mapping FIX_EARLYCON_MEM_BASE), invalidate the
>> +	 * old entry and flush the TLB entries caching it before a new
>> +	 * mapping is installed, so old and new translations never coexist.
>> +	 */
>> +	if (pte_valid(__ptep_get(ptep))) {
>>  		__pte_clear(&init_mm, addr, ptep);
>> -		flush_tlb_kernel_range(addr, addr+PAGE_SIZE);
>> +		flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
>>  	}
>> +
>> +	if (pgprot_val(flags))
>> +		__set_pte(ptep, pfn_pte(phys >> PAGE_SHIFT, flags));
>>  }
>
> I guess that's easier than getting the driver or earlycon code to do
> clear_fixmap().

Yes.  And because set_fixmap() flushes the tlb on x86, IMHO, it's a
little hard to justify the driver modification.

However, set_fixmap() only flushes the tlb on the local CPU instead of
broadcasting the flush, because fixmap is either per-CPU or used during
early boot.  In theory, we could follow that approach and perform a
local flush instead though the benefit may be marginal.

---
Best Regards,
Huang, Ying

