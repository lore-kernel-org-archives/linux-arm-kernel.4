Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2FD606A332
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 01:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TOmYWVuJ;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=VPfINziM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qW9MSBzHosQ7hdtobAJ7KEVajyY4W/gqzP4pj0COmPc=; b=TOmYWVuJqfMOZr
	7g2jCqZgkNC8QU1DpPIb8CW7l2cACxbl2MTxCs3A61R+6744rvqK+s4+698oHvlH0tBqF2Yz926I8
	RF0f+VypySi3rUuchTu30tl8KZJngtwdPzuhv7q9OUFTf9nV0eUywoX4mHWLJfQU6PXc5HZbGCwJ0
	fV9rsj8tMR8Ys7vGYvV0513J8mc6vIopJl5UU9s0VbiCRVihCY7MdlzI9MIeMx27J8bS1tJUVNJh4
	SqPiY53Exn57OXQAbvwBAXD9CgGdc/xsrCQohxhdXHSfdE8giigOrfYAQkBTH+XeHsBKv6cjNFeve
	MQrqKOBH27wwA5bwgoag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJq1-00000008Qr3-2onL;
	Thu, 12 Nov 2026 01:42:53 +0000
Received: from [113.46.200.224] (helo=canpmsgout09.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJpw-00000008Qp5-3R4S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 01:42:51 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=qW9MSBzHosQ7hdtobAJ7KEVajyY4W/gqzP4pj0COmPc=;
	b=VPfINziMutmXzV51O0x5Q8I/yYikzzBejH83e1meaMnYhaleoueAtFgbUctSPO5l8+ER9+kwc
	VjpVw9ZxTtA7rGXfplerLYkNHJXidhA38iozeWzw9VZis0gAOobg+DSyVkQkPzy8zyCLHbUzi+A
	5r0i0vA4P5rDJXYTNFq2d54=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4jQ36K1vHHz1cyS0;
	Thu, 12 Nov 2026 09:42:17 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 2D61340578;
	Thu, 12 Nov 2026 09:42:33 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 12 Nov
 2026 09:42:31 +0800
Message-ID: <7d27b172-d186-4b7a-87af-d0d25554b964@huawei.com>
Date: Thu, 12 Nov 2026 09:42:31 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 RESEND 7/7] fs/resctrl: Add info/moveable_mon_group
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
 <20261110133938.3768632-8-ruanjinjie@huawei.com>
 <efd9c3d5-a732-47bf-bca1-50a8650fd0ef@intel.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <efd9c3d5-a732-47bf-bca1-50a8650fd0ef@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_174249_504001_4C39F3BA 
X-CRM114-Status: GOOD (  22.02  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



在 2026/11/12 2:34, Reinette Chatre 写道:
> Hi Jinjie and Ben,

Hi Reinette,

> 
> On 11/10/26 5:39 AM, Jinjie Ruan wrote:
>> Moving a MON group into the mon_groups directory of another CTRL_MON
>> group changes the CLOSID of the group while its RMID stays the same.
>> Where the RMID is only meaningful together with the CLOSID, as on arm64
>> MPAM, the move changes the RMID index of the group and is rejected with
>> -EOPNOTSUPP.
>>
>> Userspace cannot tell whether the move is supported without trying it.
>> Add "info/moveable_mon_group", which reads 1 when a MON group can be
>> moved to another CTRL_MON group and 0 when the move is rejected, and
>> refer to it where resctrl.rst describes the move.
>>
>> Suggested-by: Ben Horgan <ben.horgan@arm.com>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> 
> Do you find that this binary "supported/unsupported" accurately captures

I think this behavior is deterministic on MPAMv1, so that's enough for mpam.

> everything that MPAM may ever want to do in this area? Could it be that, for

That would be what the new version of MPAM does (such as v2 mentioned
below), the behavior of the mapmv1 version is already determined..

> example, one day MPAM may be asked to support the move of a monitor group to
> support scenarios where the reset of monitor counts is acceptable to the customer
> and availability of PMG will be managed as part of the scenario needing support?

As stated in the MPAM manual, MPAMv2 completely separates PARTID and
PMG, allowing for more flexible and fine-grained monitoring statistics
across partitions, so the CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID will not
set for v2, However, it might need to be changed to a dynamic switch..

> 
> When adding a new interface it helps to consider future possible changes and
> aim to create an interface that solves the immediate problem while leaving room
> for future enhancements. If we do not do that the interface becomes a maze due
> to new files just being added to address the problem of the day.
> 

I agree with your idea. We need to think twice before we act.

> I would like to propose that this patch be submitted separately with the goal
> to obtain more feedback on the new interface. 

I don't object, but I understand this is the same thing as the previous
patch. I'd like to hear Ben's advice.

> 
> Reinette

-- 
Best regards,
Jinjie


