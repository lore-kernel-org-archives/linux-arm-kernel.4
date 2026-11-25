Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20126606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 13:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=raSShPgi;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=OPTkxYqI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=p4pwdpLr8G9tkVOw66/7LdGDUKK3H4uvVJTpUAjnWxc=; b=raSShPgimnMA4h
	JglU7/kunrw7UDVyqVxy05At3/q22iZWlHzW1ptQtfhJCHnVpuMf6VQqNRzNyBr04Z+IXK8vZc/4F
	utqDGexMeWFE7w7UHnqBdxzeQo+AFCZBprLASf6xpXxswf3U9ebqxbwGTYxi2kmFXsjT33jYVwqHG
	cpdGoByDv6nfNkmRXTJi2HU37u6ViwVxM6ykk3bmzdgwDh3MDsL+rubhB9R6ylFnm7RVnLdSUGr/E
	AE1Qv13e5/bIJ34s568VFroHIJlbVv06FL8g2Ovo+SM0R1AgVeOo57EWYj4UXi/WVOwqhn/GNCwpx
	STUsevh00dZdiO0ubk6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWCrl-00000009xkH-2Hko;
	Wed, 25 Nov 2026 13:16:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWCri-00000009xjh-2Tl5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 13:16:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 18BF22F;
	Wed, 25 Nov 2026 05:16:46 -0800 (PST)
Received: from [10.0.154.42] (e121487-lin.cambridge.arm.com [10.0.154.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0D7213F86F;
	Wed, 25 Nov 2026 05:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795612608; bh=sBRq7wpGpW8WmsuLwJ+wOE5r4x79Wz0L9uigkh0JVCU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OPTkxYqIZOPed4pLqkkr32XUHQG7ewENqa0OD+6+t1sCG+yay5oTSErb0JqNMcL6G
	 waWMK46znWE5eAhdOaub9+wRPXv8M/SMJd/5xLmjtF4VOp063b98+hcmRfb/37VogX
	 2mU5wqxIlvPDpIq1VdCBw3izczdqHfecvCsuF1u4=
Message-ID: <b0502bb9-4840-4099-ba97-822a4913ca3a@arm.com>
Date: Wed, 25 Nov 2026 13:16:46 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] ARM: NOMMU: pmsa-v7: Do not allocate more RAM regions
 than the limit
To: Brad Hawthorne <brad@sim.vu>, linux@armlinux.org.uk,
 linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
References: <20261125025757.1159931-1-brad@sim.vu>
 <20261125025757.1159931-3-brad@sim.vu>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20261125025757.1159931-3-brad@sim.vu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_051650_951464_9D1380EF 
X-CRM114-Status: GOOD (  21.67  )
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
> deviation from their usual behavior, this may indicate that their account has been compromised. Be extra cautious before opening links or attachments. *
> allocate_region() checks "count > limit" only after it has filled
> regions[count], so it can return one region more than the limit. The
> caller passes the number of MPU regions left for RAM, so the setup
> then programs a region the MPU does not have. Under QEMU (mps2-an385,
> 8 regions) with a memory node of 0x21000000 + 0x9f9000, which needs
> more regions than are left, QEMU logs "MPU region out of range 8/8"
> and the kernel reports:
> 
>   Using ARMv7 PMSA Compliant MPU. Region independence: No, Used 9 of 8 regions
> 
> Stop allocating once the limit is reached, so the memory that does not
> fit is truncated, as intended.
> 
> Tested under QEMU (mps2-an385): the same case now truncates memory and
> boots to user space. Not tested on PMSAv7 hardware.
> 
> This patch was written with an AI coding assistant (Claude Opus 5.5,
> Anthropic): it found the bug in review, wrote the fix, the QEMU tests
> and this changelog, and ran them; I reviewed the reasoning and the test
> results.
> 
> Fixes: 5c9d9a1b3a54 ("ARM: 8712/1: NOMMU: Use more MPU regions to cover memory")
> Cc: stable@vger.kernel.org
> Signed-off-by: Brad Hawthorne <brad@sim.vu>
> ---
>  arch/arm/mm/pmsa-v7.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/arch/arm/mm/pmsa-v7.c b/arch/arm/mm/pmsa-v7.c
> index a20a43867210..f2ad0f3ff480 100644
> --- a/arch/arm/mm/pmsa-v7.c
> +++ b/arch/arm/mm/pmsa-v7.c
> @@ -193,7 +193,7 @@ static int __init allocate_region(phys_addr_t base, phys_addr_t size,
>  	phys_addr_t diff = size;
>  	int attempts = MPU_MAX_REGIONS;
>  
> -	while (diff) {
> +	while (diff && count < limit) {
>  		/* Try cover region as is (maybe with help of subregions) */
>  		if (try_split_region(base, size, &regions[count])) {
>  			count++;
> @@ -215,9 +215,6 @@ static int __init allocate_region(phys_addr_t base, phys_addr_t size,
>  			size = asize < p2size ? asize + 1 : p2size + 1;
>  		}
>  
> -		if (count > limit)
> -			break;
> -
>  		if (!attempts)
>  			break;
>  
> -- 2.43.0

Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>


