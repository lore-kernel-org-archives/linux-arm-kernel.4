Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5EFF606A334
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 15:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rr3S4FuC;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=DoAuZ4d7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sRyt7J57B8/qpsnQyP3hNPb+3Du63I5pPZg0XUFrV5o=; b=rr3S4FuCEkf4Cd
	ySRA06yBFyKGFiAqMfP+4jzn5mlFaJeL6J0HkaMgCLS4HlyQEBnj0iAGjeQu1E2ehwH1Brc8T3F8A
	39GlrOKi/qQ98punTYHXxAgqrOk8WSfQULNljW0FjFbah34/0Vdsrk+vsgItumYZenc4ErnV+S90F
	8gF2ntWUNpq4vIs3uDlg1i2jcAubMJCYXdv8mrqGdc8iEzlapI8EBB6dG6b8jdNZTPJVAlUG+hqiT
	izGsDqdrScjtpaT4RmTjQvlxHzQV0Lr1yzR07+D4nq7TJQlAsKO8l4vslljnnSr4bWRA+Wqju2XJz
	pRoV3SeeZF2bf8JVvQTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnls-00000004MkQ-2I7n;
	Tue, 10 Nov 2026 15:28:28 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnlq-00000004Mjj-0sDe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 15:28:27 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-492f563d1c6so817352f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 07:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794324504; x=1794929304; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sRyt7J57B8/qpsnQyP3hNPb+3Du63I5pPZg0XUFrV5o=;
        b=DoAuZ4d7e81+MgyeqXG3bRGCGdK8NMX/ryqp6f/WSWNdZDBXGKrm6Mj+14LoEfHC4y
         W2UzVu57ImMGLmmAkQpiOWrjBN/S9WIitmr5u65ha0Eltga9qcAUf/Z26d5SmNjnBwe3
         xnXT2VGwQIoeRZm7FyWpGmK3fe+D82QLOO3tvHGDl6zTurO5NaOcl4fFr0Z7TnU8nDrT
         FbmB4WZC5uCEsmgBS/uPlnAbqHYITpfC7np/Cjolpr0xJBMVxXcnykv4aQC+qadNebIf
         VNiqbrRazdZP84KSSlK8CnrviVKXiDTlVADki1yPVAb2J4OYbJdlwyukTkzBgEbvICi4
         gYUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324504; x=1794929304;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sRyt7J57B8/qpsnQyP3hNPb+3Du63I5pPZg0XUFrV5o=;
        b=loc1E+28xuqx33Elq7XCDL58UvkzWeukjnlIF44h7NAWtmhk9mB6Jvaj5I4O3fBw/c
         zkGo67umC0Y73MxyrwidJplX6w9TIhXEz8L/WA3zYBBq0+UNeMu33cBbGGJ9FIgkqnEH
         EfDucAKYy0V9PZ+jcVUt9kkF1yGwFPDvMfNq8A1YGlMmWM0znur85v3Kme9lJJm9qGXb
         At8K/4E+L1EN4+oDKFcCM35gibJw+9Sel5k2bFUmIg40bzYBU4WGNtWy++AFnrt7Yq9r
         T2soh9fCeBE5c0/swbHxaSqk6FM87UBPrHKvkcgTAeZ/kfLOmVFuMijgb/JQyRwEEm2o
         rbQg==
X-Gm-Message-State: APuU4Z++GwjDVuW0g+6zlkWR4Uk3NeBVkDNOCqMgUTnGfCmpr/945hht
	YwPUWoDQzTFeBBSLRGkHBjBXGn3aSZsUKpfmlfAlFKpaFqnaPXUwuU10CBXiJFKp2lc=
X-Gm-Gg: AYBFou2ne2UBpMeZF60oWLkWsvKxR7tSSpby5Z+FbTtrSbTNuaFKiYzM4WtwwDETvOl
	nHIN96Y/D5ck9P+L//+0Lkpah5pBty4MMrd0E1R1OgJGKbDyQ6OdxXRs4323lmnUrC1HNC7SHBm
	hwH+aQ771jnU4/69VxbFqYbXlHCKn2VwJwtwEoyIyUa0GBphZtIWfmbpX0pG7RCn0/N/m2BQnXC
	qSPPgh/D5uXUteAbzGMtA0KENbPF8uPvLhI+LOQVT8lpm9aup/BMe5K5JyWqFwMNRq+otGdaaUI
	xM9KOdl3XXu766z4wNqLFMT6k158IrgJl5merv9ZeEI/c3SD9J4Y/Hdxr/VQvKmytrJmTlmY56r
	+Z5HB75BnKjJbRXlMM0d+IHW6uaX0G++esQXjFYkQC5EfAnze4uEOK0W4HrYXW2Tvn6TVI6JHzB
	oihVsI/mv3wXVeAVpccA1wkrtNhvTbUUXRjgMW4ck/mAnqT4lqfrAqeiIysT/1DvQK8NfUPdq+Y
	37CFahTjww9wzxUxtwlVKX9BPFAAns2lhUBEV2a3bABQoEnYqxFTijJS2zFJSdmHE2YG2bGKhuV
	btzNgeqxcQf6+jGLcgOZ9MzVw2ETpG/ZSw==
X-Received: by 2002:adf:e001:0:20b0:48b:1296:52ec with SMTP id ffacd0b85a97d-4982ecf642cmr4316594f8f.18.1794324504256;
        Tue, 10 Nov 2026 07:28:24 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835c37bdfsm5786450f8f.22.2026.11.10.07.28.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 07:28:23 -0800 (PST)
Message-ID: <4371d707-dbe3-4ea4-be1d-c69c38b4012e@linaro.org>
Date: Tue, 10 Nov 2026 15:28:22 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/23] arm64/sysreg: Define TRBSR_EL1.EC event classes
To: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-1-3f57cf3199b1@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-1-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_072826_274543_0836A225 
X-CRM114-Status: GOOD (  14.54  )
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



On 16/10/2026 17:54, Leo Yan wrote:
> TRBSR_EL1.EC identifies the cause of a trace buffer management event,
> but the sysreg description does not name its architected values. Define
> the five encodings as an unsigned enum so TRBE status handling can
> refer to each cause by name.
> 
> The values cover other events, Granule Protection Check faults,
> implementation-defined events, and stage 1 and stage 2 Data Aborts on
> writes to the trace buffer, as specified by Arm ARM (ARM DDI 0487 M.c).
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   arch/arm64/tools/sysreg | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index 94bf065c8ac71f20f482c91a5147cb6e001dfba2..f68c23dd4e83ee4d00610e097d9188d3a2c9ed15 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -5834,7 +5834,13 @@ EndSysreg
>   Sysreg	TRBSR_EL1	3	0	9	11	3
>   Res0	63:56
>   Field	55:32	MSS2
> -Field	31:26	EC
> +UnsignedEnum	31:26	EC
> +	0b000000	OTHER
> +	0b011110	FAULT_GPC
> +	0b011111	IMP_DEF
> +	0b100100	FAULT_WRITE_S1
> +	0b100101	FAULT_WRITE_S2
> +EndEnum
>   Res0	25:24
>   Field	23	DAT
>   Field	22	IRQ
> 
Reviewed-by: James Clark <james.clark@linaro.org>


