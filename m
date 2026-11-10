Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FC0606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 03:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rYJuVl6a;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ks/X0oUw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=za74yO6eVriYIL9IiaSTgnvwvp3HB2QSTMgKSrDIVsI=; b=rYJuVl6a9cMlHy
	oV7LuYYMCJsC8CcvrP+BKulL56xo1SU0XbTLOgmOKVUbRynFJCAGjAaLP7QVxiq9afxISqtNukgv2
	lNJZgeR4XkLFY9ktdPG+6FiSV7p/g/B34lMGWCDx/FnvB6m1YdvSeU878RVf/or/Sb5aNp9ghFYsP
	ru0ksvrcNmksfOXr0TuP+KLPhseDrx2T7Y7MiC/sejKz4ZSOVcoOz4SMDUFr6VBDooPp6LXtMA7fr
	cLZvUThE5DXVgGzY+TIO1puyBK99L9POfXoSAhwGYQfhHmfTsfeZSpfKdDGRIVSeD5qi+RxC2Tir2
	x6AafpzJmjdw68MjtwYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcWM-00000002I3I-4ASZ;
	Tue, 10 Nov 2026 03:27:43 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcWI-00000002I2q-1NEK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 03:27:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794281255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=za74yO6eVriYIL9IiaSTgnvwvp3HB2QSTMgKSrDIVsI=;
	b=Ks/X0oUwMevetznMLm4WwiEqM0Crz5k4mT5rTMfpRM0tJb/dV2kuRo2lB5USq5yDq9TJ80
	KIIwZ/ifil5JnoMe60+nNQzSjMfZ+nDy5zyIAMI/Y6+orUT5DnqUgq4nV6Q4dccuiRZgIZ
	lWHdqPoGUj3GRVdDJjOvGin0TL7I3yc=
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-213-cY2Ig2-4Og2KPvCj_pMN6Q-1; Mon, 09 Nov 2026 22:27:34 -0500
X-MC-Unique: cY2Ig2-4Og2KPvCj_pMN6Q-1
X-Mimecast-MFC-AGG-ID: cY2Ig2-4Og2KPvCj_pMN6Q_1794281253
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3425098ae4bso1760220eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 19:27:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794281253; x=1794886053;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=za74yO6eVriYIL9IiaSTgnvwvp3HB2QSTMgKSrDIVsI=;
        b=Fqfm8zRai3OJahDYQQclUtvOBJF1qDx+hicXEaSn196uG4AfgKQV3YOYsXzJe5UQ+x
         I1sQJYdfC45rH9/GUb/HRuimU9kL3YB38mcWc7VtAZGLwQsBF8eW45vMny82cE0LDCUt
         tHvpC/Rpgn0QEO3y5DWAvurHIEbkAmMnLNn588PfdNpdvS5NjUraKjkedPLMWIPzKvBJ
         trNnjMQ35MQp0WiEOS0gq3UQwJ38l/CNMZ/tIQ1j1tw9c0bhCZYI6YDONDt/eJxVyvn8
         sqLcqbYmsspzOw08t7XekVqb2aUF4RyCO3AjoQEJVn0AdAp289YlLzrpeewMLAvMQE+c
         q5wg==
X-Forwarded-Encrypted: i=1; AL+hErGmo8Z9YHStM1yK4+YQ8lvNe+0bsyvtC9ynAMD3G/TrNLfacyy7QqOoFkW761tYeciK/if/b7Ga6wncFp4Vx5CF@lists.infradead.org
X-Gm-Message-State: APuU4Z9XMHr26kijlA0ozi8YBs2KTyPB2Qw3dOeK+31GjBSchxaodzli
	5T6PTB/m/4YZnqgQf/pmtHymDStxk0xQn6h/gI4QN4ANNif7RzXUAkMNmODiZK95oCInvuU7vj2
	0l2LMl3GHP6YF2KYfxmypYeLBZ/2YBQacVrF02Ph1L8974G6AmXljUKUtW/XZoYrMd9A/Du45JP
	dc
