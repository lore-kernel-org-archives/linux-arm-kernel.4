Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1C6606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 02:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tsP1KQqD;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=qYzcfOL8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LdwEIwLifh+sAIGjLJdI1Wj6PaOuPDMg1EG7g0SXMS0=; b=tsP1KQqD9XAtjh
	KkOq1mo8WuGK8nIXl576qd+hKOfGR2p5hbLmN9LZC1+C7JHO3/UsBb4W2/wwI0n/L2Wzjt0Xousg0
	iVrNxA2mWKf/0HpYqIcj4k7mRSskVUcX+PsRIOUSfIgNMVPypiFlp30a8uQhrac84oaHrAreyBWaf
	LEshAIAWjPvQ3lVsBjMuvr9Z+pVqPBNubtVZvkrbu3ntzIADGgT+oezC7JQP2/aQ3nSdENsCILfy6
	WQEuGzWvvbTq02jTT3oexc5kb3OGqjtccVK+2GKhVpiytgjQznjOCyLXX85NM2QoLkrs9eFnY1jkE
	7TLlz3x/fdbpZd7zQ35A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTre4-0000000Afo4-2aAS;
	Thu, 19 Nov 2026 02:13:04 +0000
Received: from [113.46.200.225] (helo=canpmsgout10.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTre1-0000000Afn5-3hLB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 02:13:04 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=LdwEIwLifh+sAIGjLJdI1Wj6PaOuPDMg1EG7g0SXMS0=;
	b=qYzcfOL8cS+9wEBP5gFBKaokzUNWumW0LIO97cSlqaKaEae/71x3mYYBsS9nxjWg6yA8PbgsR
	wbaYHMvp6kD6r4FJZsMjPdqDQnpX7WX3X+CgqWK4hZKr5xRWYRmc2k5LxfEm6L2X2dEH9bwy9Ir
	oqdzQjkc/j+y9gd8i/GbyZ0=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4jVMRw5nhnz1K97K;
	Thu, 19 Nov 2026 10:12:28 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id DAAB24056C;
	Thu, 19 Nov 2026 10:12:42 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 19 Nov
 2026 10:12:41 +0800
Message-ID: <a39016a0-4b0a-498c-980f-27e98fcd9725@huawei.com>
Date: Thu, 19 Nov 2026 10:12:41 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] fs/resctrl: Give a monitor domain the counters the
 groups already use
To: Babu Moger <babu.moger@amd.com>, Ben Horgan <ben.horgan@arm.com>,
	<james.morse@arm.com>, <reinette.chatre@intel.com>, <fenghuay@nvidia.com>,
	<tony.luck@intel.com>, <Dave.Martin@arm.com>, <will@kernel.org>,
	<jic23@kernel.org>, <gshan@redhat.com>, <bp@alien8.de>, <x86@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20261113083506.4129060-1-ruanjinjie@huawei.com>
 <20261113083506.4129060-3-ruanjinjie@huawei.com>
 <10f43d19-2994-4ad2-8a49-2891582e32e7@arm.com>
 <bba48893-f71f-4168-8948-1d37cf59b3d5@huawei.com>
 <0e3716c3-c537-4f5c-a6a9-3272908b8e86@amd.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <0e3716c3-c537-4f5c-a6a9-3272908b8e86@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_181302_410196_821AB598 
X-CRM114-Status: GOOD (  26.12  )
X-Spam-Score: -1.3 (-)
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



在 2026/11/18 23:57, Babu Moger 写道:
> Hi Jinjie,

Hi Babu,

> 
> On 11/15/26 22:02, Jinjie Ruan wrote:
>>
>>
>> 在 2026/11/14 0:14, Ben Horgan 写道:
>>> Hi Jinjie,
>>
>> Hi Ben,
>>
>>>
>>> On 13/11/2026 08:35, tizi4590 wrote:
>>>> From: Jinjie Ruan <ruanjinjie@huawei.com>
>>>>
>>>> With assignable MBM counters, resctrl can be mounted while all CPUs of
>>>> a monitor domain go offline and one of them comes back, either through
>>>> CPU hotplug or because hibernation takes the non-boot CPUs offline. The
>>>> domain is destroyed and re-created, and the new domain starts with no
>>>> counters assigned. Counters are otherwise only assigned when a group is
>>>> created, when rdtgroup_assign_cntrs() takes a free counter in each
>>>> monitor domain for each MBM event, so no code revisits the groups that
>>>> already exist.
>>>>
>>>> Those groups read "Unassigned" on the new domain, on any system with
>>>> assignable MBM counters. A counter assigned to them later through
>>>> mbm_L3_assignments is the lowest free one in that domain, so the same
>>>> group can end up with a different counter ID on different domains. For
>>>> example, with the counter ID each group uses for mbm_total_bytes and
>>>> "_" for none:
>>>>
>>>>                                 domain 0         domain 1
>>>>    mount, mkdir g1              default=0 g1=1   default=0 g1=1
>>>>    all CPUs of domain 1 offline default=0 g1=1   (destroyed)
>>>>    one CPU of domain 1 online   default=0 g1=1   default=_ g1=_
>>>>    assign g1 on domain 1        default=0 g1=1   default=_ g1=0
>>>>
>>>> Each domain has its own counters, so g1 can use counter 0 on domain 1
>>>> and counter 1 on domain 0 without affecting the other domain, but until
>>>> it is assigned on domain 1 it reads Unassigned there.
>>>
>>> I brought this up before and it was assessed that no change was
>>> required:
>>> https://lore.kernel.org/lkml/171f92a3-fa2e-44fb-
>>> b0d1-1250c72e31d1@amd.com/
>>>
>>> Do you have any particular reason for wanting this behaviour?
>>
>> I discovered this issue during the testing process and feel it is not
>> very reasonable.
>>
>> This patch doesn't assign anything new - it only restores the counter ID
>> the group already uses on a domain that stayed online.
>>
>> So with the patch, Babu's two cases (`2=e;3=e` and `2=_;3=e`) both come
>> back exactly as they were. The only case it can't know is a group that
>> used a different ID on the domain that went away, and there it leaves
>> the event unassigned rather than guessing.
> 
> I see this patch is trying to address two separate issues:
> 
> 1. Automatically assigning counters when a domain comes online
> 
> I understand the motivation here. It is reasonable to expect counters to
> be assigned when a monitor domain comes online and counters are
> available. However, monitor domain online/offline events are typically

Yes, there was originally a counter available, and after the domain
going offline and coming back online, users still expect it to be available.

> driven by CPU hotplug, hibernation, or other user-initiated actions. In

I agree

> these cases, the user is generally aware of the state transition and can
> explicitly assign counters after the domain is online if monitoring is
> required.

If the power management daemon triggers the sleep mode and no process
with the resctrl permission is involved, the existing monitoring group
in the newly created domain will remain in the unassigned state, causing
the monitoring data to be interrupted.

> 
> 2. Retaining the same counter ID across domains
> 
> I do not see why this is necessary. The design of assignable MBM
> counters intentionally treats counters as domain-local resources and
> provides flexibility to maximize counter availability across groups.
> Counter IDs are an implementation detail and are not visible to users. A

While fixing the issues related to mpam (the first patch), I also
realized that counters are in-domain resources. I believe this point was
intended to address the mpam issues in the first patch, but it is indeed
unnecessary.

> group using a different counter ID in another domain does not affect
> functionality or monitoring results. Therefore, I do not see a strong
> justification for preserving the same counter ID when a domain is
> recreated. Given the above, I am not convinced the added complexity is
> justified.
> 
> Thanks,
> 
> Babu


