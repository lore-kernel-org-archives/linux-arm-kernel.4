Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E42D606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 01:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=G2EIfmT0;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=mSGHV/fR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SwB65NDCD7dMl4GMFsA6YFDjlZbBOrv7n+wN9M5+n+k=; b=G2EIfmT0nGyX6Y
	ZnwtJDWpdERoS57s34o4JxqxStziZNSkw3kYJrj7pek6cLSQIFEKzNbzvC1mk76PyjUS+q6jdQniF
	xIjVxp9U5YYGiRIhZyWcVVQAR0py4RCF/CtxSeZyeUneiQHEmCWNS6hf+qbauG2E1yJoWTlAQgCQo
	BKrws+I6kvNzBPmof4W2UCFkGXENtSJqkUJH3lQGLdjP2STZwb05mEXD9TRMVHbfpclKvjTL0R4s/
	DGQWHt8OpejeZ4EDM9g8TCO3JIOFKpbmtu6kBBUXT1/etNw0isDv+jlo/74KvAVJeLltI7nai+aNz
	s3UJwZuqb/C0VYU/Talg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJs6-00000008RDc-0SFx;
	Thu, 12 Nov 2026 01:45:02 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJs3-00000008RCV-0MNO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 01:45:00 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=SwB65NDCD7dMl4GMFsA6YFDjlZbBOrv7n+wN9M5+n+k=;
	b=mSGHV/fR8NRZ00QkQkxMsHT2/fNb1dGbrG0Aza/+7P9FywLB7M/q0XAH+pHDn2X2xEnU1awzB
	MzUL474Y0lp/k0rQtAwYmg6VTDlmks8GIEJPww3VmqMFhWKIU6/wWBoWXDBUF96RvtBdcxv4aim
	4Lrm8hKbbgx0esMny6tczf8=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4jQ38Y2gZCzcb0y;
	Thu, 12 Nov 2026 09:44:13 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 477D94056E;
	Thu, 12 Nov 2026 09:44:54 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 12 Nov
 2026 09:44:53 +0800
Message-ID: <e4bfab88-be7f-4146-99ff-c7023f2cb0bb@huawei.com>
Date: Thu, 12 Nov 2026 09:44:52 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 RESEND 3/7] fs/resctrl: Clear the CDP state after the
 cleanup
To: Reinette Chatre <reinette.chatre@intel.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>, <rdunlap@infradead.org>,
	<tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <ben.horgan@arm.com>,
	<fenghuay@nvidia.com>, <tan.shaopeng@fujitsu.com>, <will@kernel.org>,
	<gshan@redhat.com>, <zengheng4@huawei.com>, <jic23@kernel.org>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20261110133938.3768632-1-ruanjinjie@huawei.com>
 <20261110133938.3768632-4-ruanjinjie@huawei.com>
 <ad702ee1-ef91-412a-99ad-e425325e21a4@intel.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <ad702ee1-ef91-412a-99ad-e425325e21a4@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_174459_508727_9BFC437C 
X-CRM114-Status: GOOD (  29.21  )
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



在 2026/11/12 2:27, Reinette Chatre 写道:
> Hi Jinjie,
> 
> On 11/10/26 5:39 AM, Jinjie Ruan wrote:
>> On MPAM a CLOSID is translated into the PARTIDs that the hardware
>> configuration uses. Without CDP, CLOSID c is PARTID c; with CDP it is
>> PARTIDs 2c and 2c+1. resctrl_unmount() clears the CDP state with
>> rdt_disable_ctx() before resctrl_fs_teardown() removes the groups, so
>> the teardown translates the CLOSIDs differently from when the groups
>> were set up.
> 
> This behavior is not unique to MPAM. Above makes this sound like
> architecture specific behavior that makes one wonder why this needs
> to be fixed in resctrl filesystem

Will update it >
>>
>> For example, rdtgroup_unassign_cntrs() unassigns and resets the MBM
>> counters of each group through resctrl_arch_config_cntr(). On MPAM that
>> helper maps a counter to a monitor with the index
>> resctrl_get_config_index() returns for the CDP state. A counter assigned
> 
> Please take care not to narrate the code. Instead just describe the flow
> on a high level to help understand the change without needing reader to
> refer to the code much.

Sorry, will describe it on a high level>
>> while CDP was enabled is mapped to the monitor for PARTIDs 2c and 2c+1.
>> With CDP cleared, MPAM removes the mapping of PARTID c and resets the
>> monitor for PARTID c instead, so the mappings of PARTIDs 2c and 2c+1 are
>> left behind. The helper had an empty body on MPAM until the ABMC support
>> implemented it, which is when the teardown started to program the
>> mapping with the cleared state.
>>
>> Clear the CDP state after resctrl_fs_teardown(), so the teardown runs
>> with the CDP state the configuration was created under.
>>
>> x86 is not affected as its RMIDs and counters do not depend on the
>> CLOSID.
> 
> I think x86 is lucky here to not have encountered this issue and this fix
> applies to it just as much, adding to motivation for this needing to be
> included in the filesystem. Below is an example of a changelog that aims
> to capture all the comments, you need not use verbatim and are welcome to
> improve (and please correct) it:

Will consider the example, thank you!

> 
> 	To support CDP, resctrl halves the number of CLOSIDs available to
> 	resource groups and gives each remaining CLOSID two hardware
> 	configurations instead of one, distinguished by index: 2 * CLOSID for
> 	data and 2 * CLOSID + 1 for code. Without CDP a CLOSID has a single
> 	configuration, at index CLOSID. Every architecture computes these
> 	indices the same way.
> 
> 	Unmounting clears the CDP state before it undoes what the groups were
> 	given, so the cleanup computes index CLOSID where the group was set up
> 	with 2 * CLOSID and 2 * CLOSID + 1. The group's two configurations are
> 	left in place and index CLOSID is cleared instead, which with CDP
> 	enabled is a configuration of a different CLOSID. The architecture may
> 	keep this state for as long as the resource exists.
> 
> 	Only MPAM can reach this today. Of everything the cleanup has to undo,
> 	MPAM addresses only the MBM counter assignment by the translated CLOSID,
> 	and it only began doing so when it implemented assignable counters. x86
> 	addresses its counters by RMID alone.
> 
> 	Clear the CDP state after the cleanup, so that the cleanup runs with the
> 	CDP state the groups were set up under.
> 
>>
>> Fixes: 6e0e538a75ce ("arm_mpam: resctrl: Add resctrl_arch_config_cntr() for ABMC use")
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> Cc: <stable@vger.kernel.org> # 7.3+
> 
> Looks like 6e0e538a75ce landed in 7.3 so the stable constraint looks unnecessary?
> 
>> ---
> Patch looks good to me.

Thanks for the review.

> 
> Thank you very much.
> 
> Reinette

-- 
Best regards,
Jinjie


