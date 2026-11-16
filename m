Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29AB606A331
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 15:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KZUS5eSn;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k1TPALyE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LnSeRb4dN96wBhv6QjPTulpHgT7xgStRTwFnLWmVaVA=; b=KZUS5eSnOMWamS
	WSjCI2VAUwkczR9GHnwJLZncFgqd6VFWo+az4TaV/7ZQEtmsyl1kiSGG+eR6D23X7itTSgHdVgpE9
	AgDbLNZB1u+7P/TP1+BUCE9yeG2eStkdlV9F4bmx0G/UrPRhov2Z3286NvXmG21+XjBX4+NEDhCNB
	FroThqht4AuhqD8uGzgwg9JNEIaY2aSNlO2xzWGIVC1Y1DaEX2xrj/wlDksHQleY7psAXPmpTzbmz
	Jknw8ASIskIMD636IIHNy8SsIr/8VWc+jftmNYkWkxIdmV2aDIU9x86xzoWNiLo5zky8nJRJLxVNK
	TmzCoFRJWPonKMDdduAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSz48-000000038R0-0zB9;
	Mon, 16 Nov 2026 15:56:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSz46-000000038Qp-3MBT;
	Mon, 16 Nov 2026 15:56:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EABB56188B;
	Mon, 16 Nov 2026 15:56:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8E491F000C4;
	Mon, 16 Nov 2026 15:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794844577;
	bh=LnSeRb4dN96wBhv6QjPTulpHgT7xgStRTwFnLWmVaVA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=k1TPALyEzGuGelskzZPMTDhNwa0mXOqc58ZHlyZE4oQ0ZM5EJquOYbdtrBcKo1dW0
	 GubBjMxi0pQxAEgamTiNkRPpHViVVBQSur2/ZQ5tP+jEmhqQrglbadj6Vfe3KGK0fc
	 Wper3e3fVo7kOJNoCFBYEt9ZQTn0Ev/C0ZxiEpQ7T6poCTp83gMsU+Dpa5WRhEZXhP
	 AQmraknEk5wW3+eEG6JqdtinEvAGRPGQodVJnIOfdazJsLTxM2GtTCdt96h51hrR+p
	 +GpKDVhPOUVE/PTuucFiWQn6WWkUCOeBBqPKrXKCZlPyg9B6hl0lOHmwFPEslor1sK
	 ucIgmRGENHK4w==
Message-ID: <336dc797-2406-4d81-b322-61b85ac52bdd@kernel.org>
Date: Mon, 16 Nov 2026 15:56:06 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/12] nvmem: Add Raspberry Pi OTP nvmem driver
To: Gregor Herburger <gregor.herburger@linutronix.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Eric Anholt <eric@anholt.net>,
 Stefan Wahren <wahrenst@gmx.net>, Srinivas Kandagatla <srini@kernel.org>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
References: <20261110-rpi-otp-driver-v8-0-797e0577d414@linutronix.de>
From: Srinivas Kandagatla <srini@kernel.org>
Content-Language: en-US
In-Reply-To: <20261110-rpi-otp-driver-v8-0-797e0577d414@linutronix.de>
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/10/26 4:33 PM, Gregor Herburger wrote:
> Hi,
> 
> This series adds support for the Raspberry Pis OTP registers. The
> Raspberry Pi has one or more OTP regions. These registers are accessible
> through the firmware. Add a driver for it and add updates the devicetree
> for the Raspberry Pi 5.

What is the merge strategy for this series?
Am happy to pick up non-dt patches 1-6/12 and 12/12.
let me know other wise.


--srini


