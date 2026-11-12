Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17541606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 12:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PIuvwPw6;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xjcppjGe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ifj6UiXfbSJBfBSvReqtUSI9DQmeGitKOnO0xdeombg=; b=PIuvwPw6OJTfjEmrp6ueDsmV2A
	yKd0SEO2WklQGaMhgEMH262bkQqonsRxx1SDKGMGLGVLPgt9qeEa+wdU/726Sn6UHo14cBZO+j41H
	uAOQSQ3UQzgatWV1KcthaJzVRs3NwFfsjAMqaZC5O1JlQSWu7sb5La5PXEc/gD6FEmhR2gP/ooOwd
	6qzwH64h42Xxgct8C25UtfY1SongNMw7auW0zEV/av0k1+8zoPz93bKwqQz7wkv+Kh1YJCcLPRFZ5
	7Ya1FXEdLWfdLugPwzHNtHF+n+oZfHtqUH1EhgCmkBoUiV0MOIgi/nKFUKkMoxohILlUpoGlSG9Tg
	Bk+5+mvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUGN-00000009vYj-3PXq;
	Thu, 12 Nov 2026 12:50:47 +0000
Received: from mail-dl1-x122b.google.com ([2607:f8b0:4864:20::122b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUGK-00000009vXr-3mdE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 12:50:46 +0000
Received: by mail-dl1-x122b.google.com with SMTP id a92af1059eb24-1b3acec6677so6269523c88.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 04:50:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794487844; cv=none;
        d=google.com; s=arc-20260327;
        b=NgKrQtmWfpUF/x+WBk8Tm8u2fo+be+bjHlLHFAck3UVcHiqsRegpPWVBIXn3eb511V
         39j7fDP0EdzCu1YjOKKnxRMDVcg2SLvMhhdRPixD6wusziDpsYcnmkMeubbguH58FrEc
         smpJdnwYlKxlqZUWkQ0mmYYBiTsmMrK67UeSKMEL5EazsZf3cXCVNgNuAAKshsPuICPk
         SQe4RLG5jeL4g/xkXmTdZcIJrtDu6JlDwmoZGjv2+21QA44BgOk5FmvHsbzYh/EAh5md
         BHYjUcEvKHmBnWkJz3k2nFvD+ueQUZHuCu8z9TpOEeyDAhoy2q8lNke+kbq4tmJI2bhi
         CE9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ifj6UiXfbSJBfBSvReqtUSI9DQmeGitKOnO0xdeombg=;
        fh=4QrohBqL4TR2CJ+osECTz2RfVKW7Cs+4PbjffhkVP1k=;
        b=iF+A9Rfm3sVt0dGc/OO0xqiScrqO9QFuz3Hci3f4/KelzTmrnXVN1LKJkyUjAcH+oA
         u/fktddgDrdRo8qIGKoWtM8qaerE86XlQ62cDIXMHxEhvBT04BFXIkGB81RPQrbInrTj
         J4jDsRKL+pT8+0W50E1SIQBBVFh1QU/6NspD0iFrDtwqHfRl4jJb+EdsKOLK0p2xHg9F
         fA3L1t/NA/Azwe5BsMY23CZlgVGkludnZqgM0DDhyQ6FSLYHCx6Nt/wS8MScDwtwOuk1
         l1bbMSCWfa5G4mnFznfwhtZG9sjxOirEURbv2M/sTzO3RT7m+e1OuLNgvtqo75IzkuDy
         mM7g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794487844; x=1795092644; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ifj6UiXfbSJBfBSvReqtUSI9DQmeGitKOnO0xdeombg=;
        b=xjcppjGeaeyCRg+FgAPgRwAwYC6+5TDHUPnnPnx5rUfQCelFwy61m1iw7E5sCnDoFh
         kJbx7akH5m/mTffUGDlwagXhS/+bfYvZ1X2XjZk9+UX6b2/ZAE/aixGDBr0zceNfKHRj
         mJeAMGr4a4nomywD/Cn7wANV1sx0PalufQAKhLSJkCq8pukdeS1oaRRCsRqs/s6UVWRE
         TfZ57G0DmiJmPL5+iRoiHSD4d27ZhUnG8DZovgVQmYcNzamPh/jPvcmfqVpxARnWPja6
         Y/YYEKGEkTKKqwQ93hA6rdHFYDOI/mC71Q08oKD/TlOxTYw29+8lQ8XpGWqzcHdc54SW
         08gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794487844; x=1795092644;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ifj6UiXfbSJBfBSvReqtUSI9DQmeGitKOnO0xdeombg=;
        b=UL1Nb5pLmvfeqjlVs9HGXC88KYSsBTN2DZWut0fQR7rgiOf628CQQ87lsKUmoE5R0n
         3AO7bfzP2QHUIas9InrADmAnq9jBXwuoZcVcfs66SiYgFAt4Jeb06r50N38/KXaPuYmX
         0nzPEWh/FHuP1okIf6bjnPcVmZgyVu9+QdHGPf+yiivprdxT0bLirO6Dc/LEJrPmBM4o
         OP5M6ngoTc93VHvst1CebMTN9yOqOvpBDOTeWAxTX/DnTVW0/Ijyn1nPb91uRgdGFVu/
         MSnndBDWKpo2E0tCf2KpyuaUtJ73rJhS6f55ZH9ehlb4+GLkabyD3yAiHOOJr1pX+r1/
         7fsw==
X-Forwarded-Encrypted: i=1; AL+hErEeo/HGfXVWnD8HkvWeQKJfyN2ExCa7IMc1ECnzHNFc7Jzjvf9peYh35KTaAyPrtSyMyzzpKJxbiEJhmMoyNOkc@lists.infradead.org
X-Gm-Message-State: APuU4Z/p+xrkfJ1gMcRpCKKvZjzAl8cJVmy16N2OBKQ/3jLOq9MKkLT8
	Is+yBcSrPyFOvODywzzaNyrG8sLmOKOzG8ez0Z9BEFEc95rlMViB0hE80TFV5GrcKBXcjaOY5Kb
	NQJV2t0BXdstodh4GTbDa5wF6hRTgnW0=
X-Gm-Gg: AYBFou38WOgnzsjke0JoKW+Colu1OtlDZVI0O7Pr2WmX2cWRd9qdA/9vByGMcL5yuoP
	vc1IWh++u61OnI/BuTlkFsTtX/XDAUAGOHGkYvVffKRAiKIHPAzEp5xTDdKvTi9tk+qXoxPackC
	N1ClGZhb9XNs1DS+xMyQZm7mPrNsVsdPqj18ZeGKGEWaF7FsH2doNU43Fu7MYG85U7yFIwSjNyL
	gsoCSg9biWOzKJ36EoY/TppNZCh/nDHcTUiIrUe0GZPvb7GVPX8YR+im9TJOyUq+8GAMigj9gw2
	jPdCgfafSisE8GlMP6abftmkD1e9dnzCz3NgYYLjTB05Lx8T3bTsGv4GLldX9ApKBxSFYer6Sll
	ZBhPX7yXijGgfuv8415b6HTn1xY4ootlf70EfLA==
X-Received: by 2002:a05:7022:285:20b0:143:8860:afa1 with SMTP id
 a92af1059eb24-1b3c036c2cbmr5206179c88.46.1794487843798; Thu, 12 Nov 2026
 04:50:43 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261110-spi-runtime-pm-fix-v1-1-8601ebb2f6a8@collabora.com>
In-Reply-To: <20261110-spi-runtime-pm-fix-v1-1-8601ebb2f6a8@collabora.com>
From: Alexander Shiyan <eagle.alexander923@gmail.com>
Date: Thu, 12 Nov 2026 15:50:31 +0300
X-Gm-Features: AclHuK9YSfZpEJ-wscqvwDM5JwyJ270P-Q2k4wqitCYhbsGJfgD_snqVmQhs_tc
Message-ID: <CAP1tNvQY3wzyXrXJmJ+MpdT5S2gSK5r91qA2rWtRW-NtN1QEnA@mail.gmail.com>
Subject: Re: [PATCH] spi: Fix runtime PM imbalance on pump transfer message error
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Mark Hasemeyer <markhas@chromium.org>, linux-spi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, kernel@collabora.com, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_045045_049315_32EE668A 
X-CRM114-Status: GOOD (  24.48  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

[root@diasom-evb ~]# rtcwake -s 15 -v -m freeze
rtcwake: assuming RTC uses UTC ...
Using UTC time.
        delta   = 39
        tzone   = 0
        tzname  = UTC
        systime = 1773421897, (UTC) Fri Mar 13 17:11:37 2026
        rtctime = 1773421858, (UTC) Fri Mar 13 17:10:58 2026
alarm 0, sys_time 1773421897, rtc_time 1773421858, seconds 15
rtcwake: wakeup from "freeze" using /dev/rtc0 at Fri Mar 13 17:11:14 2026
suspend mode: freeze; suspending system
[  195.026100] PM: suspend entry (s2idle)
[  195.026582] Filesystems sync: 0.000 seconds
[  195.031059] Freezing user space processes
[  195.032653] Freezing user space processes completed (elapsed 0.001 seconds)
[  195.033266] OOM killer disabled.
[  195.033547] Freezing remaining freezable tasks
[  195.049016] Freezing remaining freezable tasks completed (elapsed
0.015 seconds)
[  195.318497] xhci-hcd xhci-hcd.3.auto: xHC error in resume, USBSTS
0x401, Reinit
[  195.319141] usb usb3: root hub lost power or was reset
[  195.319588] usb usb4: root hub lost power or was reset
[  195.321839] usb usb8: root hub lost power or was reset
[  195.324626] usb usb7: root hub lost power or was reset
[  195.338354] xhci-hcd xhci-hcd.0.auto: xHC error in resume, USBSTS
0x401, Reinit
[  195.338996] usb usb1: root hub lost power or was reset
[  195.339443] usb usb2: root hub lost power or was reset
[  195.354495] xhci-hcd xhci-hcd.4.auto: xHC error in resume, USBSTS
0x401, Reinit
[  195.355136] usb usb5: root hub lost power or was reset
[  195.355584] usb usb6: root hub lost power or was reset
[  195.359476] rk_gmac-dwmac fe1c0000.ethernet: init for RGMII_RXID
[  195.384855] dwmac4: Master AXI performs any burst length
[  195.387322] rk_gmac-dwmac fe1c0000.ethernet end3: No Safety
Features support found
[  195.389691] rk_gmac-dwmac fe1c0000.ethernet end3: IEEE 1588-2008
Advanced Timestamp supported
[  195.392178] rk_gmac-dwmac fe1c0000.ethernet end3: configuring for
phy/rgmii-rxid link mode
[  195.442885] r8169 0004:41:00.0 end1: Link is Down
[  195.484890] r8169 0002:21:00.0 end0: Link is Down
[  195.490337] rk_gmac-dwmac fe1b0000.ethernet: init for RGMII_RXID
[  195.522987] dwmac4: Master AXI performs any burst length
[  195.524320] rk_gmac-dwmac fe1b0000.ethernet end2: No Safety
Features support found
[  195.526697] rk_gmac-dwmac fe1b0000.ethernet end2: IEEE 1588-2008
Advanced Timestamp supported
[  195.529185] rk_gmac-dwmac fe1b0000.ethernet end2: configuring for
phy/rgmii-rxid link mode
[  195.656869] dwhdmiqp-rockchip fdea0000.hdmi: i2c read timed out
[  195.760866] dwhdmiqp-rockchip fdea0000.hdmi: i2c read timed out
[  195.864875] dwhdmiqp-rockchip fdea0000.hdmi: i2c read timed out
[  195.968867] dwhdmiqp-rockchip fdea0000.hdmi: i2c read timed out
[  196.072873] dwhdmiqp-rockchip fdea0000.hdmi: i2c read timed out
[  196.073408] hdmi-audio-codec hdmi-audio-codec.9.auto: HDMI: Unknown
ELD version 0
[  196.176872] dwhdmiqp-rockchip fdea0000.hdmi: i2c read timed out
[  196.518457] OOM killer enabled.
[  196.518736] Restarting tasks: Starting
[  196.519279] pcieport 0000:00:00.0: no suspend buffer for LTR; ASPM
issues possible after resume
[  196.522351] Restarting tasks: Done
[  196.522832] random: crng reseeded on system resumption
[  196.523321] PM: suspend exit
[root@diasom-evb ~]# [  196.534793] mmc_host mmc1: Bus speed =
400000Hz (req 400000Hz, actual 400000HZ div = 0)
[  196.697114] mmc_host mmc1: Bus speed = 148500000Hz (req
150000000Hz, actual 148500000HZ div = 0)
[  197.068697] dwmmc_rockchip fe2c0000.mmc: Successfully tuned phase to 208

[root@diasom-evb ~]#

So,
Tested-by: Alexander Shiyan <eagle.alexander923@gmail.com>

>
> The current SPI message pumping code may drop the runtime PM twice when
> an SPI message cannot be sent:
>
> spi_master spi2: noqueue transfer failed
> rockchip-spi feb20000.spi: Runtime PM usage count underflow!
>
> Fix the problem by always keeping the runtime PM count increased when
> exiting __spi_pump_transfer_message(), as the caller handles decreasing
> it.
>
> Note, that the function already keeps the RPM usage counter increased
> for the error paths following after the prepare_transfer_hardware step.
>
> Cc: stable@vger.kernel.org
> Fixes: bef4a48f4ef7 ("spi: Fix null dereference on suspend")
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
> I noticed this with RK3588 system suspend/resume, which uses SPI based
> PMIC and runs into SPI transmission problems when the PM domain driver
> tries to disable regulators required by e.g. NPU or GPU domain. I've not
> yet checked too closely, but suspect Heiko's atomic SPI transmission
> support series might also help with fixing the actual failure.
>
> My patch is not really a v2, but Alexander Shiyan probably ran into the
> same issue before and came up with a way different patch and rationale:
>
> https://lore.kernel.org/linux-rockchip/20260806191854.922530-1-eagle.alexander923@gmail.com/
> ---
>  drivers/spi/spi.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
> index ce257b3ec530..4d9c5d026ff6 100644
> --- a/drivers/spi/spi.c
> +++ b/drivers/spi/spi.c
> @@ -1967,7 +1967,6 @@ static int __spi_pump_transfer_message(struct spi_controller *ctlr,
>         if (!was_busy && ctlr->auto_runtime_pm) {
>                 ret = pm_runtime_get_sync(ctlr->dev.parent);
>                 if (ret < 0) {
> -                       pm_runtime_put_noidle(ctlr->dev.parent);
>                         dev_err(&ctlr->dev, "Failed to power device: %d\n",
>                                 ret);
>
> @@ -1988,9 +1987,6 @@ static int __spi_pump_transfer_message(struct spi_controller *ctlr,
>                                 "failed to prepare transfer hardware: %d\n",
>                                 ret);
>
> -                       if (ctlr->auto_runtime_pm)
> -                               pm_runtime_put(ctlr->dev.parent);
> -
>                         msg->status = ret;
>                         spi_finalize_current_message(ctlr);
>
>
> ---
> base-commit: 059518f775baecc9803fc97787bd0b17558f8047
> change-id: 20261110-spi-runtime-pm-fix-529325c25582
>
> Best regards,
> --
> Sebastian Reichel <sebastian.reichel@collabora.com>
>

