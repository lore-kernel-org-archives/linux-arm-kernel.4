Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E947606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 13:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aLVeNXCb;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SrJEvex+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BcOyV54Y0ZxOXVrr+d2Y34XvpFaNr1/jWLBvtU0HutQ=; b=aLVeNXCbx3ZokE
	jeeDogCKg1KJyQNRBiDgqkaTVx5PQKpdy7ztyAx1ez3z3UPLXJfVMB4fJ0U/o8yStmhABsr4wOhwR
	fxWW7imBXHYVx3FPGijlo2r4MrjUFs6uOXO1YPIvrLFV8nPUQshzUheiMiX0G5w46C9X+jONCKJnL
	TW2osR62y+2VvnChKWStiVRt3Dn1l78Pb39QpSGG0zABLnckKsGBralAWFETyvnB6LnVazAaODcCx
	JuCBnGM8sh6dHorA3YDwIeMA1yIhGyIrPjcG6SO5HB+W+XbF7Z801xH3gGREHdajo2cMuCsv4/Gql
	UiyUOpQVRnMzegif3tSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWvac-0000000GDPO-3wiU;
	Fri, 27 Nov 2026 13:02:10 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWvaa-0000000GDOz-2vVS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 13:02:10 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4bba5e17cbeso26669005e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 05:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795784526; x=1796389326; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BcOyV54Y0ZxOXVrr+d2Y34XvpFaNr1/jWLBvtU0HutQ=;
        b=SrJEvex+OI8CmVZg+2rzv1MlDBy3kLh7/LyjmvghYWhrSBig+BuAuT42ybSKATk3or
         8eO1hHBunr/BxA/pVsa8RnKrj2+nfh29mRhsS9OKU5lhAXOisB7V8BGJfeFnwCYNfv9c
         0ByVdPcr44xXkLYnWEJT4qimBP40zE0auIy0xK8JHQC55tXuB6Yotx6ymUO4lc/ChJmK
         2LOwR46C6lvRkCvAePzBcJ3O3gcYF6YwfKDFYQLjip/qSnFxrWOw9aFTXrHz7bHnjOF5
         gHOH+lO37DXUmwXdoWhlrrhSs6z1ohFvqrcO+/RVsa7hcTN30oIC/Xm4MWg67je6ojfV
         CkXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795784526; x=1796389326;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BcOyV54Y0ZxOXVrr+d2Y34XvpFaNr1/jWLBvtU0HutQ=;
        b=XQ+mnCL3G+7qdpeNTm7eq7lylXnJ/KcKPuaxvURDp3O+EnwfHE1eeEPUwBIeDnKB5H
         6nMh0C2ds2zDBWaecxz0v6+WrIFRUvFAHgz954CssbSrLWLnrmlHVg8kKMGin8c6Nr7w
         8yFL9YkKV3/UD3ShVxeca/mKZBrOzd9FEzXG1mBz0msscfSRoEZoHdDbvm2d/ThMWF2o
         vqNNmBNpP4UPGYE57mvwQ0B1l6FXEhb0V/n6myS+ZroBNflBpQb5iSzKVci/hooB0ATo
         XzQorUB97QA0UGHtm3Rz7x6aL/JAXSQBIznOHp8u5Ax5XW2T3ujsBPzEQ6eGh05yU7lM
         Z2KQ==
X-Forwarded-Encrypted: i=1; AL+hErGDfE8K6SfR9jqGwjtpPVWEdCduZlQcf+BgQ867QF07wBTn9aT9+okWzzzsuS0cTRonsipQ1jJYoQtwkzUJgSCC@lists.infradead.org
X-Gm-Message-State: APuU4Z8zEq0aMGfZhgUU4yEQLa+4CJrdjpb6RtKVKHVYX1XO96w3QyRf
	ifsS6YUBLdvW2POi5Hu7O7rJdxVSicTkALoYKXQ2D6+8QVXXfd5uXjmBvPojH/dlk73RqUTyc01
	nPaJH