> 
> ---
> Changes in v8:
> - Really rebase to v7.4-rc2
> - Add a patch to reorder rpi_firmware_property_tag enum
> - Link to v7: https://patch.msgid.link/20261110-rpi-otp-driver-v7-0-2345d0ee65f0@linutronix.de
> 
> Changes in v7:
> - Rebase to v7.4-rc2
> - Added Patch to register rtc driver by soc enum from drvdata
> - Link to v6: https://patch.msgid.link/20260522-rpi-otp-driver-v6-0-b0eac97d1428@linutronix.de
> 
> Changes in v6:
> - Use %pe in dev_err
> - Include <linux/slab.h> to fix build on arm
> - Add arm defconfigs: multi_v7_defconfig and bcm2835_defconfig
> - Reword commit messages
> - Link to v5: https://patch.msgid.link/20260520-rpi-otp-driver-v5-0-b26e5908eeac@linutronix.de
> 
> Changes in v5:
> - Move alignment check to nvmem core
> - Use IS_REACHABLE to simplify Kconfig
> - use root_only for private driver
> - Add driver as module to arch64 defconfig
> - Use MODULE_DEVICE_TABLE
> - Remove some unused attributes, fix typos, minor fixups
> - Link to v4: https://patch.msgid.link/20260508-rpi-otp-driver-v4-0-cf8d725d8821@linutronix.de
> 
> Changes in v4:
> - Additional patch to drop unnecessary select schema
> - fix dt-bindings
> - use __counted_by_le
> - additional alignment check in read/write callbacks
> - Link to v3: https://patch.msgid.link/20260506-rpi-otp-driver-v3-0-294602663695@linutronix.de
> 
> Changes in v3:
> - dts: add "raspberrypi,bcm2835-firmware" as fallback and fix dt-bindings
> - Fix Kconfig depends
> - Changed firmware data fields to __le32
> - Add MODULE_ALIAS
> - Link to v2: https://patch.msgid.link/20260505-rpi-otp-driver-v2-0-e9176ec72837@linutronix.de
> 
> Changes in v2:
> - register nvmem driver from firmware driver and drop firmware sub nodes
> - Use struct_size and __counted_by for dynamic array
> - Drop unneeded comment in Kconfig
> - Use NVMEM_DEVID_NONE
> - Use kzalloc
> - Update module description
> - Link to v1: https://patch.msgid.link/20260408-rpi-otp-driver-v1-0-e02d1dbe6008@linutronix.de
> 
> ---
> Gregor Herburger (12):
>       firmware: raspberrypi: reorder rpi_firmware_property_tag enum
>       soc: bcm2835: Use IS_REACHABLE for function declaration
>       nvmem: core: Enforce stride and alignment checks for nvmem_device functions
>       dt-bindings: raspberrypi,bcm2835-firmware: Add bcm2712-firmware compatible
>       nvmem: Add the Raspberry Pi OTP driver
>       firmware: raspberrypi: register nvmem driver
>       arm64: dts: broadcom: bcm2712: add raspberrypi,bcm2712-firmware compatible
>       dt-bindings: raspberrypi,bcm2835-firmware: Drop unnecessary select
>       arm64: defconfig: Enable the raspberrypi otp driver as module
>       ARM: bcm2835_defconfig: Enable the raspberrypi otp driver as module
>       ARM: multi_v7_defconfig: Enable the raspberrypi otp driver as module
>       firmware: raspberrypi: use drvdata to register rtc driver
> 
>  .../arm/bcm/raspberrypi,bcm2835-firmware.yaml      |  20 ++--
>  arch/arm/configs/bcm2835_defconfig                 |   2 +
>  arch/arm/configs/multi_v7_defconfig                |   1 +
>  .../boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi    |   4 +-
>  arch/arm64/configs/defconfig                       |   1 +
>  drivers/firmware/raspberrypi.c                     |  62 +++++++++-
>  drivers/nvmem/Kconfig                              |  11 ++
>  drivers/nvmem/Makefile                             |   1 +
>  drivers/nvmem/core.c                               |  12 ++
>  drivers/nvmem/raspberrypi-otp.c                    | 131 +++++++++++++++++++++
>  include/soc/bcm2835/raspberrypi-firmware.h         |  37 ++++--
>  11 files changed, 256 insertions(+), 26 deletions(-)
> ---
> base-commit: b3dfbde62cf1981c4638939c159dfd087b7a72e9
> change-id: 20260408-rpi-otp-driver-75fce1dcff7d
> 
> Best regards,
> --  
> Gregor Herburger <gregor.herburger@linutronix.de>
> 


