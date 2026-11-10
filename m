Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301F2606A320
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 15:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KI9CKnMT;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ulyJGc1f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wq5O9BiV0n5bNBLkemqzNPDQfweJ57nH87DQfwTWK4Y=; b=KI9CKnMTHLnC2X
	3FPP7fpS/1ugyI/ezCd75jtrRj6WFuFasWGUB1iY/BXTuh0Uc2PdgStuvDlCqtlTsgtyvvUA/LO8G
	15qbfx+JmslK/gQ5jBMjosXNnC4SxlCqulzbgxb1KgjycQzoenkaX7Bk67iQF2cgUbj2armKYKDpx
	5ZV1+Y4oR3ykSBG4QuEmXsHYIN8fvF+kVIEdzilGmu3qkaYABDbYRCl4ato7qtiSJEYtWhUFPtpnv
	Y1SGnbE7UdZoF8LPrPymir5pjfCYkXkrxNMU4x9T9+vB3VuzCJs7GvldMwmhQynOVVXvebWTW5Fru
	exC2uFltjwNLfl9qecTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnne-00000004NRG-3CtK;
	Tue, 10 Nov 2026 15:30:18 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnnc-00000004NPw-3Xzq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 15:30:18 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so21447015e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 07:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794324614; x=1794929414; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wq5O9BiV0n5bNBLkemqzNPDQfweJ57nH87DQfwTWK4Y=;
        b=ulyJGc1fue/X/i5Y7qBq3C6s9CrGYIXPe8FIiFYF9/l6UNi8pzIWig/fBncFvJ6/U1
         RBJ6RPFp0FZZhUSCwU1F9AUS77jxsekII6v4EMcR7RG+u5gZ0WJLyNIycGPWP5tWBDju
         HAlCycufuWA7ShZfPUAhM1DzF5CNEAMDT6Qq2g+l/qSoQ8hzUE6rmBrCijq79jXzV0LR
         e3PhANooa0SB4gQDA6OA3csX/am66kwNFmdG4N0EtYfakzoTkz5RqEzCLXdRdJj3P3qJ
         rpbCjRpWK9jawgOdNhTrI/7vTKRUmEGpfgnEHH+rSHlUiEgUG+8gFR9QAI930kjmznAk
         P3TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324614; x=1794929414;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wq5O9BiV0n5bNBLkemqzNPDQfweJ57nH87DQfwTWK4Y=;
        b=NRAuLTXwI+jBIOURqlXO1QfnAEkv4SLp0jYGhzpBcRl4QJqitGnneiTW/HI6KIhJ/u
         kaU4qRg5SCCgHH6q+g7m88NJGtIn2VoC+dmXx4gvsxhFIIZN7suRwgt/2zuL+LshCoun
         QKw7DuiTQtrEjscV0pi8i3QxCMDrX1TckRRLNsa4C+XIIDh0N7jwrX6TsbVvumXM7iaR
         nOlsvfRkBfr01Ee3hZXIoPTp6V3EV27xLOEee/Itb2epFVPe3xS9k0Cb5hiZSzcLamCw
         Lm/yIV8azBWws/fE3UNuydXidyof43ubKM0b1IrkK4OULaNigCJWHcnUB6XolS2CFl56
         6lPQ==
X-Gm-Message-State: APuU4Z9VJ7qRLKp05I+RwwLgFEI7LdDl5fgTXUE3Vj/ONGe9i6FlNrXa
	K1fk80zDJPLgs01sha6Hzxaq0Za//w31M1OQi84VBoekie6KAO08EBIq+MNqK8+o6yM=
X-Gm-Gg: AYBFou0mPy5TUaUy28IiHvDzdu7rnK4s6d4+As/I1Y2iNK/zvcTFo0YMI8KJvDs1o2t
	qp33TtoVjI9idp8wAw8uPNVJhUUvDo4AlCa8kMsKw0ol+xQXuX4aO6stNQJAFrHM0DGsWRPQlSM
	LekBZMibz/4na1SNPUXpBM6NKKBhir8NgLZm9/P6h99icMZ17B4ePQY6mswOEnvOkcwgJyQZUzO
	zyVxaFobum+Yevzf+wm68Ir4iZtoHnW57ORzRg6ljuLX6+qfkmJLmgnNfvgfSH2O/vgLrJ9T3o/
	liPx4ANSTupGo8rYPdoI1SRZINH0Wk1mDW9Gx8h/upnvffNo5npYXLM5YiFS0Tqxs5BsTgeS8zq
	OvPjEoosyWJSoiAix2ObcZmh5E9Gc8VyhopAvtUFyXb3SrgtxsddO/iqoHPtZcgjdgCcptkgOoD
	Trgeb79AISRDDDkcvcTiKYZUk3FucsCY90GoWJfLCN7wlokXj6aXAWPAT0NGf6RGZvj4nUkQFct
	YNvbgXY7p9RIHSq2PdZS9RfBqfCoBRbIyx1QikOVl2E3AAz3Kv1hHP41C/fEDJZsDUxH3R7eh/K
	UEQ97VewmkleG5CRmCEVbFg/DpFVVez24g==
X-Received: by 2002:a05:600c:1c1b:b0:4a2:1050:aff with SMTP id 5b1f17b1804b1-4ba02341314mr63376875e9.6.1794324614190;
        Tue, 10 Nov 2026 07:30:14 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983f7801bbsm5510561f8f.5.2026.11.10.07.30.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 07:30:13 -0800 (PST)
Message-ID: <6a607357-f613-4a9e-8d38-96ff4f02eec8@linaro.org>
Date: Tue, 10 Nov 2026 15:30:12 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/23] coresight: trbe: Publish the session after
 successful enable
To: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-7-3f57cf3199b1@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-7-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_073016_922348_E826BC7E 
X-CRM114-Status: GOOD (  22.29  )
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
Reviewed-by: James Clark <james.clark@linaro.org>

