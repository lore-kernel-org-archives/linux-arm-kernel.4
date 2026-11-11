Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AAF606A324
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 15:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rWGNemPc;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Dhj0+Yym
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zx9iLP78IiBq1ALzjHVMZmBMtAYpZpkd8prlcsOB6hg=; b=rWGNemPcS/4NoU
	8/ApBr72bJLsIUmf5NPdJdQCKkCfzCUi5hJcotu+KyjSYAm90+P3KWnYk9Ix0kfmGBBKNZMsAkXgt
	487n156fSp6w8ZR9EFayQYpZjGK91Wf4eTuZDPHTPmQT//ItPCLqW6aAk1U7mmYGVDDXk1FgBqoir
	sVf1zL1DMbU2w+H8gr0OHiSYl9Z/o37EGef2imJlYmsHuyLRrBLWwUOuWw5Dj4adgt+80/3fvL4hZ
	OB+Onl2S8hwpBzzQsA27fWrndWkRhbE/AK6SUlsBIHbEty80UPiuTozp1sg+edlw251MfE/hQYNq8
	tN7i4mmD2JM6LD2kr6Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRAGC-000000075GY-1VkF;
	Wed, 11 Nov 2026 15:29:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRAG9-000000075Fl-38cM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 15:29:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4C9A61576;
	Wed, 11 Nov 2026 07:29:09 -0800 (PST)
Received: from [10.43.20.72] (e126510-lin.lund.arm.com [10.43.20.72])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A40E73F632;
	Wed, 11 Nov 2026 07:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794410952; bh=zx9iLP78IiBq1ALzjHVMZmBMtAYpZpkd8prlcsOB6hg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Dhj0+YymHc7rFomknPwPRmnpBiVc9HeX4e1Mrc54aUxPNZzLyPVAjsbvoz7F/WA5c
	 x/6gWKxQMKSaONFtPfoPEoqkOwozaexXi53y72L4XOIUfLKIaabfuCO6VO8rtFgrHt
	 4l+2j1iAJMYNQaTu2anzXCelavKQ28MV+LNM1n5g=
Message-ID: <0b29393f-bb84-4df1-a699-f7afcb50f2e8@arm.com>
Date: Wed, 11 Nov 2026 16:29:02 +0100
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
 <9e59fd71-97e7-422c-a7dd-bc23c6e6a852@arm.com>
 <717cccfe-81d6-4e09-a466-5361ae27776f@sirena.org.uk>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <717cccfe-81d6-4e09-a466-5361ae27776f@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_072913_832921_BD7C6BC6 
X-CRM114-Status: GOOD (  12.68  )
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

On 10/11/2026 12:24, Mark Brown wrote:
> On Tue, Nov 10, 2026 at 10:01:36AM +0100, Kevin Brodsky wrote:
>
>> Do you mean adding the dependency KPKEYS_HARDENED_PGTABLES=y to
>> tools/testing/kunit/configs/all_tests.config? Indeed that would only be
>> meaningful on arm64 (for now). That said it wouldn't hurt other
>> architectures, so happy to add it there if you think that's worth it.
> Yes, or something like that - unfortunately KUnit checks to see if the
> config options appear in the configuration so something that vanishes on
> other architectures causes issues.

Alright, I guess there's not much we can do then, short of creating
arch-specific fragments.

> Perhaps the default for the config
> option ought to depend on KUNIT_ALL_TESTS?

Not sure I'm following, the config already has default KUNIT_ALL_TESTS?

- Kevin