X-Gm-Gg: AYBFou1YfpG7zWBHStwYq7xyLZx4zyko3zP9o4S9w8wndZHUEKYXoDebVonIgEyuWmi
	Aycab7HrrfezUKfZDXY/kTv8DF1qmQ23DJHCtywnoKlE/L8Ik19nvmolSQmG8GSXooXxgAmWJd3
	dSxE9UR5Ly0Mon9GOJFoBhTetA/lpRE16zd7GnyIUGLwKdT4pJOIpYBIv0JtJ3nQEMvi0hiKdHH
	8RLj3KZxaCVlaLW8QzRXKVaKaY5MdUjrviLDpaWlM6Eu6IxHCBPYLOsrixXp32K+zfvTkE3fcIp
	qwZlYXzDjfoni8IzVzz/7tqc2uIpidjXgzFF+VBEqMPupu33MJig4QTwMPKyyfDsdviQBKDWPF0
	71jwPKHSJLX5GVhQDRdRQ0uHHyL9xvg8xBbvXq7x8J0Re8XjW4ia5XvFf2j9aoSUF4peT9k0nA4
	GGzfaH3PWjeTylPcQ=
X-Received: by 2002:a05:7022:408c:b0:184:ae11:51c8 with SMTP id a92af1059eb24-1b3b5e5d8e0mr1721802c88.23.1794281252321;
        Mon, 09 Nov 2026 19:27:32 -0800 (PST)
X-Received: by 2002:a05:7022:408c:b0:184:ae11:51c8 with SMTP id a92af1059eb24-1b3b5e5d8e0mr1721763c88.23.1794281251516;
        Mon, 09 Nov 2026 19:27:31 -0800 (PST)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b72ce0sm3606624c88.18.2026.11.09.19.27.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 19:27:30 -0800 (PST)
