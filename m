Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A199606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 03:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zqns109N;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=ysZhgFT+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6Wy5oFRN2V0Kiq6yTdbpLe5sq9EA0nzBLoJ1V+78Tzk=; b=zqns109NYS0IPk2bDAX+UcfGYr
	+IhSthxpe2zVzQdgRLevqru6pQSqVg7onIQenWzNTij/0c+ZeconuhNKniXjZSqIw9Pxl/y0+1EBf
	3eXlAz1o7R0R2SnVVcWCze+glu/7AULFL5FwYICq/a2j27QhzrEUFQiVGSQUFLQuiRzuFqn7orz73
	g3hhf4JkhMZdlKRF4W/sohtm2Zwn+EaN4e+1MdeG3Z35OnFFYeK4zkdao8ubNhV1taGWsp//MjE+4
	52TLLLQzazkC2vWeS1CcrsDFcnwk2RD4YrSietmk5Xq1lqKIzXPvST5GAD7iK9U+QQ3BOdtQX09bP
	6MNAISoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWPRB-0000000Bw1y-3kwK;
	Thu, 26 Nov 2026 02:42:17 +0000
Received: from out30-112.freemail.mail.aliyun.com ([115.124.30.112])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWPR9-0000000Bw1b-3cEu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 02:42:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1795660933; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=6Wy5oFRN2V0Kiq6yTdbpLe5sq9EA0nzBLoJ1V+78Tzk=;
	b=ysZhgFT+NinjLaPnG/zjYSP1GbeW/XQuZlqKXNkXBTjBylETvmY3FkVWy/cN2IDIZ6c5uTL6KC4WdWKenk6PNCesdcIxS7M8GSOYdFqv0IGsxRlFQ+bVnOc5XL2co5bEvFwIFHj9hzVLnDVOt89jPGDvb/RbScdsiUAzFfVhSwg=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=ying.huang@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0XFT.1oD_1795660931;
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0XFT.1oD_1795660931 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 26 Nov 2026 10:42:12 +0800
From: "Huang, Ying" <ying.huang@linux.alibaba.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Yadong Qi <yadong.qi@linux.alibaba.com>,  will@kernel.org,
  mark.rutland@arm.com,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org,  ryan.roberts@arm.com,  robh@kernel.org,
  gregkh@linuxfoundation.org,  ptg-linux-kernel@linux.alibaba.com,
  stable@vger.kernel.org
Subject: Re: [PATCH] arm64: fixmap: fix missing break-before-make in
 __set_fixmap()
In-Reply-To: <awbvHVSX7sB8jzYA@arm.com> (Catalin Marinas's message of "Wed, 25
	Nov 2026 14:22:21 +0000")
References: <20261123093505.974-1-yadong.qi@linux.alibaba.com>
	<awW3Dw743-rw_-cf@arm.com> <87mrqxto23.fsf@DESKTOP-5N7EMDA>
	<awbvHVSX7sB8jzYA@arm.com>
Date: Thu, 26 Nov 2026 10:42:11 +0800
Message-ID: <87wlq0s48s.fsf@DESKTOP-5N7EMDA>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_184216_239083_E773E821 
X-CRM114-Status: GOOD (  19.33  )
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

> On Wed, Nov 25, 2026 at 02:36:36PM +0800, Huang, Ying wrote:
>> Catalin Marinas <catalin.marinas@arm.com> writes:
>> 
>> > On Mon, Nov 23, 2026 at 05:35:05PM +0800, Yadong Qi wrote:
>> >> diff --git a/arch/arm64/mm/fixmap.c b/arch/arm64/mm/fixmap.c
>> >> index f66a0016dd02..5593d7e0d523 100644
>> >> --- a/arch/arm64/mm/fixmap.c
>> >> +++ b/arch/arm64/mm/fixmap.c
>> >> @@ -126,12 +126,19 @@ void __set_fixmap(enum fixed_addresses idx,
>> >>  
>> >>  	ptep = fixmap_pte(addr);
>> >>  
>> >> -	if (pgprot_val(flags)) {
>> >> -		__set_pte(ptep, pfn_pte(phys >> PAGE_SHIFT, flags));
>> >> -	} else {
>> >> +	/*
>> >> +	 * Break-before-make: when the slot still holds a valid mapping
>> >> +	 * (e.g. earlycon re-mapping FIX_EARLYCON_MEM_BASE), invalidate the
>> >> +	 * old entry and flush the TLB entries caching it before a new
>> >> +	 * mapping is installed, so old and new translations never coexist.
>> >> +	 */
>> >> +	if (pte_valid(__ptep_get(ptep))) {
>> >>  		__pte_clear(&init_mm, addr, ptep);
>> >> -		flush_tlb_kernel_range(addr, addr+PAGE_SIZE);
>> >> +		flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
>> >>  	}
>> >> +
>> >> +	if (pgprot_val(flags))
>> >> +		__set_pte(ptep, pfn_pte(phys >> PAGE_SHIFT, flags));
>> >>  }
>> >
>> > I guess that's easier than getting the driver or earlycon code to do
>> > clear_fixmap().
>> 
>> Yes.  And because set_fixmap() flushes the tlb on x86, IMHO, it's a
>> little hard to justify the driver modification.
>> 
>> However, set_fixmap() only flushes the tlb on the local CPU instead of
>> broadcasting the flush, because fixmap is either per-CPU or used during
>> early boot.  In theory, we could follow that approach and perform a
>> local flush instead though the benefit may be marginal.
>
> Local TLBI won't work on arm64 since the page tables are shared (any CPU
> can speculatively load the TLB) and only FIX_VNCR has per-CPU entries.

Got it.  IIUC, because we have the shared page table and the BBM
restriction, even if we change the PTE for a per-CPU entry, we still
need to use a global TLBI.

---
Best Regards,
Huang, Ying

