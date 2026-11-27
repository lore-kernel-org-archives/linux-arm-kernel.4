Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3742A606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 09:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zibA5cV9;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=qSwD7ArU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kRUs7ZAA7rua9kayF2pDKhc5cHCXtHDqEJmwG/etACg=; b=zibA5cV9sYZZm/
	+tyH8FSTEuUAv8DFCsesQ1gmrDrFGKCQts2F8Lmal9b1JBGNBszcH0MD2SopMixykdhb3QPHOWRyu
	mqQXL3CEWuCxz5ERUXTySidAd248VKGMi/hlykB60q4Vl0tWrgdW0Hg0mj4mSOLE+vdjwX/6jNatx
	SqN2d9nPFdI/JZQDEOF69KlctDdyvjT5+xC1Nbx2fBRagkhDy3k1vtQJ0+THHTUkIzP7Lq7wWylEJ
	J/NnRCr/Y580jvmfK0fkG6pGd+r/7Rg9re5ratrE3gGlVasqjeNSiP8mUJmb0ZRd0mStFEr4p585q
	bd4tL1/koabjfKRA2cRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsDA-0000000FQpv-1DQJ;
	Fri, 27 Nov 2026 09:25:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsD7-0000000FQob-0CgZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 09:25:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 26D5B1758;
	Fri, 27 Nov 2026 01:25:37 -0800 (PST)
Received: from [10.57.71.121] (unknown [10.57.71.121])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D74C73F632;
	Fri, 27 Nov 2026 01:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795771540; bh=YSVAsM6E2UvKH/5A+IJHT62yGjSLzdtkY7GEKsxCbj8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qSwD7ArUfrns96Uw1W2Xa+LsibwtUL38fvGa1XA+o3Eb9WK1PWh0vvWyS25qzXIVE
	 DFzPx8Q+CthlFKA6eOGCTMr/0msCmiDMzHxA/VDblvqpAGzy2czZqK1WBlUnnNfKqw
	 B0dH1N7W29k/ong6SVwymn1QXfAEiwJV60Rr9Ozo=
Message-ID: <9e4fa895-14eb-4770-8248-ad1da1503ddc@arm.com>
Date: Fri, 27 Nov 2026 09:25:36 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/23] coresight: trbe: Refactor buffer and IRQ
 handling
Content-Language: en-GB
To: Will Deacon <will@kernel.org>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>,
 Leo Yan <leo.yan@arm.com>
Cc: catalin.marinas@arm.com, mark.rutland@arm.com, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <179571394630.2992027.10346522745976163448.b4-ty@kernel.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <179571394630.2992027.10346522745976163448.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_012541_218910_D428D818 
X-CRM114-Status: GOOD (  13.71  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 26/11/2026 17:56, Will Deacon wrote:
> On Fri, 16 Oct 2026 17:54:58 +0100, Leo Yan wrote:
>> This series follows the earlier TRBE buffer refactoring posting [1].
>> The work is now split into two parts. This first part contains fixes
>> and refactoring in preparation for wrap and trigger mode support.
>> Support for those modes will be sent separately.
>>
>> The patches are grouped as follows for easier review:
>>
>> [...]
> 
> Applied sysregs update to arm64 (for-next/sysregs), thanks!
> 
> [01/23] arm64/sysreg: Define TRBSR_EL1.EC event classes
>          https://git.kernel.org/arm64/c/9d3009259f0a
> 
> NOTE: I included the asm/sysreg.h change from patch 12 as well and added
> a comment noting that the BSC encodings only apply for "Other" buffer
> management events. Ideally, we'd be able to namespace those in the
> sysreg file for each of the MSS2 encodings but I couldn't figure out an
> easy way to do that.
> 
> Cheers,


Thank you Will, much appreciated ! We can sort out the auto generation
in a separate patch. I believe we do it for some other sysreg already.


Cheers
Suzuki


