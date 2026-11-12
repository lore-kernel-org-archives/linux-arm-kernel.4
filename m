Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA970606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 11:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H97cwXDt;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=NO6Nmu+Z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Pw4XPMCNw94/e6qgBxyGiO7Si6B6BDxB+dFAw5oBK48=; b=H97cwXDtZ1tzi6
	CV161I+AP3SSaaEUC4xOFZkPnG1WWXmIz7nrm2Fw8Kza1IcKGA7DrhWvSWO5CmUMKxC0ZocXh4uwT
	cWDEl82mEaJsBt//TM+PJgLMD6jPuYVh0IpbvPnFxV8nwQ1Wy8VYOiUrxlfrlhCe6i8JO1DFXnDAb
	6mVA8Fca+7sTPDIrWczp6Orj49VjWYzRIQNs0ojmTWNwNq88I9UXq+dPyaqg9JhSfJim47iMFQfKk
	bTB7p7S0tCdkHyT9NkFTI4fFwGGUd2h349Nddda1pV7Bvo1Mv0wwhYty/FX0SXhYaNLZyUPYIlmWf
	TdAW8RU2i1QlFePelejw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRT7L-00000009kNW-0uak;
	Thu, 12 Nov 2026 11:37:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRT7I-00000009kN9-3PZb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 11:37:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D8BF153B;
	Thu, 12 Nov 2026 03:37:16 -0800 (PST)
Received: from [10.211.55.3] (unknown [10.57.14.230])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B919F3F632;
	Thu, 12 Nov 2026 03:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794483439; bh=vTwt6H25z0763sueGZiIZeSWDqKIPD9kv2oCMsZXnIs=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=NO6Nmu+Z7bKfxKpT++lUuenb1Jioyu/gghNRzlSC4VKoJZMPI0kqYWrr6GH2vE5I9
	 mypbhw5P3w9MIGIDbhERl4o9J0m9U/bMeXpiKsWWjpA89BTaWgTB6cBuu6wonNArCT
	 4dKXPmKNc0lixXzI0+f9sgbBUickWqMiMno8XXgI=
Message-ID: <9e4852e4-0bcd-4cc2-8f80-367340fb4923@arm.com>
Date: Thu, 12 Nov 2026 11:37:12 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v5 RESEND 2/7] fs/resctrl: Do not allocate a monitor
 context when releasing limbo RMIDs
To: Jinjie Ruan <ruanjinjie@huawei.com>, tony.luck@intel.com,
 reinette.chatre@intel.com, Dave.Martin@arm.com, james.morse@arm.com,
 babu.moger@amd.com, corbet@lwn.net, skhan@linuxfoundation.org,
 rdunlap@infradead.org, tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, fenghuay@nvidia.com,
 tan.shaopeng@fujitsu.com, will@kernel.org, gshan@redhat.com,
 zengheng4@huawei.com, jic23@kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20261110133938.3768632-1-ruanjinjie@huawei.com>
 <20261110133938.3768632-3-ruanjinjie@huawei.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261110133938.3768632-3-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_033720_927701_89133435 
X-CRM114-Status: GOOD (  14.04  )
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

Hi Jinjie,

On 10/11/2026 13:39, Jinjie Ruan wrote:
> Busy RMIDs of a monitor domain are normally released by the limbo
> handler once their cache occupancy drops below the threshold. When a
> domain goes offline, its busy RMIDs are released without checking
> occupancy, since the domain is going away and the RMIDs would otherwise
> never return to the free list.
> 
> On the monitor domain offline path, __check_limbo() allocates the
> monitor context that an occupancy check needs before it scans the busy
> RMIDs, but without using it, and returns early when that allocation
> fails. Then the caller destroys the domain's monitoring state, including
> the bitmap that records which RMIDs are busy, so nothing can clear those
> bits afterwards and the busy counts never reach zero. Those RMIDs never
> return to the free list and, where the RMID depends on the CLOSID, the
> dirty count of their CLOSID never decreases. The allocation can also
> wait for a monitor to become free, which stalls the CPU offline path on
> a context that is not going to be used.
> 
> Only MPAM systems are affected. An architecture that can always read an
> RMID allocates nothing for the monitor context, so the allocation can
> neither fail nor wait there.
> 
> Move the release of busy RMIDs into a separate function that does not
> take a monitor context and leave the occupancy check to __check_limbo().
> 
> Fixes: e557999f80a5 ("x86/resctrl: Allow arch to allocate memory needed in resctrl_arch_rmid_read()")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
> Cc: James Morse <james.morse@arm.com>
> Cc: Reinette Chatre <reinette.chatre@intel.com>
> Cc: <stable@vger.kernel.org> # 7.1.x


Looks good to me.

Reviewed-by: Ben Horgan <ben.horgan@arm.com>


