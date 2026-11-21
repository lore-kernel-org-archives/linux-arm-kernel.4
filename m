Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862C4606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 10:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=agLEDlG9;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=oy7tTvfm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Yj6YhJZae49Tw0DKv2iw0HLLaEXFAkG+q7uMo0BJK1M=; b=agLEDlG9I+o2Bj
	S4H6nV3gk1jbVHd3W469AXnV0xInjiRFWMyL8xvtWQfQ4MrjQsLlBfKLUzNfv2E0rCeMaITsgTnQO
	5L7C4LuixC6s4/V3czTiIgauIpA/1DqPPFpgvVD8PDIogk+bNfFHwvNToZ/DFoKERorXvxcXmqMYY
	etq/lurrgmeJXD+UbQ+eU2aeX0TvJR454dISfotZxDzxW7dQzlA9e4wnC26BY4xF+k0RxyaB/ZG17
	E318i9thqC4KpNCoa1BDNWJJ3Xi7Xz1iFT61xvG6taTYyg1ZXF3nCyHr31kZItcTs3Hso8dOho9qB
	48tJCG+5X6trbqgE2TNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUiY2-0000000H370-2qbG;
	Sat, 21 Nov 2026 10:42:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUiXy-0000000H36a-2aAN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 10:42:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E7C8F1575;
	Sat, 21 Nov 2026 02:42:11 -0800 (PST)
Received: from [10.57.93.173] (unknown [10.57.93.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E33D03F673;
	Sat, 21 Nov 2026 02:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795257734; bh=iL8eR8LtS02jD0fPEipVhs7PZCrNJt53A3HgRmlu1nE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oy7tTvfmqCGu0HNi4kMZuliqPxj9S4Sg/F1R9gMt1ti70b/jdNnoI2j+XJJraGBRs
	 6zWwas8zsHWk+kpMPDns3rt2CAp0k3ryRfHT4apcesHp/t4pHYKqG0O1U155bD3god
	 n7+8Vxqr/TFa/r6QaMYXTbopuoDxgIv7+mptE56w=
Message-ID: <5f9eae39-b82c-4fb3-9bea-c49a6b7baf25@arm.com>
Date: Sat, 21 Nov 2026 10:42:11 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: pi: Add an ISB after mapping the FDT in the
 initial ID map
To: Fuad Tabba <fuad.tabba@linux.dev>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>,
 Yang Shi <yang@os.amperecomputing.com>, Kevin Brodsky
 <kevin.brodsky@arm.com>, Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Fuad Tabba <tabba@google.com>, stable@vger.kernel.org
References: <20261120121638.194154-1-fuad.tabba@linux.dev>
 <20261120121638.194154-2-fuad.tabba@linux.dev>
From: Ryan Roberts <ryan.roberts@arm.com>
Content-Language: en-GB
In-Reply-To: <20261120121638.194154-2-fuad.tabba@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_024218_700942_1E6F3600 
X-CRM114-Status: GOOD (  16.14  )
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

On 20/11/2026 12:16, Fuad Tabba wrote:
> map_fdt() maps the FDT into the live initial ID map with only a DSB
> before the caller reads it, so the read can fault on a translation made
> speculatively before the mapping was written. This early in boot,
> VBAR_EL1 doesn't yet point at the kernel's vectors, and the kernel fails
> to boot.
> 
> Add an ISB after the DSB.
> 
> Fixes: 84b04d3e6bdbc ("arm64: kernel: Create initial ID map from C code")
> Cc: stable@vger.kernel.org
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

I did a quick audit of all the other DSBs without ISBs in the pi code and I
think the rest are all correct because they are not synchronising stores to
_live_ tables so there can't have been any speculation with the old invalid value.

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>



> ---
>  arch/arm64/kernel/pi/map_kernel.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/kernel/pi/map_kernel.c b/arch/arm64/kernel/pi/map_kernel.c
> index fb44cbdd2f292..f9338257adb7d 100644
> --- a/arch/arm64/kernel/pi/map_kernel.c
> +++ b/arch/arm64/kernel/pi/map_kernel.c
> @@ -211,6 +211,7 @@ static void *__init map_fdt(phys_addr_t fdt)
>  		  fdt, PAGE_KERNEL, IDMAP_ROOT_LEVEL,
>  		  (pte_t *)init_idmap_pg_dir, false, 0);
>  	dsb(ishst);
> +	isb();
>  
>  	return (void *)fdt;
>  }


