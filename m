Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFA6606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 23:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d7TC2zHn;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A7jcPOKL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DttvFnge8kOenaa6QdgP5d+NJ+mqXut24bqDnL4lrTM=; b=d7TC2zHnvzQ9q5
	tkbr3h9kBC0G3DI3Z1at5kX9/w/dXGKjcrZI4BSP32GV+3x9HPJzy4Yy0V9PRguiDWjHufgO1sdp2
	y2chiMDmmS8hJ4a54TZI5M5M8BrSCP1HhsrJIOuN/LwfRKxFRItDVk+0DR+oX++zpQNxxjlMulRLx
	v/NRIkh+8Q/87+6W+jLiMjo6oJQmKILn7uSjefmP8eerHBUDae/P11zddK+1lz3d4dA41opWbC8K8
	J47HlTx3bBCe/TUDNgP3ue6f7AK7bkWEF8JC2kYOz0pCwFzrH21pE6pRn5xtHSwNXr8Ycl/nZvabR
	wLEEMcdQgKaJK2Suyl8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xReRG-0000000BGR4-27Om;
	Thu, 12 Nov 2026 23:42:42 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xReRC-0000000BGQW-3dKE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 23:42:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794526956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DttvFnge8kOenaa6QdgP5d+NJ+mqXut24bqDnL4lrTM=;
	b=A7jcPOKLGJoxCIk4ZtvCqLiS+9tUZO2McjYTf05863js08aJHsKtpjwMzjsoTYLDLy2MJ6
	LHZPulD9IjBS/+O8qPyYw+BZtS9JnbR8wmRg1HlOfdU7zs/MOPGpvF4tuwY1z8T3gQiXXC
	yuhl04T1QnQO38v6CxV8t2B4Wc5YDzQ=
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-91-luLGKr3EOiyCz7QySOTrhQ-1; Thu, 12 Nov 2026 18:42:31 -0500
X-MC-Unique: luLGKr3EOiyCz7QySOTrhQ-1
X-Mimecast-MFC-AGG-ID: luLGKr3EOiyCz7QySOTrhQ_1794526948
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36f26e6abe9so441893eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 15:42:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794526948; x=1795131748;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DttvFnge8kOenaa6QdgP5d+NJ+mqXut24bqDnL4lrTM=;
        b=g+7lzs3+sK5C36TJDSKlT03NCASH9AlBr7ktK6LXLGkduCaJgk7FXiic2h9gRyy1DA
         6Wf67F5UH1xzyouHHtYh9O/i5ITTcSqVt/+ac03vQ2WB8jX7r4Kd/v3ksSWXwuCfwSAP
         +SVbkLZ9TDvcLnkDweYzAIaM1mM7mAn9PyyhPuIbuqRrLKedyHOT/lJIsNTFnqynUHge
         y1M8MTxCRbTaP0Ih6RH3J+h6R6xBsA6ePxCgMzVvlByecDA0cHhTSfsoGaMlyKOqiMMo
         HiXst5Yv+bUr3lJSIp+RS9MKJvlro2VrApErsgLMKUkYs/QuYIH+fgiERtuUsn6RJyGw
         xRJA==
X-Forwarded-Encrypted: i=1; AL+hErGl+aSaThWVAefLcZ1LGG3dSHsBTXKuvNpKcjiCKESF/SjQzRbonTwr1kg0a/i7wnuUIU4VMepu2xvxVXZ+YX1Y@lists.infradead.org
X-Gm-Message-State: APuU4Z+80/2JHgYpIArLv/CgQoDgt5ni2JTM4NKpoPArpX8jSazq9Vqb
	edzYqyuUcyfx3c/TdsJ54+EhJkn7q6TzI1W1ksW7+7wBcur0s9OaycdCEDO4tADGfyHp5qjGk35
	GCOj+nTGdGVXg7fs4D9WQzFqDEwsd6/it2f3r0XQ+VP2faFjHOnMgDiwO0E3dDyrU8gi0UvR5S1
	77
