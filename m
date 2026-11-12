Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46EEF606A89C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 11:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EThsB6EA;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=t64olPTY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YL9vPLbC3ZW14DvANU3hpZtkl64GE6Cg8WE0isE/rfA=; b=EThsB6EARn7wOr
	3gZYXKaAROMBqlgQGlTHFQx4ECI5SR03GNwEDUXtUueBbhsormJhJs4Su0LKdEA0HHu6zc+4LCi//
	xEEsbxV9SoCGntdQN///nAVy8O57wrOfmbGyrGRFFUdSS5kLUSlxfVIB8n/p9ipsUfNrlIllV0135
	gKFet6/G93Q64VQzOYbwOSCr13pZEskh0dvMSs2fLl8FdWeXplXq1crleTAQAUI6ViET6LEv/jwyR
	Wm5YforWaFQLzCtyDQIrRPeybmSaEMcZ/7zCqu/If+fYC+xJxD8mDPZ1neNjl+WYIx81BwRUljb97
	lj8zqiw/k37TqX1HGwVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRT9q-00000009kfk-3uk6;
	Thu, 12 Nov 2026 11:39:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRT9o-00000009kfE-2TOA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 11:39:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 680D81576;
	Thu, 12 Nov 2026 03:39:49 -0800 (PST)
Received: from [10.57.59.183] (unknown [10.57.59.183])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3E85A3F632;
	Thu, 12 Nov 2026 03:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794483592; bh=ZqrSL8M+EK26zZlTilw3+OBU1RXFJn7OmIH1wj8UGK8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=t64olPTYqsoQruagzwJOaBesAbiAuLSWj19fX/8b7GkaY+T0lCZpZaJDwCz7A9L7V
	 +fqxsw7u8kA5Dpjlo5v6OChVIthmr7+a0bvXzVahIPw5GvhtMB39qoCGMRCkXDT77T
	 iTNyJwWtn5UF4h3ugfYVxBZJaw1lYK9xBCS4ekKo=
Message-ID: <4fab7e04-c429-4a35-9945-57eea8c97144@arm.com>
Date: Thu, 12 Nov 2026 12:39:42 +0100
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
 <0b29393f-bb84-4df1-a699-f7afcb50f2e8@arm.com>
 <9deffbb1-75fd-407e-90cc-59bf4c2fa1a6@sirena.org.uk>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <9deffbb1-75fd-407e-90cc-59bf4c2fa1a6@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_033956_742834_05001B5D 
X-CRM114-Status: GOOD (  17.70  )
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

On 11/11/2026 17:15, Mark Brown wrote:
>>> Yes, or something like that - unfortunately KUnit checks to see if the
>>> config options appear in the configuration so something that vanishes on
>>> other architectures causes issues.
>> Alright, I guess there's not much we can do then, short of creating
>> arch-specific fragments.
> Or my suggestion below, or come up with some generic option that could
> always be there and would in turn select hardening things.  There's
> probably a case for having something given that the hardening features
> will tend to catch some kinds of test error but that feels more config
> fragment like.  Another idea would be to teach KUnit about the idea that
> it should try turning on some config options but not worry if they're
> not selected.
>
>>> Perhaps the default for the config
>>> option ought to depend on KUNIT_ALL_TESTS?
>> Not sure I'm following, the config already has default KUNIT_ALL_TESTS?
> The config for the test does, but KPKEYS_HARDENED_PGTABLES which the
> test depends on does not so unless the underlying defconfig turns that
> on the test won't be enabled.  I was suggesting also adding a default
> for testing.

Ah got it. It doesn't look like there's a precedent for KUNIT_ALL_TESTS
having that kind of side effect though.

A separate fragment for hardening options where KUnit ignores options
not getting selected seems like a reasonable approach.

- Kevin

