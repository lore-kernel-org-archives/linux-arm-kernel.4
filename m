Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3C2606A322
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 11:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dC93xUC4;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=UDy/zwRf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=inz3V9aU2hIOsAXbZhSDYnlb/bzphfFnZ8kzbgYaBlk=; b=dC93xUC4vFCmaL
	JZdEJKtkumj+4TvIlBaUphhyWiXoLFZdNRxGjQ7+dtSkBsFE3NoeJFiEVSNixq46UySUJibqGCLYp
	Kx18aMDjE4SZHjbPGnsu+3GRRgZsfedcjrmcExkibPUBxHL9M/WpyezwCtpN68GSsBVMWUYrq0aa7
	XE4kby3C5OFx/1cBRlm7lVtchGvUOrs458jQ6LUaSl/kAVD39QYk5LkJaHdXr9O5nwxn4Tt3QGviT
	pEkATbbdrtXk7vmT2xf5kdfY2SUbASWhSSdb6O9sjdcAU6M/cYXd8ynrywXFrJ10pml0CcO8t39js
	AQnHcdUeH+tc+iO9wSGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQNpH-00000000ZQO-0l5Q;
	Mon, 09 Nov 2026 11:46:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQNpF-00000000ZQ4-0XcD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 11:46:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DAF5E1516;
	Mon,  9 Nov 2026 03:46:08 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 82E5C3F85F;
	Mon,  9 Nov 2026 03:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794224771; bh=SOsE0hHxasXXtCdWlJUe4/zvLfJPTM6n0JuFxF70CN0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UDy/zwRfRVfaKPLb7UyUTEVdxwfIEUun+o4m7fcFxRLUAcfno6nYRFQjV5M6F+Pio
	 A6Sn55YA0I9Okn0Ll2VnuRamAovaLYJkwAcHoH4M48T9VYGbMxabRyQmf5f59KTPPn
	 P+13J0vg9TLWbf1tXUcrvSBlQKyRQR/3Otr6CZsA=
Message-ID: <a7a484d0-9458-4051-aad0-983341dfb0e6@arm.com>
Date: Mon, 9 Nov 2026 11:46:09 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: fix resource leaks on path build failure
To: James Clark <james.clark@linaro.org>, Jie Gan <jie.gan@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Mike Leach <mike.leach@arm.com>,
 Leo Yan <leo.yan@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20260513-fix-memory-leak-issue-v1-1-49822d7bc7d4@oss.qualcomm.com>
 <51a86fe7-95b8-4f49-96bc-2245c334b7f6@oss.qualcomm.com>
 <6f6f69b2-6005-4574-972d-efe80b8a8b5a@linaro.org>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <6f6f69b2-6005-4574-972d-efe80b8a8b5a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_034613_414655_1CB1E5A9 
X-CRM114-Status: GOOD (  14.96  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 09/11/2026 10:34, James Clark wrote:
> 
> 
> On 09/11/2026 01:24, Jie Gan wrote:
>>
>>
>> On 5/13/2026 9:32 AM, Jie Gan wrote:
>>> Two related leaks when _coresight_build_path() encounters an error after
>>> coresight_grab_device() has already incremented the pm_runtime, module,
>>> and device references for a node:
>>>
>>> 1. In _coresight_build_path(), if kzalloc_obj() for the path node fails
>>>     after coresight_grab_device() succeeds, coresight_drop_device() was
>>>     never called, permanently leaking all three references.
>>>
>>> 2. In coresight_build_path(), on failure the partial path was freed with
>>>     kfree(path) instead of coresight_release_path(path).  kfree() only
>>>     frees the coresight_path struct itself; it does not iterate 
>>> path_list
>>>     to call coresight_drop_device() and kfree() for each coresight_node
>>>     already added by deeper recursive calls, leaking both the 
>>> pm_runtime,
>>>     module, and device references and the node memory for every element
>>>     on the partial path.
>>>
>>> Fix both by adding coresight_drop_device() in the OOM unwind of
>>> _coresight_build_path(), and replacing kfree(path) with
>>> coresight_release_path(path) in coresight_build_path().
>>>
>>> Fixes: 32b0707a4182 ("coresight: Add try_get_module() in 
>>> coresight_grab_device()")
>>> Fixes: b3e94405941e ("coresight: associating path with session rather 
>>> than tracer")
>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>
>> Gentle ping.
>>
>>> ---
>>>   drivers/hwtracing/coresight/coresight-core.c | 6 ++++--
>>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/ 
>>> hwtracing/coresight/coresight-core.c
>>> index 46f247f73cf6..c1354ea8e11d 100644
>>> --- a/drivers/hwtracing/coresight/coresight-core.c
>>> +++ b/drivers/hwtracing/coresight/coresight-core.c
>>> @@ -825,8 +825,10 @@ static int _coresight_build_path(struct 
>>> coresight_device *csdev,
>>>           return ret;
>>>       node = kzalloc_obj(struct coresight_node);
>>> -    if (!node)
>>> +    if (!node) {
>>> +        coresight_drop_device(csdev);
>>>           return -ENOMEM;
>>> +    }
>>>       node->csdev = csdev;
>>>       list_add(&node->link, &path->path_list);
>>> @@ -851,7 +853,7 @@ struct coresight_path 
>>> *coresight_build_path(struct coresight_device *source,
>>>       rc = _coresight_build_path(source, source, sink, path);
>>>       if (rc) {
>>> -        kfree(path);
>>> +        coresight_release_path(path);
> 
> @Suzuki, there's a conflict here. This will need to be 
> coresight_release_path_locked() if we also take "coresight: etm-perf: 
> Serialize AUX topology access" from my Sashiko fixes.

The changes needed by the patch are already what your patches does.
Apologies Jie Gan, I have merged Jamess series which solves everything.
So, we can ignore this one.

Cheers
Suzuki


