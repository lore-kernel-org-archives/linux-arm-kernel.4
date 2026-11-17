Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591FD606A885
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 03:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J2fQdrCU;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=PKfwVZYu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rlurS4MvXS+GmSamzD0JfsmMpmwQtgRk+U6c6jP8MBo=; b=J2fQdrCUCIHdog
	k23gIAnUlJ6Q/Syda3aHDaZtZigp2HCF94st223In6MZwu/a0VjHKC/scEwljLSVxU2LK6jPNsJEN
	5HVzY4TEX4PkIQ984lsqC1O8dfVXYu/4na+guQ57UDZRzkXHBWd4b8E2Ep4x/JCh4Be0EFHTVXv/E
	dRjaQlLBw4QqKwz0r4ianp1Gy5DmQv/vH75pd+JTxzEon5FSydTqpmIjJgcDyXhI+bdwDMO/Oo2F3
	UsSs2gnZbIZ/HS/Jr7WNWleBeObB5rQTuGODlq9A4JX+9xkmiuhR6RKG1fBNhgBizjbOtXl+5DWQ7
	IeA45/cnDgbk0HiyZgnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT9vH-00000004VRf-3mQ5;
	Tue, 17 Nov 2026 03:31:55 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT9v2-00000004VJR-3977
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 03:31:52 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=rlurS4MvXS+GmSamzD0JfsmMpmwQtgRk+U6c6jP8MBo=;
	b=PKfwVZYuXZwA8euS7rl3LEz71zSVabOEJGzaSgNcCU/T3r7nZwjGms5xi0j7y9aq93QPG29uZ
	Ep0eWKve20okKf1G5PlmswmIY2/kWrr4wACRNmAX9+cSEF4ig68JsIM/7lW0DsgGNtTBNsIJgAX
	AoAMBK2LcbHl2t7XI0FcN3E=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4jT9H62Gv6z12LcZ;
	Tue, 17 Nov 2026 11:30:42 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 48FEA203AB;
	Tue, 17 Nov 2026 11:31:35 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 17 Nov
 2026 11:31:34 +0800
Message-ID: <b1fd5fa8-bf03-4575-bc05-540a288b609d@huawei.com>
Date: Tue, 17 Nov 2026 11:31:33 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] arm_mpam: resctrl: Only enable CDP on a resource
 that supports it
To: Gavin Shan <gshan@redhat.com>, <james.morse@arm.com>,
	<ben.horgan@arm.com>, <reinette.chatre@intel.com>, <fenghuay@nvidia.com>,
	<zengheng4@huawei.com>, <tan.shaopeng@jp.fujitsu.com>, <jic23@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20261111081316.3828283-1-ruanjinjie@huawei.com>
 <20261111081316.3828283-3-ruanjinjie@huawei.com>
 <a783b375-7c27-4c91-b40e-7e615d33bc5b@redhat.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <a783b375-7c27-4c91-b40e-7e615d33bc5b@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_193142_532012_83689EBA 
X-CRM114-Status: GOOD (  18.23  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Gavin,

在 2026/11/13 7:42, Gavin Shan 写道:
> On 11/11/26 6:13 PM, Jinjie Ruan wrote:
>> resctrl_arch_set_cdp_enabled() enables CDP for any cache level that is
>> requested, even one that has no MPAM cache controls. Mounting resctrl
>> with -o cdpl2 when only L3 can allocate still turns CDP emulation on for
>> the whole system, so every CLOSID takes two PARTIDs while resctrl keeps
>> its CLOSID count at the number of PARTIDs. Control groups in the upper
>> half then map to PARTIDs beyond mpam_partid_max, which index past the
>> configuration and monitor arrays and program out of range PARTIDs into
>> the MSCs. On QEMU with 5 PARTIDs the first monitor read after creating
>> 2 control groups raises MSMONCFG_ID_RANGE for PARTID 5, and MPAM is
>> disabled.
>>
>> Do not enable CDP when a resource cannot allocate or is not CDP capable,
>> as x86 does, so the mount fails instead. Only the enable path is checked,
>> since unmount disables CDP on both cache levels to restore the MBA
>> control.
>>
>> A system where only MBA can allocate, or that only has monitors, now
>> fails a mount with CDP as well: CDP hides the MBA control because
>> mbw_max is a per-PARTID maximum, leaving nothing for CDP to apply to.
>>
>> Fixes: 6789fb99282c ("arm_mpam: resctrl: Add CDP emulation")
>> Link: https://sashiko.dev/#/bug/linux-05c19551-0bba-4a06-
>> aa2c-3c90fab5853d
>> Suggested-by: Ben Horgan <ben.horgan@arm.com>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> Cc: <stable@vger.kernel.org> # 7.1+
>> ---
>>   drivers/resctrl/mpam_resctrl.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/
>> mpam_resctrl.c
>> index 573617ba09df..afa3c084c475 100644
>> --- a/drivers/resctrl/mpam_resctrl.c
>> +++ b/drivers/resctrl/mpam_resctrl.c
>> @@ -222,6 +222,10 @@ int resctrl_arch_set_cdp_enabled(enum
>> resctrl_res_level rid, bool enable)
>>       if (enable && mpam_partid_max < 1)
>>           return -EINVAL;
>>   +    if (enable && (!
>> mpam_resctrl_controls[rid].resctrl_res.alloc_capable ||
>> +               !mpam_resctrl_controls[rid].resctrl_res.cdp_capable))
>> +        return -EINVAL;
>> +
> 
> x86 only checks 'cdp_capable', so this check isn't exactly same as to
> what's
> done on x86, as claimed in the commit log?

Sorry, the commit message is somewhat misleading and need updated.

In my opinion, CDP is a feature related to resource allocation, and it
is always reasonable to check alloc_capable.

Best regards,
Jinjie

> 
> int resctrl_arch_set_cdp_enabled(enum resctrl_res_level l, bool enable)
> {
>         struct rdt_hw_resource *hw_res = &rdt_resources_all[l];
> 
>         if (!hw_res->r_resctrl.cdp_capable)
>                 return -EINVAL;
> 
>         :
> }
> 
> 
>>       /*
>>        * resctrl_arch_set_cdp_enabled() is only called with enable set to
>>        * false on error and unmount.
> 
> Thanks,
> Gavin


