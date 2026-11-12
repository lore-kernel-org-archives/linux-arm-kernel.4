Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D2D606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 17:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qO6Nvt4u;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=tA/qa2jN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=w1+1tscNVgFkOUECvPwWHIyIX3Va6MdsRUwTGzDutp4=; b=qO6Nvt4uxp6sxL
	JmuzZ+bK0YElOBCR8NMMbRUPcxZguwp2uK+HAtnMZ9bfLLWCPmF0qrShfWdSZy8Kz81t5Bn6MlbOI
	rCR2nhmxA2CX7VSZdxfSxk3ZKgyZqkuZ4Qf6LXeNHLA03DcOHb1tb5NmHn9pXzi+hLXoqx2rTyKLU
	puysH7mjG41qZm0V520GO1qiEGi0itEiHEK7Eekhi+285/raP9rIGijaH7bZCoBHC2JB8J//8AwFx
	eB1dIwmb4VTjhXIxaPPnvUl+ZnJh+oW1qOueRKg/GQz2f/MvbP7M1cMBXfwIeM+AWQwT/hBi//YQY
	Ajgn5KtYWSCfL9Kud62g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRYQD-0000000Ajoq-04CB;
	Thu, 12 Nov 2026 17:17:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRYPi-0000000AjgT-0PKQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 17:16:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 022321516;
	Thu, 12 Nov 2026 09:16:38 -0800 (PST)
Received: from [10.211.55.3] (unknown [10.57.14.230])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 563903F632;
	Thu, 12 Nov 2026 09:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794503801; bh=VB5Gtl3Pw9RoKAr/cwkMBK0KqjUTj1JlFDgq5zlwbKI=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=tA/qa2jNYtaVCs53UlAKPtn7goLnLNdP2hMMgFb0088OJVMFvFJqFBejhyqy+EZpx
	 ec1jDq24MTu6wEKBXLtgwFFagT49yRLQaN1Ma+yMNn7kbuHCwM0Whfv+n/PeNjYoBn
	 yD4kQa7QZ47kEhazzQJs/gthYsaiYTDtocFDkZKI=
Message-ID: <7ce15dbf-d4d7-4fb3-ad50-f47f782a7440@arm.com>
Date: Thu, 12 Nov 2026 17:16:34 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v5 RESEND 7/7] fs/resctrl: Add info/moveable_mon_group
To: Jinjie Ruan <ruanjinjie@huawei.com>,
 Reinette Chatre <reinette.chatre@intel.com>, tony.luck@intel.com,
 Dave.Martin@arm.com, james.morse@arm.com, babu.moger@amd.com,
 corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
 tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, fenghuay@nvidia.com,
 tan.shaopeng@fujitsu.com, will@kernel.org, gshan@redhat.com,
 zengheng4@huawei.com, jic23@kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20261110133938.3768632-1-ruanjinjie@huawei.com>
 <20261110133938.3768632-8-ruanjinjie@huawei.com>
 <efd9c3d5-a732-47bf-bca1-50a8650fd0ef@intel.com>
 <7d27b172-d186-4b7a-87af-d0d25554b964@huawei.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <7d27b172-d186-4b7a-87af-d0d25554b964@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_091646_550461_2A1EFB09 
X-CRM114-Status: GOOD (  34.48  )
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

Hi Jinjie, Reinette,

On 12/11/2026 01:42, Jinjie Ruan wrote:
> 
> 
> 在 2026/11/12 2:34, Reinette Chatre 写道:
>> Hi Jinjie and Ben,
> 
> Hi Reinette,
> 
>>
>> On 11/10/26 5:39 AM, Jinjie Ruan wrote:
>>> Moving a MON group into the mon_groups directory of another CTRL_MON
>>> group changes the CLOSID of the group while its RMID stays the same.
>>> Where the RMID is only meaningful together with the CLOSID, as on arm64
>>> MPAM, the move changes the RMID index of the group and is rejected with
>>> -EOPNOTSUPP.
>>>
>>> Userspace cannot tell whether the move is supported without trying it.
>>> Add "info/moveable_mon_group", which reads 1 when a MON group can be
>>> moved to another CTRL_MON group and 0 when the move is rejected, and
>>> refer to it where resctrl.rst describes the move.
>>>
>>> Suggested-by: Ben Horgan <ben.horgan@arm.com>
>>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>>
>> Do you find that this binary "supported/unsupported" accurately captures
> 
> I think this behavior is deterministic on MPAMv1, so that's enough for mpam.
> 
>> everything that MPAM may ever want to do in this area? Could it be that, for
> 
> That would be what the new version of MPAM does (such as v2 mentioned
> below), the behavior of the mapmv1 version is already determined..
> 
>> example, one day MPAM may be asked to support the move of a monitor group to
>> support scenarios where the reset of monitor counts is acceptable to the customer
>> and availability of PMG will be managed as part of the scenario needing support?

For such a destructive move I would have thought it would be better to
forbid the move and just rely on the user deleting the existing monitor
group and creating a new one at the new location. If we consider only
llc_occupancy on MPAM, which isn't affected by any requirement to be
free running as effectively the hardware re-measures the cache occupancy
on each read, then allowing monitor groups to be moved still gives a
misleading impression to the users. The actual cache occupancy of the
tasks in the moved monitor group stays the same but only the cache lines
allocated after the move with the new (PARTID, PMG) association are
accounted for in llc_occupancy. The tasks still get cache hits for the
lines allocated previous to the monitor group move.

Having said that, one problem with relying on deleting and creating a
new monitor group is that you have to keep track of the associated tasks
which isn't necessarily straight forward, e.g. when a child task is
started after deleting the monitor group.

Any relaxation of expectations of what happens when a monitor group is
moved would need explicit buy-in from the user as otherwise they could
rightly expect the established resctrl behaviour.

I haven't understood the reason why groups that monitor cpus can't be
moved. Is this impossible to implement even on an x86 system? Why can't
the cpus move move between control groups in the way that tasks do?

> 
> As stated in the MPAM manual, MPAMv2 completely separates PARTID and
> PMG, allowing for more flexible and fine-grained monitoring statistics

Which MPAM manual in particular are you referring to? Whilst the
separation of PARTID and PMG is definitely possible in MPAMv2 there is a
lot of nuance in this area.

> across partitions, so the CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID will not
> set for v2, However, it might need to be changed to a dynamic switch..
> 
>>
>> When adding a new interface it helps to consider future possible changes and
>> aim to create an interface that solves the immediate problem while leaving room
>> for future enhancements. If we do not do that the interface becomes a maze due
>> to new files just being added to address the problem of the day.
>>
> 
> I agree with your idea. We need to think twice before we act.
> 
>> I would like to propose that this patch be submitted separately with the goal
>> to obtain more feedback on the new interface. 
> 
> I don't object, but I understand this is the same thing as the previous
> patch. I'd like to hear Ben's advice.

Given that the documentation dependency has been avoided in your patch 6
I think as Reinette suggests it is indeed better to take some more time.
This is a proposal for new abi, after all.

Thanks,

Ben
> 
>>
>> Reinette
> 


