Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50D9606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 14:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BAv64XfS;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Ud5c/r1j
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JY41AbFjJt9FKuxn9PivDuklHDyfv269Y+Nc373H9sQ=; b=BAv64XfSRu0qO1
	L/yOjLJ06BHyEfTSWVnj74uqtYPUynoGxFU4QvfDintuUVxWvtFOE1qmmWrCz7NmuDL9WuFHO8tx+
	A9h/trDLXbXmHEFOj/tfkud9dfxLVn61c6++z44/tc7Vku9qksT2j6qdcxUbFyNfSD/eH5Jkt1mOc
	fIDBNJ0OcXLiTLUYt6DqPuGR6cD77ZW0S5JetmoUyTkBFXtTthzqCThjvQ73Ri6eZFlHJFUjWup6c
	snVk7KGHoIXdf+QxsroWUFOhKJFm4+JjjHsKslBX1WiUVgkiAWZq0waAhlE+a2VbjnSs4OFopD/B0
	mK8YBR3QgR1jKt5w/rCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDVm-0000000A4yR-2xD6;
	Wed, 25 Nov 2026 13:58:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDVj-0000000A4xl-1ymb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 13:58:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BEDA31762;
	Wed, 25 Nov 2026 05:58:07 -0800 (PST)
Received: from [10.0.135.195] (M0PRX50XMG.cambridge.arm.com [10.0.135.195])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 291303F86F;
	Wed, 25 Nov 2026 05:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795615090; bh=g6yDIGheZOSV9BwSKe++njM/qPQOvfexIPSYSeOYw9s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ud5c/r1jM0kLPTmnZmXJ5gCPJ66qrynzJlpvsIMkws+BMLS4oJi9QcDWYyWIeDcv6
	 u57icOp1B/QzMGoSKo7tsosT/Fq2f6mWPAwF4nYTj1WDoSZly3r0z+SYjc43oMUPxd
	 FB3VOw+MRwiVyNmzcDKDzP/xPBay24ibDbTmzyMc=
Message-ID: <65f3844e-6a5c-4b2b-b678-907115da47ad@arm.com>
Date: Wed, 25 Nov 2026 13:58:07 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/14] irqchip/gic-v5: Serialise IRS synchronisation
 requests
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
 Timothy Hayes <timothy.hayes@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Jonathan Cameron <jic23@kernel.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261118-host_gicv5_fixes-v3-0-13c1859e8aa3@arm.com>
 <20261118-host_gicv5_fixes-v3-3-13c1859e8aa3@arm.com>
 <CA+EHjTwoP36opJYeZ6Ba4aLE8f5igZzW9+LSbuZkztr51bRdxg@mail.gmail.com>
Content-Language: en-GB
From: Sascha Bischoff <sascha.bischoff@arm.com>
In-Reply-To: <CA+EHjTwoP36opJYeZ6Ba4aLE8f5igZzW9+LSbuZkztr51bRdxg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_055811_563264_23E69C24 
X-CRM114-Status: GOOD (  14.93  )
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

Hi Fuad,

On 19/11/2026 11:53, Fuad Tabba wrote:
> Hi Sascha,
> 
> On Wed, 18 Nov 2026 17:35:32 +0000, Sascha Bischoff
> <sascha.bischoff@arm.com> wrote:
>> IRS_SYNCR writes are ignored while IRS_SYNC_STATUSR.IDLE is clear.
>> Concurrent calls to gicv5_irs_syncr() can overlap, causing a request
>> to be dropped. A caller can then observe the earlier request
>> completing and assume that its own events have been processed.
>>
>> gicv5_irs_syncr() may need to be called in atomic context. Serialise
>> the request and completion poll with a raw spinlock, and use atomic
>> polling.
>>
>> Fixes: 57d72196dfc8 ("irqchip/gic-v5: Add GICv5 ITS support")
>> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
>> Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
>> Cc: stable@vger.kernel.org
> 
> I don't think two calls can overlap in the host driver today. The only
> caller is gicv5_its_irq_domain_free(), and since the LPI domain is the
> parent of every ITS domain, irq_domain_free_irqs() holds the LPI
> domain's mutex around that call. Do we need the Fixes: and Cc: stable
> tags then?

Good point. I don't think that this is really an issue until we have the 
KVM patches to trigger this in place. I'd not quite realised this when 
adding those tags. I've dropped the fixes and Cc: stable trailers from 
the next version.

> 
> That said:
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> 
> Cheers,
> /fuad

Thanks,
Sascha