X-Gm-Gg: AZFdTZe+xglgmcpFwp9sIgK5BHiPc7jxkhFuVL3phlZHaKsto4o1+/Ox12qc2xdi1gI
	hp67lPoXd7pyffq5NNZRBP30pr6NfIzfD+aT41TbP3d+A4daBQplQ6xWojHFP5w0njINhnDpeuc
	m4FftJ68Vz6PXWQKogi3l7SVvcK26bhSm/p/INy1yIwJ07Zv/TUaMzLqCAaAoj5ohwwJo/gMjst
	eZbXQTee7HxcRRryd6CZc2biY282A9mWBvKeAS6A9DrubnVEyiX/K/pKKFEKx3M8P2MsGCHSLyk
	vXbDa91dfS/tP7G9hBAOVyuY5dYX++gDETTE7ymotYrIOX5RqtODmsxVhfnCv5MlHLpTPgZncaq
	XV5Ih9HRWZQXXzdmtI8INDf1/UZLwHYjnUAcDNhcsng07/C7P426qa0Yt0D0zEcSLKyT+BdZACl
	4wXGDloNDr+NctAhwhVYI0z8S0R/XCKXA4oo8GQnfJAhZjn15jkEk+RvYpsPkM0PT5Z5kddctVK
	JUq3eAD82xWjFJ9IJuU0Abk+jOPP5mo9VpU7rTK7+hHaW1CT2+TpKS0XvhScLothruqT5FKKmXd
	mY+yjevuvB0X9+m0dSmJGf6poi+HbVI5hg==
X-Received: by 2002:a05:600c:4e16:b0:4bb:6f77:1e35 with SMTP id 5b1f17b1804b1-4bb88810991mr526806065e9.21.1795784525598;
        Fri, 27 Nov 2026 05:02:05 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b70c05b9desm22812875f8f.54.2026.11.27.05.02.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 05:02:05 -0800 (PST)
Message-ID: <6f997513-27da-47e5-83bb-18c267e930c6@linaro.org>
Date: Fri, 27 Nov 2026 13:02:03 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] coresight: add missing MODULE_DEVICE_TABLE() for CTCU
 and TPDA
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>, suzuki.poulose@arm.com
Cc: mike.leach@arm.com, leo.yan@arm.com, alexander.shishkin@linux.intel.com,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261127113137.931578-1-xiaqinghuan@mail.ustc.edu.cn>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261127113137.931578-1-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_050208_762611_5FCD6F19 
X-CRM114-Status: GOOD (  18.00  )
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



On 27/11/2026 11:31, Qianhui Xu wrote:
> Hi,
> 
> both the CTCU and the TPDA driver are matched through an ID table, but
> neither exports that table, so building them as modules produces a
> module without an "of:" / "amba:" modalias.  udev cannot autoload such a
> module, and the device stays unbound until somebody loads it by hand.
> 
> This was found on an SM8750 based phone (mainline v7.3.1,
> CONFIG_CORESIGHT_CTCU=m and CONFIG_CORESIGHT_TPDA=m):
> 
>    # lsmod | grep -c coresight_ctcu
>    0
>    # modinfo -F alias coresight-ctcu
>    (empty)
>    # modprobe coresight-ctcu && readlink -f /sys/bus/platform/devices/10001000.ctcu/driver
>    .../drivers/coresight-ctcu
> 
> Five tpda devices behave the same way.  With this series applied the
> modules carry "of:N*T*Cqcom,sa8775p-ctcu" and "amba:d???F0F??" aliases,
> and on the next boot both autoload with no modules-load.d help at all:
> 
>    # lsmod | grep -E 'coresight_(ctcu|tpda)'
>    coresight_ctcu         16384  0
>    coresight_tpda         24576  0
>    # for f in /sys/bus/amba/devices/*; do [ -e $f/driver ] || n=$((n+1)); done; echo $n
>    0
> 
> There is no functional change for built-in builds; MODULE_DEVICE_TABLE()
> is only used for module aliases.
> 
> *** AI-assistance disclosure ***
> This series was prepared with the help of an LLM coding assistant.  The
> author reviewed every line, reproduced the before/after behaviour on
> hardware and is responsible for the content.
> 
> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
> 
> Qianhui Xu (2):
>    coresight: ctcu: add missing MODULE_DEVICE_TABLE()
>    coresight: tpda: add missing MODULE_DEVICE_TABLE()
> 
>   drivers/hwtracing/coresight/coresight-ctcu-core.c | 1 +
>   drivers/hwtracing/coresight/coresight-tpda.c      | 1 +
>   2 files changed, 2 insertions(+)
> 


Could probably do with fixes: tags for both commits, but:

Reviewed-by: James Clark <james.clark@linaro.org>

