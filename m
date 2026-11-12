Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A2C606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 23:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LC91JYJB;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FMp0sQ8K
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=j+2MQFCjJLlFkCf/4Ra1E51lD7PDuO5cvPRTDHXzpTk=; b=LC91JYJB8zVWdn
	5OTmxthOzzqW6fz4kTxSHsOns1g6SfIgtltJiPo+/z1y416l4D002bzSoUEuKSwOiJu5FzJydn476
	s63x0CULcRw1KEgY8DP+XlZfLF4jwN+GVGM1QypUmGimqMAMerWxLHvZOJdMmPhwKp0KZ+HaJgoiG
	/7cY5HwqzvTFIjNqzIwlaeuTjnYAw006FOfQjQoY4AU4pdam2FxTEnzNrrQz79dSjrtHm06KLRTTu
	1OyfXiOhNNAZDgao5zz8hao45rhu/1V79vFiCfDBF5jmX9m72Sh+L6kFsxRqar2BVqJM33aNvN0gI
	Wsm+Fft9iGl8kd/Rd+wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xReDp-0000000BFOM-0WLb;
	Thu, 12 Nov 2026 23:28:49 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xReDl-0000000BFNG-34b6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 23:28:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794526123;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j+2MQFCjJLlFkCf/4Ra1E51lD7PDuO5cvPRTDHXzpTk=;
	b=FMp0sQ8KEXhwjo9VllqLor1Lr/Z9gOUWvYm5ZgIjLRexRlwHoG2v+t6UyW84T9rUxHbAyz
	wYxDESng+Ffd+ohw2CtzRIlOTZjq2z5FdPMWViJBBVTi9y1Z3fmd4XnLkAEuky/2TxlHHG
	fShb2o6Eo3L7r18bJC2ApVD3+UJ3kjw=
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com
 [74.125.82.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-762kLfJNPoyDYhMIDYwhEw-1; Thu, 12 Nov 2026 18:28:42 -0500
X-MC-Unique: 762kLfJNPoyDYhMIDYwhEw-1
X-Mimecast-MFC-AGG-ID: 762kLfJNPoyDYhMIDYwhEw_1794526121
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1a2af4c8cbaso190853c88.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 15:28:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794526121; x=1795130921;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j+2MQFCjJLlFkCf/4Ra1E51lD7PDuO5cvPRTDHXzpTk=;
        b=oFgMw/7Lov6qmSHkPQDf/PVMy4dRj2VQzPoSZEatVNT4Ygu1x4qngHdDktuEhGc0wK
         ah5uhDUCbbHDBdkiZjbG6aJoK8lvSPsq/YoUvhw4yrNuNIfWr3OuhLdeASjHZVH8JASM
         byH5oNkKJlL377ta45acIhgqhDlWE7eMvtUuG/mI5GRm8UzVunydH26meEa8BdqFICEB
         LHHKR2Yt7xT8YMrvU5eO7ihDzM2eDhPZK1sTCqyYDH+fSSNMteVpyWAx6zEV2kHbNWwk
         Fr52QlpVj9Z5J2rZNvHmkioseRDSJmT4xptSSD2QwqvhycymWtnquUmu4lGai5zeR6CH
         P0Qg==
X-Forwarded-Encrypted: i=1; AL+hErGLDECgcqMbFt2B3Wp87pyMrCq+382craRkniYP5PZc7yf5LX/QMQF2xUNRoiKErFft1Gy7bZnUkpotrfq8nt7g@lists.infradead.org
X-Gm-Message-State: APuU4Z/R1vKv4C25q8YhpbHf9Mf+f92TOHxw0b09ak7K9X5ej+fNGDcr
	gyjcFAE79yAG/j4G8gmfSYn/OzlMLBLO/LOEcOBwNE39iryC262sAopuQ16THP3JIYBQBzItomQ
	IkLEjZA0sdwU5Vp1fdNQVjSSbnV/j1LOpc6OCmGWjaDmYOd3XwKf3x/eddaYE/i9EkqQ8j+9ofp
	eO
X-Gm-Gg: AYBFou3xBRvX/PMKQVZsR1FiyuLs1wVK5uJGu1BOybe3K1DU86I4Vbzq+zQTGPp8KTG
	Z/lWvJ9I89og3DlrBKdtoKsMkQfkcIoVCm442sNdkpnLgQL86ETT8O7JvocZSe4/H+gAUHEIMPD
	gODO/+Gk3JsRE7yhrUFK9iCoHSg9J07cymXlgYHQAtn3UonVYgrV+cvGmIbbQwUfr6d622BIehF
	+MyrLkqCbX+II+G5mNA0f1/L9jHWnn09rC9LG7pFOF/XTwUmoUpoCGmRIwHkUEd+eEHVdlN7/l6
	QticOljVoBy7/HXFJUscR1hnnbSoGoIx+bqyy8y+cN5Ms2mV7H9QeV6G6k3fMxv2LjmNZ57tFcE
	bkgqGgD+stU00/x1OhQK7NFS411KqXGk7xxyWvFs5hGocqdgF7mUR3uH8Yh3I/XSdkI4WdNR1/S
	ngrcRiUtEBcXN9LJ0=
X-Received: by 2002:a05:7022:3b87:b0:1b2:43cc:48 with SMTP id a92af1059eb24-1b5030d2bf7mr881057c88.33.1794526120687;
        Thu, 12 Nov 2026 15:28:40 -0800 (PST)
X-Received: by 2002:a05:7022:3b87:b0:1b2:43cc:48 with SMTP id a92af1059eb24-1b5030d2bf7mr881032c88.33.1794526120149;
        Thu, 12 Nov 2026 15:28:40 -0800 (PST)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b503191a43sm1796185c88.10.2026.11.12.15.28.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 15:28:39 -0800 (PST)
Message-ID: <8804ae3a-8dac-4f4a-98b5-06b2a7524d12@redhat.com>
Date: Fri, 13 Nov 2026 09:28:34 +1000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] arm_mpam: resctrl: Leave CDP off when there are
 too few PARTIDs
To: Jinjie Ruan <ruanjinjie@huawei.com>, james.morse@arm.com,
 ben.horgan@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
 zengheng4@huawei.com, tan.shaopeng@jp.fujitsu.com, jic23@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261111081316.3828283-1-ruanjinjie@huawei.com>
 <20261111081316.3828283-2-ruanjinjie@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20261111081316.3828283-2-ruanjinjie@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bylaA6GvCgPw4XNYnavrMkZGK82uz8kB9qnwFKtPFhA_1794526121
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_152845_940602_A0FD0479 
X-CRM114-Status: GOOD (  12.63  )
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
> Enabling CDP requires at least 2 PARTIDs. If there are too few PARTIDs,
> resctrl_arch_set_cdp_enabled() returns -EINVAL, but only after it has
> recorded CDP as enabled, halved the monitor count and turned off the
> mbw_max MBA control. resctrl then believes CDP is off, which leaves the
> two sides out of step and the halved monitor count and the missing MBA
> control are not undone.
> 
> Check the PARTID limit before anything is changed so a failed enable has
> no effect.
> 
> Fixes: 6789fb99282c ("arm_mpam: resctrl: Add CDP emulation")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: <stable@vger.kernel.org> # 7.1+
> ---
>   drivers/resctrl/mpam_resctrl.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>


