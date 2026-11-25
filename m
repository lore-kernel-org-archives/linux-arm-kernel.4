Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3855F606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 14:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ogzEzsGP;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=O8JRYTGn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cPVmlqwgTJ0+O2N7IsQoI4o+3+8lWMqd0l4ipgO2ro4=; b=ogzEzsGP5r15Rw
	5248GTiSrAmGrWudTyfS1ClcZ/oF36gapMi+Vh3C7O6vT2fykW1QpxWpk24VdQRpPPBKbObWa9/Za
	ko8RJtxG06wfnAbDw9n5g8qPjkdKqG3ByHV/Kyji1kwtN5GOPFlLaPG/YIREckUSbCIJzOMrRasZh
	l3NILMAml6+ZnZTAwJXDI4od/ggPJ8aSzi3tAKW2yYH2l1YBBcVXdUoZ3GJPmIw1gVhmqn+JcD+sr
	++puf+XSfQ7dPRI+eR2XWjluleUQksYrVLHL62wvWNKLjA4UWgizfyXsEqvHeZTBLeM54uUk3Qvx2
	NpteZ58hNLVxyUJ5lvNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDaQ-0000000A5de-2v6C;
	Wed, 25 Nov 2026 14:03:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDaO-0000000A5d6-43Ms
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 14:03:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68AC42F;
	Wed, 25 Nov 2026 06:02:56 -0800 (PST)
Received: from [10.0.135.195] (M0PRX50XMG.cambridge.arm.com [10.0.135.195])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D0C6E3F86F;
	Wed, 25 Nov 2026 06:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795615379; bh=WeHxNZ3LfJfngdKcIainGtVtPJGUuJsc1UXxkRlYBss=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=O8JRYTGnVTn/oO+6nGTmR5sMNtvJkSd2qivR77LZi7ITXReD0NSspVM0vn58xyUXV
	 NbdkJXWMO60UDqhjPBBvw+YnZoPe/17FT1Ari5LvEnK2IUT6Rsy+y8BvAtvvJqIh0Z
	 uiB2BUEPX0Cyb8ezvsVzxGpdEoWUTlmHN/zu6gSc=
Message-ID: <c92755e8-dc10-437d-b3fc-2b91be243263@arm.com>
Date: Wed, 25 Nov 2026 14:02:56 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/14] irqchip/gic-v5: Retain the ITT when device
 invalidation times out
To: Fuad Tabba <fuad.tabba@linux.dev>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, Timothy Hayes <timothy.hayes@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Jonathan Cameron <jic23@kernel.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261118-host_gicv5_fixes-v3-0-13c1859e8aa3@arm.com>
 <20261118-host_gicv5_fixes-v3-12-13c1859e8aa3@arm.com>
 <av7PQ4iniwWC9goF@red-moon>
 <CA+EHjTwYexVk5tgHNorQVHwxLThT3nFzjYz50oYp=xhrd1LXDg@mail.gmail.com>
Content-Language: en-GB
From: Sascha Bischoff <sascha.bischoff@arm.com>
In-Reply-To: <CA+EHjTwYexVk5tgHNorQVHwxLThT3nFzjYz50oYp=xhrd1LXDg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_060301_060320_F0C993A4 
X-CRM114-Status: GOOD (  12.13  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 19/11/2026 12:07, Fuad Tabba wrote:
> On Thu, 19 Nov 2026 10:28:19 +0000, Lorenzo Pieralisi
> <lpieralisi@kernel.org> wrote:
> [...]
>>> diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
> [...]
>>> @@ -570,7 +570,9 @@ static int gicv5_its_device_unregister(struct gicv5_its_chip_data *its,
>>>           its_write_table_entry(its, dte, 0);
>>>
>>>           ret = gicv5_its_device_cache_inv(its, its_dev);
>>> -        gicv5_its_free_itt(its_dev);
>>> +        /* Only release the ITT once the ITS has discarded its references. */
>>> +        if (!ret)
>>> +                gicv5_its_free_itt(its_dev);
>>
>>          if (ret)
>>                  return ret;
>>
>>          gicv5_its_free_itt(its_dev);
>>
>>          return 0;
> 
> In this error path and the one in gicv5_its_device_register(),
> kmemleak will report the retained ITT once the caller frees its_dev.
> Could you mark the ITT allocations with kmemleak_not_leak() on both
> paths, l2ptrs included for a two-level ITT?

I've added these, thanks.

> 
> With that added:
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> 
> Cheers,
> /fuad


