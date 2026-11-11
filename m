Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0396606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 10:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VgTyMTyx;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=MWmswE93
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5V9jRlyh7Ihg0NTQ3+KjZaPOqstTGKiqiBozrCfwUxY=; b=VgTyMTyxKundCv
	r9hnXP7unTAGXxn/apJ2GJBHf6S10+jgp3nqsRySrljhD1B6eUUITrgdW6SMBww3QhK19FNAx9dGq
	bH3klEH6YDv9Z+NQNh8OONLGSG5nS+hdHr1YZ9HFRejp3GImCr/DXhEAKnYJy1W/HWDKkkrujsSfz
	0m6Lv2++BP8HKtlg+YCe8dnDlsAiB43qJJHEfmVNcsC+xVyunOb09EG6YDwmFVfjachsy3ZQb4lwE
	T99tnxtAbTy0RYDUksMYc4UseueS8vkDjFOxMkE1T6j8ZMNRIOUD27gvMjaLaUAorSu+HSeKj7Sr+
	9r5noYWnZcZpH6PYhS5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR5Xb-00000006LLs-3vA7;
	Wed, 11 Nov 2026 10:26:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR5XZ-00000006LKu-1utJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 10:26:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2EBED2F;
	Wed, 11 Nov 2026 02:26:47 -0800 (PST)
Received: from [10.57.63.24] (unknown [10.57.63.24])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9770F3F632;
	Wed, 11 Nov 2026 02:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794392810; bh=5p/zP+v+C50UsZoAhPNAyBGrgi2Vxw0z5RAhgrPcN0k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MWmswE93spZbG2V0obRVIKBymfeULcFqEbj2cVnHxFaY5kyeW/5QiG+uLZDVflVGi
	 2C77Gaqu/MzBzW/w8VmfSod584m9JMJoYwQ5iuh3UEd4+jjlIHFkwwezDCHM5pGV6p
	 M+ch4d/6NeEOTwtoO+eqNyC1tAY1uTMp8qcFSlgM=
Message-ID: <45b19233-741e-46c8-a6c1-28775c4d646d@arm.com>
Date: Wed, 11 Nov 2026 11:26:39 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v10 04/22] arm64: Implement asm/kpkeys.h using POE
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
 <20261109-kpkeys-v10-4-aa6c4d9603bc@arm.com>
 <07b55bf9-e116-4731-9f84-49cd1b55fa50@sirena.org.uk>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <07b55bf9-e116-4731-9f84-49cd1b55fa50@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_022653_545820_CEBFF1E6 
X-CRM114-Status: UNSURE (   7.79  )
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

On 10/11/2026 15:19, Mark Brown wrote:
> On Mon, Nov 09, 2026 at 03:58:29PM +0000, Kevin Brodsky wrote:
>
>> +#define POR_EL1_INIT	POR_ELx_PERM_PREP(0, POE_RWX)
>> +
>> +#ifndef __ASSEMBLY__
> Everything else in arch/arm64 was converted to __ASSEMBLER__.

Good catch, copy/pasted the wrong one when I first wrote this!

- Kevin

