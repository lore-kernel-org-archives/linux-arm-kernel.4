Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFEA5606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 12:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PJrQYXPj;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=G92ewwS6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qwGHYWqkzjPKzDNH4i/tvvgZ4hxVWyzdRGgiuO5uYi0=; b=PJrQYXPjDekyfT
	WQNZZMQukA2CuF4ez/zv+s4FxBuNVAssIOQtKk/JsHeXGvxwmZUz2ndtJzvw57oIKL+2bNlBDImVR
	s68Paz/brHD+9QKZHXtZrwfQBO9ZqmuM7ELfCbbwjQJnWHW7sWdCNIkBHQ762BcBVe7WEJMwYnmMv
	MQj3V6Cd2ONZVO8V2u7IwkKwOjJvcSRYF+CyiMBMyAEpvUFMocXCrMtDyHt6ycfc+OhEjbXYCr+mC
	g6NY+8YcCdOzeytRAk/pGSAiP5KJ5EV7jo9CWLJHbPzMS5KgXmWOYq73vzR5/WAtCH8NvxrFTKjBp
	N41VKCAnSRBLD8YW6/uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRU4R-00000009u2J-32xj;
	Thu, 12 Nov 2026 12:38:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRU4P-00000009u1k-2Shr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 12:38:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 354211477;
	Thu, 12 Nov 2026 04:38:21 -0800 (PST)
Received: from [10.57.59.183] (unknown [10.57.59.183])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F0E6E3F673;
	Thu, 12 Nov 2026 04:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794487104; bh=GXDArifiTXzGS/TEyKUeQy694OV8tzZyyHhxUDTufKU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=G92ewwS69xI/sQnwPuFxDuaGeeicD5gWXRAQcqnYkeOnE+1AhuhQD+T9u+2gEnSvA
	 8Tz0b5fy8Nanp500jVMIfPIBqybgWOu28wUx9eUNS6BsJB8hlKLfKfowurrVqb8yg0
	 gegWtANRaNOjC5bAe0P7rnTdXxQKCb9wTnu50CiQ=
Message-ID: <7b92f7c8-1543-447e-8ef3-aba608141699@arm.com>
Date: Thu, 12 Nov 2026 13:38:13 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v10 07/22] arm64: Initialize POR_EL1 register on
 cpu_resume()
To: Yeoreum Yun <yeoreum.yun@arm.com>, Mark Brown <broonie@kernel.org>
Cc: linux-hardening@vger.kernel.org, Andrew Morton
 <akpm@linux-foundation.org>, Ard Biesheuvel <ardb+git@google.com>,
 Andy Lutomirski <luto@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 "David Hildenbrand (Arm)" <david@kernel.org>, Jann Horn <jannh@google.com>,
 Jeff Xu <jeffxu@chromium.org>, Joey Gouly <joey.gouly@arm.com>,
 Kees Cook <kees@kernel.org>, Linu Cherian <linu.cherian@arm.com>,
 Linus Walleij <linusw@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Maxwell Bland <mbland@motorola.com>,
 "Mike Rapoport (IBM)" <rppt@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Pierre Langlois <pierre.langlois@arm.com>,
 =?UTF-8?Q?Pierre-Cl=C3=A9ment_Tosi?= <ptosi@google.com>,
 Quentin Perret <qperret@google.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Vlastimil Babka <vbabka@kernel.org>,
 Will Deacon <will@kernel.org>, Yang Shi <yang@os.amperecomputing.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org, x86@kernel.org, Ira Weiny <iweiny@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, Thomas Gleixner <tglx@kernel.org>
References: <20261109-kpkeys-v10-0-aa6c4d9603bc@arm.com>
 <20261109-kpkeys-v10-7-aa6c4d9603bc@arm.com>
 <be361be8-c5ad-4ff7-a6db-7b0815bfe1d0@sirena.org.uk>
 <avNH_AdvK9AqvfF7@e129823.arm.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <avNH_AdvK9AqvfF7@e129823.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_043825_667928_FC6FFA85 
X-CRM114-Status: UNSURE (   9.15  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/11/2026 17:36, Yeoreum Yun wrote:
> On Tue, Nov 10, 2026 at 03:53:30PM +0000, Mark Brown wrote:
>> On Mon, Nov 09, 2026 at 03:58:32PM +0000, Kevin Brodsky wrote:
>>> From: Yeoreum Yun <yeoreum.yun@arm.com>
>>>
>>> The POR_EL1 register is reset to an unknown value after cpu_suspend().
>>> Since POR_EL1 always holds POR_EL1_INIT when entering cpu_suspend(),
>>> initialize POR_EL1 with POR_EL1_INIT before cpu_do_resume().
>>>> +#ifdef CONFIG_ARM64_POE
>>> +alternative_if_not ARM64_HAS_S1POE
>>> +	b	.Lskip_por_set
>>> +alternative_else_nop_endif
>>> +	mov_q	x2, POR_EL1_INIT
>>> +	msr_s	SYS_POR_EL1, x2
>>> +	/* isb can be skipped since cpu_do_resume() will do it. */
>>> +.Lskip_por_set:
>>> +#endif /* CONFIG_ARM64_POE */
>> cpu_do_resume() will update TCR2_EL1 to enable POE again, a sufficiently
>> unhelpful implementation could potentially decide to do that before this
>> POR_EL1 value takes effect AFAICT given that there's no barriers.
> Thanks. seems required to isb() after initialising SYS_POR_EL1.

Agreed (as Sashiko reported as well). Presumably that means we also need
an ISB after writing to POR_EL1 in cpu_enable_poe(), as that's basically
the same situation.

- Kevin

