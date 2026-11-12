Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB590606A327
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 21:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TCuSmmjV;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Vsex3fdN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NWZiXsZIO9JbQ9mqYN0WWdRXv+kVOWB/KKAR39dAavU=; b=TCuSmmjVBwn/aE
	cHujogtx2sYpRA8L7gubF5+jM8D8bms+8USPKkZumS3EJEa/FC/2Ti1hpkKLU7uxuQqgynNQKWOgH
	tku5jrPsRX0NEoAG0S7REUfAdXzpajc1svMe9JFhqGoCQOON5PdxMmqwq6DcmCjhIeco1imr8NKZH
	5Ywg/UDFmv98kmHSnQCQvjiE8maebGENze7Vrq+zbFVAuGCsc0hwlbMgsF5COUXKIDjTtSzX2oC7Z
	sgO02y/q4T/sSnfjxt81FiptiSh7D8fNto/pjr3UjWYJm0ByRdQFjiEEP+qR+4Ojn4L92TOjATAUj
	7hk/iKflQiW30if4IEHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRcC8-0000000B55q-22A5;
	Thu, 12 Nov 2026 21:18:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRcC5-0000000B54u-1S2X
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 21:18:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 64E861516;
	Thu, 12 Nov 2026 13:18:48 -0800 (PST)
Received: from [10.211.55.3] (unknown [10.57.14.230])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C003D3F632;
	Thu, 12 Nov 2026 13:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794518331; bh=GjzrUYC0FSKDkhN90grSXlqpyDPaHp92cULgUh2tfzI=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Vsex3fdNuqG3xF0tWSe+ChHgcFjCFRm+bCis60U/M/RAh/iE2ON/wppdCijNGYfMc
	 1nH8aCS+WxJsjv+lKCCstbW5NQbFFdazIZGbLKOnFkbarvFK/ReYFO3VfWNttcZX5C
	 BbgLuYLCC6NKGDEyeKJ7y0lEQaIThQIIHHiDsmXk=
Message-ID: <7aa50421-6e92-4ea6-be39-88045e682a9f@arm.com>
Date: Thu, 12 Nov 2026 21:18:36 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v5 RESEND 5/7] fs/resctrl: Release the limbo RMIDs when
 the CDP state changes
To: Reinette Chatre <reinette.chatre@intel.com>,
 Jinjie Ruan <ruanjinjie@huawei.com>, tony.luck@intel.com,
 Dave.Martin@arm.com, james.morse@arm.com, babu.moger@amd.com,
 corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
 tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, fenghuay@nvidia.com,
 tan.shaopeng@fujitsu.com, will@kernel.org, gshan@redhat.com,
 zengheng4@huawei.com, jic23@kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20261110133938.3768632-1-ruanjinjie@huawei.com>
 <20261110133938.3768632-6-ruanjinjie@huawei.com>
 <3c48dac2-78af-44c9-b546-e5fcf7bbd8d6@intel.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <3c48dac2-78af-44c9-b546-e5fcf7bbd8d6@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_131853_591347_94A5D1C5 
X-CRM114-Status: GOOD (  30.80  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Reinette, Jinjie,

On 11/11/2026 18:33, Reinette Chatre wrote:
> Hi Jinjie,
> 
> On 11/10/26 5:39 AM, Jinjie Ruan wrote:
> 
>> still carry those RMIDs are accounted to the next user of each RMID.
>>
>> The CDP state that matters is the one that changes the PARTIDs used by
>> the monitors, which is not necessarily the CDP state of the L3
>> resource. MPAM gives every CLOSID two PARTIDs in all MSCs while CDP is
>> enabled on any resource, so enabling CDP on L2 alone also changes the
>> PARTIDs the L3 monitors use. Add resctrl_arch_mon_cdp_enabled() to let
>> the architecture report this. Only MPAM can be affected, so the RMIDs
>> are only released where the RMID depends on the CLOSID. On x86 the
>> RMID does not depend on the CLOSID, and resctrl_arch_mon_cdp_enabled()
>> returns false.
> 
> nack. The helper name and value returned on x86 is the first hint that this
> is not right. For x86 the value is not a statement about x86: CDP exists on
> x86 and can be enabled, so a function called resctrl_arch_mon_cdp_enabled()
> returning false reads as wrong until the comment above it explains that what
> is really being reported is whether CDP changes the IDs the monitors use.

The invariant that the limbo handler is currently relying on is that the
mapping of rmid index to the underlying hardware monitor index is fixed.
For MPAM, if cdp is enabled at all then the mapping is changed and so
the invariant does not hold between mounts. MPAM's emulation of CDP is
why it breaks the invariant. resctrl shouldn't need to care about this
MPAM specific reason and should only care whether or not the invariant
is upheld or not. In the future, MPAM may use more than the two existing
indexing schemes. For instance, if we wanted to have one memory
bandwidth monitor per monitor group, without assignment, then we would
need to limit the number of monitor groups.

> 
> Every architecture now needs to match this. This looks more like forcing
> every architecture to indicate whether it has the same quirk as MPAM.
> 
> If there is no way to handle this in MPAM driver then handling this should at
> least be contained between resctrl filesystem and MPAM driver. This should not
> be forced on all architectures.

I don't see a way for the MPAM to keep the same RMID for when it is
emulating CDP and when it's not.

> 
> I trust the MPAM folks to say whether it can or cannot be done in MPAM driver.
> If this is not possible in MPAM driver then it looks like this needs to go back
> to include the L2 CDP check as was done in previous version. With this check 
> gated by IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID) it does hint "MPAM"
> but would also need a comment to explain why that is done.
> 

Would something like an rmid indexing generation count be any better or
is that just overthinking it?

int resctrl_arch_rmid_indexing_generation(void);

If the indexing never changes the arch could always return 1 and if it
does change the architecture can bump the number on every change. It
would still never change when resctrl is mounted.

Thanks,

Ben

