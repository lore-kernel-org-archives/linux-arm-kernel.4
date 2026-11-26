Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98EA606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 16:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WYbYOeDA;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Ybm+ZCwO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=y8Eg/yzSVCNhVFWmPD8/uMOmYnaralDAmMpwUmNw1QU=; b=WYbYOeDAN3sKbe
	qsFBG0WJnL7XQj88f768gTWMFOkoVag62ZtPy2OWexp8shpoi3vZPcCK8zGiFP3DLLr4s00yVBWNi
	ZsWbkFFFsxMPCURm5u++uJ3+b7gxsVA0MGWz73rLBH7EL7v1T60H1+lZnzkkGkdfvCo7v45Dsl+32
	1MZIN3iK21PxiFPpoWZn0uTpIwmH323t7HVSarnZ1TbOTphpvzlT2S1bNE0TwYmHTmwMdTH/KDL5c
	h7Ah1vDaFHYHQ/9qZnR6cqVNAyeSTSN2Cbu20jzhsntchBSz6cjDLqNP0VGWQU7nUfUeznMlNiK6S
	0/f20kGkNnkWe3qdMH4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWcaR-0000000DxDh-3Xwz;
	Thu, 26 Nov 2026 16:44:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWcaP-0000000DxCr-2eoe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 16:44:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5FA531BA8;
	Thu, 26 Nov 2026 08:44:37 -0800 (PST)
Received: from [10.57.71.121] (unknown [10.57.71.121])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 54D5B3F86F;
	Thu, 26 Nov 2026 08:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795711480; bh=NEFJ/kElwexbXWDUkbQAkXiAvulsTSqrsqEn0imaXLY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ybm+ZCwOCK+2HHO6FgbAX9my0/BTun88oGN77k4OSKnowsqqPT1G0kNcnjSVGQxrs
	 hY1K8G6HgrR4cxYM9czf6rU6rCrPBd98bmNsGkL5yJntkuJpHSF3PN3bQ4cHkdkXjK
	 QmS1PVCCCp0ddzDgt33JDReTrm7rr7d47ijybtHA=
Message-ID: <11d4ade4-e7a5-461a-aaa8-6ef1ca5019dd@arm.com>
Date: Thu, 26 Nov 2026 16:44:36 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/23] arm64/sysreg: Define TRBSR_EL1.EC event classes
Content-Language: en-GB
To: Will Deacon <will@kernel.org>
Cc: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-1-3f57cf3199b1@arm.com>
 <dfea6dc5-6a2f-4006-8bbd-37844b6b5986@arm.com>
 <awhPHldqbDgiVH8A@willie-the-truck>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <awhPHldqbDgiVH8A@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_084441_797935_3FF99246 
X-CRM114-Status: UNSURE (   8.79  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 26/11/2026 15:24, Will Deacon wrote:
> On Thu, Nov 26, 2026 at 10:24:17AM +0000, Suzuki K Poulose wrote:
>> Catalin, Will,
>>
>>
>> On 16/10/2026 17:54, Leo Yan wrote:
>>> TRBSR_EL1.EC identifies the cause of a trace buffer management event,
>>> but the sysreg description does not name its architected values. Define
>>> the five encodings as an unsigned enum so TRBE status handling can
>>> refer to each cause by name.
>>>
>>> The values cover other events, Granule Protection Check faults,
>>> implementation-defined events, and stage 1 and stage 2 Data Aborts on
>>> writes to the trace buffer, as specified by Arm ARM (ARM DDI 0487 M.c).
>>>
>>> Signed-off-by: Leo Yan <leo.yan@arm.com>
>>
>> Are you ok with me taking this via the coresight tree ?
> 
> The sysregs file gets updated quite regularly, so let me stick this patch
> on a shared branch for you.
> 

Thank you Will !

Cheers
Suzuki


> Will


