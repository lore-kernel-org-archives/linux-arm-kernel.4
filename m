Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10596606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 23:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NEJs2myb;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aMFpOYBV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Fp4tdSd/mDb/LWGtHZMVb3duVaZTa+5YiNZw4U0pJl0=; b=NEJs2mybrb5Fa4
	2PkUA3sBtPGfgxcOcG7XQsgiiXLscpimzLcwgQdJ3qg/W3w7BnPVL9UUeB3+oJN0xWIMs+MH+SAnd
	pBErZ7QcvgBiJl7Xp0g6iBS/3w0916NaflH+2nJXIcl0NWkH2FMJWAuaVMsICBGYQZ2bnXBlBhMgL
	zoF0JvwVYq3z8mU9uVR0LyUttOQ3YHqNSQrhjlsOmpy77QIXWEOyG4TGUfbI56dg4TKowfrKEvryl
	kC7Dl/QOigwwkt9ihYhWV8M2JYQVheJ8TEbnSeZbhfCHTzcD3V3N24f9zkOEY3rX0CtoMJDQjmNl/
	eM+N/emgTfDrB6I+3gaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xReVE-0000000BGf2-03Zs;
	Thu, 12 Nov 2026 23:46:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xReVB-0000000BGeX-1Bo9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 23:46:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794527204;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fp4tdSd/mDb/LWGtHZMVb3duVaZTa+5YiNZw4U0pJl0=;
	b=aMFpOYBV3sKiSX/C8LUcfGIZPqqNl7cJvy70h4f9lAsjx/mUAuvubLzk2HuukL23bojyzk
	rXt8wtR87Qo3HyV6NhzfbmXGOGnxkySdlrcMDEho7gVPEhBXV5/MVfrsL4WbOFTVmRpiav
	uWYWr9s2bMm74CTwe6z3n+pbCuzg+II=
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-222-VTYT7EEaPyOuSIiGB-cY3w-1; Thu, 12 Nov 2026 18:46:40 -0500
X-MC-Unique: VTYT7EEaPyOuSIiGB-cY3w-1
X-Mimecast-MFC-AGG-ID: VTYT7EEaPyOuSIiGB-cY3w_1794527199
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so601539eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 15:46:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794527199; x=1795131999;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fp4tdSd/mDb/LWGtHZMVb3duVaZTa+5YiNZw4U0pJl0=;
        b=ko36v9kE1qoI0M/SEhu3/ChhmwPk4MXcvXggYfsYqFHahM1nO/hLMYNct5fUxVRnHZ
         txtrbDnPyXKG96k5XkhIe2oPibbVxrLZLZFdJQMWkXOcPk6Ut2iVlTaKLAmj3gp+u4iG
         TQWMYLMsvY+rUC4S6gW+hijeSFZqQud6b3Cme/PNgaDAAJLJfy64e2r1oppOkk5UmoQ7
         o8lpBMAxhrPEUdPUYj7m8DS0FW/nBh6GMiR61D8cNdsp6cMyv828shkyS7iZlHGEYXKm
         6FkyVqALmba9DQYJLtZLZ7jm2LE3XP/N5UFD22TTEXhRV+bGAuHOpQo6Spa0IsQ7H0v2
         28fA==
X-Forwarded-Encrypted: i=1; AL+hErHOCRDwqeAq/yakSD9dDH8A7OcEz2M9FoefIshtFJcn9Rs5eX9vB7w+jCo1RpqRQ+BbaO7ESQbn3vdIvBP+iCUU@lists.infradead.org
X-Gm-Message-State: APuU4Z9PeADj4j8g4NLnnrpe7O/UKq1AHoax8h9DLWEZkxVFha0OT9cY
	W11/aFnkBcmc6sMh1EIppZXOrTs0Y83o3rdfWIo2aMMVDWaxGKG9m5jwm6h3qaGJjXHqJEat32b
	TFHsgn3m8AUIACQ2cBZsVJc6tFxY25mVLOC2mVKHOXnP8zHUDDAdqYsXd/rwzsjO7wNbHNU/dvK
	FJ
X-Gm-Gg: AYBFou2+MzwReuNaramZIRQpt6wHvei+OxC/AgUXqFQikUNxVmV1cUa8WGiLSeytooF
	EepcwQZpGYj1eGgBanUtv/KOANz8cvd5D3j5OF8T7DUc1p3vibpkwZRpvtHTpVqMg/Yu76FYNSc
	37DZjQbuNMdmZ0Czc19Bd2BTS8C+VflcLRm6BamOZc+kDjcrWGViaWjlY9W5AFA4ucUYIeOkcl7
	OcSRvMFo0WGjJOII6+rKX5hplntrpvgx8K963JfH0OGxyQtLfoLmP0bTNKccYnm1aHb/5iuVAWo
	7WLSi2n+zpgdQYL+rgyPKjHhwnFdfS6WWwuzz7kNH6HSxExkfemOZqii359MZaD0GPUck40Ccus
	s/5WP3m1ejPPEJOgIUAYqMfmopiw54JUsoPxZ3NXpXcA3s8RsEzJ+9d+EP9Zs6ZIu4hs0EXnP2w
	vez5quE89o/bej6As=
