Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2197606A327
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 23:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wCaxZVEM;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MXadRDMN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=z+zbegv6WNwelnf26fBHxwGs4v3hsuubcLKQw8LQhIA=; b=wCaxZVEMwSrEK4
	5C0SjPLRJ58Rd8+nLCROv4QTWobhhtpMrIRFD7LxwWIri3JofhQDd4JuO7O5Zadbz4QjeUfFcQ+B7
	rtC4A4Zw2oWYUwdELN+N7d3MA0I0I5oeJEku89/MFXahAUOaAm3SkD9oId4wWGB3FRFflBnYlutXC
	8S+kXNT3IJuCY2EHOJITKteEaJ+SO2Flo0dxi/9ZdRghipIoQIWzD9ziWK9Cg6owsxS1t+Ee4ogXM
	C7LBihsMIUBe7IX4Y9M6jCxakth2an0jizACejbL3hps7LdVpsZGbKC7Hxxa3+mVfZ8C7kewAaoT/
	0CedRkOA8NooyPeE+NfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQvSE-00000005Fim-0a2U;
	Tue, 10 Nov 2026 23:40:42 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQvSA-00000005Fi1-0wmb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 23:40:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794354036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z+zbegv6WNwelnf26fBHxwGs4v3hsuubcLKQw8LQhIA=;
	b=MXadRDMNR24eo5We7hf45UxdI1mJeGKwPG24yLnW4AblZU5ed+UPi7aL4DWmLYi+VDWod1
	JnDn4Ayfz/LLPzO0s/9RzKjwQqlzVhprU2ywDkTDYY6Z50QiU8W23bhkNtteEMeBmtPATW
	TjYJyw8sxnlCRS8+hCYy9CCJKzShKzs=
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-138-20fh1eazMlGSOfAHKPvAjA-1; Tue, 10 Nov 2026 18:40:34 -0500
X-MC-Unique: 20fh1eazMlGSOfAHKPvAjA-1
X-Mimecast-MFC-AGG-ID: 20fh1eazMlGSOfAHKPvAjA_1794354034
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36d1353fdcdso272953eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 15:40:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794354034; x=1794958834;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z+zbegv6WNwelnf26fBHxwGs4v3hsuubcLKQw8LQhIA=;
        b=bX8F2yf6ZY7h/nDDQhMI6gwl+OZoNIWwfU9LHyCx8V/i8RM0+kRDS8TvEu1d9FhVVp
         yukbR4ZHWG5T967+4yD2JFKnEg26DFq/r6gLsThMTPJuDvoATXeCROCz1oDKFsQOEUUa
         g6KhEGlylfSFIexQiNWkT/tmlRSg3384wYdYFHsSgCqyWT2rKHAKNAFXjF3egiFtsrIN
         sLxmzVCRBY/vaGmlooaWsLa+8NZebpPMDOYjusOalS2bXkDKeA8hyXh6rZMbCSY9VHrZ
         VtS83qUUaggG5fbI+QXScO9Fo0xrwo1x8nsq/DRNaJhSkMrHZYlufM+MVQGNf5mxbFoD
         RLMg==
X-Forwarded-Encrypted: i=1; AL+hErHeRftyNAILigNya5ieVn53o/L8oDzO2yzJIDRJgC90J+NhQ1Ubw+EyApH/8Fl3MiIeaumz+ifUgHgRlTms4WuV@lists.infradead.org
X-Gm-Message-State: APuU4Z9CbjAYNWTC6grR+rzPw2JRmofoybVgFWI++wfdfbAQ834ciATA
	5bZDrBR0bhHhc6eKg/QGz+9Cl4DqpsJuqEWxvcLxEaZzVdGctyCBRD/RdyZC/4SrVeD3KXH6uCL
	+xwES6uE6vQOdv+sRfGAYKak0cZpuWvNnREKetkckEbJB6Twq1+qJ2e03frwtDof5wTjP1awU+v
	Hs
