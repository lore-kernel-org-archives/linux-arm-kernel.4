Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC4260A380A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 16:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HMStTacg;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PPVhjnFz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7vNr4k+b01YY8p+kpU/hMLREhjgtpBFIV1zNsYWBE8E=; b=HMStTacgyim/0h
	2PbU9bpRU5MLtn7Hztolrm5HnJsn1QdYMb+TH0Qeq20tfnzRIfTuy5kiQSEmtOtZoLYsMuWd56sey
	c2wNWngvC6pVqxff0nDLrVFrn6afDHorRTl/b17GcbHOWGTGcyVa99vb1fhkmxLlHXKkwdM+bvMHg
	M2jveDT+Nf5oJUZF2p2S3M8Tteliue7DSLZvU6GP9Td+hMCEOusr6Zex4rTn7RHGWj/lhLEBTKS+H
	OlyCZVutbioe68PNdwtzN0NfhjxMnTDyDt9UzT4zsQMvMRErgVQz1/fF7BbyM2vA0BVukZktg8/WT
	Mh69IcsLDeVPtHTxMojw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQSbA-00000001Fri-2rDX;
	Mon, 09 Nov 2026 16:52:04 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQSax-00000001FgC-1V0t
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 16:51:52 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so16177205e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 08:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794243105; x=1794847905; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7vNr4k+b01YY8p+kpU/hMLREhjgtpBFIV1zNsYWBE8E=;
        b=PPVhjnFzo+bRfxAiR2kDAlMOkMJZAq95my3yaz3boJygaesB3HmQYapu3WZFvQTjIR
         LTSKXI12epcEeH98ttxE/vGKrAQb9KZe5tR3d/4BUqWKOXAZC5VmA3d1dJRNz9e9Y5H1
         bBLDW9h2NNNtugBdswyudCkKP/gI9LZmdoMinbONKbRNojdncGxqUb/Rp6aehiNEd3Cz
         feaCrsPKwvrS8h/nkduBOUZH9sS8gQS0fsIb1EPMHF9cQsl1bmuaJuBoXv0XusF4MzBH
         60JNN1leHGwwx5NuwK/hFkZ/e7brQaQ1Okq/lpAbgt1DGOEfsVsJLjQtWkDIuhAKQCoh
         0JMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794243105; x=1794847905;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7vNr4k+b01YY8p+kpU/hMLREhjgtpBFIV1zNsYWBE8E=;
        b=A5SHmGotDgo5WxrgNTIRy/xhP35rUZJeiHQ59sYtNAFj2yJ+k6TSsjGdE8U8aZZBW5
         tDF9/iQVIu85evMxKslEVTU8rwW42s7nLnFRjjO/gplzfDbKNsE4IXLKrnDvE8U618mk
         7OpWu6jkRnow3Tp8PZWylQ+RcApklKH3RBvzKA6gKxz4gHAAFiQP7t9OXe83QkgDLGX0
         o/Lca9namWpRAsO/kqaGf/PX07Ro2C09NG3Eoiv1aKaKXzdeAhkp6DFoIvMS1i7yhvc5
         uwh15MqarYv57MPW3L6u2Lj6HmyGR+B0sEhHorMwyp1vKvrrAVdT0PW/uhvdj28j/BUB
         UE6A==
X-Gm-Message-State: APuU4Z9DGES6aGsivjAYdZ9+pHC9ioGpc+RpPekPnfWWuLY6Frlixblz
	EbsFJaeVDVtaRqCwkVQA7TDq0xSrnObnPO4yldtXMKtVCGzMerP7cTYlRtswbbFKMZI=
X-Gm-Gg: AYBFou0ae47tr+7MLXr4mCsykvVGRheRjuk0g8ERvZbYwl9IJocDooM12C9jonnYUxC
	6i/f0lca7aabYpPervRD2Sy9ZCj8YEJYzEEObttgK3VfJKJA+WSioN3LJBlN4RQYeVEAdgAknHd
	gD89vmdk9HrYVBjdhcYZYoR5ynU153K+DuPkQDZzLAvL4oQOOMAzr2VTPuYcHUhWG5ulyq5xlKS
	p9bUOZmz7n3uzWqtyW8wPQxRleXc5SIB5sompMtHsZwICvmWzNpodK5e9Ss9z1gmB/tK0JJpxhk
	m5mAMitw8EkcaKF5zJhkKk/g7BEiQt7rghK9QoxhlUw+96AkwrCq6b95lGr4hPlfg9c50vK9VOH
	I3BoozcIajxW5dTWZkctwoHDBjflbWdGDLfEt3PagyVYCtt15luGW5cXjQRbqKYeDKkEpVLHxR9
	Tv3cPVws4/PLZVfWdzjPDPPAZXzTgqlgz85Ol0+lh3O1yTyJq+iRo3QsSyWgsaO6st1h/2/Hj3x
	cS3DMBftC7TjCB4YKO6PdgfJQwLrktt/xP1NRgZ6/sgz2IpRkx/iahS6O+Qy/B8MAFLELQeiXXD
	mMu6H46mOuaf/V99YQ==
