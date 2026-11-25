Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F78606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 15:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gnG9rAsK;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Ab1+EvLC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zIIHWBdfnlh9zX3FDIzP6qtC6f0i8hRvS/c5rZc05D8=; b=gnG9rAsKROMDqt
	2ZpoCvpVUDGXlAcHssM25LOMnEZkE5OJY9r73IG7K6wCxKRFE0L+DJsa36fTQHu7UIz2BXMWisC1J
	LI7X84pehhisnyYo9B2SpXe7xA3MBRIbWyfieZhUMngALLvjIZwnU6pYQKuAOSoCu9yU/BZDnLh5j
	vh4wroJsM/bNmGqn6HlotHQedqCdtp80uOSEAxjaSbZiwUnpLagYjiDRog0ax3Tahnrz2ognSx98P
	TNvKNmmMvXzIGyYqplkUpqGLe/ivYHKOH7leRrBMWmIRrPSada9UV9CR4Q5UYD7kqsZW5kY9RNvVC
	kAnszF5DRdCLxhLHQRbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEZC-0000000AI3y-19NC;
	Wed, 25 Nov 2026 15:05:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEZ9-0000000AI3T-23JS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 15:05:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 971802F;
	Wed, 25 Nov 2026 07:05:42 -0800 (PST)
Received: from [10.0.154.42] (e121487-lin.cambridge.arm.com [10.0.154.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 70D503F86F;
	Wed, 25 Nov 2026 07:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795619145; bh=6nK+DE/IB41r1sM8OcVXfo+D23yadS38taWhDdStzQI=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=Ab1+EvLC+ArAiJ8Adp3EWHIGwrWqcF2Q/1povAkp3lhTLRBTNXzGGOXNypKKCljUx
	 mwzHZHnhI5f4Zzz7f5DLPAbaw94O8opr3bNqWLUM8Z5I/DPmvOxG16gknaNxhzBuAw
	 8h7ESwfyXPs2XnveqLnvAeswOW2KrydUqKqoIkqE=
Message-ID: <99861f22-0010-4b83-8665-9ed03c91a04c@arm.com>
Date: Wed, 25 Nov 2026 15:05:41 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 23/39] arm64: cpufeature: Detect PE support for
 FEAT_NMI
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, catalin.marinas@arm.com, lpieralisi@kernel.org,
 liaochang1@huawei.com, ashok.raj@oss.qualcomm.com,
 Mark Brown <broonie@kernel.org>, maz@kernel.org, will@kernel.org,
 ruanjinjie@huawei.com
References: <20261112132042.129062-1-vladimir.murzin@arm.com>
 <20261112132042.129062-24-vladimir.murzin@arm.com>
Content-Language: en-GB
In-Reply-To: <20261112132042.129062-24-vladimir.murzin@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_070547_584483_ABFDE540 
X-CRM114-Status: UNSURE (   8.95  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/12/26 13:20, Vladimir Murzin wrote:
> +static void nmi_enable(const struct arm64_cpu_capabilities *__unused)
> +{
> +	/*
> +	 * Enable use of NMIs controlled by ALLINT, SPINTMASK should
> +	 * be clear by default but make it explicit that we are using
> +	 * this mode.  Ensure that ALLINT is clear first in order to
> +	 * avoid leaving things masked.
> +	 */
> +	_allint_clear();
> +	sysreg_clear_set(sctlr_el1, SCTLR_EL1_SPINTMASK, SCTLR_EL1_NMI);
> +	isb();
> +}

Sashiko correctly pointed out that nmi_enable() unmasks PSTATE.ALLINT
on secondary CPUs while PSTATE.DAIF is still fully masked. I'm planing
to drop enable callback and perform unmasking on corresponding paths
for boot and secondary CPU [1]

[1] https://lore.kernel.org/linux-arm-kernel/18952733-d1a6-4292-ad30-7d45d1b1d3a9@arm.com/

Thanks
Vladimir

