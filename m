Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD98606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 03:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EY19gMBk;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=2XmO2F0w
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2zFul203cJABpzA7e6NhNRDGHJm49HaUa43qT7bwsi0=; b=EY19gMBk7wSiAz
	+G+DtRmD32h2nDrZ/GAH5faLoxdA39japOe1JeHR0bEbrWCKV8SzvDhllmIcRvVkTgp4wXordfcV+
	LDVYUOT6QIh+jGLO2PzmVnfoHz3AZ8SicexIK6Q97dc8Ap5xYtM9Poe4uGM6XLDISIIQTxwoGZ0QF
	jygeBJT5QWbPQgw20kPcEy3+OJ5v7XzyEP1KUQPJ8cab/JFrQ2uCGDbRdP9JHkZ+LyMrKXMVKT8su
	YuwxJpSBuolVCz/CxIzHmx/575caJv1JmBWced+jBYVbF5nsPFVsFEKVIZwN8o3BcVQsDGO5eNATM
	82lNnGmIRXYtDisuxosA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT9qq-00000004TC6-0U9i;
	Tue, 17 Nov 2026 03:27:20 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT9ql-00000004TBR-2J9l
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 03:27:18 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=2zFul203cJABpzA7e6NhNRDGHJm49HaUa43qT7bwsi0=;
	b=2XmO2F0wYOlOqZXYbb4uoagngFo4eP0ch1UG1ZihMy/0FK3smtUs9vUYYch62jRw13m6KrVYy
	cCoCGopLKVB4FhRpXvmtGIP691hLzWkHVGR5qVBr7Bhi42gQlY8rijG9tGzmtVnScQEeB2I4xMH
	jAKDMqvRZmPa8BCylbnu4zg=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4jT9BX5gG3zLlXL;
	Tue, 17 Nov 2026 11:26:44 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 8EDEB40563;
	Tue, 17 Nov 2026 11:27:03 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 17 Nov
 2026 11:27:02 +0800
Message-ID: <1162c8a9-2829-40a4-9ad5-6a526bc57178@huawei.com>
Date: Tue, 17 Nov 2026 11:27:02 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] fs/resctrl: Give a monitor domain the counters the
 groups already use
To: Ben Horgan <ben.horgan@arm.com>, <james.morse@arm.com>,
	<reinette.chatre@intel.com>, <fenghuay@nvidia.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <babu.moger@amd.com>, <will@kernel.org>,
	<jic23@kernel.org>, <gshan@redhat.com>, <bp@alien8.de>, <x86@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20261113083506.4129060-1-ruanjinjie@huawei.com>
 <20261113083506.4129060-3-ruanjinjie@huawei.com>
 <10f43d19-2994-4ad2-8a49-2891582e32e7@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <10f43d19-2994-4ad2-8a49-2891582e32e7@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_192716_243709_1597C420 
X-CRM114-Status: GOOD (  19.50  )
X-Spam-Score: -2.1 (--)
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



在 2026/11/14 0:14, Ben Horgan 写道:
> Hi Jinjie,
> 
> On 13/11/2026 08:35, tizi4590 wrote:
>> From: Jinjie Ruan <ruanjinjie@huawei.com>
>>
>> With assignable MBM counters, resctrl can be mounted while all CPUs of
>> a monitor domain go offline and one of them comes back, either through
>> CPU hotplug or because hibernation takes the non-boot CPUs offline. The
>> domain is destroyed and re-created, and the new domain starts with no
>> counters assigned. Counters are otherwise only assigned when a group is
>> created, when rdtgroup_assign_cntrs() takes a free counter in each
>> monitor domain for each MBM event, so no code revisits the groups that
>> already exist.
>>
>> Those groups read "Unassigned" on the new domain, on any system with
>> assignable MBM counters. A counter assigned to them later through
>> mbm_L3_assignments is the lowest free one in that domain, so the same
>> group can end up with a different counter ID on different domains. For
>> example, with the counter ID each group uses for mbm_total_bytes and
>> "_" for none:
>>
>>                                domain 0         domain 1
>>   mount, mkdir g1              default=0 g1=1   default=0 g1=1
>>   all CPUs of domain 1 offline default=0 g1=1   (destroyed)
>>   one CPU of domain 1 online   default=0 g1=1   default=_ g1=_
>>   assign g1 on domain 1        default=0 g1=1   default=_ g1=0
>>
>> Each domain has its own counters, so g1 can use counter 0 on domain 1
>> and counter 1 on domain 0 without affecting the other domain, but until
>> it is assigned on domain 1 it reads Unassigned there.
> 
> I brought this up before and it was assessed that no change was required:
> https://lore.kernel.org/lkml/171f92a3-fa2e-44fb-b0d1-1250c72e31d1@amd.com/
> 
> Do you have any particular reason for wanting this behaviour?

Hi Ben,

sashiko also find this problem as below.

Link:
https://sashiko.dev/#/patchset/20261116125914.498841-1-ruanjinjie%40huawei.com

Best regards,
Jinjie

> 
> Thanks,
> 
> Ben
> 
>>
>> Assign the counters when the domain comes online, after its state is
>> set up. Give each enabled MBM event of every group, including the
>> monitor groups under mon_groups/, the counter ID the group uses in
>> another domain, and leave the event unassigned when that ID is already
>> taken on the new domain. Skip groups in pseudo-lock mode, as their RMID
>> has been freed and they are not monitored.
>>
>> A group that has no counter for an event in any domain stays unassigned
>> on the new domain, as it was before. mbm_assign_on_mkdir only applies
>> when a group is created, and counters that the user removed through
>> mbm_L3_assignments stay removed.
>>
>> Fixes: ef712fe97ec5 ("fs/resctrl: Auto assign counters on mkdir and clean up on group removal")
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> Cc: <stable@vger.kernel.org>
>> Cc: Tony Luck <tony.luck@intel.com>
>> Cc: Reinette Chatre <reinette.chatre@intel.com>
>> Cc: Babu Moger <babu.moger@amd.com>
>> Cc: James Morse <james.morse@arm.com>
>> Cc: Ben Horgan <ben.horgan@arm.com>
>> Cc: Dave Martin <Dave.Martin@arm.com>
>> ---
>> Changes in v2:
>> - Drop the MPAM part of the changelog, the MPAM driver is fixed by
>>   "arm_mpam: resctrl: Use the domain's counter ID".
>> - Link to v1: https://lore.kernel.org/all/20261106094537.2337188-1-ruanjinjie@huawei.com/
> 


