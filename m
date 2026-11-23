Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA062606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 01:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=f/K6k9vh;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WkEKM0OB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:From:
	Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HPgiKAKXJD1IfapqnG6OwznXuOp3qOSKSxNr/yY/XDo=; b=f/K6k9vh2VFdOI4vAmpb8Cdrgl
	hNsQ297K9oScYsOVFlxSOBacRzKbT0QdVzZAEJmUrp+X0gTScTTmTqyuzeFEkmKGs+CNkbCeGzGrI
	ERo4U0uKG5yQ87Zf89Huw05JYVzbQv4iOn+D9HV4rQ5cABg7Srb2otbbtRrS1ElXyQMxgvwBvNlJW
	tWmTcLFRt0F+NTTx+u/a4bmc71GCCWw+HREEc6w8rOPmLALxmKpw0LnU8MuPXw1F6rEHJ25ZEeO9Y
	BMzQ8SYaRtZe3TFYPWRvtwSYdGetwDJjrVOKQ7oTYsIDbjPuHDxEiXKhYO7B0WybtxzFqLEq3TV6S
	jB/yI2sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVJCC-000000026Xc-2wcB;
	Mon, 23 Nov 2026 01:50:16 +0000
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVJCA-000000026Wj-0oV1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 01:50:16 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-14394530ec6so4135673c88.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 17:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795398613; x=1796003413; darn=lists.infradead.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HPgiKAKXJD1IfapqnG6OwznXuOp3qOSKSxNr/yY/XDo=;
        b=WkEKM0OBnQI7hDSJiiTuKvr+sbq4dBlNPNrYBB9obooTTlgg39POCRvXNfVicXZsXY
         p/nMrcLTWnxJzo8p+yqshJW3dvFTBnTyLVB+rUwrqndwDtTgLm6pRruRBl1n6Sv/uiUn
         OfJhBV4ULuo1ecwNnPDgOjgbaORCAUr8gIX15RvhuPwl8IWPKGurseVhHpcDqdvVj82U
         8yODFLvXssjV53tandUEG3yBUBzNRSnAxOcpTiN0YOIo6c7cjl20ftLSOqlTVA3SxZM2
         AnKqhifwyVooT/4HbSOU+i3voPmj67wlIhumjt8jqzboq7PAoS6VRlz/GgBMR5HHzg9G
         F92g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795398613; x=1796003413;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HPgiKAKXJD1IfapqnG6OwznXuOp3qOSKSxNr/yY/XDo=;
        b=2HtO1MuxRK4WwI7F4U2QRRO1Yyq4DPrnMghW5Q/w1fMzHvvw4/mkzQMfnZmmaIua3E
         DXGXxd/Nd6deIS8htRpp/MXBm3Om4bE/h8M2ZkhdvT4d9TeM/bG2B/CitBToO8Zaonzr
         V+PfWZsG0rvEqecRq1PvzO7mmnmveC+4WBwkc7s5g0imn+rzXAIWvXjiXLFoEF/FoutP
         H/mW7J9A1RUaz7+SlSb+0m35CrcfQqb9Ybyl6Oe8rtTVPa6exrbqxRTmw5LvBhas6e5Q
         9sHSMmVg1G7DeLYn8gG4QvrPXNZiVflAqwpqOcGS/3fqjJpn51pp++5KsCNHx2sFwLFK
         pxdQ==
X-Forwarded-Encrypted: i=1; AL+hErHgYn9/SU6XWaIwKtAlC3Ask10GMDQJ6rGYzsvVaxl5ue9qfsqAorDTP2d+xSy+899m2YhKtk39ntp3GgNBAlr8@lists.infradead.org
X-Gm-Message-State: APuU4Z9WfudlrrHJsCSet6bIzBpX1bV67Ts4GTewTTmx5rzsiJLGo2mJ
	6U2S3gtgZszONQocmOEqa0UIRstSoe8pYOtU4iaWwekie/bzi7tjWkm/k9BPfQ==
