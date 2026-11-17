Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A66606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 03:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wOEYkdz2;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L9qflDvY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VjhI9txFfRTko2BSCtlm1pUp3KaQ41pWXwKSOhoN710=; b=wOEYkdz235+eAm
	yJV+4ip0NQLDETPDs8NRe6knjqFfBE+ndCiud2YgXk5GsV5W1WkLiefRQT+yO2mJ7c8ImZ72LZ+8W
	9j1Ws1rlyCBd/JfmG6vAvMWJNTFQb6/o2QDbLMTf0r7abwdRYDO8/B4eJAFkIU8H5twrA88Lq8phr
	5xx4B55ATad2wUuf7gFCz3WQBxHZihdkPS7Y9om3PhPQD88zrTw2on9JzsMTN3g+7UAlNtY+uqft0
	RtVDtKGr8eJcdgNUqBro0xhpt0u4CYbh9YHAJ7MdI4GZpssArd3JjfgdKYQAa9pOepccKG+0b4ZEc
	kad1pEITsCI8EclUwbdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTACs-00000004W2P-1Mb2;
	Tue, 17 Nov 2026 03:50:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTACp-00000004W1A-0KSh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 03:50:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794887400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VjhI9txFfRTko2BSCtlm1pUp3KaQ41pWXwKSOhoN710=;
	b=L9qflDvYoqsC+GEzWadd+dnqFzmoBOodJA5qmZuzbUKY3rUb7au5RNi4ydF7H3TdDBBPLR
	+d8G18dnfwG/jTNN+OU6HuYBlYHiznGlgmI2QVzluSaWVW74G1vRRn7grRiPXlvUjFjKea
	PyOEsNkDTffWtqS1mT3Y0hf3lgM0E0s=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-328-pECc-vHQPIugDDzLFXCypQ-1; Mon, 16 Nov 2026 22:49:59 -0500
X-MC-Unique: pECc-vHQPIugDDzLFXCypQ-1
X-Mimecast-MFC-AGG-ID: pECc-vHQPIugDDzLFXCypQ_1794887398
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8b32efd7ec4so3938596b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 19:49:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794887398; x=1795492198;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VjhI9txFfRTko2BSCtlm1pUp3KaQ41pWXwKSOhoN710=;
        b=IRFukRSMtXpvVcmWFSIi8aUe2C9Sv5iblaD1SXqLg9/PLuIJo7Y4ZkYObxAGBLDjbS
         eLLAp5frI5HLFAcOjzIaq3395kOY61fP1X5XFQFFOlQVrmB/0Ydj9X4qP2/Q+tTcwN5S
         kW3EVcHfPUZDtg+IHLAAvJNh7oQyOhfC7nIEbufvoiqa2xNI+jq/X+pWkEQ5ipS/DlpH
         KdVH0Mm4JMhG7wlBDe9qxziRFbFZYJ12ZKUS5NbhVaILismm4bjI3BYGTSCb4DRInAzy
         VhAmHb7wuRtiSjtcsjsOu4CD8q2iv8D5owKsrEUASanSjuZjBTfX10ema+uzEoqaj+5v
         JpNw==
X-Forwarded-Encrypted: i=1; AL+hErHHYoNM6UpLYQT7Z619TKsacBsdfitA8T7fDrkbnTruTXHlh0TIL7adZASoDF8NlP+AGk/l0dr+lGe59ofc0IfP@lists.infradead.org
X-Gm-Message-State: APuU4Z9rWdLgw/qxfBIX6c8HwKRy/E/pNPoyfD7A8cF5Luiutjt60glv
	8XXciypwjYgttRSrKft4K9OLEzb0nQlJSknc2BjDjw7hsKgrNtwNhcV9pTR9yqttwheXkJhg9WB
	qNmPsK+nZMZ+7fWcqKmPZOKN3f4Shv55AAFBWkNvfDRtvlRpsfNLi8cOWlpFWW6JqxXe4tVRuP7
	eH
X-Gm-Gg: AYBFou0yLveRfbbiCjrTEEaxJoIJzdhPJnw9LpwfWYNj+lLN6qk0snLC+hMMZ2uTtTI
	f3V5QKYsdmA9egNvvMfnN2AHwB4WmI50m+MrAA7sV0gHtlKszTEM08WvIIDwTJGSU8aehY02LaF
	X64R6XLifUG9YBVHeRPL/cI813jZKJ0/y6kk72hSOye+uxrgSckq5cENuNdo2fcoZqUelpaZ7w9
	/Vs4o3FYTikX/cTITyjWsJBhvxa+g/ZezKqBa/Joff/G7qrUDeh0JXHij8m0hketJvB4wyRgzBl
	lmqweM26pArYODgFQsb0E90HnZOrT14hpIWbLcGzkMWcYSqy8BX36hyFja6Azs1vLb14/2guSV5
	3ciPNmdHnRlvM0k542MqkGrSj9V2BxfuNYe3l9okFWMx7zmnOmgFBe1gH6wB7G5ZJ8VnX3uM8vc
	YAAdSshn/g7X79shc=
X-Received: by 2002:a05:6a00:340f:b0:857:7317:cff5 with SMTP id d2e1a72fcca58-8beb6197550mr10516404b3a.22.1794887397468;
        Mon, 16 Nov 2026 19:49:57 -0800 (PST)
