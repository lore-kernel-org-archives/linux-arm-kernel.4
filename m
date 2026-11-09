Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FF6606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 08:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ahVfjOKp;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fzcxw7qn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VcAkY3YiPTQFVieeDjubnbkf41BaBANgAAkiKJvWm2w=; b=ahVfjOKpwldLWG
	b+qq0m0UsJxkoMQCIE0gGWc7l+bTQGACpq6WCYdf9YB5/9nlGto8MOihnIh8/HML1kwJObFyAaSOJ
	FSzx1lDRcTlkvSjbDgUvJGKHTyzqZlCe360CKSG5onIpmRJrrl/3/n4B8LEGiTRUkujWrR4GDpkPM
	bJlLNvm0xLgeAWBtZE8nxiyPXUetxb56MUzFgFph1XDtMVsPuSaUu1OF7yvsTV/KUWGMQYxnpICIs
	B/ty1w8XqdPeTpsqYYreIJjUoj2iAHavJ5hQGFemCQaBnY9QHNFljA229kwW9t42LzoKHKdbrz9Mj
	FMJWeI0bbPeW+zgw2Lsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQKeA-000000002cH-3Ijb;
	Mon, 09 Nov 2026 08:22:34 +0000
Received: from mail-dl2-x07.google.com ([2607:f8b0:4864:38::7])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQKe5-000000002ao-1Ism
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 08:22:33 +0000
Received: by mail-dl2-x07.google.com with SMTP id a92af1059eb24-13985f8229aso678466c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 00:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794212548; x=1794817348; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VcAkY3YiPTQFVieeDjubnbkf41BaBANgAAkiKJvWm2w=;
        b=fzcxw7qndX4pH8E46FZxWHbLpsoirYsYb/YbNhcp2MmSrcUCNAtFFeVZ8knXZnL9Yu
         br7CY5Eock4DrS8tDVpgXaRujXGDzHyte7OgeV2/PO26k2jkuflUhGF8LiHlfSWwKcBz
         J/UUJLG+tddcQULVAdz6XxgkaTpHOPRUMb+0iQ0Zt+u6U0ff7Zf/KgTP1oyX5aWZwvjN
         8qpT9f629GF58ZO8SHmhpzMESvmxCSPHHFvxI73YYxTgZXd9cPWUPeG488y9nrLUex57
         gR3p+DQHwXz99dl6XOfKBZbm36pqkcmFsbtnLJidi+Oz9B1ogwjdrWNQPII8DaU9Xiy5
         nUlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794212548; x=1794817348;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VcAkY3YiPTQFVieeDjubnbkf41BaBANgAAkiKJvWm2w=;
        b=O6RaBSIO5FXMd+oVfpKiHZqyHuQ7dl+xpuUF1sFPPYG5weaIzIq8ZKZZVytJAUwc7s
         KH3SKN/wyYdSP5EToq//vd/KAnw140Cdy//nGZ6VmoSAf9Os12msXs+KCnKDNT8/4nmR
         c/v1yERze3kGjN6s6RQCwLSb99AMCwO+7OOyN3Dl1d9mdm6pgU06xWP/GzZNq9plJsxF
         vTJL8VGjTnxSknjEJSXWFfzdn/3o05+k1LhMjzh9RbN6Ol+QyqSr9puguLWhDHfSrmeH
         XqeS00zZ/c7I287ZerglSi86DH0OSvwZ6VIdU0oNl19bOUd29VjM547kA0eSHfeyfJ/E
         8UwQ==
X-Forwarded-Encrypted: i=1; AL+hErH1p3/KL3iRB96tUUIjxU/WiV+jWs1uzeT1nFirNrVh5J7ZFWAhIG+xDEbxCPF1cMw6BXLLuUaabspvJ5hL8h3L@lists.infradead.org
X-Gm-Message-State: APuU4Z+UEG229bZk82iDKXtZnNe/RneJoU8onfhGZUb48JRQmHIpNAEz
	GZqLB2iOgrY7Thk4mtbCtSwSZQ9XAHxI7FO/u5bj2S5V6h1cj9u2ZOLjWYhFlkYmR78=
X-Gm-Gg: AYBFou0rV9DkDQBGJn9dRwcsQO4Q7Z+NUW78ubftQFhh8rT7vWRYS148xmVDbe3fR9C
	sRU67Rbl6l/4QghSwUVLtvqA4xkewDXHnQuHYWsraX3Gm4BDKsFh8qp7DqeaeRusQuzujrcqhvS
	AWWxRbojongQodALwMnLRE3cC0e8FrGN/7y59NnGvPDsJT4OCJilfnd+ZPgGB9Jlzz5P/2A9Tzv
	PRWGv1ZtcaueMKc19EGa6Ia1u0Xl939bBF6KH6Oa1rT2k8kCrbpz18P/RrvbcU0dOS0lHIEZVYO
	trBTylJBxRc+fzkFCozg2HrZ+teRtK48VUblJFEp/sPXSUbecB4UGlAULJ6P23eTYVP93m1cx/4
	dVvPYqF8n6LfahewqWnAabYlgcNe2inmu8+MNvR/sNWjzoJZhPzH0fKHeX4A9tIQrQFOfIvInsR
	X7QAbR5hdHKIzE1CSBC6ZezFicztMF6yD1ucEDvPmacP+pLfyLNt3Ly8wh2+qhwqyeP6xbsEJ0/
	ziaw0byFFRpnLgRM/7lQa2jwdZUCtCDpsvXiRtBxRmuzUuWAR+v+mCoNyqFCs/FeIiVG39aGnoS
	SzBlePOU6r4XDwYyLUBW4t/IhClxzyHK6Salfa0=
