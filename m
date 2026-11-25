Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022B9606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 13:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4gDn0ICE;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=c9ngxlxr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9mLR3ReibMxxaJSoED1PK69ne/VAm1etiDTIP2zYucc=; b=4gDn0ICE8Bf9BY
	5Stvti3wouS6px989JO/WZYrvpjO5Jd6wooI2BB8mdi3EdL1CN4QaMpCGwPKHYE2kCahRgYxh88Hd
	3ZJ1UeoxkA9ufZuApnqkU9im+8CAZjKXKFLUSr+qrM72NmIJwfbiBpmKCLDkmqHETGWY2qrtT5PB2
	Sg9qhQmwKy1LUtW9vtw+jj7c22T2poh74hrE32SPDOEzz6PM64W5tgrjql1mRL34Q5EnS5kApYSxR
	pYGbwE7KqChp0yTsVEn4BSDQBoO1FvVd9xPL7j0TKildA+qmRFQdKuz1JL+RnlvjAfodG1cuZMj28
	PUZVR9dO/vLKBLRos73Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDTC-0000000A4Yp-0xKE;
	Wed, 25 Nov 2026 13:55:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDT9-0000000A4WW-48Qd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 13:55:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 72F541762;
	Wed, 25 Nov 2026 05:55:25 -0800 (PST)
Received: from [10.0.135.195] (M0PRX50XMG.cambridge.arm.com [10.0.135.195])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D3F7E3F86F;
	Wed, 25 Nov 2026 05:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795614928; bh=lFlXR/nWHqMhCzMVQ0vM9REkBLQ/I9uQbkx3Vlgppws=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=c9ngxlxrtG85+E9yWt9tDY6wd6LRRaRetZ8uuB6D7Wv9kcS25/YiGJMhK85uAwedQ
	 Z4yXmCwSWlV2AB7x4mSHpgXpVmEiPVL0mUJ+Q+qcpnQ08mG6uKy+6TSlrizJgmvJJC
	 nbgOnGvrKalGZkL4RxKobag2CWKvkuPIPTJvxo3M=
Message-ID: <3fe28416-f24d-4c43-81c8-4c49a8ec913a@arm.com>
Date: Wed, 25 Nov 2026 13:55:25 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/14] irqchip/gic-v5: Only set IRS DPS when 1ofN
 routing is supported
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
 Timothy Hayes <timothy.hayes@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Jonathan Cameron <jic23@kernel.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261118-host_gicv5_fixes-v3-0-13c1859e8aa3@arm.com>
 <20261118-host_gicv5_fixes-v3-2-13c1859e8aa3@arm.com>
 <CA+EHjTxyzmrs_MmyR+mgd2i3o+WsCJXUDeFYMazx90HcMsRpcw@mail.gmail.com>
Content-Language: en-GB
From: Sascha Bischoff <sascha.bischoff@arm.com>
In-Reply-To: <CA+EHjTxyzmrs_MmyR+mgd2i3o+WsCJXUDeFYMazx90HcMsRpcw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_055532_086227_A8C116FA 
X-CRM114-Status: GOOD (  12.07  )
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

On 19/11/2026 11:50, Fuad Tabba wrote:
> Hi Sascha,
> 
> On Wed, 18 Nov 2026 17:35:31 +0000, Sascha Bischoff
> <sascha.bischoff@arm.com> wrote:
>> IRS_PE_CR0.DPS is RES0 when the IRS does not support 1ofN routing.
>> Read the capability from IRS_IDR0 and skip programming DPS on systems
>> without support for 1ofN routing, rather than blindly writing it.
> 
> vgic_v5_irs_set_up_vpe() in KVM writes IRS_VPE_CR0.DPS unconditionally
> too, and that bit is RES0 when IRS_IDR0.VIRT_ONE_N is clear. Worth a
> separate KVM patch for that one?

Yes, absolutely. That doesn't belong in this series though, and from the 
looks of it I have a few things to fix up there, so I'll be sending a 
series that way in due course. Thanks for flagging it.

> 
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> 
> Cheers,
> /fuad

Thanks,
Sascha

