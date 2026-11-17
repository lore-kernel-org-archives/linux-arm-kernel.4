Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F3E606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 13:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=un266jaV;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=VFmiYNfK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XekK17PZVeAg1EAr0WE/yrPV7Cb/raW68qRRXtrEj8Y=; b=un266jaVcIfYva
	9sgccZr7YI+nqq4A+LB5Cq8Bju97ePEVjV2WAh8lNSZw6j4ROzprG/WC2gI5/59glcNFVPahD1Opx
	ctCXdShoPx+fIBl543Q1vvgNs7kCWyPdtec82IwXnfaEqyrOSqKwOjyBsNcLSMnkA7gnU/8B5umms
	Fl0DK37NnbtBOIHlpF2EX2rVLviELICyQh44rZepAUUgX7wIvdQvmYIXnPmS1cvzub/u4vmkuBV84
	xpWvYHuBgHtg6O++Zr4/mb/nD7EOleyGDVS7mSUk5if6jRe9xaI7xWSOYfblDVNUc4xk/SdePTGak
	OHAKBdYAVsBr2j/o8xdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJTc-000000060Hj-1ZHm;
	Tue, 17 Nov 2026 13:44:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJTZ-000000060H7-3PSK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 13:43:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9FF2D1476;
	Tue, 17 Nov 2026 05:43:53 -0800 (PST)
Received: from [10.211.55.3] (unknown [10.57.17.180])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3905F3F632;
	Tue, 17 Nov 2026 05:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794923036; bh=ug4DXiwzrQJM5OXNn5R3tQTW4M8dAr6uuOFwNPex6f8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VFmiYNfK+u/GffYcWORPBwD8cDhkiKcQT+7otu4MzQg+yyZJyCwZcosn8/oIrUHV6
	 ZNQ60AxEnR0rJIbVaM//V4rjXoCt03OB7NEWTpobg76oWUHVVYaf8LbJ0bpQgJCV/M
	 Kt0ysRjCnEZhKIuZLIjQUTGEermhAocggPEczfrg=
Message-ID: <10d97df6-ccfc-4025-9773-0ebe7421cbaf@arm.com>
Date: Tue, 17 Nov 2026 13:43:51 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH RFC v1 0/6] arm_mpam,resctrl: expose MPAM MBW_MAX hard
 limit
To: Fenghua Yu <fenghuay@nvidia.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Tony Luck
 <tony.luck@intel.com>, James Morse <james.morse@arm.com>,
 Will Deacon <will@kernel.org>, Dave Martin <Dave.Martin@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Shaopeng Tan <tan.shaopeng@fujitsu.com>, Chen Yu <yu.c.chen@intel.com>,
 Babu Moger <babu.moger@amd.com>, Drew Fustini <fustini@kernel.org>,
 Vikram Sethi <vsethi@nvidia.com>, Shanker Donthineni
 <sdonthineni@nvidia.com>, Newton Liu <newtonl@nvidia.com>,
 Richard Cheng <icheng@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261109212937.1409570-1-fenghuay@nvidia.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261109212937.1409570-1-fenghuay@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_054357_937525_F63802B6 
X-CRM114-Status: GOOD (  25.39  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Fenghua,

On 09/11/2026 21:29, Fenghua Yu wrote:
> This series exposes the ARM MPAM MBW_MAX HARDLIM bit through resctrl.
> The MBA schemata line sets the maximum bandwidth. HARDLIM selects
> whether that maximum is a hard limit. It is a per-domain 0/1 value, not
> another percentage, so it is a separate control on the MBA resource
> rather than a second bandwidth percentage.
> 
> MPAMF_MBW_IDR.MAX_LIM reports how the implementation encodes that limit.
> When the probed value is 0, this kernel treats HARDLIM as read/write.
> When MAX_LIM is nonzero, or the platform has no hard-limit control, the
> schemata line is omitted.
> 
> The line follows the MSC, the same way the bandwidth line does. A cache
> MSC uses cache ids:
> 
> 	       MB:1=100;2=100
> 	MB_MAXHLM:1=0;2=0
> 
> A memory-level MSC uses NUMA node ids:
> 
> 	       MB_NODE:0=100;1=100
> 	MB_MAXHLM_NODE:0=0;1=0
> 
> Please advise if "MB_MAXHLM" on cache ids and "MB_MAXHLM_NODE" on
> NUMA ids meet the new naming conventions.

It doesn't look to match the naming convention to me.

I was expecting: <resource_type>_<scope>_<control>_<control_param>.

Reinette asked you your view on this here:
https://lore.kernel.org/all/e13cf2e7-3956-4069-ac43-c65e874c6109@intel.com/

Thanks,

Ben

> 
> 0 clears HARDLIM (soft limit). 1 sets HARDLIM. New groups start with the
> hard limit off. info/MB/schemata/MB_MAXHLM/max and
> info/MB/schemata/MB_MAXHLM_NODE/max are 1. The bandwidth control's max
> stays 100. The control directory under info/MB/schemata/ is MB_MAXHLM or
> MB_MAXHLM_NODE.
> 
> The 6 patches are grouped as follows:
> 
> 1. resctrl hard-limit control (patch 1)
> 
>    Parse MB_MAXHLM as a 0/1 value on the MBA resource, and initialize
>    new groups with HARDLIM clear.
> 
> 2. MPAM probe and config (patches 2-3)
> 
>    Read MAX_LIM from MPAMF_MBW_IDR, derive HARDLIM read/write when that
>    encoding is 0, and keep the HARDLIM bit in mpam_config so later
>    MBW_MAX programming does not drop it.
> 
> 3. Wire the control (patch 4)
> 
>    Create the MAXHLM control on the MBA resource when HARDLIM is
>    read/write, and read and write it through resctrl_arch_get_config()
>    and resctrl_arch_update_one().
> 
> 4. Node scope and documentation (patches 5-6)
> 
>    On a memory-level MSC, name the control MB_MAXHLM_NODE, set the
>    resource scope to the NUMA node, and give the hard-limit control the
>    range 0..1. Document both schemata lines.
> 
> The branch is on top CPU-less RFC V3 and resource controls RFC V2:
> https://github.com/fyu1/linux/commits/hlim.rfc.v1
> 
> Testing
> 
> Brought up on an ARM MPAM platform whose MBA resource is a memory-level
> MSC. resctrl mounts, and schemata lists MB_NODE and MB_MAXHLM_NODE with
> NUMA node ids. Not tested on x86 beyond compilation of the resctrl
> changes.
> 
> Fenghua Yu (6):
>   resctrl: wire MB_MAXHLM schemata parsing and group setup
>   arm_mpam: resctrl: probe MPAMF_MBW_IDR MAX_LIM and hardlim_rw
>   arm_mpam: resctrl: track MBW max hard-limit in config
>   arm_mpam: resctrl: add MAXHLM control on the MBA resource
>   arm_mpam: Add MB_MAXHLM_NODE and Node scope
>   Documentation: resctrl: document MB_MAXHLM for MPAM MBA
> 
>  Documentation/filesystems/resctrl.rst |  28 ++++
>  drivers/resctrl/mpam_devices.c        |  67 ++++++++-
>  drivers/resctrl/mpam_internal.h       |   8 ++
>  drivers/resctrl/mpam_resctrl.c        | 191 +++++++++++++++++++++-----
>  fs/resctrl/ctrlmondata.c              |  36 +++++
>  fs/resctrl/rdtgroup.c                 |  17 +++
>  include/linux/resctrl.h               |  16 ++-
>  7 files changed, 325 insertions(+), 38 deletions(-)
> 