X-Gm-Gg: AYBFou0CBHe6LpjBmry5bBfOaH3IIWiAnBlWaF0NQmSv9RlcD6bXEfa83nVJ5uaBYSg
	9ds7zJXbmYghXF8WS+yxCqHczHH4ASba43CxMMVhwPP+83s1q65/o+y0iZNrbgLq7m4aK2zLGQT
	gTpcL+hOhiw2t1ShVAPJhTAqyTE9oRNlpKzYoddSuI0mZhhz2eXAVj208vts93UaBWUMLjCWRav
	JoK+utXOcwGGlGfe+fnL8eKlaqa/aXDAgkHm8o+kgH+lcdsf36mzFORqvdedUNx8V4SUy5aOUTd
	aN9P+C+xyNfDcIutYvxuV6gHg1L4zwoWIybQwM4BCMl5m/5ZaLSFCcOsqoVtcqBtweux0Z6OOAg
	Zi6gTVXe7iic9+Uc4UaV2j06qqy8K8dX5hiAr+EELNdhpziFFOWy5ZL45R4jreBXxkZhRSsgUxb
	W4ODoI3TwBbe8dvkA=
X-Received: by 2002:a05:701b:2616:b0:182:6c6c:d876 with SMTP id a92af1059eb24-1b5030e74dcmr678967c88.8.1794526948217;
        Thu, 12 Nov 2026 15:42:28 -0800 (PST)
X-Received: by 2002:a05:701b:2616:b0:182:6c6c:d876 with SMTP id a92af1059eb24-1b5030e74dcmr678949c88.8.1794526947710;
        Thu, 12 Nov 2026 15:42:27 -0800 (PST)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm2689566c88.5.2026.11.12.15.42.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 15:42:27 -0800 (PST)
Message-ID: <a783b375-7c27-4c91-b40e-7e615d33bc5b@redhat.com>
Date: Fri, 13 Nov 2026 09:42:21 +1000
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
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20261111081316.3828283-3-ruanjinjie@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SRjywT9ftnq8bxgJn9NdPhMIVcjIsThpToh6cwrxEUQ_1794526948
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_154239_308553_38F2CFE0 
X-CRM114-Status: GOOD (  21.76  )
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
> resctrl_arch_set_cdp_enabled() enables CDP for any cache level that is
> requested, even one that has no MPAM cache controls. Mounting resctrl
> with -o cdpl2 when only L3 can allocate still turns CDP emulation on for
> the whole system, so every CLOSID takes two PARTIDs while resctrl keeps
> its CLOSID count at the number of PARTIDs. Control groups in the upper
> half then map to PARTIDs beyond mpam_partid_max, which index past the
> configuration and monitor arrays and program out of range PARTIDs into
> the MSCs. On QEMU with 5 PARTIDs the first monitor read after creating
> 2 control groups raises MSMONCFG_ID_RANGE for PARTID 5, and MPAM is
> disabled.
> 
> Do not enable CDP when a resource cannot allocate or is not CDP capable,
> as x86 does, so the mount fails instead. Only the enable path is checked,
> since unmount disables CDP on both cache levels to restore the MBA control.
> 
> A system where only MBA can allocate, or that only has monitors, now
> fails a mount with CDP as well: CDP hides the MBA control because
> mbw_max is a per-PARTID maximum, leaving nothing for CDP to apply to.
> 
> Fixes: 6789fb99282c ("arm_mpam: resctrl: Add CDP emulation")
> Link: https://sashiko.dev/#/bug/linux-05c19551-0bba-4a06-aa2c-3c90fab5853d
> Suggested-by: Ben Horgan <ben.horgan@arm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: <stable@vger.kernel.org> # 7.1+
> ---
>   drivers/resctrl/mpam_resctrl.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index 573617ba09df..afa3c084c475 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -222,6 +222,10 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
>   	if (enable && mpam_partid_max < 1)
>   		return -EINVAL;
>   
> +	if (enable && (!mpam_resctrl_controls[rid].resctrl_res.alloc_capable ||
> +		       !mpam_resctrl_controls[rid].resctrl_res.cdp_capable))
> +		return -EINVAL;
> +

x86 only checks 'cdp_capable', so this check isn't exactly same as to what's
done on x86, as claimed in the commit log?

int resctrl_arch_set_cdp_enabled(enum resctrl_res_level l, bool enable)
{
         struct rdt_hw_resource *hw_res = &rdt_resources_all[l];

         if (!hw_res->r_resctrl.cdp_capable)
                 return -EINVAL;

         :
}


>   	/*
>   	 * resctrl_arch_set_cdp_enabled() is only called with enable set to
>   	 * false on error and unmount.

Thanks,
Gavin