X-Gm-Gg: AZFdTZepme2w3XFSA6KqwA4h1U2/NbYXeEtUQNc8H/IgJRAQ4+ZUodpoY8VvThIwoCj
	JfrUel43m0tWGSjpay5IgV9R8nrhxi2eCeUEsXnLHhihQ82SjH7dszU1SUuNqfhbV+Df1kZd+9I
	lbukci2Eg2dtO/pvyUber0/zhTgcQwB9Vhr8vnLvbDqfWAYWhK2tDCoV0ZoG+1arNTyTroetsDf
	/w2JRsjCGTVH3gBpDCEWjSM7mLKKIxLBiQY7zMFP1UVF8ZyHvTc3YiP+OrxchrTsE3/Cj5kca4N
	lEHh53l8x6xNcGaEt6kN/NyjMEo8VVV5CIIkYjT7RfL6Gv0E7tFhuXPtJhihCUUmz/7vxM9Wiu/
	Y/UVAmbDlXjTaDzts4ybn2yB4Vz80GJnX+38vKRAJmk1ym/RHISAXjBlZjoRF9jcJrUzAxyxE7J
	feg/jX9hdXDpimhjiJh9pJ0Q8ptPyeYaBCmnxcPnYlMVRxnHmQvPfZ9Sf8Wiu2C96rKRtw56Lr/
	x3dS7+C9SvSwuASndzkcWD/xXCsRb1l29wDhWXEtWWtrW4ZR+hxMKbxzO6y1wS+ZPyEVzbxWi6P
	lmuHlA9DG+uvRGqVeq36cbLZubaNZ7IuGDQeDsbB38jfFmiAD6phUUjpMlnBp507GOjYOg==
X-Received: by 2002:a05:701b:230b:b0:1b2:4da6:bccd with SMTP id a92af1059eb24-1b5568feaadmr8740253c88.34.1795398612828;
        Sun, 22 Nov 2026 17:50:12 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:f002:4621:aeeb:e0e7])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567e2bd1sm23364703c88.3.2026.11.22.17.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 17:50:12 -0800 (PST)
Date: Sun, 22 Nov 2026 17:50:11 -0800
Message-ID: <8c2d4920319771e3f7edb083b2e831a9@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
Cc: Mark Brown <broonie@kernel.org>,
	Jakob Unterwurzacher <jakobunt@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Joseph Chen <chenjh@rock-chips.com>,
	Lee Jones <lee@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/4] Input: rk805-pwrkey - enable the wakeup interrupt during system suspend
In-Reply-To: <7bec766f-14b1-4eac-96c7-d7f1cf38021d@cherry.de>
References: <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-0-cb12621c1fb4@cherry.de> <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-1-cb12621c1fb4@cherry.de> <avUGEQhSKlko0Fm9@google.com> <7bec766f-14b1-4eac-96c7-d7f1cf38021d@cherry.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_175014_252145_265739F2 
X-CRM114-Status: GOOD (  21.27  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jakob,

On Fri, Nov 20, 2026 at 02:42:57PM +0100, Jakob Unterwurzacher wrote:
> On 11/12/26 01:25, Dmitry Torokhov wrote:
...
> > Sounds like this needs to be solved in PM core rather than hacked around
> > in individual driver? Let's CC Tony and Rafael.
>
> How about something like this, copy-pasted below? If no immediate 
> objections I'll post it as a proper patch.
>
> With this, rk805-pwrkey can use dev_pm_set_wake_irq with no issues 
> (tested on RK3588-Tiger).

This approach makes sense to me (and matches what several I2C controller
drivers such as i2c-imx already do), though ultimately it is up to Mark
Brown to decide for SPI.

For rk805-pwrkey, please use devm_pm_set_wake_irq() in v2.

...
> >     Take a runtime PM reference in the regular suspend phase and drop it on
> >     resume. This keeps the controller usable until its noirq suspend
> >     callback, and since it was active then, pm_runtime_force_resume()
> >     restores it in the noirq resume phase, before interrupts of child
> >     devices are handled again.
> >     
> >     Signed-off-by: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>

Probably worth adding

	Fixes: be721b451aff ("spi: rockchip: Resolve unbalanced runtime PM / system PM handling")

as well.

...
> > +/*
> > + * Child devices (e.g. an RK806 PMIC with its interrupt controller and wakeup
> > + * interrupts) can still need the bus during the late and noirq phases of
> > + * system suspend and resume, while runtime PM is disabled. Keep the controller
> > + * runtime-active from the regular suspend phase on, so that such transfers
> > + * work and pm_runtime_force_resume() restores the controller in the noirq
> > + * resume phase, before child device interrupts are handled again.
> > + */

One nit on the comment: rockchip_spi_isr() does not use IRQF_NO_SUSPEND
(and pl330 DMA suspends in the late phase), so arbitrary transfers in
child suspend_noirq()/resume_noirq() callbacks still will not work. What
this actually enables are PIO transfers in the late/early phases, during
device_wakeup_arm_wake_irqs() before device IRQs are suspended, and once
resume_device_irqs() re-enables them at the end of the noirq resume
phase. It might be worth wording the comment more precisely so nobody
assumes general noirq transfers are supported.

Thanks.

-- 
Dmitry