Message-ID: <c5af474b-a475-491e-a45b-5c026a5645ad@redhat.com>
Date: Tue, 10 Nov 2026 13:27:24 +1000
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
X-Mimecast-MFC-PROC-ID: PULn6WFpbgMI5FyGHw_18_nC97hzXFmn-wnXvl0aLE8_1794281253
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_192738_537765_4EF1E726 
X-CRM114-Status: GOOD (  19.12  )
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
X-Spam-Status: No, score=-22.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Sudeep,

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
> diff --git a/Documentation/tee/ts-tee.rst b/Documentation/tee/ts-tee.rst
> index 843e34422648..0999d0e0d859 100644
> --- a/Documentation/tee/ts-tee.rst
> +++ b/Documentation/tee/ts-tee.rst
> @@ -62,7 +62,7 @@ References
>   
>   [3] https://www.arm.com/architecture/security-features/platform-security
>   
> -[4] drivers/firmware/arm_ffa/
> +[4] drivers/firmware/arm/ffa/
>   
>   [5] https://trusted-services.readthedocs.io/en/v1.0.0/developer/service-access-protocols.html#abi
>   
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 93abbb315065..550863200d44 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4040,7 +4040,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
>   F:	Documentation/ABI/testing/sysfs-firmware-cca
>   F:	Documentation/arch/arm64/
>   F:	arch/arm64/
> -F:	drivers/firmware/arm_rmm/
> +F:	drivers/firmware/arm/rmm/
>   F:	drivers/virt/coco/arm-cca-guest/
>   F:	drivers/virt/coco/pkvm-guest/
>   F:	include/linux/arm-rmi-cmds.h
> @@ -10462,7 +10462,7 @@ FIRMWARE FRAMEWORK FOR ARMV8-A
>   M:	Sudeep Holla <sudeep.holla@kernel.org>
>   L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>   S:	Maintained
> -F:	drivers/firmware/arm_ffa/
> +F:	drivers/firmware/arm/ffa/
>   F:	include/linux/arm_ffa.h
>   
>   FIRMWARE LOADER (request_firmware)
> @@ -22265,7 +22265,7 @@ M:	Lorenzo Pieralisi <lpieralisi@kernel.org>
>   L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>   S:	Maintained
>   F:	Documentation/devicetree/bindings/arm/psci.yaml
> -F:	drivers/firmware/psci/
> +F:	drivers/firmware/arm/psci/
>   F:	include/linux/psci.h
>   F:	include/uapi/linux/psci.h
>   
> @@ -25374,9 +25374,9 @@ M:	Lorenzo Pieralisi <lpieralisi@kernel.org>
>   M:	Sudeep Holla <sudeep.holla@kernel.org>
>   L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>   S:	Maintained
> -F:	drivers/firmware/smccc/
> -F:	include/linux/arm-smccc-bus.h
> +F:	drivers/firmware/arm/smccc/
>   F:	include/linux/arm-smccc.h
> +F:	include/linux/arm-smccc-bus.h
>   F:	include/linux/device-id/arm_smccc.h
>   
>   SECURITY CONTACT
> @@ -26000,7 +26000,7 @@ M:	James Morse <james.morse@arm.com>
>   L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>   S:	Maintained
>   F:	Documentation/devicetree/bindings/arm/firmware/sdei.txt
> -F:	drivers/firmware/arm_sdei*
> +F:	drivers/firmware/arm/sdei*
>   F:	include/linux/arm_sdei.h
>   F:	include/uapi/linux/arm_sdei.h
>   
> @@ -27262,8 +27262,8 @@ S:	Maintained
>   F:	Documentation/devicetree/bindings/firmware/arm,sc[mp]i.yaml
>   F:	drivers/clk/clk-sc[mp]i.c
>   F:	drivers/cpufreq/sc[mp]i-cpufreq.c
> -F:	drivers/firmware/arm_scmi/
> -F:	drivers/firmware/arm_scpi.c
> +F:	drivers/firmware/arm/scmi/
> +F:	drivers/firmware/arm/scpi.c
>   F:	drivers/hwmon/scmi-hwmon.c
>   F:	drivers/pinctrl/pinctrl-scmi.c
>   F:	drivers/pmdomain/arm/
> @@ -27282,7 +27282,7 @@ L:	imx@lists.linux.dev
>   L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>   S:	Maintained
>   F:	Documentation/devicetree/bindings/firmware/nxp,*scmi.yaml
> -F:	drivers/firmware/arm_scmi/vendors/imx/
> +F:	drivers/firmware/arm/scmi/vendors/imx/
>   
>   SYSTEM RESET/SHUTDOWN DRIVERS
>   M:	Sebastian Reichel <sre@kernel.org>
> diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
> index 43e2e2a64594..2097547850e7 100644
> --- a/drivers/firmware/Kconfig
> +++ b/drivers/firmware/Kconfig
> @@ -6,60 +6,11 @@
>   
>   menu "Firmware Drivers"
>   
> -source "drivers/firmware/arm_scmi/Kconfig"
> +source "drivers/firmware/arm/Kconfig"
>   
>   config FW_ATTR_CLASS
>   	tristate
>   
> -config ARM_SCPI_PROTOCOL
> -	tristate "ARM System Control and Power Interface (SCPI) Message Protocol"
> -	depends on ARM || ARM64 || COMPILE_TEST
> -	depends on MAILBOX
> -	help
> -	  System Control and Power Interface (SCPI) Message Protocol is
> -	  defined for the purpose of communication between the Application
> -	  Cores(AP) and the System Control Processor(SCP). The MHU peripheral
> -	  provides a mechanism for inter-processor communication between SCP
> -	  and AP.
> -
> -	  SCP controls most of the power management on the Application
> -	  Processors. It offers control and management of: the core/cluster
> -	  power states, various power domain DVFS including the core/cluster,
> -	  certain system clocks configuration, thermal sensors and many
> -	  others.
> -
> -	  This protocol library provides interface for all the client drivers
> -	  making use of the features offered by the SCP.
> -
> -config ARM_SDE_INTERFACE
> -	bool "ARM Software Delegated Exception Interface (SDEI)"
> -	depends on ARM64
> -	help
> -	  The Software Delegated Exception Interface (SDEI) is an ARM
> -	  standard for registering callbacks from the platform firmware
> -	  into the OS. This is typically used to implement RAS notifications.
> -
> -config ARM_SDEI_NMI
> -	bool "SDEI-based cross-CPU NMI service (arm64)"
> -	depends on ARM_SDE_INTERFACE
> -	help
> -	  Provides SDEI-based cross-CPU NMI delivery for hooks that need
> -	  to reach interrupt-masked CPUs on silicon that lacks FEAT_NMI:
> -
> -	    - arch_trigger_cpumask_backtrace()  (sysrq-l, RCU stalls,
> -	      hardlockup_all_cpu_backtrace, soft-lockup secondary dumps,
> -	      hung-task auxiliary dumps)
> -	    - smp_send_stop() escalation         (reboot/halt and the
> -	      panic / kdump crash stop)
> -
> -	  The driver registers a handler for the SDEI software-signalled
> -	  event (event 0) and reaches a target CPU by signalling it with
> -	  SDEI_EVENT_SIGNAL. Firmware delivers the event out of EL3
> -	  regardless of the target's PSTATE.DAIF -- forced delivery into a
> -	  CPU wedged with interrupts locally masked.
> -
> -	  If unsure, say N.
> -
>   config EDD
>   	tristate "BIOS Enhanced Disk Drive calls determine boot disk"
>   	depends on X86
> @@ -299,8 +250,6 @@ config TURRIS_MOX_RWTM_KEYCTL
>   
>   endif # TURRIS_MOX_RWTM
>   
> -source "drivers/firmware/arm_ffa/Kconfig"
> -source "drivers/firmware/arm_rmm/Kconfig"
>   source "drivers/firmware/broadcom/Kconfig"
>   source "drivers/firmware/cirrus/Kconfig"
>   source "drivers/firmware/coreboot/Kconfig"
> @@ -308,10 +257,8 @@ source "drivers/firmware/efi/Kconfig"
>   source "drivers/firmware/imx/Kconfig"
>   source "drivers/firmware/meson/Kconfig"
>   source "drivers/firmware/microchip/Kconfig"
> -source "drivers/firmware/psci/Kconfig"
>   source "drivers/firmware/qcom/Kconfig"
>   source "drivers/firmware/samsung/Kconfig"
> -source "drivers/firmware/smccc/Kconfig"
>   source "drivers/firmware/tegra/Kconfig"
>   source "drivers/firmware/xilinx/Kconfig"
>   
> diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
> index 50b338313152..f347328e0a0c 100644
> --- a/drivers/firmware/Makefile
> +++ b/drivers/firmware/Makefile
> @@ -2,9 +2,6 @@
>   #
>   # Makefile for the linux kernel.
>   #
> -obj-$(CONFIG_ARM_SCPI_PROTOCOL)	+= arm_scpi.o
> -obj-$(CONFIG_ARM_SDE_INTERFACE)	+= arm_sdei.o
> -obj-$(CONFIG_ARM_SDEI_NMI)	+= arm_sdei_nmi.o
>   obj-$(CONFIG_DMI)		+= dmi_scan.o
>   obj-$(CONFIG_DMI_SYSFS)		+= dmi-sysfs.o
>   obj-$(CONFIG_EDD)		+= edd.o
> @@ -25,9 +22,7 @@ obj-$(CONFIG_TI_SCI_PROTOCOL)	+= ti_sci.o
>   obj-$(CONFIG_TRUSTED_FOUNDATIONS) += trusted_foundations.o
>   obj-$(CONFIG_TURRIS_MOX_RWTM)	+= turris-mox-rwtm.o
>   
> -obj-y				+= arm_ffa/
> -obj-y				+= arm_rmm/
> -obj-y				+= arm_scmi/
> +obj-y				+= arm/
>   obj-y				+= broadcom/
>   obj-y				+= cirrus/
>   obj-y				+= meson/
> @@ -35,9 +30,7 @@ obj-y				+= microchip/
>   obj-$(CONFIG_COREBOOT_FIRMWARE)	+= coreboot/
>   obj-y				+= efi/
>   obj-y				+= imx/
> -obj-y				+= psci/
>   obj-y				+= qcom/
>   obj-y				+= samsung/
> -obj-y				+= smccc/
>   obj-y				+= tegra/
>   obj-y				+= xilinx/
> diff --git a/drivers/firmware/arm/Kconfig b/drivers/firmware/arm/Kconfig
> new file mode 100644
> index 000000000000..c980a847f233
> --- /dev/null
> +++ b/drivers/firmware/arm/Kconfig
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +source "drivers/firmware/arm/ffa/Kconfig"
> +source "drivers/firmware/arm/psci/Kconfig"
> +source "drivers/firmware/arm/rmm/Kconfig"
> +source "drivers/firmware/arm/scmi/Kconfig"
> +source "drivers/firmware/arm/smccc/Kconfig"
> +
> +config ARM_SCPI_PROTOCOL
> +	tristate "ARM System Control and Power Interface (SCPI) Message Protocol"
> +	depends on ARM || ARM64 || COMPILE_TEST
> +	depends on MAILBOX
> +	help
> +	  System Control and Power Interface (SCPI) Message Protocol is
> +	  defined for the purpose of communication between the Application
> +	  Cores(AP) and the System Control Processor(SCP). The MHU peripheral
> +	  provides a mechanism for inter-processor communication between SCP
> +	  and AP.
> +
> +	  SCP controls most of the power management on the Application
> +	  Processors. It offers control and management of: the core/cluster
> +	  power states, various power domain DVFS including the core/cluster,
> +	  certain system clocks configuration, thermal sensors and many
> +	  others.
> +
> +	  This protocol library provides interface for all the client drivers
> +	  making use of the features offered by the SCP.
> +
> +config ARM_SDE_INTERFACE
> +	bool "ARM Software Delegated Exception Interface (SDEI)"
> +	depends on ARM64
> +	help
> +	  The Software Delegated Exception Interface (SDEI) is an ARM
> +	  standard for registering callbacks from the platform firmware
> +	  into the OS. This is typically used to implement RAS notifications.
> +
> +config ARM_SDEI_NMI
> +	bool "SDEI-based cross-CPU NMI service (arm64)"
> +	depends on ARM_SDE_INTERFACE
> +	help
> +	  Provides SDEI-based cross-CPU NMI delivery for hooks that need
> +	  to reach interrupt-masked CPUs on silicon that lacks FEAT_NMI:
> +
> +	    - arch_trigger_cpumask_backtrace()  (sysrq-l, RCU stalls,
> +	      hardlockup_all_cpu_backtrace, soft-lockup secondary dumps,
> +	      hung-task auxiliary dumps)
> +	    - smp_send_stop() escalation         (reboot/halt and the
> +	      panic / kdump crash stop)
> +
> +	  The driver registers a handler for the SDEI software-signalled
> +	  event (event 0) and reaches a target CPU by signalling it with
> +	  SDEI_EVENT_SIGNAL. Firmware delivers the event out of EL3
> +	  regardless of the target's PSTATE.DAIF -- forced delivery into a
> +	  CPU wedged with interrupts locally masked.
> +
> +	  If unsure, say N.
> diff --git a/drivers/firmware/arm/Makefile b/drivers/firmware/arm/Makefile
> new file mode 100644
> index 000000000000..5e90380a0666
> --- /dev/null
> +++ b/drivers/firmware/arm/Makefile
> @@ -0,0 +1,11 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-$(CONFIG_ARM_SCPI_PROTOCOL)	+= scpi.o
> +obj-$(CONFIG_ARM_SDE_INTERFACE)	+= sdei.o
> +obj-$(CONFIG_ARM_SDEI_NMI)	+= sdei_nmi.o
> +
> +obj-y				+= ffa/
> +obj-y				+= psci/
> +obj-y				+= rmm/
> +obj-y				+= scmi/
> +obj-y				+= smccc/
> diff --git a/drivers/firmware/arm_ffa/Kconfig b/drivers/firmware/arm/ffa/Kconfig
> similarity index 100%
> rename from drivers/firmware/arm_ffa/Kconfig
> rename to drivers/firmware/arm/ffa/Kconfig
> diff --git a/drivers/firmware/arm_ffa/Makefile b/drivers/firmware/arm/ffa/Makefile
> similarity index 100%
> rename from drivers/firmware/arm_ffa/Makefile
> rename to drivers/firmware/arm/ffa/Makefile
> diff --git a/drivers/firmware/arm_ffa/bus.c b/drivers/firmware/arm/ffa/bus.c
> similarity index 100%
> rename from drivers/firmware/arm_ffa/bus.c
> rename to drivers/firmware/arm/ffa/bus.c
> diff --git a/drivers/firmware/arm_ffa/common.h b/drivers/firmware/arm/ffa/common.h
> similarity index 100%
> rename from drivers/firmware/arm_ffa/common.h
> rename to drivers/firmware/arm/ffa/common.h
> diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm/ffa/driver.c
> similarity index 100%
> rename from drivers/firmware/arm_ffa/driver.c
> rename to drivers/firmware/arm/ffa/driver.c
> diff --git a/drivers/firmware/arm_ffa/smccc.c b/drivers/firmware/arm/ffa/smccc.c
> similarity index 100%
> rename from drivers/firmware/arm_ffa/smccc.c
> rename to drivers/firmware/arm/ffa/smccc.c
> diff --git a/drivers/firmware/psci/Kconfig b/drivers/firmware/arm/psci/Kconfig
> similarity index 100%
> rename from drivers/firmware/psci/Kconfig
> rename to drivers/firmware/arm/psci/Kconfig
> diff --git a/drivers/firmware/psci/Makefile b/drivers/firmware/arm/psci/Makefile
> similarity index 100%
> rename from drivers/firmware/psci/Makefile
> rename to drivers/firmware/arm/psci/Makefile
> diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/arm/psci/psci.c
> similarity index 100%
> rename from drivers/firmware/psci/psci.c
> rename to drivers/firmware/arm/psci/psci.c
> diff --git a/drivers/firmware/psci/psci_checker.c b/drivers/firmware/arm/psci/psci_checker.c
> similarity index 100%
> rename from drivers/firmware/psci/psci_checker.c
> rename to drivers/firmware/arm/psci/psci_checker.c
> diff --git a/drivers/firmware/arm_rmm/Kconfig b/drivers/firmware/arm/rmm/Kconfig
> similarity index 100%
> rename from drivers/firmware/arm_rmm/Kconfig
> rename to drivers/firmware/arm/rmm/Kconfig
> diff --git a/drivers/firmware/arm_rmm/Makefile b/drivers/firmware/arm/rmm/Makefile
> similarity index 100%
> rename from drivers/firmware/arm_rmm/Makefile
> rename to drivers/firmware/arm/rmm/Makefile
> diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/arm/rmm/rmi.c
> similarity index 100%
> rename from drivers/firmware/arm_rmm/rmi.c
> rename to drivers/firmware/arm/rmm/rmi.c
> diff --git a/drivers/firmware/arm_rmm/rsi.c b/drivers/firmware/arm/rmm/rsi.c
> similarity index 100%
> rename from drivers/firmware/arm_rmm/rsi.c
> rename to drivers/firmware/arm/rmm/rsi.c
> diff --git a/drivers/firmware/arm_scmi/Kconfig b/drivers/firmware/arm/scmi/Kconfig
> similarity index 97%
> rename from drivers/firmware/arm_scmi/Kconfig
> rename to drivers/firmware/arm/scmi/Kconfig
> index 9f6241efd592..2b62679598ea 100644
> --- a/drivers/firmware/arm_scmi/Kconfig
> +++ b/drivers/firmware/arm/scmi/Kconfig
> @@ -82,8 +82,8 @@ config ARM_SCMI_QUIRKS
>   	  depending on the SCMI firmware advertised versions and/or machine
>   	  compatibles.
>   
> -source "drivers/firmware/arm_scmi/transports/Kconfig"
> -source "drivers/firmware/arm_scmi/vendors/imx/Kconfig"
> +source "drivers/firmware/arm/scmi/transports/Kconfig"
> +source "drivers/firmware/arm/scmi/vendors/imx/Kconfig"
>   
>   endif #ARM_SCMI_PROTOCOL
>   
> diff --git a/drivers/firmware/arm_scmi/Makefile b/drivers/firmware/arm/scmi/Makefile
> similarity index 100%
> rename from drivers/firmware/arm_scmi/Makefile
> rename to drivers/firmware/arm/scmi/Makefile
> diff --git a/drivers/firmware/arm_scmi/base.c b/drivers/firmware/arm/scmi/base.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/base.c
> rename to drivers/firmware/arm/scmi/base.c
> diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm/scmi/bus.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/bus.c
> rename to drivers/firmware/arm/scmi/bus.c
> diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm/scmi/clock.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/clock.c
> rename to drivers/firmware/arm/scmi/clock.c
> diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm/scmi/common.h
> similarity index 100%
> rename from drivers/firmware/arm_scmi/common.h
> rename to drivers/firmware/arm/scmi/common.h
> diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm/scmi/driver.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/driver.c
> rename to drivers/firmware/arm/scmi/driver.c
> diff --git a/drivers/firmware/arm_scmi/msg.c b/drivers/firmware/arm/scmi/msg.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/msg.c
> rename to drivers/firmware/arm/scmi/msg.c
> diff --git a/drivers/firmware/arm_scmi/notify.c b/drivers/firmware/arm/scmi/notify.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/notify.c
> rename to drivers/firmware/arm/scmi/notify.c
> diff --git a/drivers/firmware/arm_scmi/notify.h b/drivers/firmware/arm/scmi/notify.h
> similarity index 100%
> rename from drivers/firmware/arm_scmi/notify.h
> rename to drivers/firmware/arm/scmi/notify.h
> diff --git a/drivers/firmware/arm_scmi/perf.c b/drivers/firmware/arm/scmi/perf.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/perf.c
> rename to drivers/firmware/arm/scmi/perf.c
> diff --git a/drivers/firmware/arm_scmi/pinctrl.c b/drivers/firmware/arm/scmi/pinctrl.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/pinctrl.c
> rename to drivers/firmware/arm/scmi/pinctrl.c
> diff --git a/drivers/firmware/arm_scmi/power.c b/drivers/firmware/arm/scmi/power.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/power.c
> rename to drivers/firmware/arm/scmi/power.c
> diff --git a/drivers/firmware/arm_scmi/powercap.c b/drivers/firmware/arm/scmi/powercap.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/powercap.c
> rename to drivers/firmware/arm/scmi/powercap.c
> diff --git a/drivers/firmware/arm_scmi/protocols.h b/drivers/firmware/arm/scmi/protocols.h
> similarity index 100%
> rename from drivers/firmware/arm_scmi/protocols.h
> rename to drivers/firmware/arm/scmi/protocols.h
> diff --git a/drivers/firmware/arm_scmi/quirks.c b/drivers/firmware/arm/scmi/quirks.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/quirks.c
> rename to drivers/firmware/arm/scmi/quirks.c
> diff --git a/drivers/firmware/arm_scmi/quirks.h b/drivers/firmware/arm/scmi/quirks.h
> similarity index 100%
> rename from drivers/firmware/arm_scmi/quirks.h
> rename to drivers/firmware/arm/scmi/quirks.h
> diff --git a/drivers/firmware/arm_scmi/raw_mode.c b/drivers/firmware/arm/scmi/raw_mode.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/raw_mode.c
> rename to drivers/firmware/arm/scmi/raw_mode.c
> diff --git a/drivers/firmware/arm_scmi/raw_mode.h b/drivers/firmware/arm/scmi/raw_mode.h
> similarity index 100%
> rename from drivers/firmware/arm_scmi/raw_mode.h
> rename to drivers/firmware/arm/scmi/raw_mode.h
> diff --git a/drivers/firmware/arm_scmi/reset.c b/drivers/firmware/arm/scmi/reset.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/reset.c
> rename to drivers/firmware/arm/scmi/reset.c
> diff --git a/drivers/firmware/arm_scmi/scmi_power_control.c b/drivers/firmware/arm/scmi/scmi_power_control.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/scmi_power_control.c
> rename to drivers/firmware/arm/scmi/scmi_power_control.c
> diff --git a/drivers/firmware/arm_scmi/sensors.c b/drivers/firmware/arm/scmi/sensors.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/sensors.c
> rename to drivers/firmware/arm/scmi/sensors.c
> diff --git a/drivers/firmware/arm_scmi/shmem.c b/drivers/firmware/arm/scmi/shmem.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/shmem.c
> rename to drivers/firmware/arm/scmi/shmem.c
> diff --git a/drivers/firmware/arm_scmi/system.c b/drivers/firmware/arm/scmi/system.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/system.c
> rename to drivers/firmware/arm/scmi/system.c
> diff --git a/drivers/firmware/arm_scmi/transports/Kconfig b/drivers/firmware/arm/scmi/transports/Kconfig
> similarity index 100%
> rename from drivers/firmware/arm_scmi/transports/Kconfig
> rename to drivers/firmware/arm/scmi/transports/Kconfig
> diff --git a/drivers/firmware/arm_scmi/transports/Makefile b/drivers/firmware/arm/scmi/transports/Makefile
> similarity index 100%
> rename from drivers/firmware/arm_scmi/transports/Makefile
> rename to drivers/firmware/arm/scmi/transports/Makefile
> diff --git a/drivers/firmware/arm_scmi/transports/mailbox.c b/drivers/firmware/arm/scmi/transports/mailbox.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/transports/mailbox.c
> rename to drivers/firmware/arm/scmi/transports/mailbox.c
> diff --git a/drivers/firmware/arm_scmi/transports/optee.c b/drivers/firmware/arm/scmi/transports/optee.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/transports/optee.c
> rename to drivers/firmware/arm/scmi/transports/optee.c
> diff --git a/drivers/firmware/arm_scmi/transports/pcc.c b/drivers/firmware/arm/scmi/transports/pcc.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/transports/pcc.c
> rename to drivers/firmware/arm/scmi/transports/pcc.c
> diff --git a/drivers/firmware/arm_scmi/transports/smc.c b/drivers/firmware/arm/scmi/transports/smc.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/transports/smc.c
> rename to drivers/firmware/arm/scmi/transports/smc.c
> diff --git a/drivers/firmware/arm_scmi/transports/virtio.c b/drivers/firmware/arm/scmi/transports/virtio.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/transports/virtio.c
> rename to drivers/firmware/arm/scmi/transports/virtio.c
> diff --git a/drivers/firmware/arm_scmi/vendors/imx/Kconfig b/drivers/firmware/arm/scmi/vendors/imx/Kconfig
> similarity index 100%
> rename from drivers/firmware/arm_scmi/vendors/imx/Kconfig
> rename to drivers/firmware/arm/scmi/vendors/imx/Kconfig
> diff --git a/drivers/firmware/arm_scmi/vendors/imx/Makefile b/drivers/firmware/arm/scmi/vendors/imx/Makefile
> similarity index 100%
> rename from drivers/firmware/arm_scmi/vendors/imx/Makefile
> rename to drivers/firmware/arm/scmi/vendors/imx/Makefile
> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c b/drivers/firmware/arm/scmi/vendors/imx/imx-sm-bbm.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c
> rename to drivers/firmware/arm/scmi/vendors/imx/imx-sm-bbm.c
> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c b/drivers/firmware/arm/scmi/vendors/imx/imx-sm-cpu.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c
> rename to drivers/firmware/arm/scmi/vendors/imx/imx-sm-cpu.c
> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-lmm.c b/drivers/firmware/arm/scmi/vendors/imx/imx-sm-lmm.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/vendors/imx/imx-sm-lmm.c
> rename to drivers/firmware/arm/scmi/vendors/imx/imx-sm-lmm.c
> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c b/drivers/firmware/arm/scmi/vendors/imx/imx-sm-misc.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> rename to drivers/firmware/arm/scmi/vendors/imx/imx-sm-misc.c
> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx95.rst b/drivers/firmware/arm/scmi/vendors/imx/imx95.rst
> similarity index 100%
> rename from drivers/firmware/arm_scmi/vendors/imx/imx95.rst
> rename to drivers/firmware/arm/scmi/vendors/imx/imx95.rst
> diff --git a/drivers/firmware/arm_scmi/voltage.c b/drivers/firmware/arm/scmi/voltage.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/voltage.c
> rename to drivers/firmware/arm/scmi/voltage.c
> diff --git a/drivers/firmware/arm_scpi.c b/drivers/firmware/arm/scpi.c
> similarity index 100%
> rename from drivers/firmware/arm_scpi.c
> rename to drivers/firmware/arm/scpi.c
> diff --git a/drivers/firmware/arm_sdei.c b/drivers/firmware/arm/sdei.c
> similarity index 100%
> rename from drivers/firmware/arm_sdei.c
> rename to drivers/firmware/arm/sdei.c
> diff --git a/drivers/firmware/arm_sdei_nmi.c b/drivers/firmware/arm/sdei_nmi.c
> similarity index 100%
> rename from drivers/firmware/arm_sdei_nmi.c
> rename to drivers/firmware/arm/sdei_nmi.c

