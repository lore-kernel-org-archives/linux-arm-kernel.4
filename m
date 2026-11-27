Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2F5606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 18:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=twHgH+6J;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=HHc77jFv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NZGcvqBJEfT7g/whVf4ukhs+6BekUU6T21N+nSw//EY=; b=twHgH+6Jg1f33GurBMKBSQDMeR
	sZDT/SmSPghg39B2/icolf15Qms03RC+JFG2z7vkEVi4UFVuDYHkwoB5KUqno9r/rtknSV8mXeVq7
	XyTI5e9LKly/F/Zjv2Fg6epWJoy78P0aaim22R8OTjlGpkOsM1lqQAFBiUoaY8ywpBk3sXw9ROkh4
	ilVLWzIi3HHgitMrcWGc4AncmweYsAX9BL0aHsRcz8DnH/2JkjGtIbUKqXP+ZdamQt9q3gzw0XMqO
	Fp+wyNAyX0OsI2Fn1eeqgMyf8YvhQudd/rVNrfleWYwhbkCRzrDa80Hc76LmqsRWZxuNmkr8OHRDd
	ZeKwHIfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0Qq-0000000HNbx-2ioN;
	Fri, 27 Nov 2026 18:12:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0Qo-0000000HNbE-2i8t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 18:12:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 891F61575;
	Fri, 27 Nov 2026 10:12:18 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EBA4E3F86C;
	Fri, 27 Nov 2026 10:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795803141; bh=BX01zZQ8nHBs4mxff7UBzSukxYsQTZNUpf0gX1VR81o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HHc77jFvjaccfHJE17xqKL/IqiGPQ+BeH6zBI+g2ieHQmh2//J2eW8wELdkkk8hRu
	 dO/oTl4A3EAMrpugvgDmxQrH2rsSUmToa4UBPRb6Y5gHJGiXiSml4XSNmZSjqEaPjT
	 FKNykJLuwmnANFhWJPm0cV+aM5RAEJZy25LS3Ack=
Date: Fri, 27 Nov 2026 18:12:15 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	Steven Price <steven.price@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>, thuth@redhat.com,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	Pawel Chmielewski <pawel.chmielewski@intel.com>,
	Jiri Pirko <jiri@resnulli.us>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>, Len Brown <lenb@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Mark Brown <broonie@kernel.org>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Gavin Shan <gshan@redhat.com>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH RFC v3 3/8] arm64: acpi: Enable ACPI CCEL support
Message-ID: <awnH_1vFvFXpny-M@e129823.arm.com>
References: <20261127-arm_cca_mr-v3-0-df3230afce8f@arm.com>
 <20261127-arm_cca_mr-v3-3-df3230afce8f@arm.com>
 <3a46bcc3-33bb-4c9d-a3e5-44144406dbda@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a46bcc3-33bb-4c9d-a3e5-44144406dbda@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_101222_764193_E29C126A 
X-CRM114-Status: GOOD (  21.07  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 27, 2026 at 04:28:01PM +0000, Suzuki K Poulose wrote:
> On 27/11/2026 15:32, Yeoreum Yun wrote:
> > From: Suzuki K Poulose <suzuki.poulose@arm.com>
> > 
> > Add support for ACPI CCEL by handling the EfiACPIMemoryNVS type memory.
> > As per UEFI specifications NVS memory is reserved for Firmware use even
> > after exiting boot services. Thus map the region as read-only.
> > 
> > Cc: Sami Mujawar <sami.mujawar@arm.com>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
> > Cc: Steven Price <steven.price@arm.com>
> > Cc: Sudeep Holla <sudeep.holla@arm.com>
> > Cc: Gavin Shan <gshan@redhat.com>
> > Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > ---
> >   arch/arm64/kernel/acpi.c | 11 +++++++++++
> >   1 file changed, 11 insertions(+)
> > 
> > diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
> > index 681aa2bbc3995..3d6335db882d3 100644
> > --- a/arch/arm64/kernel/acpi.c
> > +++ b/arch/arm64/kernel/acpi.c
> > @@ -354,6 +354,17 @@ void __iomem *acpi_os_ioremap(acpi_physical_address phys, acpi_size size)
> >   			prot = PAGE_KERNEL_RO;
> >   			break;
> > +		case EFI_ACPI_MEMORY_NVS:
> > +			/*
> > +			 * ACPI NVS marks an area reserved for use by the
> > +			 * firmware, even after exiting the boot service.
> > +			 * This may be used by the firmware for sharing dynamic
> > +			 * tables/data (e.g., ACPI CCEL) with the OS. Map it
> > +			 * as read-only.
> > +			 */
> > +			prot = PAGE_KERNEL_RO;
> > +			break;
> > +
> 
> Unfortunately this breaks some platforms, where the NVS must be mapped
> R/W. Thats why we dropped this patch.
> 
> https://lore.kernel.org/all/20251124103329.363afcc6@foz.lan

Thanks to share. anyway it's enough to read in this series.
So I'll drop this in the next spin. Thanks!

-- 
Sincerely,
Yeoreum Yun

