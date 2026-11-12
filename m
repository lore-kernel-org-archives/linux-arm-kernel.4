Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FE5606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 13:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WiCUQhQA;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=qhR8siKF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wTBvg55fBuWD5tQeyFYmzV7yA87nWgeKUd2BDomzFCs=; b=WiCUQhQAHrktwr
	6XTz82m6I5UBwHNfpSbzWXm/roy+NEvtgc4lGc2PrQ8I5nfUfP0y0PhnZQ6ccqFIINrsEvLXEtn7G
	zfbp6HeWCNIaz+YZxsgmZ5qeblDr1G612PGs42glLdEOMkKBK8xIjkfo0RLen6rMDEBnoBa/mYzm8
	odOacVA6orU+xn5toDin1MlmFHUHQGKPvFcEbmzdnPeggjV3ktB28jfqgnYGMtrRFr7bh3Dl8/fvc
	PukwElDZXGbo31bZ2TtEATJ2pxc9JsGeg0ZlG2KnRjiC8K3b+Dd+LgovWeadKv3hGbNUCpJgLJxz9
	RWZFdttseNaKdBIKrsBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUfW-00000009ztQ-3w3f;
	Thu, 12 Nov 2026 13:16:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUfU-00000009zt8-06Yc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 13:16:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 25CFD1477;
	Thu, 12 Nov 2026 05:16:40 -0800 (PST)
Received: from [10.57.59.183] (unknown [10.57.59.183])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 008353F632;
	Thu, 12 Nov 2026 05:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794489403; bh=wTBvg55fBuWD5tQeyFYmzV7yA87nWgeKUd2BDomzFCs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qhR8siKF3uHjUA/hWmh1H8py+Ns7uPCZYEMtvUSIeYR5dIH30FjHUDT4bD49VvDcb
	 I5k/ohiMpYz3LO+MsI+K1M42BEms0asveRWV7ANV92sDMfAMZoQct9bN5pPyWH2lLi
	 +OTp7Uve9C+YFkm6cp8nZIyyLv2wUgeasDHv3a7E=
Message-ID: <9148043e-580c-42e5-a93f-3a177f8d75df@arm.com>
Date: Thu, 12 Nov 2026 14:16:33 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v10 07/22] arm64: Initialize POR_EL1 register on
 cpu_resume()
To: Mark Brown <broonie@kernel.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, linux-hardening@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Ard Biesheuvel <ardb+git@google.com>, Andy Lutomirski <luto@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
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
 <7b92f7c8-1543-447e-8ef3-aba608141699@arm.com>
 <6808f3a6-1c12-4cb2-a109-30704d812490@sirena.org.uk>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <6808f3a6-1c12-4cb2-a109-30704d812490@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_051644_134834_CA0F4F99 
X-CRM114-Status: UNSURE (   8.36  )
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

On 12/11/2026 14:02, Mark Brown wrote:
>> Agreed (as Sashiko reported as well). Presumably that means we also need
>> an ISB after writing to POR_EL1 in cpu_enable_poe(), as that's basically
>> the same situation.
> Possibly just have one before writing TCR2_EL1 rather than for each of
> the indvididual features, that's harder to mess up?

cpu_enable_poe() directly writes to TCR2_EL1 so surely the extra ISB has
to be there (between writing to POR_EL1 and writing to TCR2_EL1)?

In _cpu_resume for now I'd keep the ISB directly after writing to
POR_EL1, as I'm not sure the ordering is needed for anything but POE and
it seems easier to follow with the ISB right after POR_EL1.

- Kevin

