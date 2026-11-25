Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D13606A323
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 13:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IwoWkMfZ;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=bZZL0vp4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2ma/EbgjJlNK07nvQvlAz6GaFYdt19XTiZ5E0MqXzFI=; b=IwoWkMfZSyi2L8
	uoXwNmKPZZornVxtM5WE3asKazyBFS93+2GSFigaDBoTX11kzAtKZa8IjnvPAZ3Bht24YwDZJRWxu
	qUHHorcp1bEF2eZFNgDA7MHfF6sim+kc8l6JPcWj1qIRA3hIpjDrvtgzkejK3oJj5S0Ljd5u4hjUu
	TJnvKZdfKUtN7UnDt+7JUqXJBfSW/suXEfwBer/SMdPGlwfDLZgSxswtCsgh40AYD1xDCkYOu5xyB
	TOceMXbgX8tHWjvwDLPXDmHl9k74erKvgLuHHb6zD6BbLFzG126PabKjsBnqrN0EE8A7kcWEZXamn
	SgFJGxa6FAulGksMlccA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWCti-00000009xwY-073D;
	Wed, 25 Nov 2026 13:18:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWCtg-00000009xvw-0b6Q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 13:18:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A05822F;
	Wed, 25 Nov 2026 05:18:47 -0800 (PST)
Received: from [10.0.154.42] (e121487-lin.cambridge.arm.com [10.0.154.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 79C423F86F;
	Wed, 25 Nov 2026 05:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795612730; bh=JM58YbwXlaYErfQ/3tivOhPKKAEYmR9p/1aB6hZTuxI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bZZL0vp4uIu/5CwAs9E1jpk07Qz4Z/LsHgDgAIrp5wdetENcRJMCdVLFDk16tryLC
	 p9al0WFpXujZv+eGAzMywAUUE9ZaPzqy1P/cgX3E1GYWUxSOTf9JNq9vAxRr/bnI/X
	 +Q9bGNEaQas1YOj8x0cM8M10w1rAt1hNvIOqEElE=
Message-ID: <3d441264-bf6d-4d42-9172-14da8781e54a@arm.com>
Date: Wed, 25 Nov 2026 13:18:47 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] ARM: NOMMU: pmsa-v7: Fix off-by-one in
 mpu_setup_region()
To: Brad Hawthorne <brad@sim.vu>, linux@armlinux.org.uk,
 linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
References: <20261125025757.1159931-1-brad@sim.vu>
 <20261125025757.1159931-4-brad@sim.vu>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20261125025757.1159931-4-brad@sim.vu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_051852_232144_FCB94204 
X-CRM114-Status: GOOD (  17.95  )
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

On 11/25/26 02:57, Brad Hawthorne wrote:
> mpu_setup_region() rejects "number > mpu_max_regions", which lets
> number == mpu_max_regions through. Regions are numbered from 0, so
> that number names a region the MPU does not have. Reject it too.
> 
> Now that allocate_region() respects its limit, no caller passes that
> number. Tested under QEMU (mps2-an385): no change in behaviour.
> 
> This patch was written with an AI coding assistant (Claude Opus 5.5,
> Anthropic): it found the bug in review, wrote the fix, the QEMU tests
> and this changelog, and ran them; I reviewed the reasoning and the test
> results.
> 
> Fixes: 5ad7dcbe40ae ("ARM: mpu: add MPU probe and initialisation functions in C")
> Signed-off-by: Brad Hawthorne <brad@sim.vu>
> ---
>  arch/arm/mm/pmsa-v7.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mm/pmsa-v7.c b/arch/arm/mm/pmsa-v7.c
> index f2ad0f3ff480..af0c71135a6e 100644
> --- a/arch/arm/mm/pmsa-v7.c
> +++ b/arch/arm/mm/pmsa-v7.c
> @@ -371,7 +371,7 @@ static int __init mpu_setup_region(unsigned int number, phys_addr_t start,
>  	u32 size_data;
>  
>  	/* We kept a region free for probing resolution of MPU regions*/
> -	if (number > mpu_max_regions
> +	if (number >= mpu_max_regions
>  	    || number >= MPU_MAX_REGIONS)
>  		return -ENOENT;
>  
> -- 2.43.0

Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>


