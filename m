Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4999606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 03:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZgPAt6bU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7OayvwVyWzvQMLzg/8vpv2bnMtoPYxC0zzH7bx4Z0mw=; b=ZgPAt6bUxklQxn
	S8+MzfPddg65Ih1Esgt2ZeNwZ2r5ecnrYBZV9w0Wq7LF5iisqhkEA96t07ozaS1f/EmXuTBO6OjrJ
	Pgvs5fonPJcA+IYJ4xp0p++P3p2S4h3MYk9Uh9Fp+7DgdAMB+t7rLZU8S/Cd32coJQobLjzCKfjnV
	QSp5bE/ED6SCnEVcOSyMwJ7pZo20RwFUa5nI88L0dMBmK6ln3a5gj1P7isWhBchn+vb/8CdA8rOTv
	t4EsrluXF714gQVX26j+Vnk9xlo7LDvTawmvwwMfimpglLVXyH56hFmeJMpSo2/mrhv5guD/XmrGg
	nQGmRbmMuvrkm4asI7Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVKyY-00000002EJO-2zJ3;
	Mon, 23 Nov 2026 03:44:22 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVKyQ-00000002EHf-1edv;
	Mon, 23 Nov 2026 03:44:11 +0000
Message-ID: <0cc7d474-adf2-46f8-bd4f-f352696313af@infradead.org>
Date: Sun, 22 Nov 2026 19:44:09 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: sdei: add sdei_nmi.disabled= to keep the GIC NMI
 path reachable
To: Jinjie Ruan <ruanjinjie@huawei.com>, corbet@lwn.net,
 skhan@linuxfoundation.org, james.morse@arm.com, rppt@kernel.org,
 arnd@arndb.de, kmehltretter@gmail.com, dapeng1.mi@linux.intel.com,
 elver@google.com, enelsonmoore@gmail.com, bp@alien8.de, jlayton@kernel.org,
 catalin.marinas@arm.com, sean@starlabs.systems, will@kernel.org,
 jonathan.cameron@oss.qualcomm.com, tzungbi@kernel.org, kas@kernel.org,
 steven.price@arm.com, chenhuacai@kernel.org, tzimmermann@suse.de,
 wenst@chromium.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, vladimir.murzin@arm.com
References: <20261123033222.1067923-1-ruanjinjie@huawei.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20261123033222.1067923-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/22/26 7:32 PM, Jinjie Ruan wrote:
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 176648941aec..9a3ce8ed18f4 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -6958,6 +6958,14 @@ Kernel parameters
>  			1 -- enable.
>  			Default value is 1.
>  
> +	sdei_nmi.disabled= [ARM64,EARLY]
> +			Disable SDEI-based cross-CPU NMI and leave the GIC NMI
> +			path in place. Requires the kernel to be built with
> +			CONFIG_ARM_SDEI_NMI.
> +			Format: { "0" | "1" }
> +			0 -- enable (default).
> +			1 -- disable.
> +

Alphabetical order, please. Entries are a bit messed up in the s* world...
Please add this one between
	scftorture.weight_all_wait= [KNL]
and
	sdw_mclk_divider=[SDW]

>  	serialnumber	[BUGS=X86-32]

-- 
~Randy