X-Received: by 2002:a05:6a00:340f:b0:857:7317:cff5 with SMTP id d2e1a72fcca58-8beb6197550mr10516380b3a.22.1794887396928;
        Mon, 16 Nov 2026 19:49:56 -0800 (PST)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bececcc68csm4430596b3a.8.2026.11.16.19.49.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 19:49:56 -0800 (PST)
Message-ID: <cc2d1a43-d8be-4ed0-ac96-30b326b67280@redhat.com>
Date: Tue, 17 Nov 2026 13:49:48 +1000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] arm_mpam: resctrl: Only enable CDP on a resource
 that supports it
To: Jinjie Ruan <ruanjinjie@huawei.com>, james.morse@arm.com,
 ben.horgan@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
 zengheng4@huawei.com, tan.shaopeng@jp.fujitsu.com, jic23@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261111081316.3828283-1-ruanjinjie@huawei.com>
 <20261111081316.3828283-3-ruanjinjie@huawei.com>
 <a783b375-7c27-4c91-b40e-7e615d33bc5b@redhat.com>
 <b1fd5fa8-bf03-4575-bc05-540a288b609d@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <b1fd5fa8-bf03-4575-bc05-540a288b609d@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gEs3ixt_oyoyBbLuqLsWOegVmrFfQ2d9eB6npqmW2fc_1794887398
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_195003_216777_ED02B950 
X-CRM114-Status: GOOD (  19.71  )
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

Hi Jinjie,

On 11/17/26 1:31 PM, Jinjie Ruan wrote:
> 在 2026/11/13 7:42, Gavin Shan 写道:
>> On 11/11/26 6:13 PM, Jinjie Ruan wrote:
>>> resctrl_arch_set_cdp_enabled() enables CDP for any cache level that is
>>> requested, even one that has no MPAM cache controls. Mounting resctrl
>>> with -o cdpl2 when only L3 can allocate still turns CDP emulation on for
>>> the whole system, so every CLOSID takes two PARTIDs while resctrl keeps
>>> its CLOSID count at the number of PARTIDs. Control groups in the upper
>>> half then map to PARTIDs beyond mpam_partid_max, which index past the
>>> configuration and monitor arrays and program out of range PARTIDs into
>>> the MSCs. On QEMU with 5 PARTIDs the first monitor read after creating
>>> 2 control groups raises MSMONCFG_ID_RANGE for PARTID 5, and MPAM is
>>> disabled.
>>>
>>> Do not enable CDP when a resource cannot allocate or is not CDP capable,
>>> as x86 does, so the mount fails instead. Only the enable path is checked,
>>> since unmount disables CDP on both cache levels to restore the MBA
>>> control.
>>>
>>> A system where only MBA can allocate, or that only has monitors, now
>>> fails a mount with CDP as well: CDP hides the MBA control because
>>> mbw_max is a per-PARTID maximum, leaving nothing for CDP to apply to.
>>>
>>> Fixes: 6789fb99282c ("arm_mpam: resctrl: Add CDP emulation")
>>> Link: https://sashiko.dev/#/bug/linux-05c19551-0bba-4a06-
>>> aa2c-3c90fab5853d
>>> Suggested-by: Ben Horgan <ben.horgan@arm.com>
>>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>>> Cc: <stable@vger.kernel.org> # 7.1+
>>> ---
>>>    drivers/resctrl/mpam_resctrl.c | 4 ++++
>>>    1 file changed, 4 insertions(+)
>>>
>>> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/
>>> mpam_resctrl.c
>>> index 573617ba09df..afa3c084c475 100644
>>> --- a/drivers/resctrl/mpam_resctrl.c
>>> +++ b/drivers/resctrl/mpam_resctrl.c
>>> @@ -222,6 +222,10 @@ int resctrl_arch_set_cdp_enabled(enum
>>> resctrl_res_level rid, bool enable)
>>>        if (enable && mpam_partid_max < 1)
>>>            return -EINVAL;
>>>    +    if (enable && (!
>>> mpam_resctrl_controls[rid].resctrl_res.alloc_capable ||
>>> +               !mpam_resctrl_controls[rid].resctrl_res.cdp_capable))
>>> +        return -EINVAL;
>>> +
>>
>> x86 only checks 'cdp_capable', so this check isn't exactly same as to
>> what's
>> done on x86, as claimed in the commit log?
> 
> Sorry, the commit message is somewhat misleading and need updated.
> 
> In my opinion, CDP is a feature related to resource allocation, and it
> is always reasonable to check alloc_capable.

Making sense, with the commit log improved:

Reviewed-by: Gavin Shan <gshan@redhat.com>

> 
> Best regards,
> Jinjie
> 
>>
>> int resctrl_arch_set_cdp_enabled(enum resctrl_res_level l, bool enable)
>> {
>>          struct rdt_hw_resource *hw_res = &rdt_resources_all[l];
>>
>>          if (!hw_res->r_resctrl.cdp_capable)
>>                  return -EINVAL;
>>
>>          :
>> }
>>
>>
>>>        /*
>>>         * resctrl_arch_set_cdp_enabled() is only called with enable set to
>>>         * false on error and unmount.
>>

Thanks,
Gavin