X-Received: by 2002:a05:600c:4e05:b0:4b8:4af2:88b3 with SMTP id 5b1f17b1804b1-4b963c6d91amr84003165e9.22.1794243105036;
        Mon, 09 Nov 2026 08:51:45 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe2c5asm361995e9.5.2026.11.09.08.51.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 08:51:44 -0800 (PST)
Message-ID: <06beb206-886b-4a40-a406-3d877443f5c2@linaro.org>
Date: Mon, 9 Nov 2026 16:51:43 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/23] coresight: trbe: Clear TRBSR status at stop
 sites
From: James Clark <james.clark@linaro.org>
To: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-9-3f57cf3199b1@arm.com>
 <f8a2f477-2dc7-45a9-a2f0-f6e279ebf8f1@linaro.org>
Content-Language: en-US
In-Reply-To: <f8a2f477-2dc7-45a9-a2f0-f6e279ebf8f1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_085148_099697_5EB29F17 
X-CRM114-Status: GOOD (  23.02  )
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



On 09/11/2026 16:40, James Clark wrote:
> 
> 
> On 16/10/2026 17:55, Leo Yan wrote:
>> TRBSR_EL1 records the status of the buffer that just stopped. Clearing
>> it in trbe_enable_hw() postpones cleanup until another run starts. If
>> AUX output cannot restart, for example when AUX space is exhausted,
>> that clear never executes. Clear the status in arm_trbe_disable()
>> after disabling TRBE instead.
> 
> Why is leaving it set a problem though? That's not mentioned. Maybe 
> there is some later patch that requires it?
> 
> It seems like clearing on enable is cleaner because it only requires one 
> call to clear, but this replaces it with two separate calls without 
> really saying what the benefit of the extra complexity is.
> 

I see Anshuman left a similar comment on V1 and you said there was a 
race condition. But that explanation wasn't added to the commit message, 
and I'm not sure if it exists anyway. A late IRQ after already disabling 
the buffer would just hit the check for a NULL aux handle and not run 
the handler.

>>
>> trbe_handle_overflow() can start the next run without calling
>> arm_trbe_disable(). Clear the stopped buffer's syndrome and status bits
>> while TRBE is disabled, before attempting the AUX restart. This also
>> leaves the status clean when the restart fails.
>>
>> Signed-off-by: Leo Yan <leo.yan@arm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-trbe.c | 10 +++++++++-
>>   1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/ 
>> hwtracing/coresight/coresight-trbe.c
>> index 
>> 26e7554d6bdd31f8a55a8bc3a7b6d4c49b984b9b..dd9c9330bb0c739795f300dafc6ce34e72fbf280 100644
>> --- a/drivers/hwtracing/coresight/coresight-trbe.c
>> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
>> @@ -655,7 +655,6 @@ static void trbe_enable_hw(struct trbe_buf *buf)
>>       WARN_ON(buf->trbe_hw_base < buf->trbe_base);
>>       WARN_ON(buf->trbe_write < buf->trbe_hw_base);
>>       WARN_ON(buf->trbe_write >= buf->trbe_limit);
>> -    clr_trbe_status();
>>       set_trbe_base_pointer(buf->trbe_hw_base);
>>       set_trbe_write_pointer(buf->trbe_write);
>> @@ -1069,6 +1068,8 @@ static int arm_trbe_disable(struct 
>> coresight_device *csdev)
>>           return -EINVAL;
>>       trbe_drain_and_disable_local(cpudata);
>> +    clr_trbe_status();
>> +
>>       buf->cpudata = NULL;
>>       cpudata->buf = NULL;
>>       cpudata->mode = CS_MODE_DISABLED;
>> @@ -1095,6 +1096,13 @@ static int trbe_handle_overflow(struct 
>> perf_output_handle *handle)
>>       unsigned long size;
>>       struct etm_event_data *event_data;
>> +    /*
>> +     * Clear the status. No context synchronization is required here,
>> +     * since context synchronization will be performed before TRBE is
>> +     * re-enabled (see trbe_enable_hw()).
>> +     */
>> +    clr_trbe_status();
>> +
>>       size = trbe_get_trace_size(handle, buf, true);
>>       if (buf->snapshot)
>>           handle->head += size;
>>
> 


