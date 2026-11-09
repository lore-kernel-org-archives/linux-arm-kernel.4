Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45380606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 10:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hc0aOool;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OwZGEoLB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FGfYDpuV3icdfKs35Y88PCFmQpt8If2+8yLawkeKFOk=; b=hc0aOooldNL5D+
	7JjvrwsS1mJ1xTJWoYQ3U5EcRC1z2EKLHURHk53XPkUcqaay4qZovJkIrbF/RUsOYW0GofJfRGPIQ
	VHnuGI+SWxN+Wc9PPsuqlK0QcuEDG6QsBbxRCYNSHEhqv0wKewDgzGi7fjX/suysT32iLfRlxpi3R
	WRC8IS0OJ3ywk9SDojD+6cn3S2HjchHmJ9O+lLvrVS9LcxXf03TPd/NpG3QrFYstfNECbJnXAJqSE
	QfbWHt9qLcPxTy4Ah1hqeYbHWVsU2T5TCHH7sWLE4Jq3IIatUhhU6xmXpZUD8n77U2DRLuccuZQ1e
	88HHoBgj7U7BdkEFBjDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQMhm-00000000QSe-2e7h;
	Mon, 09 Nov 2026 10:34:26 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQMhj-00000000QRd-3WPr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 10:34:25 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-4922523d1afso346040f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 02:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794220462; x=1794825262; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FGfYDpuV3icdfKs35Y88PCFmQpt8If2+8yLawkeKFOk=;
        b=OwZGEoLBtp3ZYGqXQKM2VFPeyMZ5NDfokKl3yZ3W5/X1CM+lR//5c1ZLXViPYtXYBY
         4LEGqlTtrZeQ6VRn9tSobn0iFmV+q4++VZsOgzgzxOw3EUr1MuE0D8/9KMtTksivlIgb
         RF/l/kZCGbTT4KYGyYZqdPODD+xiy8QWIRXmccjCH4qzVVCw1OlqfN2MszIEKkddMizW
         AP/fWFrecefqoPmmr0xOOW+NxTcQPVLsu++e6uTmPmap/dv6HjEb19fl+YBxQ0ApZbg+
         F8xZ9Yf7X4xs1fHl3MV252wz2cXllA6QWU66ARFMjwbN5CoitwnzLo2k2TX0nFcIEut4
         Y3gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794220462; x=1794825262;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FGfYDpuV3icdfKs35Y88PCFmQpt8If2+8yLawkeKFOk=;
        b=TJAVXiLnrumNk11w/Nh/2M0HiWH5HSQhPuM8/tXnX824L9gh1brlUOy/Dhr3VR4DBY
         DaszPVWIpjm9CM+oA5pcsVZScEBUyBr55tJZS+N1GjNpfl16h1XNBBzCYquvWMmJd3aZ
         ZRHMpRmKVu5LJRd2aoC3grUakr3SMMu124LrbfXkPHtVNwIuqkNYP2N3RkqdVF7IQ7ad
         X6uuDk9sWO9w6QOf/9uSPiT6bew6etwf9Wgwc4j9PifXlSfr3oOVH3m+UEPZ9pE2xRtu
         r6jGb7oF5johk2TJFCrPz0VNDDd9c02FrO7Y0zRi9be+Qt+AZdLbSaOPPdDeZfBzKLek
         iYmQ==
X-Forwarded-Encrypted: i=1; AL+hErFS+FPakmBt4xDdZ2kIevD7/5js03dvjJsN7CtS3NlGs/UVzfikrtMXl32Kfc9v15Dv+q2dzBIMGomxwogs8Ce3@lists.infradead.org
X-Gm-Message-State: APuU4Z+ilxfALZMsoJ/aVd8xUFt0YB5tKFNKK2yJhAhVL6LSO4Sxu4P/
	6ColwLBB2BGm7Z9klzBno8wbFV2KcIIkroRHhcoSCbPmdHMvjOR8rKkyVWCIWnDdeWU=