X-Gm-Gg: AYBFou3IGWofaxXgPQiAYwx/QnrjE1mE2uvM5HLBCCJ+FXRjpORWUaGRoPGQ7lzHIUd
	M+gfT8OyO+H/HKUFt4LwxKoOuAm0+hvUZGuvvqRUQ1ENGpnPcckZCsnkHKRWTuY1A4y8NtwQW+i
	kf4xoNvrcmuzRzDoRzF27MssFtucqhNEvGJ8GXQwe4M7ATtoJsMOA2pcJr6N6XzEkmGyQMvfEiV
	7qAvHcmqXO4cAs6ePjEY0qDhpx+G2OSSRhhjSFjcm3TnYe/TicBZC4aAjZOk1v1lIixnYC0DU+Q
	Pw+S0ovLGBV0xoxlCZhg3xp7EbhQFWcVZ+ExQ9qXYX5xNzPShJLSoo55n33bO4J+R7+fnAtWHZe
	KAhmeuU1O7izyvesLE+cnmM4mZtRhdQsvsXxFOY6EFCFaNl1w/+TmGGxTUZDGVla+iL7Y/oNYxW
	IiM32hVrI2nZ/EA5Q=
X-Received: by 2002:a05:7300:2324:b0:369:4c3f:8a5 with SMTP id 5a478bee46e88-376858967b7mr1813688eec.14.1794354033581;
        Tue, 10 Nov 2026 15:40:33 -0800 (PST)
X-Received: by 2002:a05:7300:2324:b0:369:4c3f:8a5 with SMTP id 5a478bee46e88-376858967b7mr1813612eec.14.1794354032765;
        Tue, 10 Nov 2026 15:40:32 -0800 (PST)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e9d78sm10969186eec.25.2026.11.10.15.40.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 15:40:31 -0800 (PST)
Message-ID: <7d523a31-5d1f-48f8-9d0b-63f4c01fe449@redhat.com>
Date: Wed, 11 Nov 2026 09:40:26 +1000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] firmware: arm: Group interface drivers under arm/
To: Sudeep Holla <sudeep.holla@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 James Morse <james.morse@arm.com>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Yeoreum Yun
 <yeoreum.yun@arm.com>, Arnd Bergmann <arnd@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>
References: <20261106115046.62344-1-sudeep.holla@kernel.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20261106115046.62344-1-sudeep.holla@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SQ13sxjMRruh2dD3jJ5GGupW9AFI8vniJGzZNEVyZmI_1794354034
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_154038_419057_603BBD0F 
X-CRM114-Status: GOOD (  15.17  )
X-Spam-Score: -2.8 (--)
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

