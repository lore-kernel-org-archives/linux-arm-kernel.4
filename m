Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5407E60A2622
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 09:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F2T/xBCf;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=mlXxr88Y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=N5RMWLcP7isxBVM2qsk29DjsEb+SK3rhdns3s69Yvq8=; b=F2T/xBCffxfpDA
	Jsmtu/aU7rm6pt/rI4th2yAoDXO4aIgkEUpVF/9Yw5weOfFIWOIqekrQUf0kOaLUD+GcKoEp4Qrx6
	G9vObLq/TmODf80xpcPOtsayxqOHMQ5Wme7JU3MHfrCsk30bAFcwQXFH+6YOSjnuApEhL2s/xYwrc
	q7HKtisIHJi3MHtQDcIbxLNrD1SAluoqi+4kMxXbGkrM9W3Y9nuySOiGN7WTxKeQzoyGi12v5y4tZ
	R3xRnPMHq9XFpIAft6WuDVhhEbbbXNLcqBU3pCUKG6Hpe5Y04ELuJfV1CnM0PipZi2qiO85MxSASk
	3Ah/t1V8C3UfNq16YEzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQhjh-00000003CCM-0rCj;
	Tue, 10 Nov 2026 09:01:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQhjf-00000003CBw-35jg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 09:01:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 665221516;
	Tue, 10 Nov 2026 01:01:43 -0800 (PST)
Received: from [10.57.60.120] (unknown [10.57.60.120])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A60013F85F;
	Tue, 10 Nov 2026 01:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794301306; bh=9CU41Se9la/KtdDwMQULrIKfytvMpdfr7XLUHb+OkJk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mlXxr88YJEAGdd0L2wAgQsnosP8cErHqpjtUnIFgrZRlpeDVMedSkCWzs5XJQabcP
	 AYoasvJ/eG3DdRL64rFmaMFN2uhjRLcP6I3ZkVQpszUmeizzIzpLY6LqjYw9gK2PiX
	 Tw4LA2EMpYvVCFN3nkVI0GLFrsqAWZf0DZ7bW+m8=
Message-ID: <9e59fd71-97e7-422c-a7dd-bc23c6e6a852@arm.com>
Date: Tue, 10 Nov 2026 10:01:36 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v10 22/22] mm: Add basic tests for
 kpkeys_hardened_pgtables
To: Mark Brown <broonie@kernel.org>
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
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, x86@kernel.org,
 Ira Weiny <iweiny@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>
References: <20261109-kpkeys-v10-0-aa6c4d9603bc@arm.com>
 <20261109-kpkeys-v10-22-aa6c4d9603bc@arm.com>
 <2d13fbb7-b5b4-446e-8709-5b43349ff19a@sirena.org.uk>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <2d13fbb7-b5b4-446e-8709-5b43349ff19a@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_010147_819414_594EE046 
X-CRM114-Status: GOOD (  13.64  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 09/11/2026 20:28, Mark Brown wrote:
> On Mon, Nov 09, 2026 at 03:58:47PM +0000, Kevin Brodsky wrote:
>
>> ---
>>  mm/Makefile                               |   1 +
>>  mm/tests/kpkeys_hardened_pgtables_kunit.c | 200 ++++++++++++++++++++++++++++++
>>  security/Kconfig.hardening                |  12 ++
>>  3 files changed, 213 insertions(+)
>> +config KPKEYS_HARDENED_PGTABLES_KUNIT_TEST
>> +	bool "KUnit tests for kpkeys_hardened_pgtables" if !KUNIT_ALL_TESTS
>> +	depends on KPKEYS_HARDENED_PGTABLES
>> +	depends on KUNIT=y
>> +	default KUNIT_ALL_TESTS
> I'd also expect to see this added to one of the KUnit config fragments
> somewhere so it gets run as standard, though that's a little awkward
> given that KPKEYS_HARDENED_PGTABLES isn't universally available.

Do you mean adding the dependency KPKEYS_HARDENED_PGTABLES=y to
tools/testing/kunit/configs/all_tests.config? Indeed that would only be
meaningful on arm64 (for now). That said it wouldn't hurt other
architectures, so happy to add it there if you think that's worth it.

- Kevin