X-Gm-Gg: AYBFou1QJ7ux/jLzmm+H7aFitrzoE8WMLRozAgj1QH+SEXyKtwKi/kC0hN4tbzgmjsw
	EqVdb//UOWIVrL4fbmtMW0y9IK9ebzcYzNsB1Lg1gJcd+SK58BgijBkTnUV3CqDhcE9sH7oDN+j
	GqDzCLDUQktc0yZSoJZ4onSEhzXh+AaEv15YDQkoS9huVN5hQxR5wfyB4kPekhHlvIhYq7ttxYz
	EZblmTXvHyF/bTcu0z8Xjq7NZaBxtEVzJRIRnPUzgFTaBzHRur6B0RurC+plduX6FtU1n7JJGtQ
	OiGLua9CgfkX2XsAnFOVegHDutngE28nk5TEi3PdPKesVqdPb7Dpcc1Ax0BZGLeiQsimFnsBN0j
	ybQ3HmkqUyU/vI3XOnUsC67WH4KAbfN6NgV9k7IxP083906jzY6e11xS54Sa4ZW+dztWiPZCgpZ
	VXwDaIFlgbikpzr520JCjnc8bqGUeIbLgO7ERdxBpJRtK4OgyqtSm/MyRndG1mdeTEnJp+7/GTE
	ezlnALjFmCkPHx9uZEpgXMcD81ssFhp6UMvY9DVS1ZLzWhhROrZRX3WiBygXGrj2upVQQlWHNLB
	c+7Hla4phUyti5QgyYs+tq2nqwuOg7iySedBHMbQKwQyUEIX66d+TQ==
X-Received: by 2002:a05:6000:4305:b0:48e:e9e:129 with SMTP id ffacd0b85a97d-4958363c1a9mr8033944f8f.29.1794220461897;
        Mon, 09 Nov 2026 02:34:21 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4959774736bsm10021500f8f.43.2026.11.09.02.34.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 02:34:21 -0800 (PST)
Message-ID: <6f6f69b2-6005-4574-972d-efe80b8a8b5a@linaro.org>
Date: Mon, 9 Nov 2026 10:34:20 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: fix resource leaks on path build failure
To: Jie Gan <jie.gan@oss.qualcomm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Mike Leach <mike.leach@arm.com>,
 Leo Yan <leo.yan@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20260513-fix-memory-leak-issue-v1-1-49822d7bc7d4@oss.qualcomm.com>
 <51a86fe7-95b8-4f49-96bc-2245c334b7f6@oss.qualcomm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <51a86fe7-95b8-4f49-96bc-2245c334b7f6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_023423_917343_29F218BE 
X-CRM114-Status: GOOD (  16.71  )
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



On 09/11/2026 01:24, Jie Gan wrote:
> 
> 
> On 5/13/2026 9:32 AM, Jie Gan wrote:
>> Two related leaks when _coresight_build_path() encounters an error after
>> coresight_grab_device() has already incremented the pm_runtime, module,
>> and device references for a node:
>>
>> 1. In _coresight_build_path(), if kzalloc_obj() for the path node fails
>>     after coresight_grab_device() succeeds, coresight_drop_device() was
>>     never called, permanently leaking all three references.
>>
>> 2. In coresight_build_path(), on failure the partial path was freed with
>>     kfree(path) instead of coresight_release_path(path).  kfree() only
>>     frees the coresight_path struct itself; it does not iterate path_list
>>     to call coresight_drop_device() and kfree() for each coresight_node
>>     already added by deeper recursive calls, leaking both the pm_runtime,
>>     module, and device references and the node memory for every element
>>     on the partial path.
>>
>> Fix both by adding coresight_drop_device() in the OOM unwind of
>> _coresight_build_path(), and replacing kfree(path) with
>> coresight_release_path(path) in coresight_build_path().
>>
>> Fixes: 32b0707a4182 ("coresight: Add try_get_module() in 
>> coresight_grab_device()")
>> Fixes: b3e94405941e ("coresight: associating path with session rather 
>> than tracer")
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> 
> Gentle ping.
> 
>> ---
>>   drivers/hwtracing/coresight/coresight-core.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/ 
>> hwtracing/coresight/coresight-core.c
>> index 46f247f73cf6..c1354ea8e11d 100644
>> --- a/drivers/hwtracing/coresight/coresight-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-core.c
>> @@ -825,8 +825,10 @@ static int _coresight_build_path(struct 
>> coresight_device *csdev,
>>           return ret;
>>       node = kzalloc_obj(struct coresight_node);
>> -    if (!node)
>> +    if (!node) {
>> +        coresight_drop_device(csdev);
>>           return -ENOMEM;
>> +    }
>>       node->csdev = csdev;
>>       list_add(&node->link, &path->path_list);
>> @@ -851,7 +853,7 @@ struct coresight_path *coresight_build_path(struct 
>> coresight_device *source,
>>       rc = _coresight_build_path(source, source, sink, path);
>>       if (rc) {
>> -        kfree(path);
>> +        coresight_release_path(path);

@Suzuki, there's a conflict here. This will need to be 
coresight_release_path_locked() if we also take "coresight: etm-perf: 
Serialize AUX topology access" from my Sashiko fixes.

>>           return ERR_PTR(rc);
>>       }
>>
>> ---
>> base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
>> change-id: 20260513-fix-memory-leak-issue-034b4a45265e
>>
>> Best regards,
> 


