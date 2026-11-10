Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B20606A325
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 15:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=f7YT1wOq;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EM3W0uOs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XccD1DO1R/ZU+LZB06u2umQt+RgHY9hz8EUttqWNV7k=; b=f7YT1wOqpeAse9
	kwn2HW7ahrDVq8x8Lti+t8cD2ta7FiJXTi4IuNVwUpGNW71BkiU945K7QVPCixkOkLY3rK54TUWl6
	7AhCoAXtV5e4+GAIalrrRn1Bb/zqaepnbkGJsqPaonP9loHXjJ71evRZppPiTj7uhcNRpaWf4eBTh
	1Cxubb0tNswNC1ZkzDGp7dL5j9C5THosxhMmy8pxwm6GvfGWujW95p0EIFOLGjG6PDKVYgrHnYeeU
	OqDG5KmRoKhgMW+ab3MWEhckQw9tDO0iBTDwknEPSdZtClgKctbgZ78g0Y4bA7oMAxw12i+RrrY9l
	yeaVvQEtLmGdTKV/mJOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnq7-00000004OLA-2Qbz;
	Tue, 10 Nov 2026 15:32:51 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnq5-00000004OJj-2BSZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 15:32:50 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so22808985e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 07:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794324767; x=1794929567; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XccD1DO1R/ZU+LZB06u2umQt+RgHY9hz8EUttqWNV7k=;
        b=EM3W0uOsNX9GJRCWcinemHfrK83QpNbYVXrUgKlhFD/KKJwMvUN1UoPVjSSJSGBLZ3
         TPh2/g2kktpQUtkh++VfptAGI5GihFFLZaEgaX62BB5B5xj/hajgZHE1diYKkZn+cowG
         +GiPjNUjMdK/4ZAx4YbYJVHr2rb289/UgZD0zZ49JRm3+r09sRToTkYngtz64l+SoDEt
         j0OcsQdRY6ZIR29yFJpWv0ksnbU5kC8ebmOweCpxmuo/g8uzLuF+1geQwlRK3RgENOiX
         SsCyUJ4Pdgt+d7LvWeIyGMeUpRjyh+W3zCCKH75QSGy1u62fGKeE2JtvqRt1BIWCF5Bh
         W90g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324767; x=1794929567;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XccD1DO1R/ZU+LZB06u2umQt+RgHY9hz8EUttqWNV7k=;
        b=xAF/o+D6hvXNzcMYKOR5xlSBGj52J9W2eBqdYEGfBtj6IeqmtpSHP214SKwEn+UIjf
         7A3I1FYoNJwLW4eJFlz5BD2Y3nOk5f8RvY/elAUVRsoFy8av+nTgTIvlse+SuOYOwQ0E
         pF34e8go+86marW6x94M+rzKSMmc0TA6nDm2u+YpK9pPLWIM6afPL6PESyT1M3LkQFsZ
         8yCnEqDef288YifHPH4Xr6ZML2JLvO7M3fDSLTKHcwJX2MIWjykOaiebam1kVacipCr9
         C86ZaDIjTCI+wwuUnr8GWdqUFxFQ5WyIyL4V2ao0AaOhKu8j0GUpp/Xy+iWOajS6B3YI
         uUtQ==
X-Gm-Message-State: APuU4Z+dprm+VLcNA+4LHn4OrraubMHqjkJ1KYFHvbvnzMTgNSv15QNT
	qOZT5CGndaUss3e26nLu1Slt9UOCkCFv0+4BgqFiHvXlnKPfvqwyU05M0WBjQ0mAZGA=
