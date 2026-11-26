Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF8E606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 15:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HCbV9e63;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=T7GwDymH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wvxVJqSGVuApLTKz4mwcbmdNfV/hIsiHSvEl/vvD4v0=; b=HCbV9e63h6h2m2
	o83yc8swm0wrBCTUFLjHmwuIwlMs7/00ZAeJCPtCGGYQv71CHkrleOo7mH00g+StPuEK++H0Hn9jc
	uavBaZGd7l4fVtu6LQ+nS0gBFJD0F17bhnvx92lnGu5rILGIMsnWS4/StaXlt8+BVrbqGX4rG+GLw
	rYYYTV8S6qjmCp9qDcVl8x9OJYndvm0d92zQTiQqulQjjUFpOpiCFsIXo+wWzlNn7BfSgFZmE0Mdc
	RxgsXn1XWeWNUeDVWo1yKRKF+kWXQOfLtvbukTK4HRzTFKYJlYyA8MoSzQJYLu+oA4TqvSrMEWmd3
	ca29rEzrVu8NwKl99U+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWb7B-0000000Dgvn-29yV;
	Thu, 26 Nov 2026 15:10:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWb5l-0000000DgWc-0sip
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 15:09:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5CBF41BA8;
	Thu, 26 Nov 2026 07:08:52 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF03A3F632;
	Thu, 26 Nov 2026 07:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795705735; bh=Ue8IPCZ7z+Rz2AeoD4nUpDOU0+Z3z7tWnDkxEZZk624=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=T7GwDymH4UHkJY/YJVw/9ZTUduCJO3dW7TCu5flRs77MiNEPaCTVOTd1NN1tjsfs7
	 lYn6PzvdUMmWVZzhgdlCJB4l1A/RaEFZd5uCV6cO/vX8LoSVjD1QNDo6jlDitupdIe
	 lRfYw5jAaBlv4pG6RIy1uy6Hbat1VhOgbHsl/JCk=
Message-ID: <be1b4244-3018-43a6-a4c1-ad49d3cba6be@arm.com>
Date: Thu, 26 Nov 2026 15:08:52 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/23] coresight: trbe: Publish the session after
 successful enable
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-7-3f57cf3199b1@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-7-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_070857_363651_DF6EE66D 
X-CRM114-Status: GOOD (  20.26  )
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

On 16/10/2026 17:55, Leo Yan wrote:
> arm_trbe_enable() records the session buffer and perf mode before
> __arm_trbe_enable() can fail. CoreSight skips the sink disable callback
> when sink enable fails, leaving that session state published even though
> tracing did not start.
> 
> Install buf->cpudata temporarily for the buffer setup helpers, then call
> __arm_trbe_enable() before assigning cpudata->buf and cpudata->mode.
> Clear the temporary buffer association if setup fails; the inner helper
> still truncates and ends the AUX transaction.
> 
> After successful enable, retain the buffer association across AUX
> transactions and clear it in arm_trbe_disable().
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>

> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 15 ++++++++++++---
>   1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 979d0fa84c1c7b448c1ce5cd7a37dff8845795ef..9dfc6bb7afb4c42dfdec643ee7e4f2f193e2b70c 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -69,6 +69,7 @@ struct trbe_buf {
>   	int nr_pages;
>   	void **pages;
>   	bool snapshot;
> +	/* CPU used to configure this buffer. */
>   	struct trbe_cpudata *cpudata;
>   };
>   
> @@ -137,6 +138,7 @@ struct trbe_save_state {
>    * @trbe_align		- Software alignment used for the TRBPTR_EL1.
>    * @cpu			- CPU this TRBE belongs to.
>    * @mode		- Mode of current operation. (perf/disabled)
> + * @buf			- Buffer configuration retained for the enabled session.
>    * @drvdata		- TRBE specific drvdata
>    * @errata		- Bit map for the errata on this TRBE.
>    */
> @@ -1033,17 +1035,24 @@ static int arm_trbe_enable(struct coresight_device *csdev, enum cs_mode mode,
>   	struct trbe_cpudata *cpudata = dev_get_drvdata(&csdev->dev);
>   	struct perf_output_handle *handle = path->handle;
>   	struct trbe_buf *buf = etm_perf_sink_config(handle);
> +	int ret;
>   
>   	WARN_ON(cpudata->cpu != smp_processor_id());
>   	WARN_ON(cpudata->drvdata != drvdata);
>   	if (mode != CS_MODE_PERF)
>   		return -EINVAL;
>   
> -	cpudata->buf = buf;
> -	cpudata->mode = mode;
> +	/* Buffer helpers need the CPU association while setting up tracing. */
>   	buf->cpudata = cpudata;
> +	ret = __arm_trbe_enable(buf, handle);
> +	if (ret) {
> +		buf->cpudata = NULL;
> +		return ret;
> +	}
>   
> -	return __arm_trbe_enable(buf, handle);
> +	cpudata->buf = buf;
> +	cpudata->mode = mode;
> +	return 0;
>   }
>   
>   static int arm_trbe_disable(struct coresight_device *csdev)
> 