X-Received: by 2002:a05:7300:a21f:b0:36e:c85c:3bbc with SMTP id 5a478bee46e88-37965ca778amr617158eec.12.1794527199125;
        Thu, 12 Nov 2026 15:46:39 -0800 (PST)
X-Received: by 2002:a05:7300:a21f:b0:36e:c85c:3bbc with SMTP id 5a478bee46e88-37965ca778amr617132eec.12.1794527198548;
        Thu, 12 Nov 2026 15:46:38 -0800 (PST)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379553316f2sm1655703eec.9.2026.11.12.15.46.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 15:46:37 -0800 (PST)
Message-ID: <da4c6658-a4a0-43ae-92da-14d8463dfc08@redhat.com>
Date: Fri, 13 Nov 2026 09:46:32 +1000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm_mpam: resctrl: Limit num_rmids to the CLOSIDs
 in use
To: Jinjie Ruan <ruanjinjie@huawei.com>, james.morse@arm.com,
 ben.horgan@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
 zengheng4@huawei.com, tan.shaopeng@jp.fujitsu.com, jic23@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261111081316.3828283-1-ruanjinjie@huawei.com>
 <20261111081316.3828283-4-ruanjinjie@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20261111081316.3828283-4-ruanjinjie@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: luapB1-sUeg0q_rupa3fGjh6jRZkAxizqdz72-jFKPQ_1794527199
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_154645_403625_482722F6 
X-CRM114-Status: GOOD (  21.88  )
X-Spam-Score: -2.8 (--)
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

On 11/11/26 6:13 PM, Jinjie Ruan wrote:
> On MPAM an RMID is a PMG within a PARTID, so resctrl can only allocate
> the PMGs of the CLOSIDs it uses. info/L3_MON/num_rmids is instead set
> to the whole PARTID and PMG space when the monitors are initialised,
> and halved when CDP is enabled. It reports more RMIDs than resctrl can
> allocate in two cases:
> 
> - With CDP each CLOSID takes two PARTIDs, and resctrl halves the
>    CLOSID count rounding down, while MPAM halves the whole RMID space.
>    With 5 PARTIDs and 2 PMGs resctrl has 2 CLOSIDs and 4 RMIDs, but
>    num_rmids reads 5. The count is too high whenever the number of
>    PARTIDs is odd and there is more than one PMG.
> 
> - On a monitor-only system there are no control groups and resctrl
>    only uses the default CLOSID, but num_rmids still covers every
>    PARTID. With 5 PARTIDs and 2 PMGs it reads 10 while only 2 RMIDs
>    can be allocated.
> 
> RMID allocation is limited to the CLOSIDs in use, so only the value
> reported to userspace is too high. Creating as many monitor groups as
> num_rmids allows fails with -ENOSPC before that number is reached.
> 
> Count the CLOSIDs resctrl uses instead: every resource has
> mpam_partid_max + 1 CLOSIDs, halved and rounded down while CDP is
> enabled, and a system with no resource that can allocate uses only the
> default CLOSID. Report (pmg_max + 1) RMIDs for each of those CLOSIDs.
> Count at monitor initialisation and from resctrl_arch_set_cdp_enabled(),
> which resctrl calls whenever a mount or unmount enables or disables
> CDP.
> 
> Fixes: 264c285999fc ("arm_mpam: resctrl: Add monitor initialisation and domain boilerplate")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: <stable@vger.kernel.org> # 7.1+
> Cc: James Morse <james.morse@arm.com>
> Cc: Ben Horgan <ben.horgan@arm.com>
> Cc: Reinette Chatre <reinette.chatre@intel.com>
> Cc: Fenghua Yu <fenghuay@nvidia.com>
> ---
> v4:
> - Simplify the fix with mpam_partid_max, cdp_enabled
>    and resctrl_arch_alloc_capable() as Ben suggested.
> v3:
> - Drop resctrl_arch_set_mon_rmid_count() and count the CLOSIDs in the
>    MPAM driver instead, as Ben suggested.
> - v2: https://lore.kernel.org/all/20261105123304.2281987-1-ruanjinjie@huawei.com/
> v2:
> - Also fix num_rmids on monitor-only systems, as Ben suggested.
> - Retitle from "arm_mpam: Round the CDP RMID count down to whole CLOSIDs".
> - v1: https://lore.kernel.org/all/20261104101622.563280-1-ruanjinjie@huawei.com/
> ---
>   drivers/resctrl/mpam_resctrl.c | 30 +++++++++++++++++-------------
>   1 file changed, 17 insertions(+), 13 deletions(-)

Reviewed-by: Gavin Shan <gshan@redhat.com>