X-Gm-Gg: AYBFou2U2huhIWYQK0dwopPRQg+YJ/+VnAWjMlKCkJ957ndQmU62htXhash9ImvFBn6
	4kMqqkHn+DsHzixtyNEQXWUOndNQ71xPSiLJsBi6sBXss2qzGjPUK/xSz1WP5Ese9BVLz9f8YZ+
	VCv2T2LncTYLOlP82kvFmdJqX15mcpV8wm01cq8GCcub7Xr8+CuQCePuVS0JpqQ2rJlRGCPFjzH
	4+HgMgweSp5l4fiMMaSO1k7Kq67mFsaEN4yceEigV57uyAzLk7NiHV76IMCyZAReH2mUpEKqppY
	MgZldfeQJHzWRji1olOyHfy95q9E0/iXZ0stsD4lZn4ODKNBGsebMPUYG/q9eg+NPwjYoO7IhwZ
	H8BN5BaqPDJM9qej55kP4cl32aQ9z1a8rzVvS7hHG83yOBn8nOenVkggyhSDXIzA5jrfbHctPz8
	gEYr3CFJkm05aHNlKV055Y9yKB6CFqjHHDSBP6KYxilyKxfXic2e0hzdqrCYltrv8pe2qgbj/AA
	bI8OFTw6l7akLi4abp6aUCNJ3WjLR2dy2j93f7kIAgB62p4FlqIt80rx9H1+vdgbbAg+uZyetFR
	nB+AGV5tfsiCuc5YPEVF8RC2YfE9Eo8g1w==
X-Received: by 2002:a05:600c:3b0e:b0:4b4:262b:88a2 with SMTP id 5b1f17b1804b1-4ba02308316mr48969035e9.1.1794324767136;
        Tue, 10 Nov 2026 07:32:47 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498363dffa1sm5509777f8f.39.2026.11.10.07.32.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 07:32:46 -0800 (PST)
Message-ID: <7a5fe9b1-bad9-4ce0-af92-475f13c5de5d@linaro.org>
Date: Tue, 10 Nov 2026 15:32:45 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/23] coresight: trbe: Simplify wrap status handling
To: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-13-3f57cf3199b1@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-13-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_073249_584629_A42B53E2 
X-CRM114-Status: GOOD (  19.80  )
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



On 16/10/2026 17:55, Leo Yan wrote:
> After explicitly decoding the TRBSR_EL1 EC/BSC values, unsupported or
> unexpected stop reasons are handled before the WRAP check. And the
> erratum and pointer checks is no longer relevant when deciding the
> buffer wrap.
> 
> Remove the redundant checks and treat any remaining TRBSR_EL1.WRAP
> status as a wrap event. This also means WRAP with BSC_NOT_STOPPED is
> reported as an overflow instead of a spurious event, which prepares for
> for TRBE wrap mode where collection continues and a maintenance
> interrupt is raised on current write pointer wrap.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 11 +----------
>   1 file changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index a851f09d806a6b6a6386d6f7547b01a17f61b88e..4aeed1a17c4bf1653fb41731ac15f31feec7ed2e 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -661,8 +661,6 @@ static enum trbe_fault_action trbe_get_fault_act(struct perf_output_handle *hand
>   	const char *err_str;
>   	int ec = get_trbe_ec(trbsr);
>   	int bsc = get_trbe_bsc(trbsr);
> -	struct trbe_buf *buf = etm_perf_sink_config(handle);
> -	struct trbe_cpudata *cpudata = buf->cpudata;
>   
>   	WARN_ON(is_trbe_running(trbsr));
>   
> @@ -710,14 +708,7 @@ static enum trbe_fault_action trbe_get_fault_act(struct perf_output_handle *hand
>   		goto out_fatal;
>   	}
>   
> -	/*
> -	 * If the trbe is affected by TRBE_WORKAROUND_OVERWRITE_FILL_MODE,
> -	 * it might write data after a WRAP event in the fill mode.
> -	 * Thus the check TRBPTR == TRBBASER will not be honored.
> -	 */
> -	if ((is_trbe_wrap(trbsr) && (ec == TRBSR_EL1_EC_OTHER) && (bsc == TRBSR_EL1_BSC_FILLED)) &&
> -	    (trbe_may_overwrite_in_fill_mode(cpudata) ||
> -	     get_trbe_write_pointer() == get_trbe_base_pointer()))
> +	if (is_trbe_wrap(trbsr))
>   		return TRBE_FAULT_ACT_WRAP;
>   
>   	return TRBE_FAULT_ACT_SPURIOUS;
> 
Reviewed-by: James Clark <james.clark@linaro.org>

