Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6687F60A261F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 15:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3rso0Ixv;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=p2jKRHn8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eE5bBnvx3Gqg63Wh6ioe05F/FzYJEQy40fvhqq/+9QY=; b=3rso0IxvajtfIm
	ptnG1q2kNheUmErxVVVJoA2XaWZVpHVdx0LBJzyZRr3Ob1ac+O+BNLIQ6V0JH2HIFz9mxOrU6QJED
	5WWEyZYcgccU9Y/1CjSTgVUT7llDPlCY0bYEuzG3QVdfMn2m7/xBZF1MIZi0qdHQtpV99sdI6y9GJ
	rP138NmC4E//282AGJ+v4R7Z9TRokHHHzxmptgqGTtiRwRwVRqb5uF8runl5sjiF9nZ1ksZdn03qq
	ApuO/w9dsu5X0KCnwCy5cAC4tuSPIqHIqRy+2GAGflmbshlEAplBRaiW8DYopVfgAMormLpguag9t
	GgRZw9lNXwBg919oyg5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnmv-00000004N9U-1CtG;
	Tue, 10 Nov 2026 15:29:33 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnmr-00000004N7o-1sSP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 15:29:31 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso15701455e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 07:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794324567; x=1794929367; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eE5bBnvx3Gqg63Wh6ioe05F/FzYJEQy40fvhqq/+9QY=;
        b=p2jKRHn8j7AIUiRod5sec7Z3YT8kr3PvOR0Ge1fVZiVTx2fwRXWrMKhwaPN3La8QFI
         +UofP4fgIouqfpwySDqT18nR59MtyNOmRGUJJz2v23HH2nuSStqTi5Tsw+13q8YWl+Ea
         KOxUHdxJbPeLzAZZx3qXQFTkusB7Foa9aYxJOa0I0aBvMVR2pA+qAc15Re7Uczr630Yb
         URSwkbqAzmOR58YKCqz7k1nCaoIQlpLTLloylqTeg6K37Rvk0TLmpPIM1KauBfd/zZXQ
         d/k2CRxwAw0CNpSCeytvP0tcdjULXIZFoADSAUm6eBpLOtY4p1dlmQ5OHj1rRMlL0xcn
         NyuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324567; x=1794929367;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eE5bBnvx3Gqg63Wh6ioe05F/FzYJEQy40fvhqq/+9QY=;
        b=0SrIPbUAdIWQ36TE+i8N4t/3bZpFsrkhHML7BCyc4GiHlLZqvy3lFR5wrt0WtuQZry
         9/EEtwz0iXXOTGsnee7Svb7PWlhH79hijh3aT5+0kORxPaX96nJvLoeW83bjNl+U1KHR
         yXocCqkf3HWB4k/eVGj0FPaRdMQNJlsMWMkMd/9tbjTwrmc6jt9LranTjX7eFOa1oFGY
         xUZ8XiMFjrOcVhPCEXCrE1gM6e1eOiev2g2Wovo978su1GauhuUlzO80aFX1fVPFbPjN
         1Bh5LiAHwz64kBU25GaAmmJkWC2sg+aXf0ftLEE3TwU20SSHpNrANpcTSyk9M1Cec7WL
         iUFQ==
X-Gm-Message-State: APuU4Z+RUullXpMjcQ8lB/fuWKpkRYLbikdJC81WibIq/fmwCBdvACMb
	KrnK2hx9iEmVjRziH7PSsHHDgGqiAKpS+VfP7uXO1tbYnVCQDkQcI3uY9l7EN1cyX6LsFVOFUeG
	yfLm5bbM=
X-Gm-Gg: AYBFou3xnlg+JaRzK6ng3wBni7YcsXlacFvs0S0t10B/DlDJh1+5+h/XXLSliDrg+bO
	xmorYakX4ThGcwWLsW3KTmwByipY+ONeK75CRpUUhFv+8vzojtxB+daP0jXz0L6H+8x8o9r/rAr
	4v5RaMCPamvqqYBtwQtTMO4JcyQRfq/VogXJEUs9r0TThlicEOATreh1zxKUZz7igLhZQO+aYbA
	PErdjmo8LJE7Qe/VCWrABlVmL+glhkXjXYmwmAvtmePwuxvIHul+j7u8So56Iy3uPdaCd0gIkdi
	ZIsaiTQLeB8LpGnplITM/vNgdvvYoAwO++jT2sK2o2dfI/0JnHTLO+FG7WkS3a64OaL3dGGG2Aw
	qcz6ywnPVe2b28arEQHEEjYk6MQNdmJU16crCxo5XFVxxC70MLHghPCFw0ZqZdMu9/2CNHVVuHF
	14hRM1XjFDV47KWSxRtTPLu0mHZImuzTyXHKj/pgwIf9PlS0XowQgNXM6S9YaBvWAdv+jL94xV8
	1cKNd8kUXcqFAAK/FaVJErlklA+u+EXZNGSWAlx15epnPc8rv8AZzILmVY3G3MDS5G8kN2c4bPc
	yoQ5d1OuoMicifw/7ryZfpDrWeDLzUEiH+BI9WfWIRRKLQtTeX8QWuI=
X-Received: by 2002:a05:600c:3b83:b0:4a1:88de:9e8b with SMTP id 5b1f17b1804b1-4ba0233f907mr61071135e9.5.1794324567432;
        Tue, 10 Nov 2026 07:29:27 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0236f03esm55689215e9.3.2026.11.10.07.29.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 07:29:27 -0800 (PST)
Message-ID: <d5b0310d-7123-4b61-95e1-04cf4f92e523@linaro.org>
Date: Tue, 10 Nov 2026 15:29:26 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/23] coresight: trbe: Check the buffer association
 before IRQ validation
To: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-4-3f57cf3199b1@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-4-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_072929_511168_293654E9 
X-CRM114-Status: GOOD (  17.14  )
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
> is_perf_trbe() obtains the sink buffer from the output handle and
> dereferences buf->cpudata before validating either pointer. A live AUX
> transaction does not guarantee that the selected buffer has a CPU
> association.
> 
> Reject a missing buffer or CPU association before reading CPU driver
> data or checking the hardware buffer addresses. Treat these configurations
> as an invalid perf TRBE session.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 8ec0b4c4987f25d10ee0b2f80c27e10f76357387..91fbdbad3676ffae399df0b4d4ddcd603a40e86c 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -1111,10 +1111,16 @@ static int trbe_handle_overflow(struct perf_output_handle *handle)
>   static bool is_perf_trbe(struct perf_output_handle *handle)
>   {
>   	struct trbe_buf *buf = etm_perf_sink_config(handle);
> -	struct trbe_cpudata *cpudata = buf->cpudata;
> -	struct trbe_drvdata *drvdata = cpudata->drvdata;
> +	struct trbe_cpudata *cpudata;
> +	struct trbe_drvdata *drvdata;
>   	int cpu = smp_processor_id();
>   
> +	if (!buf || !buf->cpudata)
> +		return false;
> +
> +	cpudata = buf->cpudata;
> +	drvdata = cpudata->drvdata;
> +
>   	WARN_ON(buf->trbe_hw_base != get_trbe_base_pointer());
>   	WARN_ON(buf->trbe_limit != get_trbe_limit_pointer());
>   
> 

Reviewed-by: James Clark <james.clark@linaro.org>