X-Received: by 2002:a05:6a20:258e:b0:3e2:100b:1043 with SMTP id adf61e73a8af0-3eed3c6c6e1mr3218263637.42.1794207088842;
        Sun, 08 Nov 2026 22:51:28 -0800 (PST)
Received: from [100.125.153.207] ([139.159.170.67])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb9677c58dsm1220517a12.3.2026.11.08.22.51.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 22:51:28 -0800 (PST)
Message-ID: <ce196fb6-87cb-486a-a465-ccd0ea2ce343@gmail.com>
Date: Mon, 9 Nov 2026 14:51:22 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jinjie Ruan <ruanjinjie01@gmail.com>
Subject: Re: [PATCH] arm_mpam: resctrl: Leave CDP off when there are too few
 PARTIDs
To: Ben Horgan <ben.horgan@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>,
 james.morse@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
 tan.shaopeng@jp.fujitsu.com, jic23@kernel.org, zengheng4@huawei.com,
 gshan@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261031025257.1540228-1-ruanjinjie@huawei.com>
 <750c9d05-94f8-4936-a824-5ccbed1d13ed@huawei.com>
 <fd20a317-1f3c-43bf-b629-587877cf9503@arm.com>
Content-Language: en-US
In-Reply-To: <fd20a317-1f3c-43bf-b629-587877cf9503@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_002229_499857_227D67F5 
X-CRM114-Status: GOOD (  22.76  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



在 2026/11/6 19:34, Ben Horgan 写道:
> Hi Jinjie,
> 

Hi Ben,

> On 06/11/2026 08:35, Jinjie Ruan wrote:
>> Hi Ben,
>>
>> Is this modification okay?
> 
> Yes it's ok but there is more we can do here. Sashiko has raised a bug that points out we don't take
> into account whether or not a resource is cdp_capable or not [1].
> 
> This leads to an additional check along the lines of:
> 
> if (enable && (!the_res.alloc_capable || !the_res.cdp_capable))
>      return -EINVAL;

Ok, I will fix it together.

> 
> On a process note, it would helpful to me for reviewing and later on when collecting the patches
> together if you could put related patches together in a series. In the case of this patch it it is
> solving a cdp related problem, as is your patch "arm_mpam: resctrl: Limit num_rmids to the CLOSIDs
> in use". fs/resctrl patches though should be kept separately unless there is a particular reason why
> they should be in a series with MPAM patches, e.g. new resctrl_arch_ helpers and such like.

OK, I will send them in a patch set for the mpam cdp patches.

Best Regards,
Jinjie

> 
> [1] https://sashiko.dev/#/bug/linux-05c19551-0bba-4a06-aa2c-3c90fab5853d
> 
> Thanks,
> 
> Ben
> 
>>
>> 在 2026/10/31 10:52, Jinjie Ruan 写道:
>>> Enabling CDP requires at least 2 PARTIDs. If there are too few PARTIDs,
>>> resctrl_arch_set_cdp_enabled() returns -EINVAL, but only after it has
>>> recorded CDP as enabled, halved the monitor count and turned off the
>>> mbw_max MBA control. resctrl then believes CDP is off, which leaves the
>>> two sides out of step and the halved monitor count and the missing MBA
>>> control are not undone.
>>>
>>> Check the PARTID limit before anything is changed so a failed enable has
>>> no effect.
>>>
>>> Fixes: 6789fb99282c ("arm_mpam: resctrl: Add CDP emulation")
>>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>>> ---
>>> RFC v2 -> v1:
>>> - Check mpam_partid_max ahead and The partid_d/partid_i determination
>>>    remains in place.
>>> - Update the commit message as Ben suggested.
>>> ---
>>>   drivers/resctrl/mpam_resctrl.c | 6 +++---
>>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
>>> index 5468367776e2..aa3b3a093857 100644
>>> --- a/drivers/resctrl/mpam_resctrl.c
>>> +++ b/drivers/resctrl/mpam_resctrl.c
>>> @@ -210,6 +210,9 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
>>>   	if (enable)
>>>   		pr_warn("CDP is an expert feature and may cause MPAM to malfunction.\n");
>>>   
>>> +	if (enable && mpam_partid_max < 1)
>>> +		return -EINVAL;
>>> +
>>>   	/*
>>>   	 * resctrl_arch_set_cdp_enabled() is only called with enable set to
>>>   	 * false on error and unmount.
>>> @@ -239,9 +242,6 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
>>>   		mpam_resctrl_controls[RDT_RESOURCE_MBA].resctrl_res.alloc_capable = true;
>>>   
>>>   	if (enable) {
>>> -		if (mpam_partid_max < 1)
>>> -			return -EINVAL;
>>> -
>>>   		partid_d = resctrl_get_config_index(RESCTRL_RESERVED_CLOSID, CDP_DATA);
>>>   		partid_i = resctrl_get_config_index(RESCTRL_RESERVED_CLOSID, CDP_CODE);
>>>   	}
>>
> 