There are other two source files where updates are needed to reflect the
renaming (drivers/firmware/arm_sdei_nmi.c -> drivers/firmware/arm/sdei_nmi.c).

gshan@gshan-thinkpadx1nanogen2:~/sandbox/l$ git grep arm_sdei_nmi\.c
arch/arm64/include/asm/nmi.h: * drivers/firmware/arm_sdei_nmi.c implements them when active; a future
arch/arm64/kernel/smp.c: *   - the SDEI cross-CPU NMI handler (drivers/firmware/arm_sdei_nmi.c),


> diff --git a/drivers/firmware/smccc/Kconfig b/drivers/firmware/arm/smccc/Kconfig
> similarity index 100%
> rename from drivers/firmware/smccc/Kconfig
> rename to drivers/firmware/arm/smccc/Kconfig
> diff --git a/drivers/firmware/smccc/Makefile b/drivers/firmware/arm/smccc/Makefile
> similarity index 100%
> rename from drivers/firmware/smccc/Makefile
> rename to drivers/firmware/arm/smccc/Makefile
> diff --git a/drivers/firmware/smccc/bus.c b/drivers/firmware/arm/smccc/bus.c
> similarity index 100%
> rename from drivers/firmware/smccc/bus.c
> rename to drivers/firmware/arm/smccc/bus.c
> diff --git a/drivers/firmware/smccc/kvm_guest.c b/drivers/firmware/arm/smccc/kvm_guest.c
> similarity index 100%
> rename from drivers/firmware/smccc/kvm_guest.c
> rename to drivers/firmware/arm/smccc/kvm_guest.c
> diff --git a/drivers/firmware/smccc/smccc.c b/drivers/firmware/arm/smccc/smccc.c
> similarity index 100%
> rename from drivers/firmware/smccc/smccc.c
> rename to drivers/firmware/arm/smccc/smccc.c
> diff --git a/drivers/firmware/smccc/soc_id.c b/drivers/firmware/arm/smccc/soc_id.c
> similarity index 100%
> rename from drivers/firmware/smccc/soc_id.c
> rename to drivers/firmware/arm/smccc/soc_id.c

Thanks,
Gavin