On 11/6/26 9:50 PM, Sudeep Holla wrote:
> Arm firmware interface drivers currently live directly under
> drivers/firmware/. Some use an arm_ prefix while others use generic
> names. More Arm firmware interface drivers, such as:
> 
> 1. Live Firmware Activation (LFA) [1]
> 2. Firmware Interfaces for Realm Management Extension (FIRME) [2]
> 
> expected soon, which would further crowd the top-level directory.
> 
> There are couple of other possible arm specific firmware interfaces
> that may need to reside there.
> 
> Create drivers/firmware/arm/ as the common home for Arm firmware
> interface drivers. Move FF-A, PSCI, RMM, SCMI, SCPI, SDEI, and SMCCC
> under it, drop the redundant arm_ prefix from the some directory/file
> names. Update the Kconfig, Kbuild, maintainer and documentation paths.
> 
> The resulting hierarchy provides room for upcoming interfaces without
> continuing to add Arm-specific directories at the firmware root.
> 
> [1] https://lore.kernel.org/all/20261102165421.3651202-1-andre.przywara@arm.com/
> [2] https://lore.kernel.org/all/20261019-firme_interface-v1-0-27895c9cebaa@arm.com/
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
> ---
> 
> v1[1]->v2:
>   - Rebased on v7.4-rc1
>   - Fixed missing rmm folder movement in Kconfig and Makefile
> 
>   [1] https://lore.kernel.org/all/20261022090003.3083557-1-sudeep.holla@kernel.org/
> 
>   Documentation/tee/ts-tee.rst                  |  2 +-
>   MAINTAINERS                                   | 18 +++---
>   drivers/firmware/Kconfig                      | 55 +-----------------
>   drivers/firmware/Makefile                     |  9 +--
>   drivers/firmware/arm/Kconfig                  | 56 +++++++++++++++++++
>   drivers/firmware/arm/Makefile                 | 11 ++++
>   drivers/firmware/{arm_ffa => arm/ffa}/Kconfig |  0
>   .../firmware/{arm_ffa => arm/ffa}/Makefile    |  0
>   drivers/firmware/{arm_ffa => arm/ffa}/bus.c   |  0
>   .../firmware/{arm_ffa => arm/ffa}/common.h    |  0
>   .../firmware/{arm_ffa => arm/ffa}/driver.c    |  0
>   drivers/firmware/{arm_ffa => arm/ffa}/smccc.c |  0
>   drivers/firmware/{ => arm}/psci/Kconfig       |  0
>   drivers/firmware/{ => arm}/psci/Makefile      |  0
>   drivers/firmware/{ => arm}/psci/psci.c        |  0
>   .../firmware/{ => arm}/psci/psci_checker.c    |  0
>   drivers/firmware/{arm_rmm => arm/rmm}/Kconfig |  0
>   .../firmware/{arm_rmm => arm/rmm}/Makefile    |  0
>   drivers/firmware/{arm_rmm => arm/rmm}/rmi.c   |  0
>   drivers/firmware/{arm_rmm => arm/rmm}/rsi.c   |  0
>   .../firmware/{arm_scmi => arm/scmi}/Kconfig   |  4 +-
>   .../firmware/{arm_scmi => arm/scmi}/Makefile  |  0
>   .../firmware/{arm_scmi => arm/scmi}/base.c    |  0
>   drivers/firmware/{arm_scmi => arm/scmi}/bus.c |  0
>   .../firmware/{arm_scmi => arm/scmi}/clock.c   |  0
>   .../firmware/{arm_scmi => arm/scmi}/common.h  |  0
>   .../firmware/{arm_scmi => arm/scmi}/driver.c  |  0
>   drivers/firmware/{arm_scmi => arm/scmi}/msg.c |  0
>   .../firmware/{arm_scmi => arm/scmi}/notify.c  |  0
>   .../firmware/{arm_scmi => arm/scmi}/notify.h  |  0
>   .../firmware/{arm_scmi => arm/scmi}/perf.c    |  0
>   .../firmware/{arm_scmi => arm/scmi}/pinctrl.c |  0
>   .../firmware/{arm_scmi => arm/scmi}/power.c   |  0
>   .../{arm_scmi => arm/scmi}/powercap.c         |  0
>   .../{arm_scmi => arm/scmi}/protocols.h        |  0
>   .../firmware/{arm_scmi => arm/scmi}/quirks.c  |  0
>   .../firmware/{arm_scmi => arm/scmi}/quirks.h  |  0
>   .../{arm_scmi => arm/scmi}/raw_mode.c         |  0
>   .../{arm_scmi => arm/scmi}/raw_mode.h         |  0
>   .../firmware/{arm_scmi => arm/scmi}/reset.c   |  0
>   .../scmi}/scmi_power_control.c                |  0
>   .../firmware/{arm_scmi => arm/scmi}/sensors.c |  0
>   .../firmware/{arm_scmi => arm/scmi}/shmem.c   |  0
>   .../firmware/{arm_scmi => arm/scmi}/system.c  |  0
>   .../{arm_scmi => arm/scmi}/transports/Kconfig |  0
>   .../scmi}/transports/Makefile                 |  0
>   .../scmi}/transports/mailbox.c                |  0
>   .../{arm_scmi => arm/scmi}/transports/optee.c |  0
>   .../{arm_scmi => arm/scmi}/transports/pcc.c   |  0
>   .../{arm_scmi => arm/scmi}/transports/smc.c   |  0
>   .../scmi}/transports/virtio.c                 |  0
>   .../scmi}/vendors/imx/Kconfig                 |  0
>   .../scmi}/vendors/imx/Makefile                |  0
>   .../scmi}/vendors/imx/imx-sm-bbm.c            |  0
>   .../scmi}/vendors/imx/imx-sm-cpu.c            |  0
>   .../scmi}/vendors/imx/imx-sm-lmm.c            |  0
>   .../scmi}/vendors/imx/imx-sm-misc.c           |  0
>   .../scmi}/vendors/imx/imx95.rst               |  0
>   .../firmware/{arm_scmi => arm/scmi}/voltage.c |  0
>   drivers/firmware/{arm_scpi.c => arm/scpi.c}   |  0
>   drivers/firmware/{arm_sdei.c => arm/sdei.c}   |  0
>   .../{arm_sdei_nmi.c => arm/sdei_nmi.c}        |  0
>   drivers/firmware/{ => arm}/smccc/Kconfig      |  0
>   drivers/firmware/{ => arm}/smccc/Makefile     |  0
>   drivers/firmware/{ => arm}/smccc/bus.c        |  0
>   drivers/firmware/{ => arm}/smccc/kvm_guest.c  |  0
>   drivers/firmware/{ => arm}/smccc/smccc.c      |  0
>   drivers/firmware/{ => arm}/smccc/soc_id.c     |  0
>   68 files changed, 81 insertions(+), 74 deletions(-)
>   create mode 100644 drivers/firmware/arm/Kconfig
>   create mode 100644 drivers/firmware/arm/Makefile
>   rename drivers/firmware/{arm_ffa => arm/ffa}/Kconfig (100%)
>   rename drivers/firmware/{arm_ffa => arm/ffa}/Makefile (100%)
>   rename drivers/firmware/{arm_ffa => arm/ffa}/bus.c (100%)
>   rename drivers/firmware/{arm_ffa => arm/ffa}/common.h (100%)
>   rename drivers/firmware/{arm_ffa => arm/ffa}/driver.c (100%)
>   rename drivers/firmware/{arm_ffa => arm/ffa}/smccc.c (100%)
>   rename drivers/firmware/{ => arm}/psci/Kconfig (100%)
>   rename drivers/firmware/{ => arm}/psci/Makefile (100%)
>   rename drivers/firmware/{ => arm}/psci/psci.c (100%)
>   rename drivers/firmware/{ => arm}/psci/psci_checker.c (100%)
>   rename drivers/firmware/{arm_rmm => arm/rmm}/Kconfig (100%)
>   rename drivers/firmware/{arm_rmm => arm/rmm}/Makefile (100%)
>   rename drivers/firmware/{arm_rmm => arm/rmm}/rmi.c (100%)
>   rename drivers/firmware/{arm_rmm => arm/rmm}/rsi.c (100%)
>   rename drivers/firmware/{arm_scmi => arm/scmi}/Kconfig (97%)
>   rename drivers/firmware/{arm_scmi => arm/scmi}/Makefile (100%)
>   rename drivers/firmware/{arm_scmi => arm/scmi}/base.c (100%)
>   rename drivers/firmware/{arm_scmi => arm/scmi}/bus.c (100%)
>   rename drivers/firmware/{arm_scmi => arm/scmi}/clock.c (100%)
>   rename drivers/firmware/{arm_scmi => arm/scmi}/common.h (100%)
>   rename drivers/firmware/{arm_scmi => arm/scmi}/driver.c (100%)
>   rename drivers/firmware/{arm_scmi => arm/scmi}/msg.c (100%)
>   rename drivers/firmware/{arm_scmi => arm/scmi}/notify.c (100%)
>   rename drivers/firmware/{arm_scmi => arm/scmi}/notify.h (100%)
>   rename drivers/firmware/{arm_scmi => arm/scmi}/perf.c (100%)
>   rename drivers/firmware/{arm_scmi => arm/scmi}/pinctrl.c (100%)
>   rename drivers/firmware/{arm_scmi => arm/scmi}/power.c (100%)
>   rename drivers/firmware/{arm_scmi => arm/scmi}/powercap.c (100%)
>   rename drivers/firmware/{arm_scmi => arm/scmi}/protocols.h (100%)
>   rename drivers/firmware/{arm_scmi => arm/scmi}/quirks.c (100%)
>   rename drivers/firmware/{arm_scmi => arm/scmi}/quirks.h (100%)
>   rename drivers/firmware/{arm_scmi => arm/scmi}/raw_mode.c (100%)
>   rename drivers/firmware/{arm_scmi => arm/scmi}/raw_mode.h (100%)
>   rename drivers/firmware/{arm_scmi => arm/scmi}/reset.c (100%)
>   rename drivers/firmware/{arm_scmi => arm/scmi}/scmi_power_control.c (100%)
>   rename drivers/firmware/{arm_scmi => arm/scmi}/sensors.c (100%)
>   rename drivers/firmware/{arm_scmi => arm/scmi}/shmem.c (100%)
>   rename drivers/firmware/{arm_scmi => arm/scmi}/system.c (100%)
>   rename drivers/firmware/{arm_scmi => arm/scmi}/transports/Kconfig (100%)
>   rename drivers/firmware/{arm_scmi => arm/scmi}/transports/Makefile (100%)
>   rename drivers/firmware/{arm_scmi => arm/scmi}/transports/mailbox.c (100%)
>   rename drivers/firmware/{arm_scmi => arm/scmi}/transports/optee.c (100%)
>   rename drivers/firmware/{arm_scmi => arm/scmi}/transports/pcc.c (100%)
>   rename drivers/firmware/{arm_scmi => arm/scmi}/transports/smc.c (100%)
>   rename drivers/firmware/{arm_scmi => arm/scmi}/transports/virtio.c (100%)
>   rename drivers/firmware/{arm_scmi => arm/scmi}/vendors/imx/Kconfig (100%)
>   rename drivers/firmware/{arm_scmi => arm/scmi}/vendors/imx/Makefile (100%)
>   rename drivers/firmware/{arm_scmi => arm/scmi}/vendors/imx/imx-sm-bbm.c (100%)
>   rename drivers/firmware/{arm_scmi => arm/scmi}/vendors/imx/imx-sm-cpu.c (100%)
>   rename drivers/firmware/{arm_scmi => arm/scmi}/vendors/imx/imx-sm-lmm.c (100%)
>   rename drivers/firmware/{arm_scmi => arm/scmi}/vendors/imx/imx-sm-misc.c (100%)
>   rename drivers/firmware/{arm_scmi => arm/scmi}/vendors/imx/imx95.rst (100%)
>   rename drivers/firmware/{arm_scmi => arm/scmi}/voltage.c (100%)
>   rename drivers/firmware/{arm_scpi.c => arm/scpi.c} (100%)
>   rename drivers/firmware/{arm_sdei.c => arm/sdei.c} (100%)
>   rename drivers/firmware/{arm_sdei_nmi.c => arm/sdei_nmi.c} (100%)
>   rename drivers/firmware/{ => arm}/smccc/Kconfig (100%)
>   rename drivers/firmware/{ => arm}/smccc/Makefile (100%)
>   rename drivers/firmware/{ => arm}/smccc/bus.c (100%)
>   rename drivers/firmware/{ => arm}/smccc/kvm_guest.c (100%)
>   rename drivers/firmware/{ => arm}/smccc/smccc.c (100%)
>   rename drivers/firmware/{ => arm}/smccc/soc_id.c (100%)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>





