Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBFE606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 16:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ltiuK37u;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=p+Q1KG4h;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=tDBgDGsD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=c4qt7wJmo33DH5hr5919v3DQD2BX8Lp+y10YBFjPKmk=; b=ltiuK37uQxmwpM
	k8frPuXB47SBX/nYM6HzGwDOdL7tAkTCb7/+UIGTYL5dBIbOc0ctpAVdFJ5zgqQOBokMAgEPhP9q9
	A7E1lA796Vw0wH+WbEq/TOUw9K7Dkekm+n7mLUceZ6B+mXDyBNludcXRt8K4ujDFrqLWcTMdg2Pnb
	8muwP3kTE3H4QQ1sDRu3QLLg7ZOf6FwTUED2935JO4kS3Xz4NtF82eMTBgsfMrHvsyqZI7qQso6pn
	8WCvzM5g1445wCCRL/6nASmrnUVGyzEPTtEX0rK8wfhGVUAS+GKmVuhkI6m6XkmI447k6tJR1LVyd
	NX8OcTzREul98raiTVig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWyoV-0000000H4Vw-152B;
	Fri, 27 Nov 2026 16:28:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWynz-0000000H4F7-33SD
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Nov 2026 16:28:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=c4qt7wJmo33DH5hr5919v3DQD2BX8Lp+y10YBFjPKmk=; b=p+Q1KG4hsT5ZEzRstUWVnqIOgL
	UIrkPemNvqwQkIYCILYVxBXz7PwHrT8IlbimOOoYmlpu6GIRTiSX6SmpGQut8r2Ur6PAVmd0Vadhj
	tePs4IfNN0jlE3NGrKwemu63LJW5KIy6tQq5vSwPBlC9/KY3O2lyvnpnewuebeB5z682FpVVo185Q
	pdLMhW9hVlEMUpnZA9t4DBQ7dsDEGjpFMlX3gm0nESqx7sTwT4+lJZnkuMijgUC2D34EA99DE3f+r
	BmygAprol0Rvr8PEHEJaw3Sxtjuym6YwwidGawW+Ufk5fnjk82URTmksPtM7zH3TWNNbgsu9na97K
	clmbIP6Q==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWynw-00000007xvw-150T
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 16:28:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 925061570;
	Fri, 27 Nov 2026 08:28:03 -0800 (PST)
Received: from [10.57.71.121] (unknown [10.57.71.121])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DCB863F632;
	Fri, 27 Nov 2026 08:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795796886; bh=uvuUXT6/oqsW0UDpUW3bxTylCGwKduT/Ak8GOkRy0JI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tDBgDGsDThNcbZ/lRt+L05X+6ny7A+3HRqTsQbrQsJ2FvfB/00IVOcWQzTiPzD1C3
	 UIxSjIS/Jj4KtHiTh778z9A54Dxs9VRSk16Yiuh6Eb6+a2vsIyCvRZTOGpVDmc4Jhv
	 iF5991BtBv4GBMMLieU7slocKD2Zui4XCnT02ssA=
Message-ID: <3a46bcc3-33bb-4c9d-a3e5-44144406dbda@arm.com>
Date: Fri, 27 Nov 2026 16:28:01 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 3/8] arm64: acpi: Enable ACPI CCEL support
Content-Language: en-GB
To: Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Steven Price <steven.price@arm.com>,
 Sami Mujawar <sami.mujawar@arm.com>, thuth@redhat.com,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
 Pawel Chmielewski <pawel.chmielewski@intel.com>,
 Jiri Pirko <jiri@resnulli.us>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <shuah@kernel.org>, Len Brown <lenb@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Mark Brown <broonie@kernel.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Gavin Shan <gshan@redhat.com>,
 Sudeep Holla <sudeep.holla@kernel.org>
References: <20261127-arm_cca_mr-v3-0-df3230afce8f@arm.com>
 <20261127-arm_cca_mr-v3-3-df3230afce8f@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261127-arm_cca_mr-v3-3-df3230afce8f@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_162808_703279_C824DCE4 
X-CRM114-Status: GOOD (  17.73  )
X-Spam-Score: -2.5 (--)
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

On 27/11/2026 15:32, Yeoreum Yun wrote:
> From: Suzuki K Poulose <suzuki.poulose@arm.com>
> 
> Add support for ACPI CCEL by handling the EfiACPIMemoryNVS type memory.
> As per UEFI specifications NVS memory is reserved for Firmware use even
> after exiting boot services. Thus map the region as read-only.
> 
> Cc: Sami Mujawar <sami.mujawar@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Sudeep Holla <sudeep.holla@arm.com>
> Cc: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>   arch/arm64/kernel/acpi.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
> index 681aa2bbc3995..3d6335db882d3 100644
> --- a/arch/arm64/kernel/acpi.c
> +++ b/arch/arm64/kernel/acpi.c
> @@ -354,6 +354,17 @@ void __iomem *acpi_os_ioremap(acpi_physical_address phys, acpi_size size)
>   			prot = PAGE_KERNEL_RO;
>   			break;
>   
> +		case EFI_ACPI_MEMORY_NVS:
> +			/*
> +			 * ACPI NVS marks an area reserved for use by the
> +			 * firmware, even after exiting the boot service.
> +			 * This may be used by the firmware for sharing dynamic
> +			 * tables/data (e.g., ACPI CCEL) with the OS. Map it
> +			 * as read-only.
> +			 */
> +			prot = PAGE_KERNEL_RO;
> +			break;
> +

Unfortunately this breaks some platforms, where the NVS must be mapped
R/W. Thats why we dropped this patch.

https://lore.kernel.org/all/20251124103329.363afcc6@foz.lan

Cheers
Suzuki

>   		case EFI_ACPI_RECLAIM_MEMORY:
>   			/*
>   			 * ACPI reclaim memory is used to pass firmware tables
> 


